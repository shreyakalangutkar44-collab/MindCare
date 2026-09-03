
import 'dart:async';
import 'dart:convert';
import 'dart:math';
import 'dart:typed_data';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../models/game_result.dart';
import '../../models/personalized_photo.dart';
import '../../services/database_service.dart';
import '../../screens/add_memory_photo_screen.dart';

class PersonalizedMemoryGame extends StatefulWidget {
  const PersonalizedMemoryGame({super.key});

  @override
  State<PersonalizedMemoryGame> createState() =>
      _PersonalizedMemoryGameState();
}

class _PersonalizedMemoryGameState extends State<PersonalizedMemoryGame> {
  final DatabaseService _databaseService = DatabaseService();

  List<PersonalizedPhoto> _photos = [];
  List<_MemoryCard> _cards = [];

  int _score = 0;
  int _moves = 0;
  int _difficulty = 1;

  int? _firstIndex;
  int? _secondIndex;

  bool _loading = true;
  bool _checking = false;

  Timer? _timer;
  int _timeTakenSeconds = 0;

  @override
  void initState() {
    super.initState();
    _loadPhotos();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  // ============================================================
  // LOAD PERSONALIZED PHOTOS
  // ============================================================

  Future<void> _loadPhotos() async {
    final user = FirebaseAuth.instance.currentUser;

    if (user == null) {
      setState(() {
        _loading = false;
      });
      return;
    }

    try {
      final photos =
          await _databaseService.getPhotosForPatient(user.uid);

      if (photos.length < 2) {
        setState(() {
          _photos = photos;
          _loading = false;
        });
        return;
      }

      // Use a maximum of 6 personalized photos.
      final selectedPhotos = List<PersonalizedPhoto>.from(photos);

      selectedPhotos.shuffle(Random());

      final usablePhotos = selectedPhotos.take(6).toList();

      _photos = usablePhotos;

      _createCards();

      _startTimer();

      setState(() {
        _loading = false;
      });
    } catch (e) {
      setState(() {
        _loading = false;
      });

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content:
                Text('Unable to load personalized photos: $e'),
          ),
        );
      }
    }
  }

  // ============================================================
  // ADD PHOTO
  // ============================================================

  Future<void> _addPhoto() async {
    final user = FirebaseAuth.instance.currentUser;

    if (user == null) {
      return;
    }

    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) =>
            AddMemoryPhotoScreen(patientId: user.uid),
      ),
    );

    // Reload photos after returning from Add Photo screen.
    if (mounted) {
      setState(() {
        _loading = true;
      });

      _score = 0;
      _moves = 0;
      _timeTakenSeconds = 0;
      _firstIndex = null;
      _secondIndex = null;
      _checking = false;

      await _loadPhotos();
    }
  }

  // ============================================================
  // CREATE MEMORY CARDS
  // ============================================================

  void _createCards() {
    final cards = <_MemoryCard>[];

    for (final photo in _photos) {
      cards.add(
        _MemoryCard(
          photoId: photo.id,
          label: photo.label,
          imageBase64: photo.imageBase64,
        ),
      );

      cards.add(
        _MemoryCard(
          photoId: photo.id,
          label: photo.label,
          imageBase64: photo.imageBase64,
        ),
      );
    }

    cards.shuffle(Random());

    setState(() {
      _cards = cards;
    });
  }

  // ============================================================
  // TIMER
  // ============================================================

  void _startTimer() {
    _timer?.cancel();

    _timer = Timer.periodic(
      const Duration(seconds: 1),
      (_) {
        if (mounted) {
          setState(() {
            _timeTakenSeconds++;
          });
        }
      },
    );
  }

  // ============================================================
  // CARD TAP
  // ============================================================

  void _onCardTap(int index) {
    if (_checking) return;
    if (_cards[index].isMatched) return;
    if (_firstIndex == index) return;

    setState(() {
      _cards[index].isFlipped = true;
    });

    if (_firstIndex == null) {
      setState(() {
        _firstIndex = index;
      });
    } else {
      _secondIndex = index;
      _moves++;

      _checkMatch();
    }
  }

  // ============================================================
  // CHECK MATCH
  // ============================================================

  Future<void> _checkMatch() async {
    if (_firstIndex == null || _secondIndex == null) return;

    final first = _cards[_firstIndex!];
    final second = _cards[_secondIndex!];

    setState(() {
      _checking = true;
    });

    await Future.delayed(
      const Duration(milliseconds: 700),
    );

    if (!mounted) return;

    if (first.photoId == second.photoId) {
      setState(() {
        first.isMatched = true;
        second.isMatched = true;

        _score++;
      });
    } else {
      setState(() {
        first.isFlipped = false;
        second.isFlipped = false;
      });
    }

    setState(() {
      _firstIndex = null;
      _secondIndex = null;
      _checking = false;
    });

    if (_cards.every((card) => card.isMatched)) {
      _finishGame();
    }
  }

  // ============================================================
  // FINISH GAME
  // ============================================================

  Future<void> _finishGame() async {
    _timer?.cancel();

    final user = FirebaseAuth.instance.currentUser;

    if (user == null) return;

    final result = GameResult(
      userId: user.uid,
      gameName: 'Personalized Memory Game',
      score: _score,
      totalQuestions: _photos.length,
      difficulty: _difficulty,
      timeTakenSeconds: _timeTakenSeconds,
    );

    try {
      await _databaseService.saveGameResult(result);

      if (!mounted) return;

      await showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return AlertDialog(
            title: const Text('🎉 Game Complete!'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Great job!',
                  style:
                      Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: 12),
                Text(
                  'Matches: $_score / ${_photos.length}',
                ),
                Text(
                  'Accuracy: '
                  '${result.accuracy.toStringAsFixed(1)}%',
                ),
                Text(
                  'Time: $_timeTakenSeconds seconds',
                ),
              ],
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.pop(context);
                },
                child: const Text('Done'),
              ),
            ],
          );
        },
      );
    } catch (e) {
      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Game completed, but result was not saved: $e',
          ),
        ),
      );
    }
  }

  // ============================================================
  // DECODE IMAGE
  // ============================================================

  Uint8List _decodeImage(String base64String) {
    return base64Decode(base64String);
  }

  // ============================================================
  // BUILD CARD
  // ============================================================

  Widget _buildCard(_MemoryCard card, int index) {
    final showImage =
        card.isFlipped || card.isMatched;

    return GestureDetector(
      onTap: () => _onCardTap(index),
      child: Card(
        elevation: 4,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: showImage
                ? Colors.white
                : Colors.blue.shade100,
          ),
          child: showImage
              ? ClipRRect(
                  borderRadius:
                      BorderRadius.circular(12),
                  child: Column(
                    children: [
                      Expanded(
                        child: Image.memory(
                          _decodeImage(
                            card.imageBase64,
                          ),
                          fit: BoxFit.cover,
                          width: double.infinity,
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.all(6),
                        child: Text(
                          card.label,
                          maxLines: 1,
                          overflow:
                              TextOverflow.ellipsis,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                )
              : const Center(
                  child: Icon(
                    Icons.help_outline,
                    size: 45,
                  ),
                ),
        ),
      ),
    );
  }

  // ============================================================
  // BUILD
  // ============================================================

  @override
  Widget build(BuildContext context) {
    if (_loading) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Personalized Memory'),
        ),
        body: const Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    if (FirebaseAuth.instance.currentUser == null) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Personalized Memory'),
        ),
        body: const Center(
          child: Text(
            'Please log in to play the personalized memory game.',
          ),
        ),
      );
    }

    // ==========================================================
    // LESS THAN 2 PHOTOS
    // ==========================================================

    if (_photos.length < 2) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Personalized Memory'),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisAlignment:
                  MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.photo_library_outlined,
                  size: 70,
                  color: Colors.blue,
                ),
                const SizedBox(height: 20),
                const Text(
                  'At least 2 personalized photos '
                  'are needed to play this game.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
                const SizedBox(height: 25),

                // ADD PHOTOS BUTTON
                ElevatedButton.icon(
                  onPressed: _addPhoto,
                  icon: const Icon(
                    Icons.add_a_photo,
                  ),
                  label: const Text(
                    'Add Photos',
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }

    // ==========================================================
    // GAME SCREEN
    // ==========================================================

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Personalized Memory',
        ),
        centerTitle: true,
        actions: [
          // ADD PHOTOS BUTTON
          IconButton(
            onPressed: _addPhoto,
            icon: const Icon(
              Icons.add_a_photo,
            ),
            tooltip: 'Add Photos',
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            // ====================================================
            // GAME INFORMATION
            // ====================================================

            Row(
              mainAxisAlignment:
                  MainAxisAlignment.spaceAround,
              children: [
                Text(
                  'Matches: $_score/${_photos.length}',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Moves: $_moves',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Time: ${_timeTakenSeconds}s',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 12),

            // ====================================================
            // ADD PHOTOS BUTTON
            // ====================================================

            SizedBox(
              width: double.infinity,
              child: OutlinedButton.icon(
                onPressed: _addPhoto,
                icon: const Icon(
                  Icons.add_a_photo_outlined,
                ),
                label: const Text(
                  'Add More Memory Photos',
                ),
              ),
            ),

            const SizedBox(height: 12),

            // ====================================================
            // MEMORY GRID
            // ====================================================

            Expanded(
              child: GridView.builder(
                itemCount: _cards.length,
                gridDelegate:
                    const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                  childAspectRatio: 0.8,
                ),
                itemBuilder: (context, index) {
                  return _buildCard(
                    _cards[index],
                    index,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ================================================================
// MEMORY CARD MODEL
// ================================================================

class _MemoryCard {
  final String photoId;
  final String label;
  final String imageBase64;

  bool isFlipped;
  bool isMatched;

  _MemoryCard({
    required this.photoId,
    required this.label,
    required this.imageBase64,
    this.isFlipped = false,
    this.isMatched = false,
  });
}


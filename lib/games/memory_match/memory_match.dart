import 'dart:math';

import 'package:flutter/material.dart';
import 'memory_card.dart';
import '../../services/database_service.dart';

class MemoryMatchGame extends StatefulWidget {
  const MemoryMatchGame({super.key});

  @override
  State<MemoryMatchGame> createState() => _MemoryMatchGameState();
}

class _MemoryMatchGameState extends State<MemoryMatchGame>
    with TickerProviderStateMixin {
  // ============================================================
  // DIFFICULTY
  // ============================================================

  int currentLevel = 1;

  // Number of cards for each level.
  // Level 1 = 6 cards = 3 pairs.
  final Map<int, int> cardsPerLevel = {
    1: 6,
    2: 8,
    3: 12,
    4: 16,
  };

  // ============================================================
  // CARD VALUES
  // ============================================================

  final List<String> allCardValues = [
    '🍎',
    '🌸',
    '🐶',
    '⭐',
    '🌿',
    '☀️',
    '🍀',
    '🦋',
  ];

  late List<MemoryCard> cards;

  int? firstCardIndex;

  int moves = 0;
  int matchedPairs = 0;

  bool isChecking = false;

  // ============================================================
  // INITIALIZE GAME
  // ============================================================

  @override
  void initState() {
    super.initState();
    initializeGame();
  }

  void initializeGame() {
    int numberOfCards = cardsPerLevel[currentLevel]!;

    int numberOfPairs = numberOfCards ~/ 2;

    // Take only the number of pairs required for this level.
    List<String> selectedValues =
        allCardValues.take(numberOfPairs).toList();

    // Create two cards for every value.
    List<String> gameValues = [
      ...selectedValues,
      ...selectedValues,
    ];

    gameValues.shuffle(Random());

    cards = List.generate(
      gameValues.length,
      (index) => MemoryCard(
        id: index,
        value: gameValues[index],
      ),
    );

    moves = 0;
    matchedPairs = 0;
    firstCardIndex = null;
    isChecking = false;
  }

  // ============================================================
  // RESTART
  // ============================================================

  void restartGame() {
    setState(() {
      initializeGame();
    });
  }

  // ============================================================
  // CARD TAP
  // ============================================================

  Future<void> flipCard(int index) async {
    // Don't allow another card while checking.
    if (isChecking) return;

    // Don't allow already flipped/matched cards.
    if (cards[index].isFlipped || cards[index].isMatched) {
      return;
    }

    // Flip the selected card.
    setState(() {
      cards[index].isFlipped = true;
    });

    // ------------------------------------------------------------
    // FIRST CARD
    // ------------------------------------------------------------

    if (firstCardIndex == null) {
      firstCardIndex = index;
      return;
    }

    // ------------------------------------------------------------
    // SECOND CARD
    // ------------------------------------------------------------

    final int firstIndex = firstCardIndex!;

    setState(() {
      moves++;
      isChecking = true;
    });

    // ------------------------------------------------------------
    // MATCH
    // ------------------------------------------------------------

    if (cards[firstIndex].value == cards[index].value) {
      setState(() {
        cards[firstIndex].isMatched = true;
        cards[index].isMatched = true;

        matchedPairs++;

        firstCardIndex = null;
        isChecking = false;
      });

      // Check if level is complete.
      if (matchedPairs == cards.length ~/ 2) {
        Future.delayed(
          const Duration(milliseconds: 500),
          () {
            if (mounted) {
                final GameResult result = createGameResult();
                DatabaseService().saveGameResult(result);
                showLevelCompleteDialog(result);
            }
          },
        );
      }
    }

    // ------------------------------------------------------------
    // NOT A MATCH
    // ------------------------------------------------------------

    else {
      await Future.delayed(
        const Duration(milliseconds: 900),
      );

      if (!mounted) return;

      setState(() {
        cards[firstIndex].isFlipped = false;
        cards[index].isFlipped = false;

        firstCardIndex = null;
        isChecking = false;
      });
    }
  }

  // ============================================================
  // LEVEL COMPLETE
  // ============================================================

  void showLevelCompleteDialog() {
    bool hasNextLevel = currentLevel < cardsPerLevel.length;

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          backgroundColor: const Color(0xFFFDF9EE),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
          title: const Text(
            '🎉 Well done!',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color(0xFF51634E),
              fontSize: 26,
              fontWeight: FontWeight.bold,
            ),
          ),
          content: Text(
            hasNextLevel
                ? 'You completed Level $currentLevel!\n\nMoves: $moves'
                : 'You completed all levels!\n\nMoves: $moves',
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Color(0xFF1C1C15),
              fontSize: 18,
            ),
          ),
          actions: [
            if (hasNextLevel)
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);

                  setState(() {
                    currentLevel++;
                    initializeGame();
                  });
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF51634E),
                  foregroundColor: Colors.white,
                  minimumSize: const Size(double.infinity, 55),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: Text(
                  'Next Level',
                  style: const TextStyle(fontSize: 18),
                ),
              ),

            const SizedBox(height: 8),

            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text(
                'Continue',
                style: TextStyle(
                  color: Color(0xFF974725),
                  fontSize: 17,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  // ============================================================
  // HINT
  // ============================================================

  void showHint() {
    if (isChecking) return;

    Map<String, List<int>> groups = {};

    for (int i = 0; i < cards.length; i++) {
      if (!cards[i].isMatched) {
        groups.putIfAbsent(cards[i].value, () => []);
        groups[cards[i].value]!.add(i);
      }
    }

    for (final group in groups.values) {
      if (group.length >= 2) {
        int first = group[0];
        int second = group[1];

        setState(() {
          cards[first].isFlipped = true;
          cards[second].isFlipped = true;
        });

        Future.delayed(
          const Duration(milliseconds: 1000),
          () {
            if (!mounted) return;

            setState(() {
              if (!cards[first].isMatched) {
                cards[first].isFlipped = false;
              }

              if (!cards[second].isMatched) {
                cards[second].isFlipped = false;
              }
            });
          },
        );

        break;
      }
    }
  }

  // ============================================================
  // GRID COLUMNS
  // ============================================================

  int getGridColumns() {
    if (cards.length <= 6) {
      return 3;
    }

    if (cards.length <= 12) {
      return 3;
    }

    return 4;
  }

  // ============================================================
  // BUILD
  // ============================================================

  @override
  Widget build(BuildContext context) {
    final int columns = getGridColumns();

    return Scaffold(
      backgroundColor: const Color(0xFFFDF9EE),

      // ========================================================
      // TOP BAR
      // ========================================================

      appBar: AppBar(
        backgroundColor: const Color(0xFFFDF9EE),
        elevation: 0,
        automaticallyImplyLeading: false,

        title: Row(
          children: [
            // EXIT BUTTON
            Container(
              width: 48,
              height: 48,
              decoration: const BoxDecoration(
                color: Color(0xFFF1EEE3),
                shape: BoxShape.circle,
              ),
              child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.close,
                  color: Color(0xFF51634E),
                  size: 27,
                ),
              ),
            ),

            const SizedBox(width: 10),

            // TITLE
            const Expanded(
              child: Text(
                'Memory Match',
                style: TextStyle(
                  color: Color(0xFF51634E),
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            // MOVES
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 14,
                vertical: 9,
              ),
              decoration: BoxDecoration(
                color: const Color(0xFFECE8DD),
                borderRadius: BorderRadius.circular(30),
                border: Border.all(
                  color: const Color(0xFFC4C8BF),
                  width: 1.5,
                ),
              ),
              child: Text(
                'Moves: $moves',
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1C1C15),
                ),
              ),
            ),
          ],
        ),
      ),

      // ========================================================
      // BODY
      // ========================================================

      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 18,
              ),
              child: Column(
                children: [
                  // LEVEL INDICATOR
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 18,
                      vertical: 8,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xFFD3E8CE),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Text(
                      'Level $currentLevel',
                      style: const TextStyle(
                        color: Color(0xFF263725),
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                  const SizedBox(height: 10),

                  // INSTRUCTION
                  const Text(
                    'Find the matching pairs',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFF434841),
                      fontSize: 17,
                    ),
                  ),

                  const SizedBox(height: 12),

                  // =================================================
                  // CARD GRID
                  // =================================================

                  Expanded(
                    child: Center(
                      child: GridView.builder(
                        physics:
                            const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,

                        itemCount: cards.length,

                        gridDelegate:
                            SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: columns,

                          crossAxisSpacing: 12,
                          mainAxisSpacing: 12,

                          childAspectRatio:
                              cards.length <= 6 ? 1.05 : 0.9,
                        ),

                        itemBuilder: (context, index) {
                          return MemoryCardWidget(
                            card: cards[index],
                            onTap: () => flipCard(index),
                          );
                        },
                      ),
                    ),
                  ),

                  // =================================================
                  // BUTTONS
                  // =================================================

                  Row(
                    children: [
                      // HINT
                      Expanded(
                        child: OutlinedButton.icon(
                          onPressed:
                              isChecking ? null : showHint,
                          icon: const Icon(
                            Icons.lightbulb_outline,
                            size: 23,
                          ),
                          label: const Text(
                            'Hint',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          style: OutlinedButton.styleFrom(
                            foregroundColor:
                                const Color(0xFF51634E),
                            side: const BorderSide(
                              color: Color(0xFF51634E),
                              width: 2,
                            ),
                            minimumSize:
                                const Size(0, 58),
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(30),
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(width: 12),

                      // RESTART
                      Expanded(
                        child: ElevatedButton.icon(
                          onPressed: restartGame,
                          icon: const Icon(
                            Icons.refresh,
                            size: 23,
                          ),
                          label: const Text(
                            'Restart',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                const Color(0xFF974725),
                            foregroundColor: Colors.white,
                            minimumSize:
                                const Size(0, 58),
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(30),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 10),
                ],
              ),
            );
          },
        ),
      ),

      // ==========================================================
      // VOICE BUTTON
      // ==========================================================

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text(
                'Voice help will be available here.',
              ),
            ),
          );
        },
        backgroundColor: const Color(0xFFB89756),
        foregroundColor: const Color(0xFF443000),
        child: const Icon(
          Icons.mic,
          size: 30,
        ),
      ),
    );
  }
}

// ==================================================================
// MEMORY CARD WIDGET
// ==================================================================

class MemoryCardWidget extends StatefulWidget {
  final MemoryCard card;
  final VoidCallback onTap;

  const MemoryCardWidget({
    super.key,
    required this.card,
    required this.onTap,
  });

  @override
  State<MemoryCardWidget> createState() =>
      _MemoryCardWidgetState();
}

class _MemoryCardWidgetState extends State<MemoryCardWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;

  late Animation<double> animation;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      duration: const Duration(
        milliseconds: 600,
      ),
      vsync: this,
    );

    animation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(
      CurvedAnimation(
        parent: controller,
        curve: Curves.easeInOut,
      ),
    );
  }

  @override
  void didUpdateWidget(
    covariant MemoryCardWidget oldWidget,
  ) {
    super.didUpdateWidget(oldWidget);

    if (widget.card.isFlipped) {
      controller.forward();
    } else {
      controller.reverse();
    }
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,

      child: AnimatedBuilder(
        animation: animation,

        builder: (context, child) {
          final double angle =
              animation.value * pi;

          return Transform(
            alignment: Alignment.center,

            transform: Matrix4.identity()
              ..setEntry(
                3,
                2,
                0.001,
              )
              ..rotateY(angle),

            child: angle < pi / 2
                ? buildCardBack()
                : Transform(
                    alignment: Alignment.center,

                    transform:
                        Matrix4.rotationY(pi),

                    child: buildCardFront(),
                  ),
          );
        },
      ),
    );
  }

  // ================================================================
  // CARD BACK
  // ================================================================

  Widget buildCardBack() {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFB8CCB3),

        borderRadius:
            BorderRadius.circular(16),

        border: Border.all(
          color: const Color(0xFFD3E8CE),
          width: 2,
        ),

        boxShadow: const [
          BoxShadow(
            blurRadius: 5,
            offset: Offset(0, 3),
            color: Colors.black12,
          ),
        ],
      ),

      child: const Center(
        child: Text(
          '❓',
          style: TextStyle(
            fontSize: 42,
          ),
        ),
      ),
    );
  }

  // ================================================================
  // CARD FRONT
  // ================================================================

  Widget buildCardFront() {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFFDF9EE),

        borderRadius:
            BorderRadius.circular(16),

        border: Border.all(
          color: widget.card.isMatched
              ? const Color(0xFF51634E)
              : const Color(0xFFC4C8BF),

          width: 2,
        ),

        boxShadow: const [
          BoxShadow(
            blurRadius: 5,
            offset: Offset(0, 3),
            color: Colors.black12,
          ),
        ],
      ),

      child: Center(
        child: Text(
          widget.card.value,

          style: const TextStyle(
            fontSize: 52,
          ),
        ),
      ),
    );
  }
}

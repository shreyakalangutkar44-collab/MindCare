class MemoryCard {
  final int id;
  final String value;
  bool isFlipped;
  bool isMatched;

  MemoryCard({
    required this.id,
    required this.value,
    this.isFlipped = false,
    this.isMatched = false,
  });
}
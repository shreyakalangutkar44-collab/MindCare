import 'package:flutter/material.dart';

class PatientProgressScreen extends StatelessWidget {
  const PatientProgressScreen({super.key});

  static const Color cream = Color(0xFFFDF9EE);
  static const Color surface = Color(0xFFFFFFFF);
  static const Color sage = Color(0xFF51634E);
  static const Color sageDark = Color(0xFF394B38);
  static const Color sageLight = Color(0xFFD3E8CE);
  static const Color terracotta = Color(0xFF974731);
  static const Color yellow = Color(0xFFCCA72F);
  static const Color ink = Color(0xFF1C1C15);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cream,
      appBar: AppBar(
        backgroundColor: cream,
        elevation: 0,
        title: const Text(
          'Patient Progress',
          style: TextStyle(
            color: ink,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(
          20,
          8,
          20,
          35,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSummaryCard(),

            const SizedBox(height: 20),

            _buildChartCard(),

            const SizedBox(height: 20),

            const Text(
              'Cognitive Activities',
              style: TextStyle(
                color: ink,
                fontSize: 21,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 5),

            Text(
              'Performance across different activities',
              style: TextStyle(
                color: Colors.grey.shade600,
                fontSize: 12,
              ),
            ),

            const SizedBox(height: 14),

            _buildActivityCard(
              icon: Icons.psychology_outlined,
              title: 'Memory Match',
              subtitle: 'Memory & recall',
              score: '80%',
              progress: .80,
              color: terracotta,
            ),

            const SizedBox(height: 11),

            _buildActivityCard(
              icon: Icons.grid_view_rounded,
              title: 'Pattern Matching',
              subtitle: 'Visual recognition',
              score: '88%',
              progress: .88,
              color: sage,
            ),

            const SizedBox(height: 11),

            _buildActivityCard(
              icon: Icons.menu_book_outlined,
              title: 'Story Memory',
              subtitle: 'Story recall',
              score: '75%',
              progress: .75,
              color: yellow,
            ),

            const SizedBox(height: 11),

            _buildActivityCard(
              icon: Icons.numbers_outlined,
              title: 'Number Recall',
              subtitle: 'Short-term memory',
              score: '91%',
              progress: .91,
              color: sageDark,
            ),

            const SizedBox(height: 22),

            _buildWeeklyCard(),
          ],
        ),
      ),
    );
  }

  // ============================================================
  // SUMMARY
  // ============================================================

  Widget _buildSummaryCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: sageDark,
        borderRadius: BorderRadius.circular(23),
        boxShadow: [
          BoxShadow(
            color: ink.withValues(alpha: .13),
            blurRadius: 15,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            children: [
              Icon(
                Icons.insights_outlined,
                color: Colors.white,
                size: 25,
              ),
              SizedBox(width: 10),
              Text(
                'Overall Progress',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),

          const SizedBox(height: 22),

          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const Text(
                '85%',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(width: 10),

              Padding(
                padding: const EdgeInsets.only(
                  bottom: 7,
                ),
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 9,
                    vertical: 5,
                  ),
                  decoration: BoxDecoration(
                    color: sageLight,
                    borderRadius:
                        BorderRadius.circular(15),
                  ),
                  child: const Text(
                    '+8%',
                    style: TextStyle(
                      color: sageDark,
                      fontSize: 11,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 7),

          const Text(
            'Excellent improvement this month',
            style: TextStyle(
              color: Color(0xFFDCE8D8),
              fontSize: 12,
            ),
          ),

          const SizedBox(height: 18),

          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: const LinearProgressIndicator(
              value: .85,
              minHeight: 9,
              backgroundColor: Color(0xFF536952),
              valueColor:
                  AlwaysStoppedAnimation<Color>(
                Color(0xFFD3E8CE),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ============================================================
  // BAR GRAPH
  // ============================================================

  Widget _buildChartCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(
        18,
        19,
        18,
        18,
      ),
      decoration: BoxDecoration(
        color: surface,
        borderRadius: BorderRadius.circular(22),
        border: Border.all(
          color: const Color(0xFFE7E3D8),
        ),
        boxShadow: [
          BoxShadow(
            color: ink.withValues(alpha: .06),
            blurRadius: 14,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment:
            CrossAxisAlignment.start,
        children: [
          const Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment:
                      CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Weekly Performance',
                      style: TextStyle(
                        color: ink,
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      'Average daily score',
                      style: TextStyle(
                        color: Color(0xFF77776D),
                        fontSize: 11,
                      ),
                    ),
                  ],
                ),
              ),
              Icon(
                Icons.bar_chart_rounded,
                color: sage,
                size: 25,
              ),
            ],
          ),

          const SizedBox(height: 25),

          SizedBox(
            height: 230,
            child: Row(
              crossAxisAlignment:
                  CrossAxisAlignment.stretch,
              children: [
                _buildYAxis(),

                const SizedBox(width: 8),

                Expanded(
                  child: Column(
                    children: [
                      Expanded(
                        child: Stack(
                          children: [
                            _buildGridLines(),

                            Row(
                              crossAxisAlignment:
                                  CrossAxisAlignment.end,
                              mainAxisAlignment:
                                  MainAxisAlignment.spaceAround,
                              children: [
                                _buildBar(
                                  day: 'Mon',
                                  value: 62,
                                  height: 105,
                                  color: sageLight,
                                ),

                                _buildBar(
                                  day: 'Tue',
                                  value: 70,
                                  height: 119,
                                  color: sageLight,
                                ),

                                _buildBar(
                                  day: 'Wed',
                                  value: 76,
                                  height: 129,
                                  color: sageLight,
                                ),

                                _buildBar(
                                  day: 'Thu',
                                  value: 72,
                                  height: 122,
                                  color: sageLight,
                                ),

                                _buildBar(
                                  day: 'Fri',
                                  value: 85,
                                  height: 145,
                                  color: sage,
                                  selected: true,
                                ),

                                _buildBar(
                                  day: 'Sat',
                                  value: 82,
                                  height: 139,
                                  color: sageLight,
                                ),

                                _buildBar(
                                  day: 'Sun',
                                  value: 88,
                                  height: 150,
                                  color: sage,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 12),

          const Row(
            children: [
              Icon(
                Icons.info_outline,
                color: Color(0xFF77776D),
                size: 15,
              ),
              SizedBox(width: 6),
              Expanded(
                child: Text(
                  'Higher bars indicate stronger daily performance.',
                  style: TextStyle(
                    color: Color(0xFF77776D),
                    fontSize: 10,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // ============================================================
  // Y AXIS
  // ============================================================

  Widget _buildYAxis() {
    return SizedBox(
      width: 27,
      child: Column(
        mainAxisAlignment:
            MainAxisAlignment.spaceBetween,
        children: const [
          Text(
            '100',
            style: TextStyle(
              color: Color(0xFF8A8A81),
              fontSize: 9,
            ),
          ),
          Text(
            '75',
            style: TextStyle(
              color: Color(0xFF8A8A81),
              fontSize: 9,
            ),
          ),
          Text(
            '50',
            style: TextStyle(
              color: Color(0xFF8A8A81),
              fontSize: 9,
            ),
          ),
          Text(
            '25',
            style: TextStyle(
              color: Color(0xFF8A8A81),
              fontSize: 9,
            ),
          ),
          Text(
            '0',
            style: TextStyle(
              color: Color(0xFF8A8A81),
              fontSize: 9,
            ),
          ),
        ],
      ),
    );
  }

  // ============================================================
  // GRID LINES
  // ============================================================

  Widget _buildGridLines() {
    return Column(
      mainAxisAlignment:
          MainAxisAlignment.spaceBetween,
      children: List.generate(
        5,
        (index) {
          return Container(
            height: 1,
            color: const Color(0xFFEDEAE1),
          );
        },
      ),
    );
  }

  // ============================================================
  // BAR
  // ============================================================

  Widget _buildBar({
    required String day,
    required int value,
    required double height,
    required Color color,
    bool selected = false,
  }) {
    return Expanded(
      child: Column(
        mainAxisAlignment:
            MainAxisAlignment.end,
        children: [
          if (selected)
            Container(
              margin: const EdgeInsets.only(
                bottom: 5,
              ),
              padding: const EdgeInsets.symmetric(
                horizontal: 6,
                vertical: 3,
              ),
              decoration: BoxDecoration(
                color: sageDark,
                borderRadius:
                    BorderRadius.circular(6),
              ),
              child: Text(
                '$value%',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 8,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

          Container(
            width: 23,
            height: height,
            decoration: BoxDecoration(
              color: color,
              borderRadius:
                  const BorderRadius.vertical(
                top: Radius.circular(7),
              ),
            ),
          ),

          const SizedBox(height: 7),

          Text(
            day,
            style: TextStyle(
              color: selected
                  ? sageDark
                  : const Color(0xFF77776D),
              fontSize: 9,
              fontWeight: selected
                  ? FontWeight.bold
                  : FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  // ============================================================
  // ACTIVITY CARD
  // ============================================================

  Widget _buildActivityCard({
    required IconData icon,
    required String title,
    required String subtitle,
    required String score,
    required double progress,
    required Color color,
  }) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: surface,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(
          color: const Color(0xFFE7E3D8),
        ),
        boxShadow: [
          BoxShadow(
            color: ink.withValues(alpha: .04),
            blurRadius: 10,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: color.withValues(alpha: .12),
              borderRadius:
                  BorderRadius.circular(13),
            ),
            child: Icon(
              icon,
              color: color,
              size: 24,
            ),
          ),

          const SizedBox(width: 12),

          Expanded(
            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        title,
                        style: const TextStyle(
                          color: ink,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),

                    Text(
                      score,
                      style: TextStyle(
                        color: color,
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 4),

                Text(
                  subtitle,
                  style: TextStyle(
                    color: Colors.grey.shade600,
                    fontSize: 10,
                  ),
                ),

                const SizedBox(height: 9),

                ClipRRect(
                  borderRadius:
                      BorderRadius.circular(10),
                  child: LinearProgressIndicator(
                    value: progress,
                    minHeight: 6,
                    backgroundColor:
                        color.withValues(alpha: .10),
                    valueColor:
                        AlwaysStoppedAnimation<Color>(
                      color,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // ============================================================
  // WEEKLY SUMMARY
  // ============================================================

  Widget _buildWeeklyCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(19),
      decoration: BoxDecoration(
        color: const Color(0xFFEFF5EC),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: sageLight,
        ),
      ),
      child: Column(
        crossAxisAlignment:
            CrossAxisAlignment.start,
        children: [
          const Row(
            children: [
              Icon(
                Icons.auto_graph_outlined,
                color: sageDark,
                size: 22,
              ),
              SizedBox(width: 9),
              Text(
                'Weekly Summary',
                style: TextStyle(
                  color: sageDark,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),

          const SizedBox(height: 15),

          Row(
            children: [
              Expanded(
                child: _summaryItem(
                  title: 'Sessions',
                  value: '18',
                ),
              ),

              Expanded(
                child: _summaryItem(
                  title: 'Completed',
                  value: '15',
                ),
              ),

              Expanded(
                child: _summaryItem(
                  title: 'Avg. Score',
                  value: '79%',
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _summaryItem({
    required String title,
    required String value,
  }) {
    return Column(
      crossAxisAlignment:
          CrossAxisAlignment.start,
      children: [
        Text(
          value,
          style: const TextStyle(
            color: sageDark,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),

        const SizedBox(height: 3),

        Text(
          title,
          style: const TextStyle(
            color: Color(0xFF697265),
            fontSize: 10,
          ),
        ),
      ],
    );
  }
}
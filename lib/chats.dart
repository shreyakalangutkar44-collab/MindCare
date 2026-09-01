import 'package:flutter/material.dart';

class ChatsScreen extends StatefulWidget {
  const ChatsScreen({super.key});

  @override
  State<ChatsScreen> createState() => _ChatsScreenState();
}

class _ChatsScreenState extends State<ChatsScreen> {
  // ============================================================
  // COLORS
  // ============================================================

  static const Color background = Color(0xFFFDF9EE);
  static const Color cardColor = Color(0xFFFFFCF5);

  static const Color coral = Color(0xFFFF927D);
  static const Color brown = Color(0xFF9E4826);
  static const Color darkBrown = Color(0xFF8D3F20);

  static const Color sage = Color(0xFF51634E);
  static const Color sageLight = Color(0xFFDDEBD8);

  static const Color textDark = Color(0xFF171714);
  static const Color textGrey = Color(0xFF77756E);

  // ============================================================
  // CHAT DATA
  // ============================================================

  final List<Map<String, dynamic>> chats = [
    {
      'name': 'Dr. Ananya Sharma',
      'role': 'Neurologist',
      'message': 'How is the patient doing today?',
      'time': '10:42 AM',
      'unread': 2,
      'online': true,
      'color': Color(0xFFD3E8CE),
      'icon': Icons.medical_services_outlined,
    },
    {
      'name': 'Family Caregiver',
      'role': 'Family Member',
      'message': 'I have updated the medication schedule.',
      'time': '09:18 AM',
      'unread': 1,
      'online': true,
      'color': Color(0xFFFFD9CE),
      'icon': Icons.person_outline,
    },
    {
      'name': 'Care Coordinator',
      'role': 'Care Team',
      'message': 'The appointment has been confirmed.',
      'time': 'Yesterday',
      'unread': 0,
      'online': false,
      'color': Color(0xFFE8E1C9),
      'icon': Icons.support_agent_outlined,
    },
    {
      'name': 'Dr. Rahul Mehta',
      'role': 'Physician',
      'message': 'Please continue monitoring progress.',
      'time': 'Yesterday',
      'unread': 0,
      'online': false,
      'color': Color(0xFFDDE5EF),
      'icon': Icons.local_hospital_outlined,
    },
  ];

  // ============================================================
  // BUILD
  // ============================================================

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      body: SafeArea(
        child: Column(
          children: [
            _buildTopBar(),

            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(
                  48,
                  25,
                  48,
                  35,
                ),
                child: Column(
                  crossAxisAlignment:
                      CrossAxisAlignment.start,
                  children: [
                    _buildHeader(),

                    const SizedBox(height: 18),

                    _buildSearchBar(),

                    const SizedBox(height: 20),

                    _buildSectionTitle(),

                    const SizedBox(height: 11),

                    _buildChatList(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: _buildNewChatButton(),
    );
  }

  // ============================================================
  // TOP BAR
  // ============================================================

  Widget _buildTopBar() {
    return Container(
      height: 37,
      decoration: const BoxDecoration(
        color: background,
        border: Border(
          bottom: BorderSide(
            color: Color(0xFFE8E4D9),
            width: 1,
          ),
        ),
      ),
      child: Row(
        children: [
          const SizedBox(width: 49),

          GestureDetector(
            onTap: _openMenu,
            child: const Icon(
              Icons.menu,
              size: 18,
              color: Color(0xFF566152),
            ),
          ),

          const Spacer(),

          const Text(
            'MindCare Caregiver',
            style: TextStyle(
              color: brown,
              fontSize: 17,
              fontWeight: FontWeight.bold,
            ),
          ),

          const Spacer(),

          Container(
            width: 19,
            height: 19,
            decoration: BoxDecoration(
              color: const Color(0xFFE8E5DB),
              borderRadius: BorderRadius.circular(5),
            ),
            child: const Icon(
              Icons.notifications_none,
              color: Color(0xFF687063),
              size: 14,
            ),
          ),

          const SizedBox(width: 72),
        ],
      ),
    );
  }

  // ============================================================
  // HEADER
  // ============================================================

  Widget _buildHeader() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment:
                CrossAxisAlignment.start,
            children: [
              const Text(
                'Messages',
                style: TextStyle(
                  color: textDark,
                  fontSize: 21,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 4),

              Text(
                'Stay connected with the care team',
                style: TextStyle(
                  color: textGrey,
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ),

        Container(
          width: 42,
          height: 42,
          decoration: BoxDecoration(
            color: coral,
            borderRadius: BorderRadius.circular(13),
          ),
          child: const Icon(
            Icons.chat_bubble_outline,
            color: darkBrown,
            size: 21,
          ),
        ),
      ],
    );
  }

  // ============================================================
  // SEARCH BAR
  // ============================================================

  Widget _buildSearchBar() {
    return Container(
      height: 48,
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(13),
        border: Border.all(
          color: const Color(0xFFE6E1D4),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.035),
            blurRadius: 8,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Search conversations',
          hintStyle: const TextStyle(
            color: Color(0xFF9A978E),
            fontSize: 12,
          ),
          prefixIcon: const Icon(
            Icons.search,
            color: Color(0xFF77756E),
            size: 20,
          ),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(
            vertical: 14,
          ),
        ),
      ),
    );
  }

  // ============================================================
  // SECTION TITLE
  // ============================================================

  Widget _buildSectionTitle() {
    return Row(
      children: [
        const Text(
          'Recent Conversations',
          style: TextStyle(
            color: textDark,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),

        const Spacer(),

        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 9,
            vertical: 5,
          ),
          decoration: BoxDecoration(
            color: sageLight,
            borderRadius: BorderRadius.circular(15),
          ),
          child: const Text(
            '4 chats',
            style: TextStyle(
              color: sage,
              fontSize: 10,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }

  // ============================================================
  // CHAT LIST
  // ============================================================

  Widget _buildChatList() {
    return Column(
      children: List.generate(
        chats.length,
        (index) {
          return Padding(
            padding: const EdgeInsets.only(
              bottom: 11,
            ),
            child: _buildChatCard(
              chats[index],
              index,
            ),
          );
        },
      ),
    );
  }

  // ============================================================
  // CHAT CARD
  // ============================================================

  Widget _buildChatCard(
    Map<String, dynamic> chat,
    int index,
  ) {
    final bool hasUnread = chat['unread'] > 0;

    return GestureDetector(
      onTap: () {
        _openChat(chat);
      },
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: cardColor,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: hasUnread
                ? const Color(0xFFFFCFC4)
                : const Color(0xFFE7E2D6),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.045),
              blurRadius: 11,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          children: [
            _buildAvatar(chat),

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
                          chat['name'],
                          maxLines: 1,
                          overflow:
                              TextOverflow.ellipsis,
                          style: TextStyle(
                            color: textDark,
                            fontSize: 14,
                            fontWeight: hasUnread
                                ? FontWeight.bold
                                : FontWeight.w600,
                          ),
                        ),
                      ),

                      const SizedBox(width: 5),

                      Text(
                        chat['time'],
                        style: TextStyle(
                          color: hasUnread
                              ? brown
                              : textGrey,
                          fontSize: 9,
                          fontWeight: hasUnread
                              ? FontWeight.bold
                              : FontWeight.normal,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 3),

                  Text(
                    chat['role'],
                    style: const TextStyle(
                      color: brown,
                      fontSize: 10,
                      fontWeight: FontWeight.w500,
                    ),
                  ),

                  const SizedBox(height: 6),

                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          chat['message'],
                          maxLines: 1,
                          overflow:
                              TextOverflow.ellipsis,
                          style: TextStyle(
                            color: hasUnread
                                ? const Color(0xFF44433E)
                                : textGrey,
                            fontSize: 11,
                            fontWeight: hasUnread
                                ? FontWeight.w600
                                : FontWeight.normal,
                          ),
                        ),
                      ),

                      if (hasUnread) ...[
                        const SizedBox(width: 8),

                        Container(
                          width: 20,
                          height: 20,
                          alignment: Alignment.center,
                          decoration: const BoxDecoration(
                            color: coral,
                            shape: BoxShape.circle,
                          ),
                          child: Text(
                            '${chat['unread']}',
                            style: const TextStyle(
                              color: darkBrown,
                              fontSize: 9,
                              fontWeight:
                                  FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(width: 5),

            const Icon(
              Icons.chevron_right,
              color: Color(0xFFAAA79E),
              size: 20,
            ),
          ],
        ),
      ),
    );
  }

  // ============================================================
  // AVATAR
  // ============================================================

  Widget _buildAvatar(
    Map<String, dynamic> chat,
  ) {
    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        Container(
          width: 52,
          height: 52,
          decoration: BoxDecoration(
            color: chat['color'],
            shape: BoxShape.circle,
          ),
          child: Icon(
            chat['icon'],
            color: sage,
            size: 25,
          ),
        ),

        if (chat['online'])
          Container(
            width: 13,
            height: 13,
            decoration: BoxDecoration(
              color: const Color(0xFF5E9B5D),
              shape: BoxShape.circle,
              border: Border.all(
                color: cardColor,
                width: 2,
              ),
            ),
          ),
      ],
    );
  }

  // ============================================================
  // NEW CHAT BUTTON
  // ============================================================

  Widget _buildNewChatButton() {
    return FloatingActionButton(
      onPressed: _startNewChat,
      backgroundColor: brown,
      elevation: 4,
      child: const Icon(
        Icons.add_comment_outlined,
        color: Colors.white,
        size: 23,
      ),
    );
  }

  // ============================================================
  // OPEN CHAT
  // ============================================================

  void _openChat(
    Map<String, dynamic> chat,
  ) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => ChatDetailScreen(
          name: chat['name'],
          role: chat['role'],
          avatarColor: chat['color'],
          avatarIcon: chat['icon'],
        ),
      ),
    );
  }

  // ============================================================
  // NEW CHAT
  // ============================================================

  void _startNewChat() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text(
          'New conversation',
        ),
        backgroundColor: brown,
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  // ============================================================
  // MENU
  // ============================================================

  void _openMenu() {
    showModalBottomSheet(
      context: context,
      backgroundColor: background,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(22),
        ),
      ),
      builder: (context) {
        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(
              20,
              12,
              20,
              20,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 40,
                  height: 4,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade400,
                    borderRadius:
                        BorderRadius.circular(10),
                  ),
                ),

                const SizedBox(height: 18),

                const ListTile(
                  leading: Icon(
                    Icons.chat_bubble_outline,
                    color: brown,
                  ),
                  title: Text(
                    'Messages',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),

                const ListTile(
                  leading: Icon(
                    Icons.dashboard_outlined,
                    color: sage,
                  ),
                  title: Text(
                    'Dashboard',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

// =================================================================
// CHAT DETAIL SCREEN
// =================================================================

class ChatDetailScreen extends StatefulWidget {
  final String name;
  final String role;
  final Color avatarColor;
  final IconData avatarIcon;

  const ChatDetailScreen({
    super.key,
    required this.name,
    required this.role,
    required this.avatarColor,
    required this.avatarIcon,
  });

  @override
  State<ChatDetailScreen> createState() =>
      _ChatDetailScreenState();
}

class _ChatDetailScreenState
    extends State<ChatDetailScreen> {
  final TextEditingController messageController =
      TextEditingController();

  final List<Map<String, dynamic>> messages = [
    {
      'message': 'Hello! How is the patient doing today?',
      'mine': false,
      'time': '10:35 AM',
    },
    {
      'message':
          'She is doing well. She completed her morning activity.',
      'mine': true,
      'time': '10:38 AM',
    },
    {
      'message':
          'That is good to hear. Please continue monitoring her progress.',
      'mine': false,
      'time': '10:42 AM',
    },
  ];

  @override
  void dispose() {
    messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          _ChatsScreenState.background,

      appBar: _buildChatAppBar(),

      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.fromLTRB(
                18,
                20,
                18,
                20,
              ),
              itemCount: messages.length,
              itemBuilder: (context, index) {
                return _buildMessage(
                  messages[index],
                );
              },
            ),
          ),

          _buildMessageInput(),
        ],
      ),
    );
  }

  // ============================================================
  // CHAT APP BAR
  // ============================================================

  PreferredSizeWidget _buildChatAppBar() {
    return AppBar(
      backgroundColor:
          _ChatsScreenState.background,
      elevation: 0,
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: const Icon(
          Icons.arrow_back,
          color: _ChatsScreenState.textDark,
        ),
      ),
      titleSpacing: 0,
      title: Row(
        children: [
          Stack(
            alignment: Alignment.bottomRight,
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: widget.avatarColor,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  widget.avatarIcon,
                  color: _ChatsScreenState.sage,
                  size: 20,
                ),
              ),

              Container(
                width: 11,
                height: 11,
                decoration: BoxDecoration(
                  color: const Color(0xFF5E9B5D),
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: _ChatsScreenState.background,
                    width: 2,
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(width: 10),

          Column(
            crossAxisAlignment:
                CrossAxisAlignment.start,
            children: [
              Text(
                widget.name,
                style: const TextStyle(
                  color: _ChatsScreenState.textDark,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'Online • ${widget.role}',
                style: const TextStyle(
                  color: _ChatsScreenState.sage,
                  fontSize: 9,
                ),
              ),
            ],
          ),
        ],
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.phone_outlined,
            color: _ChatsScreenState.brown,
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.more_vert,
            color: _ChatsScreenState.textDark,
          ),
        ),
      ],
    );
  }

  // ============================================================
  // MESSAGE
  // ============================================================

  Widget _buildMessage(
    Map<String, dynamic> message,
  ) {
    final bool mine = message['mine'];

    return Align(
      alignment: mine
          ? Alignment.centerRight
          : Alignment.centerLeft,
      child: Container(
        constraints: BoxConstraints(
          maxWidth:
              MediaQuery.of(context).size.width * .75,
        ),
        margin: const EdgeInsets.only(
          bottom: 12,
        ),
        padding: const EdgeInsets.fromLTRB(
          14,
          11,
          14,
          8,
        ),
        decoration: BoxDecoration(
          color: mine
              ? _ChatsScreenState.brown
              : _ChatsScreenState.cardColor,
          borderRadius: BorderRadius.only(
            topLeft: const Radius.circular(16),
            topRight: const Radius.circular(16),
            bottomLeft:
                Radius.circular(mine ? 16 : 4),
            bottomRight:
                Radius.circular(mine ? 4 : 16),
          ),
          border: mine
              ? null
              : Border.all(
                  color: const Color(0xFFE6E1D4),
                ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(
                alpha: .035,
              ),
              blurRadius: 7,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.end,
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                message['message'],
                style: TextStyle(
                  color: mine
                      ? Colors.white
                      : _ChatsScreenState.textDark,
                  fontSize: 12,
                  height: 1.35,
                ),
              ),
            ),

            const SizedBox(height: 5),

            Text(
              message['time'],
              style: TextStyle(
                color: mine
                    ? Colors.white70
                    : _ChatsScreenState.textGrey,
                fontSize: 8,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ============================================================
  // MESSAGE INPUT
  // ============================================================

  Widget _buildMessageInput() {
    return Container(
      padding: const EdgeInsets.fromLTRB(
        12,
        10,
        12,
        12,
      ),
      decoration: BoxDecoration(
        color: _ChatsScreenState.cardColor,
        border: Border(
          top: BorderSide(
            color: Colors.grey.shade200,
          ),
        ),
      ),
      child: Row(
        children: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.attach_file,
              color: _ChatsScreenState.textGrey,
              size: 21,
            ),
          ),

          Expanded(
            child: Container(
              constraints: const BoxConstraints(
                minHeight: 43,
              ),
              decoration: BoxDecoration(
                color: _ChatsScreenState.background,
                borderRadius:
                    BorderRadius.circular(23),
                border: Border.all(
                  color: const Color(0xFFE4E0D5),
                ),
              ),
              child: TextField(
                controller: messageController,
                minLines: 1,
                maxLines: 4,
                decoration: const InputDecoration(
                  hintText: 'Type a message...',
                  hintStyle: TextStyle(
                    color: Color(0xFF99968D),
                    fontSize: 11,
                  ),
                  border: InputBorder.none,
                  contentPadding:
                      EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 12,
                  ),
                ),
              ),
            ),
          ),

          const SizedBox(width: 7),

          GestureDetector(
            onTap: _sendMessage,
            child: Container(
              width: 43,
              height: 43,
              decoration: const BoxDecoration(
                color: _ChatsScreenState.brown,
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.send_rounded,
                color: Colors.white,
                size: 19,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ============================================================
  // SEND MESSAGE
  // ============================================================

  void _sendMessage() {
    final String text =
        messageController.text.trim();

    if (text.isEmpty) {
      return;
    }

    setState(() {
      messages.add({
        'message': text,
        'mine': true,
        'time': 'Now',
      });
    });

    messageController.clear();
  }
}
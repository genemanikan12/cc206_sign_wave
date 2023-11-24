import 'package:flutter/material.dart';

class Sms extends StatelessWidget {
  const Sms({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[900],
        title: Row(
          children: [
            CircleAvatar(
              radius: 16,
              backgroundImage: AssetImage('lib/assets/profile_picture.jpg'),
            ),
            SizedBox(width: 8.0),
            Text(
              'Messenger',
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.camera_alt),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {},
          ),
        ],
        iconTheme: IconThemeData(color: Colors.white),
      ),
      backgroundColor: Colors.grey[850],
      body: ChatScreen(),
      bottomNavigationBar: DefaultTextStyle(
        style: TextStyle(
          fontFamily: 'Lato',
        ),
        child: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.book, color: Colors.blue),
              label: 'Lessons',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.fitness_center, color: Colors.blue),
              label: 'Exercises',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.chat, color: Colors.blue),
              label: 'Chat',
            ),
          ],
          currentIndex: 2,
          onTap: (index) {
            _onBottomNavItemTapped(index, context);
          },
          backgroundColor: Colors.grey[900],
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white,
        ),
      ),
    );
  }

  void _onBottomNavItemTapped(int index, BuildContext context) {
    switch (index) {
      case 0:
        print("Navigating to LessonsPage");
        Navigator.pushNamed(context, '/lessons');
        break;
      case 1:
        print("Navigating to ExercisePage");
        Navigator.pushNamed(context, '/exercise');
        break;
      case 2:
        print("Already on the ChatPage");
        break;
    }
  }
}

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _messageController = TextEditingController();
  List<ChatMessage> _chatMessages = [];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            reverse: true,
            itemCount: _chatMessages.length,
            itemBuilder: (context, index) {
              return _chatMessages[index];
            },
          ),
        ),
        Container(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              IconButton(
                icon: Icon(Icons.camera),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(Icons.attach_file),
                onPressed: () {},
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: TextField(
                    controller: _messageController,
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      hintText: 'Type a message...',
                      hintStyle:
                          TextStyle(color: Colors.grey, fontFamily: 'Lato'),
                      filled: true,
                      fillColor: Colors.grey[700],
                      contentPadding: EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 16.0),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                        borderSide: BorderSide.none,
                      ),
                    ),
                    onSubmitted: (message) {
                      _sendMessage(message);
                    },
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  _sendMessage(_messageController.text);
                },
                child: Container(
                  padding: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.blue,
                  ),
                  child: Icon(
                    Icons.send,
                    color: Colors.white,
                    size: 24,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  void _sendMessage(String messageText) {
    if (messageText.isNotEmpty) {
      setState(() {
        _chatMessages.insert(
          0,
          ChatMessage(text: messageText, isSentByMe: true),
        );
        _messageController.clear();
      });
    }
  }
}

class ChatMessage extends StatelessWidget {
  final String text;
  final bool isSentByMe;

  const ChatMessage({
    Key? key,
    required this.text,
    required this.isSentByMe,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isSentByMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 4.0),
        padding: EdgeInsets.all(12.0),
        decoration: BoxDecoration(
          color: isSentByMe ? Colors.blue : Colors.grey[700],
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Text(
          text,
          style: TextStyle(color: Colors.white, fontFamily: 'Lato'),
        ),
      ),
    );
  }
}

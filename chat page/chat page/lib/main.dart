import 'package:flutter/material.dart';

void main() => runApp(WhatsAppClone());

class WhatsAppClone extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'WhatsApp Clone',
      theme: ThemeData(
        primaryColor: const Color.fromARGB(255, 238, 5, 5), // Primary color
      ),
      home: ChatScreen(),
    );
  }
}

class ChatScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor, // Set AppBar background color to primary color
        title: const Row(
          children: [
            CircleAvatar(
              backgroundImage: AssetImage('assets/images/rover_avatar.jpg'), // Replace with Rover's profile image
            ),
            SizedBox(width: 10),
            Text('Rover'), // Replace with Rover's name
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.videocam),
            onPressed: () {
              // Handle video call action
            },
          ),
          IconButton(
            icon: const Icon(Icons.call),
            onPressed: () {
              // Handle voice call action
            },
          ),
          IconButton(
            icon: const Icon(Icons.more_vert),
            onPressed: () {
              // Handle more options action
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: CustomScrollView(
              reverse: true,
              slivers: [
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                        (context, index) => ChatBubble(
                      message: index.isEven
                          ? 'Hey Rover, how are you?'
                          : 'Hi! I\'m good, thanks.',
                      isMe: index.isEven,
                    ),
                    childCount: 10, // Number of chat bubbles
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Type a message...',
                      hintStyle: TextStyle(color: Colors.black), // Change hint text color to black
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red), // Change border color to red when focused
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red), // Change border color to red when enabled
                      ),
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.send),
                  onPressed: () {
                    // Handle send message action
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ChatBubble extends StatelessWidget {
  final String message;
  final bool isMe;

  const ChatBubble({
    required this.message,
    required this.isMe,
  });

  @override
  Widget build(BuildContext context) {
    final backgroundColor = isMe ? Colors.red : Colors.grey[300];
    final textColor = isMe ? Colors.white : Colors.black;

    return Align(
      alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 5),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.only(
            topLeft: const Radius.circular(20),
            topRight: const Radius.circular(20),
            bottomLeft: isMe ? const Radius.circular(20) : const Radius.circular(0),
            bottomRight: isMe ? const Radius.circular(0) : const Radius.circular(20),
          ),
        ),
        child: Text(
          message,
          style: TextStyle(
            color: textColor,
          ),
        ),
      ),
    );
  }
}

import 'package:chat/core/models/chat_message.dart';
import 'package:chat/core/services/chat/chat_service.dart';
import 'package:flutter/material.dart';

class Messages extends StatelessWidget {
  const Messages({super.key});
  
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<ChatMessage>>(
      stream: ChatService().messagesStream(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center( child: CircularProgressIndicator() );
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return Center(child: Text('Sem Mensagens! Vamos conversar ?'));
        } else {
          final msgs = snapshot.data!;
          return ListView.builder(
            itemCount: msgs.length,
            itemBuilder: (context, index) => Text(msgs[index].text),
          );
        }
      },
    );
  }
}

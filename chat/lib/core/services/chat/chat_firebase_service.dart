import 'dart:async';
import 'package:chat/core/models/chat_message.dart';
import 'package:chat/core/models/chat_user.dart';
import 'package:chat/core/services/chat/chat_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChatFirebaseService implements ChatService {
  @override
  Stream<List<ChatMessage>> messagesStream() {
    final store = FirebaseFirestore.instance;

    // store.collection('chat').snapshots() retorna um Stream<QuerySnapshot>.
    // Com o withConverter, vira um Stream<QuerySnapshot<ChatMessage>>
    final snapshots =
        store
            .collection('chat')
            .withConverter(
              fromFirestore: _fromFirestore,
              toFirestore: _toFirestore,
            )
            .orderBy('createdAt', descending: true)
            .snapshots();

    // Precisa converter de Stream<QuerySnapshot<ChatMessage>> para Stream<List<ChatMessage>>
    return snapshots.map((snapshot) {
      return snapshot.docs.map((doc) {
        return doc.data();
      }).toList();
    });

    // Outra possiblidade mais explicita
    // return Stream<List<ChatMessage>>.multi((controller) {
    //   snapshots.listen((snapshot) {
    //     List<ChatMessage> lsita =
    //         snapshot.docs.map((doc) {
    //           return doc.data();
    //         }).toList();
    //     controller.add(lsita);
    //   });
    // });
  }

  @override
  Future<ChatMessage?> save(String msg, ChatUser user) async {
    final store = FirebaseFirestore.instance;

    final newChat = ChatMessage(
      id: '', // O proprio firebase gera o id
      text: msg,
      createdAt: DateTime.now(),
      userId: user.id,
      userName: user.name,
      userImageUrl: user.imageUrl,
    );

    // Persiste a mensagem usando um converter tipado do Firestore.
    // - withConverter<ChatMessage> garante a (de)serialização segura entre ChatMessage <-> Map<String, dynamic>.
    // - add(newChat) cria o documento e deixa o Firestore gerar o id.
    final docRef = await store
        .collection('chat')
        .withConverter(fromFirestore: _fromFirestore, toFirestore: _toFirestore)
        .add(newChat);

    // Captura o documento ja convetido para ChatMessage
    final doc = await docRef.get();
    return doc.data()!;
  }

  //  Map<String,dynamic> => ChatMessage
  ChatMessage _fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> doc,
    SnapshotOptions? options,
  ) {
    return ChatMessage(
      id: doc.id,
      text: doc['text'],
      createdAt: DateTime.parse(doc['createdAt']),
      userId: doc['userId'],
      userName: doc['userName'],
      userImageUrl: doc['userImageUrl'],
    );
  }

  // ChatMessage => Map<String,dynamic>
  Map<String, dynamic> _toFirestore(ChatMessage msg, SetOptions? options) {
    return {
      'text': msg.text,
      'createdAt': msg.createdAt.toIso8601String(),
      'userId': msg.userId,
      'userName': msg.userName,
      'userImageUrl': msg.userImageUrl,
    };
  }
}

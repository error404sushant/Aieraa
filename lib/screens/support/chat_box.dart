// import 'package:aieraa_studies/models/chat_user.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
//
// class ChatBox extends StatefulWidget {
//   const ChatBox({Key? key}) : super(key: key);
//
//   @override
//   State<ChatBox> createState() => _ChatBoxState();
// }
//
// class _ChatBoxState extends State<ChatBox> {
//   List<ChatMessage> messages = [
//     ChatMessage(messageContent: "Hello, Will", messageType: "receiver"),
//     ChatMessage(messageContent: "How have you been?", messageType: "receiver"),
//     ChatMessage(
//         messageContent: "Hey Kriss, I am doing fine dude. wbu?",
//         messageType: "sender"),
//     ChatMessage(messageContent: "ehhhh, doing OK.", messageType: "receiver"),
//     ChatMessage(
//         messageContent: "Is there any thing wrong?", messageType: "sender"),
//     ChatMessage(messageContent: "Hello, Will", messageType: "receiver"),
//     ChatMessage(messageContent: "How have you been?", messageType: "receiver"),
//     ChatMessage(
//         messageContent: "Hey Kriss, I am doing fine dude. wbu?",
//         messageType: "sender"),
//     ChatMessage(messageContent: "ehhhh, doing OK.", messageType: "receiver"),
//     ChatMessage(
//         messageContent: "Is there any thing wrong?", messageType: "sender"),
//   ];
//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       children: <Widget>[
//         ListView.builder(
//           itemCount: messages.length,
//           shrinkWrap: true,
//           padding: EdgeInsets.only(top: 10, bottom: 10),
//           physics: NeverScrollableScrollPhysics(),
//           itemBuilder: (context, index) {
//             return Container(
//               padding:
//                   EdgeInsets.only(left: 16, right: 16, top: 10, bottom: 10),
//               child: Align(
//                 alignment: (messages[index].messageType == "receiver"
//                     ? Alignment.topLeft
//                     : Alignment.topRight),
//                 child: Container(
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.only(
//                       topLeft: Radius.circular(20),
//                       topRight: Radius.circular(20),
//                       bottomLeft: Radius.circular(
//                           messages[index].messageType == "receiver" ? 0 : 20),
//                       bottomRight: Radius.circular(
//                           messages[index].messageType == "receiver" ? 20 : 0),
//                     ),
//                     color: (messages[index].messageType == "receiver"
//                         ? Colors.grey.shade200
//                         : Colors.blue[200]),
//                   ),
//                   padding: EdgeInsets.all(16),
//                   child: Text(
//                     messages[index].messageContent,
//                     style: TextStyle(fontSize: 15),
//                   ),
//                 ),
//               ),
//             );
//           },
//         ),
//       ],
//     );
//   }
// }

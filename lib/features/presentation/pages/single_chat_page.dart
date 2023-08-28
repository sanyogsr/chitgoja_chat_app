import 'package:chitgoja/features/presentation/widgets/theme/style.dart';
import 'package:flutter/material.dart';

class SingleChatPage extends StatefulWidget {
  const SingleChatPage({Key? key}) : super(key: key);

  @override
  _SingleChatPageState createState() => _SingleChatPageState();
}

class _SingleChatPageState extends State<SingleChatPage> {
  TextEditingController _messageController = TextEditingController();

  @override
  void initState() {
    _messageController.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Chats"),
      ),
      body: Column(
        children: [_listallmessagesWidget(), _inputMessageTextiField()],
      ),
    );
  }

  _listallmessagesWidget() {
    return Expanded(
      child: Container(
        // height: 700,
        child: ListView.builder(
            // physics:
            //     AlwaysScrollableScrollPhysics(parent: BouncingScrollPhysics()),
            // itemCount: 10,
            itemBuilder: (context, index) {
          return Text("");
        }),
      ),
    );
  }

  _inputMessageTextiField() {
    return Row(
      children: [
        Expanded(
            child: Container(
          margin: EdgeInsets.only(left: 10, bottom: 20),
          // height: 50,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(80),
              boxShadow: [
                BoxShadow(
                    blurRadius: 1,
                    spreadRadius: 1,
                    color: Colors.black.withOpacity(.2))
              ]),
          child: Row(
            children: [
              SizedBox(
                width: 10,
              ),
              Icon(Icons.insert_emoticon),
              SizedBox(
                width: 8,
              ),
              Expanded(
                child: Scrollbar(
                    // scrollbarOrientation: ,
                    child: TextField(
                  controller: _messageController,
                  maxLength: null,
                  decoration: InputDecoration(
                    hintText: "Type message....",
                    border: InputBorder.none,
                  ),
                )),
              ),
              SizedBox(
                width: 4,
              ),
              Icon(Icons.link),
              SizedBox(
                width: 8,
              ),
              Icon(Icons.camera_alt),
              SizedBox(
                width: 10,
              ),
            ],
          ),
        )),
        SizedBox(
          width: 10,
        ),
        Container(
          margin: EdgeInsets.only(right: 10, bottom: 20),
          height: 50,
          width: 50,
          decoration:
              BoxDecoration(color: primaryColor, shape: BoxShape.circle),
          child: Icon(_messageController.text.isEmpty ? Icons.mic : Icons.send),
        )
      ],
    );
  }
}

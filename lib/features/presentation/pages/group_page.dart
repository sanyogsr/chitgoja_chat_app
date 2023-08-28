import 'package:chitgoja/const.dart';
import 'package:chitgoja/features/presentation/widgets/single_item_group_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

class GroupPage extends StatelessWidget {
  const GroupPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, PageConst.createNewGroupPage);
          },
          child: Icon(AntDesign.addusergroup),
        ),
        body: Container(
            padding: EdgeInsets.all(15),
            child: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                      physics: AlwaysScrollableScrollPhysics(
                          parent: BouncingScrollPhysics()),
                      itemCount: 10,
                      itemBuilder: (context, index) {
                        return SingleItemGroupWidget(
                          onTap: () {
                            Navigator.pushNamed(
                                context, PageConst.singleChatPage);
                          },
                        );
                      }),
                )
              ],
            )));
  }
}

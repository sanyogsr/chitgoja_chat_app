import 'package:chitgoja/features/presentation/widgets/single_item_group_widget.dart';
import 'package:flutter/material.dart';

class GroupPage extends StatelessWidget {
  const GroupPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
                      onTap: () {},
                    );
                  }),
            )
          ],
        ));
  }
}

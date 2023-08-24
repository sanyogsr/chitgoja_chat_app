import 'package:chitgoja/features/presentation/widgets/single_item_user_widget.dart';
import 'package:flutter/material.dart';

class UsersPage extends StatelessWidget {
  const UsersPage({Key? key}) : super(key: key);

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
                    return SingleItemUserWidget(
                      onTap: () {},
                    );
                  }),
            )
          ],
        ));
  }
}

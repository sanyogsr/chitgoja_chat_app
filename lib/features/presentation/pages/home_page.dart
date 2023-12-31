import 'package:chitgoja/features/presentation/pages/group_page.dart';
import 'package:chitgoja/features/presentation/pages/profile_page.dart';
import 'package:chitgoja/features/presentation/pages/users_page.dart';
import 'package:chitgoja/features/presentation/widgets/custom_tool_bar.dart';
import 'package:chitgoja/features/presentation/widgets/text_field_widget.dart';
import 'package:chitgoja/features/presentation/widgets/theme/style.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController _searchController = TextEditingController();
  PageController _pageViewController = PageController();
  bool _isSearch = false;
  int _toolBarPageIndex = 0;

  List popUpMenuList = ["Logout"];

  List<Widget> get pages => [GroupPage(), UsersPage(), ProfilePage()];

  @override
  void dispose() {
    _searchController.dispose();
    _pageViewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: _isSearch == true ? Colors.transparent : primaryColor,
        title: _isSearch == true ? _emptyContainer() : Text('Chitgoja'),
        flexibleSpace:
            _isSearch == true ? _buidSearchWidget() : _emptyContainer(),
        actions: _isSearch == true
            ? []
            : [
                InkWell(
                    onTap: () {
                      setState(() {
                        _isSearch = !_isSearch;
                      });
                    },
                    child: Icon(Icons.search)),
                PopupMenuButton(
                    itemBuilder: (_) => popUpMenuList
                        .map((menuItem) =>
                            PopupMenuItem(child: Text("$menuItem")))
                        .toList())
              ],
      ),
      body: Column(
        children: [
          _isSearch == true
              ? _emptyContainer()
              : CustomToolBar(
                  pageIndex: _toolBarPageIndex,
                  toolBarIndexController: (int index) {
                    setState(() {
                      _toolBarPageIndex = index;
                    });

                    _pageViewController.jumpToPage(index);
                  }),
          Expanded(
            child: PageView.builder(
                controller: _pageViewController,
                onPageChanged: (index) {
                  setState(() {
                    _toolBarPageIndex = index;
                  });
                },
                itemCount: pages.length,
                itemBuilder: (context, index) {
                  return pages[index];
                }),
          )
        ],
      ),
    );
  }

  Widget _emptyContainer() {
    return Container(
      height: 0,
      width: 0,
    );
  }

  Widget _buidSearchWidget() {
    return SafeArea(
      child: Container(
        // margin: EdgeInsets.only(top: 25),
        height: 60,
        decoration: BoxDecoration(color: Colors.white, boxShadow: [
          BoxShadow(
            color: Colors.transparent,
            blurRadius: 2,
            spreadRadius: 1,
            offset: Offset(0, 0.50),
          )
        ]),
        child: TextFieldWidget(
            hintText: "Search...",
            onTap: () {
              setState(() {
                _isSearch = false;
              });
            },
            prefixIcon: Icons.arrow_back,
            controller: _searchController,
            keyboardType: TextInputType.text),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:inf_cf/common/const/colors.dart';
import 'package:inf_cf/common/layout/default_layout.dart';

class RootTab extends StatefulWidget {
  const RootTab({Key? key}) : super(key: key);

  @override
  State<RootTab> createState() => _RootTabState();
}

class _RootTabState extends State<RootTab> with SingleTickerProviderStateMixin {
  late TabController controller;
  int index = 0;

  @override
  void initState() {
    super.initState();
    controller = TabController(length: 4, vsync: this);
    controller.addListener(tabListner);
  }

  @override
  void dispose() {
    controller.removeListener(tabListner);
    super.dispose();
  }

  void tabListner() {
    setState(() {
      index = controller.index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      title: '코팩 딜리버리',
      bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: PRIMARY_COLOR,
          unselectedItemColor: BODY_TEXT_COLOR,
          selectedFontSize: 14,
          unselectedFontSize: 14,
          type: BottomNavigationBarType.shifting,
          onTap: (int index) {
            controller.animateTo(index);
          },
          currentIndex: index,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              label: '홈',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.fastfood_outlined),
              label: '음식',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.receipt_long_outlined),
              label: '주문',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_outlined),
              label: '프로필',
            ),
          ]),
      child: TabBarView(
        //스크롤로 탭바 이동하는 것 막기.
        physics: NeverScrollableScrollPhysics(),
        controller: controller,
        children: [
          Center(child: Container(child: const Text('홈'))),
          Center(child: Container(child: const Text('음식'))),
          Center(child: Container(child: const Text('주문'))),
          Center(child: Container(child: const Text('프로필'))),
        ],
      ),
    );
  }
}

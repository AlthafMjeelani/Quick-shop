import 'package:flutter/material.dart';

class TabbarWidget extends StatelessWidget {
  const TabbarWidget({
    Key? key,
    required this.tabController,
    required this.tabs,
  }) : super(key: key);

  final TabController tabController;
  final List<Widget> tabs;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TabBar(
          indicator: BoxDecoration(
              borderRadius: BorderRadius.circular(60), color: Colors.blue),
          indicatorColor: Colors.transparent,
          labelColor: const Color.fromARGB(255, 255, 255, 255),
          controller: tabController,
          unselectedLabelColor: Colors.black,
          tabs: tabs,
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/MainController.dart';
import '../widgets/todoList.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key, this.tabController}) : super(key: key);

  final TabController? tabController;
  final mainController = Get.put(MainController());

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
              centerTitle: true,
              title: const Text('내 할일')
          ),
          body: Column(
            children: [
              TabBar(tabs: [
                Tab(child: Row(
                      children:[
                        Text('할 일',style: TextStyle(color: Colors.black))
                      ],
                      mainAxisAlignment: MainAxisAlignment.center
                    )
                ),
                Tab(child: Row(
                      children:[
                        Text('완료',style: TextStyle(color: Colors.black))
                      ],
                      mainAxisAlignment: MainAxisAlignment.center
                    )
                ),
              ]),
              Expanded(child: TabBarView(
                children: [
                  TodoList(false),
                  TodoList(true)
                ],
              ))
            ],
          )
    ));
  }
}
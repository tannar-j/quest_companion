import 'package:flutter/material.dart';

//------------------------------------------------------------------------------
//--------------------------TAB BAR---------------------------------------------


Widget build(BuildContext context){
  return const DefaultTabController(length: 3, child: Scaffold(
    body: TabBarView(children: [
      Tab(icon: Icon(Icons.label_important)),Tab(icon: Icon(Icons.label_important)),Tab(icon: Icon(Icons.label_important))
    ],),
  ));
}
import 'package:example/app/routes.dart';
import 'package:flutter/material.dart';
import 'package:path_navigator/path_navigator.dart';

class ListDetailSubSubRoute extends Path {
  static String get name => "subsub/:sub_sub_id";
  final String id;
  final Data data;
  ListDetailSubSubRoute(
    this.id, {
    this.data,
  });
  @override
  String get routeName => "subsub/:sub_sub_id";
  @override
  String get url {
    String inital = "subsub/$id";
    // print("$routeName  ==> ${subRoute?.url}");
    // for (var route in subRoute ?? []) {
    //   inital += route.url;
    // }
    return inital + (subRoute?.url != null ? "/${subRoute.url}" : "");
  }

  // bool canPop = true;
  ValueNotifier<bool> canPop = ValueNotifier(true);
  @override
  Future<bool> canRemove() async {
    // BuildContext context;
    // Builder(builder: (c) {
    //   context = c;
    //   return Container();
    // });
    return await showDialog<bool>(
      context: PathNavigator.context,
      builder: (context) {
        return AlertDialog(
          title: Text("CanRemove"),
          actions: [
            RaisedButton(
                child: Text("YES"),
                onPressed: () {
                  Navigator.pop(context, true);
                }),
            RaisedButton(
                child: Text("NO"),
                onPressed: () {
                  Navigator.pop(context, false);
                }),
          ],
        );
      },
    );
  }
  
  @override
  Widget pageBuilder(BuildContext context, Path currentRoute) {
    return Container(
      color: Colors.red[200],
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          BackButton(onPressed:(){
            PathNavigator.pop();
          }),
          Text(url),
          Text(data?.toString() ?? ""),
          ValueListenableBuilder(
              valueListenable: canPop,
              builder: (context, value, child) => Switch(
                    value: value,
                    onChanged: (newVal) => canPop.value = newVal,
                  ))
        ],
      ),
    );
  }
}

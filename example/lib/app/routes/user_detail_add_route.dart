import 'package:flutter/material.dart';
import 'package:path_navigator/path_navigator.dart';

class UserDetailAddRoute extends Path {
  static String get name => "add";
  // final String id;

  UserDetailAddRoute();
  @override
  String get routeName => "add";

  @override
  String get url {
    String inital = "add";
    // print("$routeName  ==> ${subRoute?.url}");
    // for (var route in subRoute ?? []) {
    //   inital += route.url;
    // }
    return inital + (subRoute?.url != null ? "/${subRoute.url}" : "");
  }

  @override
  List<PathBuilder> get subRouteBuilder => [
        // PathBuilder(InvoicesRoute.pathName,
        //     (args) => InvoicesRoute((args as Map)["sub_id"]))
      ];

  @override
  Widget pageBuilder(BuildContext context, Path currentRoute) {
    return Container(
      color: Colors.lightGreen,
      child: Column(
        children: [
          BackButton(
            onPressed: (){
              PathNavigator.pop();
            }
          ),
          Center(
            child: Text("Add"),
          ),
        ],
      ),
    );
  }
}
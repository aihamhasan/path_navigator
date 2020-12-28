import 'package:example/app/routes.dart';
import 'package:flutter/material.dart';
import 'package:path_navigator/path_navigator.dart';
import 'user_detail_sub_sub_route.dart';

class InvoicesRoute extends Path {
  static String get pathName => "invoices/:sub_id";

  final String id;
  final String userId;
  InvoicesRoute(this.id, {this.userId});
  @override
  String get routeName => "invoices/:sub_id";
  @override
  String get url {
    String inital = "invoices/$id";
    // print("$routeName  ==> ${subRoute?.url}");
    // for (var route in subRoute ?? []) {
    //   inital += route.url;
    // }
    return inital + (subRoute?.url != null ? "/${subRoute.url}" : "");
  }

  @override
  List<PathBuilder> get subRouteBuilder => [
        PathBuilder(
            ListDetailSubSubRoute.name,
            (args) => ListDetailSubSubRoute((args as Map)["sub_sub_id"],
                data: (args as Map)["data"]))
      ];

  @override
  Widget pageBuilder(BuildContext context, Path e) {
    return Container(
      color: Colors.yellow,
      child: Column(
        children: [
          BackButton(onPressed: () {
            PathNavigator.pop();
          }),
          ListView.builder(
            itemCount: 5,
            shrinkWrap: true,
            itemBuilder: (context, i) {
              bool selected =
                  e.subRoute != null && e.subRoute is ListDetailSubSubRoute
                      ? (e.subRoute as ListDetailSubSubRoute).id == "$i"
                      : false;
              return ListTile(
                title: Text(selected
                    ? "SELECTED sub_sub_id $i"
                    : "$userId $id sub_sub_id $i"),
                onTap: () {
                  PathNavigator.pushSubRoute(
                      ListDetailSubSubRoute(i.toString(),
                          data: Data(name: "My NAme", number: 15.0 * i)),
                      args: {"data": ""});
                },
                // trailing: BackButton(
                //   onPressed: () {
                //     routeState.pushSubRoute(ListDetailAddRoute());
                //   },
                // ),
              );
            },
          ),
        ],
      ),
    );
  }
}

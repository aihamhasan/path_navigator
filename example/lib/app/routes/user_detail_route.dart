import 'package:flutter/material.dart';
import 'package:path_navigator/path_navigator.dart';
import 'invoices_route.dart';

class UserDetailRoute extends Path {
  static String get name => ":id";
  final String id;

  UserDetailRoute(this.id);
  @override
  String get routeName => ":id";

  @override
  String get url {
    String inital = "$id";
    return inital + (subRoute?.url != null ? "/${subRoute.url}" : "");
  }

  @override
  List<PathBuilder> get subRouteBuilder => [
        PathBuilder(InvoicesRoute.pathName,
            (args) => InvoicesRoute((args as Map)["sub_id"], userId: id))
      ];

  @override
  Widget pageBuilder(BuildContext context, Path e) {
    return Container(
      color: Colors.orange,
      child: Column(
        children: [
          BackButton(
            color: Colors.black,
            onPressed: () {
              PathNavigator.pop();
            },
          ),
          ListView.builder(
            itemCount: 5,
            shrinkWrap: true,
            itemBuilder: (context, i) {
              bool selected = e.subRoute != null && e.subRoute is InvoicesRoute
                  ? (e.subRoute as InvoicesRoute).id == "$i"
                  : false;
              return ListTile(
                title: Text(selected ? "SELECTED Detail $i" : " Detail $i"),
                onTap: () {
                  PathNavigator.pushSubRoute(
                      InvoicesRoute(i.toString(), userId: id));
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

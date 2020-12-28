import 'package:flutter/material.dart';
import 'package:path_navigator/path_navigator.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'user_detail_route.dart';
import 'user_detail_add_route.dart';

class UserRoute extends Path {
  static String get name => "users";
  @override
  String get routeName => name;

  @override
  List<PathBuilder> get subRouteBuilder => [
        PathBuilder(UserDetailRoute.name,
            (args) => UserDetailRoute((args as Map)["id"])),
        PathBuilder(UserDetailAddRoute.name, (args) => UserDetailAddRoute())
      ];

  @override
  Widget pageBuilder(BuildContext context, Path e) {
    return ResponsiveBuilder(builder: (context, sizingInfo) {
      switch (sizingInfo.deviceScreenType) {
        case DeviceScreenType.mobile:
          break;
        case DeviceScreenType.tablet:
          break;
        case DeviceScreenType.desktop:
          if (subRoute != null) break;
          return Row(
            children: [
              Expanded(
                child: Container(
                  color: Colors.teal,
                  child: Column(
                    children: [
                      IconButton(
                          icon: Icon(Icons.add_box),
                          onPressed: () {
                            PathNavigator.pushSubRoute(UserDetailAddRoute());
                          }),
                      ListView.builder(
                        itemCount: 5,
                        shrinkWrap: true,
                        itemBuilder: (context, i) {
                          bool selected = e.subRoute != null &&
                                  e.subRoute is UserDetailRoute
                              ? (e.subRoute as UserDetailRoute).id == "$i"
                              : false;
                          return ListTile(
                            title: Text(selected ? "SELECTED $i" : "$i"),
                            onTap: () {
                              PathNavigator.pushSubRoute(
                                  UserDetailRoute(i.toString()));
                            },
                            // trailing: IconButton(

                            // )
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  color: Colors.amber,
                  child: Center(child: Text("Empty")),
                ),
              )
            ],
          );
          break;
        default:
      }
      return Container(
        color: Colors.teal,
        child: Column(
          children: [
            IconButton(
                icon: Icon(Icons.add_box),
                onPressed: () {
                  PathNavigator.pushSubRoute(UserDetailAddRoute());
                }),
            ListView.builder(
              itemCount: 5,
              shrinkWrap: true,
              itemBuilder: (context, i) {
                bool selected =
                    e.subRoute != null && e.subRoute is UserDetailRoute
                        ? (e.subRoute as UserDetailRoute).id == "$i"
                        : false;
                return ListTile(
                  title: Text(selected ? "SELECTED $i" : "$i"),
                  onTap: () {
                    PathNavigator.pushSubRoute(UserDetailRoute(i.toString()));
                  },
                  // trailing: BackButton(
                  //   onPressed: () {
                  //     PathNavigator.pushSubRoute(UserDetailAddRoute());
                  //   },
                  // ),
                );
              },
            ),
          ],
        ),
      );
    });
  }
}

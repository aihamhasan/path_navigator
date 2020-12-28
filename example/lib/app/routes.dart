import 'dart:convert';
import 'package:example/app/app.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:path_navigator/path_navigator.dart';
import 'package:responsive_builder/responsive_builder.dart';

class HomeRoute extends Path {
  static String get name => "home";
  @override
  String get routeName => name;

  @override
  Widget pageBuilder(BuildContext context, Path currentRoute) {
    return Home();
  }
}

class SettingsRoute extends Path {
  static String get name => "settings";
  @override
  String get routeName => name;

  @override
  Widget pageBuilder(BuildContext context, Path currentRoute) {
    return Container(
      color: Colors.lightBlue[100],
      child: Center(
        child: Text("Settings"),
      ),
    );
  }
}

abstract class SubCustomPath extends Path {
  String get id;
  String get segment;
  bool operator ==(Object other) {
    return (other is SubCustomPath && other.segment == segment);
  }

  @override
  int get hashCode => segment.hashCode;
}

class Data {
  String name;
  double number;
  Data({
    this.name,
    this.number,
  });

  Data copyWith({
    String name,
    double number,
  }) {
    return Data(
      name: name ?? this.name,
      number: number ?? this.number,
    );
  }

  Data merge(Data model) {
    return Data(
      name: model.name ?? this.name,
      number: model.number ?? this.number,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'number': number,
    };
  }

  factory Data.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Data(
      name: map['name'],
      number: map['number'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Data.fromJson(String source) => Data.fromMap(json.decode(source));

  @override
  String toString() => 'Data(name: $name, number: $number)';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is Data && o.name == name && o.number == number;
  }

  @override
  int get hashCode => name.hashCode ^ number.hashCode;
}


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'home.dart';

void main() {
  runApp(GetMaterialApp(
    home: Home(),
    theme: ThemeData(fontFamily: 'SFPRO'),
  ));
}
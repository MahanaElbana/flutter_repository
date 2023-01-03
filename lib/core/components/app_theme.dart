import 'package:flutter/material.dart';
import 'package:flutter_repository/core/components/app_colors.dart';

ThemeData appThemeData = ThemeData(
  // ========= app bar theme =============//
  appBarTheme: const AppBarTheme(
    backgroundColor: AppColors.primaryColor , 
    centerTitle: true ,
  ),
  // ========= primarySwatch =============//
  primarySwatch: Colors.indigo ,
);

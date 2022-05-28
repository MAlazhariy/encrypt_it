import 'dart:developer';

import 'package:encryption_app/cubit/material_cubit/material_states.dart';
import 'package:encryption_app/shared/network/local/color_theme_cache.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// This block is for changing the color theme
/// or anything related to rebuilding the Material widget
///
/// Using the AppCubit leads to a problem, as the Material widget is rebuilt
/// every time it goes to a state so that the application runs from the beginning
/// and this leads to some problems such as not opening the keyboard.
class MaterialCubit extends Cubit<MaterialStates>{
  MaterialCubit() : super(MaterialInitState());

  // bool? isDarkMode = ThemeCache.isDarkMode();
  // todo: remove this testing line
  bool? isDarkMode = null;

  static MaterialCubit get (context) => BlocProvider.of(context);

  void changeThemeMode(bool value){
    log('color mode changed to ${value?'dark mode':'light mode'}');
    isDarkMode = value;
    ThemeCache.setDarkMode(value);
    emit(MaterialChangeThemeModeState());
  }
}
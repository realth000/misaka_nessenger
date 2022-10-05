import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

final ListTileThemeData _listTileTheme = ListTileThemeData(
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(26),
  ),
  horizontalTitleGap: 10,
);

const InputDecorationTheme _inputDecorationTheme = InputDecorationTheme(
  border: OutlineInputBorder(),
);

final ThemeData _flexLightBase = FlexThemeData.light(
  colors: const FlexSchemeColor(
    primary: Color(0xff375778),
    primaryContainer: Color(0xffa4c4ed),
    secondary: Color(0xff08803a),
    secondaryContainer: Color(0xff50c27f),
    tertiary: Color(0xff836d5b),
    tertiaryContainer: Color(0xffa99686),
    appBarColor: Color(0xff50c27f),
    error: Color(0xffb00020),
  ),
  surfaceMode: FlexSurfaceMode.highScaffoldLowSurface,
  blendLevel: 20,
  appBarOpacity: 0.95,
  tabBarStyle: FlexTabBarStyle.forBackground,
  tooltipsMatchBackground: true,
  subThemesData: const FlexSubThemesData(
    defaultRadius: 26,
    thickBorderWidth: 1.5,
    unselectedToggleIsColored: true,
    fabUseShape: true,
    popupMenuOpacity: 0.98,
    dialogBackgroundSchemeColor: SchemeColor.inversePrimary,
    navigationBarHeight: 63,
    navigationBarLabelBehavior:
        NavigationDestinationLabelBehavior.onlyShowSelected,
    navigationRailOpacity: 0.99,
  ),
  keyColors: const FlexKeyColors(
    useSecondary: true,
    useTertiary: true,
    keepSecondary: true,
    keepPrimaryContainer: true,
    keepSecondaryContainer: true,
  ),
  visualDensity: FlexColorScheme.comfortablePlatformDensity,
  useMaterial3: true,
  // To use the playground font, add GoogleFonts package and uncomment
  // fontFamily: GoogleFonts.notoSans().fontFamily,
);

final ThemeData _flexDarkBase = FlexThemeData.dark(
  colors: const FlexSchemeColor(
    primary: Color(0xffacc9ee),
    // primaryContainer: Color(0xffa4c4ed),
    primaryContainer: Color(0xff516f98),
    secondary: Color(0xff40c498),
    secondaryContainer: Color(0xff394b3a),
    tertiary: Color(0xff917965),
    tertiaryContainer: Color(0xffa99686),
    appBarColor: Color(0xff394b3a),
    error: Color(0xffcf6679),
  ),
  surfaceMode: FlexSurfaceMode.highScaffoldLevelSurface,
  blendLevel: 19,
  appBarOpacity: 0.98,
  tabBarStyle: FlexTabBarStyle.forBackground,
  tooltipsMatchBackground: true,
  subThemesData: const FlexSubThemesData(
    defaultRadius: 26,
    thickBorderWidth: 1.5,
    unselectedToggleIsColored: true,
    fabUseShape: true,
    popupMenuOpacity: 0.98,
    dialogBackgroundSchemeColor: SchemeColor.inversePrimary,
    navigationBarHeight: 63,
    navigationBarLabelBehavior:
        NavigationDestinationLabelBehavior.onlyShowSelected,
    navigationRailOpacity: 0.99,
  ),
  keyColors: const FlexKeyColors(
    useSecondary: true,
    useTertiary: true,
    keepSecondary: true,
  ),
  visualDensity: FlexColorScheme.comfortablePlatformDensity,
  useMaterial3: true,
  // To use the playground font, add GoogleFonts package and uncomment
  // fontFamily: GoogleFonts.notoSans().fontFamily,
);

/// App light theme.
///
/// Based on flex light base theme data.
final ThemeData flexLight = _flexLightBase.copyWith(
  listTileTheme: _listTileTheme,
  inputDecorationTheme: _inputDecorationTheme,
);

/// App dark theme.
///
/// Based on flex dark base theme data.
final ThemeData flexDark = _flexDarkBase.copyWith(
  listTileTheme: _listTileTheme,
  inputDecorationTheme: _inputDecorationTheme,
);

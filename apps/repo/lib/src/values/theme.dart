import 'package:flutter/material.dart';
import 'package:repo/src/values/colors.dart';
import 'package:template/template.dart';

class AppTheme {
  static double widthDevice = 428;
  static double heightDevice = 926;

  /// Defines the light theme with specific color configurations.
  static final themeLight = () {
    final defaultTheme = ThemeData.light().copyWith(
      primaryColor: AppColors.primaryColor,
      cardColor: Colors.white,
      scaffoldBackgroundColor: Colors.white,
      timePickerTheme: const TimePickerThemeData(backgroundColor: Colors.white),
      shadowColor: AppColors.primaryColor.withOpacity(0.12),
      cardTheme: CardTheme(
        shadowColor: Colors.black.withOpacity(0.12),
        surfaceTintColor: Colors.white,
      ),
      listTileTheme: const ListTileThemeData(
        textColor: Colors.black,
      ),
      buttonTheme: ButtonThemeData(
        splashColor: AppColors.primaryColor.withOpacity(0.3),
        hoverColor: AppColors.primaryColor.withOpacity(0.3),
      ),
      splashColor: AppColors.primaryColor.withOpacity(0.3),
      hoverColor: Colors.transparent,
      colorScheme: const ColorScheme(
        brightness: Brightness.light,
        primary: AppColors.primaryColor,
        onPrimary: AppColors.white,
        secondary: AppColors.ksSecondaryLight,
        onSecondary: Color(0xFFBBBBBB),
        error: AppColors.ksErrorLight,
        onError: Color(0xFFEF5350),
        background: Color(0xFFF1F2F3),
        onBackground: Color(0xFFF1F2F3),
        surface: AppColors.primaryColor,
        onSurface: Colors.black,
        tertiary: Colors.white,
        surfaceTint: Colors.white,
      ),
      textTheme: ThemeData.light().textTheme.apply(
            fontFamily: 'Poppins',
          ),
    );
    return defaultTheme.copyWith(
      extensions: [
        _lightAppColors,
      ],
    );
  }();

  /// Defines color values for the light theme using [ThemeColorExtension].
  static final _lightAppColors = ThemeColorExtension(
    ksPrimary: AppColors.primaryColor,
    ksSecondary: AppColors.ksSecondaryLight,
    ksTertiary: AppColors.ksTertiaryLight,
    ksBody: AppColors.ksBodyLight,
    ksBorder: AppColors.ksBorderLight,
    // ksBorder2: AppColors.ksBorder2Light,
    ksSuccess: AppColors.ksSuccessLight,
    ksWarning: AppColors.ksWarningLight,
    ksInfo: AppColors.ksInfoLight,
    ksError: AppColors.ksErrorLight,
    ksBlack: Colors.black,
    ksWhite: Colors.white,
    ksGrey: const Color(0xFF808080),
    ksBackground1: AppColors.ksBackground1Light,
    ksBackground2: AppColors.ksBackground2Light,
    ksBackground3: AppColors.ksBackground3Light,
    // ksBackground4: AppColors.ksBackground4Light,
    // ksBackground5: AppColors.ksBackground5Light,
    // ksBackground6: AppColors.ksBackground6Light,
    // ksBackground7: AppColors.ksBackground7Light,
    ksProductCustomColors1:
        AppColors.ksProductCustomColors1Light, //const Color(0xFFFF2365)
    ksProductCustomColors2: AppColors.ksProductCustomColors2Light,
    ksProductCustomColors3: AppColors.ksProductCustomColors3Light,
    ksProductCustomColors4: AppColors.ksProductCustomColors4Light,
    ksProductCustomColors5: AppColors.ksProductCustomColors5Light,
    ksProductCustomColors6: AppColors.ksProductCustomColors6Light,
    ksProductCustomColors7: AppColors.ksProductCustomColors7Light,
    ksProductCustomColors8: AppColors.ksProductCustomColors8Light,
    ksProductCustomColors9: AppColors.ksProductCustomColors9Light,
    ksProductCustomColors10: AppColors.ksProductCustomColors10Light,
    ksProductCustomColors11: AppColors.ksProductCustomColors11Light,
    // ksProductCustomColors12: AppColors.ksProductCustomColors12Light,
    // ksProductCustomColors13: AppColors.ksProductCustomColors13Light,
    // ksProductCustomColors14: AppColors.ksProductCustomColors14Light,
    // ksProductCustomColors15: AppColors.ksProductCustomColors15Light,
    // ksProductCustomColors16: AppColors.ksProductCustomColors16Light,
  );

  //==============Dark Theme
  static final themeDark = () {
    final defaultTheme = ThemeData.dark().copyWith(
      primaryColor: AppColors.primaryColor,
      cardColor: Colors.black,
      scaffoldBackgroundColor: Colors.black,
      shadowColor: AppColors.primaryColor.withOpacity(0.12),
      dividerColor: Colors.black.withOpacity(0.2),
      dividerTheme: DividerThemeData(
        color: Colors.black12.withOpacity(0.2),
        thickness: 1,
      ),
      splashColor: AppColors.primaryColor.withOpacity(0.3),
      hoverColor: AppColors.primaryColor.withOpacity(0.3),
      cardTheme: CardTheme(
        shadowColor: Colors.black.withOpacity(0.12),
        surfaceTintColor: Colors.black,
      ),
      listTileTheme: const ListTileThemeData(
        textColor: Colors.black,
      ),
      timePickerTheme:
          const TimePickerThemeData(backgroundColor: Color(0xFF2C2F41)),
      textTheme: ThemeData.dark().textTheme.apply(
            fontFamily: 'Poppins',
          ),
      colorScheme: const ColorScheme(
        brightness: Brightness.dark,
        primary: AppColors.primaryColor,
        onPrimary: AppColors.primaryColor,
        secondary: Color(0xFFBBBBBB),
        onSecondary: Color(0xFFBBBBBB),
        error: AppColors.ksErrorDark,
        onError: AppColors.ksErrorDark,
        background: Color(0xFF232531),
        onBackground: Color(0xFF232531),
        surface: Color(0xFF232531),
        onSurface: Colors.black,
        tertiary: Colors.black,
        surfaceTint: Colors.black,
      ),
    );
    return defaultTheme.copyWith(
      extensions: [
        _darkAppColors,
      ],
    );
  }();

  /// Defines color values for the dark theme using [ThemeColorExtension].
  static final _darkAppColors = ThemeColorExtension(
    ksPrimary: AppColors.primaryColor,
    ksSecondary: AppColors.ksSecondaryDark,
    ksTertiary: AppColors.ksTertiaryDark,
    ksBody: AppColors.ksBodyDark,
    ksBorder: AppColors.ksBorderDark,
    // ksBorder2: AppColors.ksBorder2Dark,
    ksSuccess: AppColors.ksSuccessDark,
    ksWarning: AppColors.ksWarningDark,
    ksInfo: AppColors.ksInfoDark,
    ksError: AppColors.ksErrorDark,
    ksBlack: Colors.black,
    ksWhite: Colors.white,
    ksGrey: const Color(0xFF808080),
    ksBackground1: AppColors
        .ksBackground1Dark, // const [Color(0xFF232531), Color(0xFF232531)],
    ksBackground2: AppColors.ksBackground2Dark,
    ksBackground3: AppColors.ksBackground3Dark,
    // ksBackground4: AppColors.ksBackground4Dark,
    // ksBackground5: AppColors.ksBackground5Dark,
    // ksBackground6: AppColors.ksBackground6Dark,
    // ksBackground7: AppColors.ksBackground7Dark,
    ksProductCustomColors1: AppColors.ksProductCustomColors1Dark,
    ksProductCustomColors2: AppColors.ksProductCustomColors2Dark,
    ksProductCustomColors3: AppColors.ksProductCustomColors3Dark,
    ksProductCustomColors4: AppColors.ksProductCustomColors4Dark,
    ksProductCustomColors5: AppColors.ksProductCustomColors5Dark,
    ksProductCustomColors6: AppColors.ksProductCustomColors6Dark,
    ksProductCustomColors7: AppColors.ksProductCustomColors7Dark,
    ksProductCustomColors8: AppColors.ksProductCustomColors8Dark,
    ksProductCustomColors9: AppColors.ksProductCustomColors9Dark,
    ksProductCustomColors10: AppColors.ksProductCustomColors10Dark,
    ksProductCustomColors11: AppColors.ksProductCustomColors11Dark,
    // ksProductCustomColors12: AppColors.ksProductCustomColors12Dark,
    // ksProductCustomColors13: AppColors.ksProductCustomColors13Dark,
    // ksProductCustomColors14: AppColors.ksProductCustomColors14Dark,
    // ksProductCustomColors15: AppColors.ksProductCustomColors15Dark,
    // ksProductCustomColors16: AppColors.ksProductCustomColors16Dark,
  );
}

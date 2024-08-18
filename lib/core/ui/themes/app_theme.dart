part of 'theme.dart';

class AppThemes {
  static const String appFont = 'Montserrat';

  static const iconTheme = IconThemeData(color: AppColors.black);

  static final ThemeData light = ThemeData(
    brightness: Brightness.light,
    fontFamily: appFont,
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.primary,
      primary: AppColors.primary,
      secondary: AppColors.secondary,
      onSecondary: AppColors.black,
      tertiary: AppColors.tertiary,
      error: AppColors.error,
      surface: AppColors.white,
      surfaceVariant: AppColors.lightGrey,
      onSurface: AppColors.black,
      onPrimary: AppColors.white,
      onError: AppColors.white,
    ),
    // iconTheme: iconTheme,
    appBarTheme: AppBarTheme(
      titleTextStyle: AppTextStyle.body1.copyWith(
        fontWeight: FontWeight.bold,
        color: AppColors.black,
        fontFamily: appFont,
      ),
      iconTheme: iconTheme,
      centerTitle: false,
    ),
    badgeTheme: const BadgeThemeData(
      backgroundColor: AppColors.primary,
      textColor: AppColors.white,
    ),
    cardTheme: CardTheme(
      margin: EdgeInsets.zero,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    ),
    chipTheme: ChipThemeData(
      selectedColor: AppColors.primary,
      backgroundColor: AppColors.lightGrey,
      labelStyle: AppTextStyle.body2.copyWith(
        fontWeight: FontWeight.w500,
      ),
      secondaryLabelStyle: AppTextStyle.body2.copyWith(
        fontWeight: FontWeight.w500,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(100),
        side: const BorderSide(color: Colors.transparent),
      ),
    ),
    dividerTheme: DividerThemeData(
      thickness: 1.5,
      color: AppColors.black.withOpacity(0.08),
      space: 1,
    ),
    useMaterial3: true,
  );
}

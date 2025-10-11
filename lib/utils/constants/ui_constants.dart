import '../imports/common_libs.dart';

class UIConstants {
  // ==========================================================================
  // THEME
  // ==========================================================================
  ThemeData get theme => customLightTheme;

  // ==========================================================================
  // SPACING - 8pt Grid System
  // ==========================================================================
  double spacing0 = 0.0;
  double spacing1 = 4.0; // 8 * 0.5
  double spacing2 = 8.0; // 8 * 1
  double spacing3 = 12.0; // 8 * 1.5
  double spacing4 = 16.0; // 8 * 2
  double spacing5 = 20.0; // 8 * 2.5
  double spacing6 = 24.0; // 8 * 3
  double spacing7 = 28.0; // 8 * 3.5
  double spacing8 = 32.0; // 8 * 4
  double spacing10 = 40.0; // 8 * 5
  double spacing12 = 48.0; // 8 * 6
  double spacing16 = 64.0; // 8 * 8
  double spacing20 = 80.0; // 8 * 10
  double spacing24 = 96.0; // 8 * 12

  // ==========================================================================
  // OPACITY SCALE
  // ==========================================================================
  double opacity10 = 0.1;
  double opacity20 = 0.2;
  double opacity30 = 0.3;
  double opacity40 = 0.4;
  double opacity50 = 0.5;
  double opacity60 = 0.6;
  double opacity70 = 0.7;
  double opacity80 = 0.8;
  double opacity90 = 0.9;

  // ==========================================================================
  // BORDER RADIUS
  // ==========================================================================
  double radius4 = 4.0;
  double radius8 = 8.0;
  double radius12 = 12.0;
  double radius16 = 16.0;
  double radius20 = 20.0;
  double radius24 = 24.0;

  // ==========================================================================
  // ELEVATION
  // ==========================================================================
  double elevation2 = 2.0;
  double elevation4 = 4.0;
  double elevation6 = 6.0;
  double elevation8 = 8.0;
  double elevation12 = 12.0;
  double elevation16 = 16.0;

  // ==========================================================================
  // BORDER WIDTH
  // ==========================================================================
  double borderWidth1 = 1.0;
  double borderWidth2 = 2.0;
  double borderWidth3 = 3.0;
  double borderWidth4 = 4.0;

  // ==========================================================================
  // COMPONENT CONSTANTS
  // ==========================================================================

  // Tooltip
  double tooltipMinHeight = 32.0;
  double tooltipPaddingHorizontal = 12.0;
  double tooltipPaddingVertical = 8.0;
  double tooltipMargin = 8.0;
  double tooltipVerticalOffset = 24.0;
  double tooltipFontSize = 12.0;
  double tooltipLetterSpacing = 0.4;
  int tooltipWaitDurationMs = 500;
  int tooltipShowDurationMs = 1500;

  // AppBar
  double appBarTitleSpacing = 16.0;
  double appBarToolbarHeight = 64.0;
  double appBarLeadingWidth = 56.0;
  double appBarIconSize = 24.0;
  double appBarActionsPadding = 8.0;
  double appBarTitleFontSize = 22.0;
  double appBarToolbarFontSize = 16.0;

  // Button
  double buttonPaddingHorizontal = 16.0;
  double buttonPaddingVertical = 8.0;
  double buttonHeight = 48.0;

  // ==========================================================================
  // LIGHT THEME COLORS - GREEN & CYAN
  // ==========================================================================

  // Primary Colors - Cyan
  Color lightPrimary = Color(0xFF00BFA5);
  Color lightOnPrimary = Color(0xFFFFFFFF);
  Color lightPrimaryContainer = Color(0xFFA0F9E8);
  Color lightOnPrimaryContainer = Color(0xFF002219);
  Color lightPrimaryFixedDim = Color(0xFF00A393);
  Color lightInversePrimary = Color(0xFF7FFFFF);
  Color lightSurfaceTint = Color(0xFF00BFA5);

  // Secondary Colors - Green
  Color lightSecondary = Color(0xFF1B6E3C);
  Color lightOnSecondary = Color(0xFFFFFFFF);
  Color lightSecondaryContainer = Color(0xFFA5F9B1);
  Color lightOnSecondaryContainer = Color(0xFF002110);
  Color lightSecondaryFixedDim = Color(0xFF0D5726);
  Color lightOnSecondaryFixed = Color(0xFFFFFFFF);

  // Tertiary Colors - Teal Green
  Color lightTertiary = Color(0xFF2BA889);
  Color lightOnTertiary = Color(0xFFFFFFFF);
  Color lightTertiaryContainer = Color(0xFFAEF9D0);
  Color lightOnTertiaryContainer = Color(0xFF001F18);
  Color lightTertiaryFixedDim = Color(0xFF158F6F);
  Color lightOnTertiaryFixedVariant = Color(0xFF0D7B62);

  // Error Colors
  Color lightError = Color(0xFFBA1A1A);
  Color lightOnError = Color(0xFFFFFFFF);
  Color lightErrorContainer = Color(0xFFFFDAD6);
  Color lightOnErrorContainer = Color(0xFF410002);

  // Surface Colors
  Color lightSurface = Color(0xFFFBFDF9);
  Color lightOnSurface = Color(0xFF191C1A);
  Color lightOnSurfaceVariant = Color(0xFF3F4945);
  Color lightSurfaceContainerLowest = Color(0xFFFFFFFF);
  Color lightSurfaceContainerLow = Color(0xFFF5F7F4);
  Color lightSurfaceContainer = Color(0xFFEFF1EE);
  Color lightSurfaceContainerHigh = Color(0xFFE9EBE8);
  Color lightSurfaceContainerHighest = Color(0xFFE3E5E2);
  Color lightSurfaceDim = Color(0xFFDDDFDC);
  Color lightSurfaceBright = Color(0xFFFEFDFA);

  // Outline Colors
  Color lightOutline = Color(0xFF6F7974);
  Color lightOutlineVariant = Color(0xFFBEC9C3);

  // Inverse Colors
  Color lightInverseSurface = Color(0xFF2E312E);
  Color lightOnInverseSurface = Color(0xFFF1F3F0);

  // Shadow & Scrim
  Color lightShadow = Color(0xFF000000);
  Color lightScrim = Color(0xFF000000);

  // ==========================================================================
  // DARK THEME COLORS - GREEN & CYAN
  // ==========================================================================

  // Primary Colors - Cyan
  Color darkPrimary = Color(0xFF7FFFFF);
  Color darkOnPrimary = Color(0xFF003732);
  Color darkPrimaryContainer = Color(0xFF00544D);
  Color darkOnPrimaryContainer = Color(0xFFA0F9E8);
  Color darkPrimaryFixedDim = Color(0xFF7FFFFF);
  Color darkOnPrimaryFixedVariant = Color(0xFF00BFA5);
  Color darkInversePrimary = Color(0xFF00BFA5);
  Color darkSurfaceTint = Color(0xFF7FFFFF);

  // Secondary Colors - Green
  Color darkSecondary = Color(0xFF8DF999);
  Color darkOnSecondary = Color(0xFF003D1B);
  Color darkSecondaryContainer = Color(0xFF0D5726);
  Color darkOnSecondaryContainer = Color(0xFFA5F9B1);
  Color darkSecondaryFixedDim = Color(0xFF8DF999);

  // Tertiary Colors - Teal Green
  Color darkTertiary = Color(0xFF91DDB6);
  Color darkOnTertiary = Color(0xFF003D2C);
  Color darkTertiaryContainer = Color(0xFF158F6F);
  Color darkOnTertiaryContainer = Color(0xFFAEF9D0);
  Color darkTertiaryFixedDim = Color(0xFF91DDB6);
  Color darkOnTertiaryFixedVariant = Color(0xFF2BA889);

  // Error Colors
  Color darkError = Color(0xFFFFB4AB);
  Color darkOnError = Color(0xFF690005);
  Color darkErrorContainer = Color(0xFF93000A);
  Color darkOnErrorContainer = Color(0xFFFFDAD6);

  // Surface Colors
  Color darkSurface = Color(0xFF191C1A);
  Color darkOnSurface = Color(0xFFE3E5E2);
  Color darkOnSurfaceVariant = Color(0xFFBEC9C3);
  Color darkSurfaceContainerLowest = Color(0xFF0F1210);
  Color darkSurfaceContainerLow = Color(0xFF22251B);
  Color darkSurfaceContainer = Color(0xFF26291F);
  Color darkSurfaceContainerHigh = Color(0xFF30332A);
  Color darkSurfaceContainerHighest = Color(0xFF3B3F35);
  Color darkSurfaceDim = Color(0xFF191C1A);
  Color darkSurfaceBright = Color(0xFF3F4339);

  // Outline Colors
  Color darkOutline = Color(0xFF89938E);
  Color darkOutlineVariant = Color(0xFF3F4945);

  // Inverse Colors
  Color darkInverseSurface = Color(0xFFE3E5E2);
  Color darkOnInverseSurface = Color(0xFF2E312E);

  // Shadow & Scrim
  Color darkShadow = Color(0xFF000000);
  Color darkScrim = Color(0xFF000000);

  // ==========================================================================
  // COMMON COLORS
  // ==========================================================================
  Color transparent = Colors.transparent;

  // ==========================================================================
  // UTILITY METHODS
  // ==========================================================================

  /// Get color by theme mode
  Color getColorByTheme({
    required bool isDark,
    required Color lightColor,
    required Color darkColor,
  }) {
    return isDark ? darkColor : lightColor;
  }

  /// Get primary color by theme mode
  Color getPrimaryColor(bool isDark) {
    return isDark ? darkPrimary : lightPrimary;
  }

  /// Get surface color by theme mode
  Color getSurfaceColor(bool isDark) {
    return isDark ? darkSurface : lightSurface;
  }

  /// Get on surface color by theme mode
  Color getOnSurfaceColor(bool isDark) {
    return isDark ? darkOnSurface : lightOnSurface;
  }
}

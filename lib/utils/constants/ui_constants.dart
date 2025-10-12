import '../imports/common_libs.dart';

class UIConstants {
  // ==========================================================================
  // THEME
  // ==========================================================================
  ThemeData get theme => customLightTheme;

  // ==========================================================================
  // SPACING - 8pt Grid System
  // ==========================================================================
  final double spacing0 = 0.0;
  final double spacing1 = 4.0; // 8 * 0.5
  final double spacing2 = 8.0; // 8 * 1
  final double spacing3 = 12.0; // 8 * 1.5
  final double spacing4 = 16.0; // 8 * 2
  final double spacing5 = 20.0; // 8 * 2.5
  final double spacing6 = 24.0; // 8 * 3
  final double spacing7 = 28.0; // 8 * 3.5
  final double spacing8 = 32.0; // 8 * 4
  final double spacing10 = 40.0; // 8 * 5
  final double spacing12 = 48.0; // 8 * 6
  final double spacing16 = 64.0; // 8 * 8
  final double spacing20 = 80.0; // 8 * 10
  final double spacing24 = 96.0; // 8 * 12

  // ==========================================================================
  // OPACITY SCALE
  // ==========================================================================
  final double opacity10 = 0.1;
  final double opacity20 = 0.2;
  final double opacity30 = 0.3;
  final double opacity40 = 0.4;
  final double opacity50 = 0.5;
  final double opacity60 = 0.6;
  final double opacity70 = 0.7;
  final double opacity80 = 0.8;
  final double opacity90 = 0.9;

  // ==========================================================================
  // BORDER RADIUS
  // ==========================================================================
  final double radius4 = 4.0;
  final double radius8 = 8.0;
  final double radius12 = 12.0;
  final double radius16 = 16.0;
  final double radius20 = 20.0;
  final double radius24 = 24.0;

  // ==========================================================================
  // ELEVATION
  // ==========================================================================
  final double elevation2 = 2.0;
  final double elevation4 = 4.0;
  final double elevation6 = 6.0;
  final double elevation8 = 8.0;
  final double elevation12 = 12.0;
  final double elevation16 = 16.0;

  // ==========================================================================
  // BORDER WIDTH
  // ==========================================================================
  final double borderWidth1 = 1.0;
  final double borderWidth2 = 2.0;
  final double borderWidth3 = 3.0;
  final double borderWidth4 = 4.0;

  // ==========================================================================
  // COMPONENT CONSTANTS
  // ==========================================================================

  // Tooltip
  final double tooltipMinHeight = 32.0;
  final double tooltipPaddingHorizontal = 12.0;
  final double tooltipPaddingVertical = 8.0;
  final double tooltipMargin = 8.0;
  final double tooltipVerticalOffset = 24.0;
  final double tooltipFontSize = 12.0;
  final double tooltipLetterSpacing = 0.4;
  final int tooltipWaitDurationMs = 500;
  final int tooltipShowDurationMs = 1500;

  // AppBar
  final double appBarTitleSpacing = 16.0;
  final double appBarToolbarHeight = 64.0;
  final double appBarLeadingWidth = 56.0;
  final double appBarIconSize = 24.0;
  final double appBarActionsPadding = 8.0;
  final double appBarTitleFontSize = 22.0;
  final double appBarToolbarFontSize = 16.0;

  // Button
  final double buttonPaddingHorizontal = 16.0;
  final double buttonPaddingVertical = 8.0;
  final double buttonHeight = 48.0;
  final double _buttonFontSize = 16.0;
  final double _buttonLetterSpacing = 0.4;
  final double _buttonIconSize = 16.0;

  // ==========================================================================
  // LIGHT THEME COLORS - GREEN & CYAN
  // ==========================================================================

  // Primary Colors - Cyan
  final Color lightPrimary = Color(0xFF00BFA5);
  final Color lightOnPrimary = Color(0xFFFFFFFF);
  final Color lightPrimaryContainer = Color(0xFFA0F9E8);
  final Color lightOnPrimaryContainer = Color(0xFF002219);
  final Color lightPrimaryFixedDim = Color(0xFF00A393);
  final Color lightInversePrimary = Color(0xFF7FFFFF);
  final Color lightSurfaceTint = Color(0xFF00BFA5);

  // Secondary Colors - Green
  final Color lightSecondary = Color(0xFF1B6E3C);
  final Color lightOnSecondary = Color(0xFFFFFFFF);
  final Color lightSecondaryContainer = Color(0xFFA5F9B1);
  final Color lightOnSecondaryContainer = Color(0xFF002110);
  final Color lightSecondaryFixedDim = Color(0xFF0D5726);
  final Color lightOnSecondaryFixed = Color(0xFFFFFFFF);

  // Tertiary Colors - Teal Green
  final Color lightTertiary = Color(0xFF2BA889);
  final Color lightOnTertiary = Color(0xFFFFFFFF);
  final Color lightTertiaryContainer = Color(0xFFAEF9D0);
  final Color lightOnTertiaryContainer = Color(0xFF001F18);
  final Color lightTertiaryFixedDim = Color(0xFF158F6F);
  final Color lightOnTertiaryFixedVariant = Color(0xFF0D7B62);

  // Error Colors
  final Color lightError = Color(0xFFBA1A1A);
  final Color lightOnError = Color(0xFFFFFFFF);
  final Color lightErrorContainer = Color(0xFFFFDAD6);
  final Color lightOnErrorContainer = Color(0xFF410002);

  // Surface Colors
  final Color lightSurface = Color(0xFFFBFDF9);
  final Color lightOnSurface = Color(0xFF191C1A);
  final Color lightOnSurfaceVariant = Color(0xFF3F4945);
  final Color lightSurfaceContainerLowest = Color(0xFFFFFFFF);
  final Color lightSurfaceContainerLow = Color(0xFFF5F7F4);
  final Color lightSurfaceContainer = Color(0xFFEFF1EE);
  final Color lightSurfaceContainerHigh = Color(0xFFE9EBE8);
  final Color lightSurfaceContainerHighest = Color(0xFFE3E5E2);
  final Color lightSurfaceDim = Color(0xFFDDDFDC);
  final Color lightSurfaceBright = Color(0xFFFEFDFA);

  // Outline Colors
  final Color lightOutline = Color(0xFF6F7974);
  final Color lightOutlineVariant = Color(0xFFBEC9C3);

  // Inverse Colors
  final Color lightInverseSurface = Color(0xFF2E312E);
  final Color lightOnInverseSurface = Color(0xFFF1F3F0);

  // Shadow & Scrim
  final Color lightShadow = Color(0xFF000000);
  final Color lightScrim = Color(0xFF000000);

  // ==========================================================================
  // DARK THEME COLORS - GREEN & CYAN
  // ==========================================================================

  // Primary Colors - Cyan
  final Color darkPrimary = Color(0xFF7FFFFF);
  final Color darkOnPrimary = Color(0xFF003732);
  final Color darkPrimaryContainer = Color(0xFF00544D);
  final Color darkOnPrimaryContainer = Color(0xFFA0F9E8);
  final Color darkPrimaryFixedDim = Color(0xFF7FFFFF);
  final Color darkOnPrimaryFixedVariant = Color(0xFF00BFA5);
  final Color darkInversePrimary = Color(0xFF00BFA5);
  final Color darkSurfaceTint = Color(0xFF7FFFFF);

  // Secondary Colors - Green
  final Color darkSecondary = Color(0xFF8DF999);
  final Color darkOnSecondary = Color(0xFF003D1B);
  final Color darkSecondaryContainer = Color(0xFF0D5726);
  final Color darkOnSecondaryContainer = Color(0xFFA5F9B1);
  final Color darkSecondaryFixedDim = Color(0xFF8DF999);

  // Tertiary Colors - Teal Green
  final Color darkTertiary = Color(0xFF91DDB6);
  final Color darkOnTertiary = Color(0xFF003D2C);
  final Color darkTertiaryContainer = Color(0xFF158F6F);
  final Color darkOnTertiaryContainer = Color(0xFFAEF9D0);
  final Color darkTertiaryFixedDim = Color(0xFF91DDB6);
  final Color darkOnTertiaryFixedVariant = Color(0xFF2BA889);

  // Error Colors
  final Color darkError = Color(0xFFFFB4AB);
  final Color darkOnError = Color(0xFF690005);
  final Color darkErrorContainer = Color(0xFF93000A);
  final Color darkOnErrorContainer = Color(0xFFFFDAD6);

  // Surface Colors
  final Color darkSurface = Color(0xFF191C1A);
  final Color darkOnSurface = Color(0xFFE3E5E2);
  final Color darkOnSurfaceVariant = Color(0xFFBEC9C3);
  final Color darkSurfaceContainerLowest = Color(0xFF0F1210);
  final Color darkSurfaceContainerLow = Color(0xFF22251B);
  final Color darkSurfaceContainer = Color(0xFF26291F);
  final Color darkSurfaceContainerHigh = Color(0xFF30332A);
  final Color darkSurfaceContainerHighest = Color(0xFF3B3F35);
  final Color darkSurfaceDim = Color(0xFF191C1A);
  final Color darkSurfaceBright = Color(0xFF3F4339);

  // Outline Colors
  final Color darkOutline = Color(0xFF89938E);
  final Color darkOutlineVariant = Color(0xFF3F4945);

  // Inverse Colors
  final Color darkInverseSurface = Color(0xFFE3E5E2);
  final Color darkOnInverseSurface = Color(0xFF2E312E);

  // Shadow & Scrim
  final Color darkShadow = Color(0xFF000000);
  final Color darkScrim = Color(0xFF000000);

  // ==========================================================================
  // COMMON COLORS
  // ==========================================================================
  final Color transparent = Colors.transparent;

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

  double? get buttonFontSize => _buttonFontSize;

  double? get buttonLetterSpacing => _buttonLetterSpacing;

  double? get buttonIconSize => _buttonIconSize;
}

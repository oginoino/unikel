import '../../utils/imports/common_libs.dart';

ColorScheme _lightColorScheme = ColorScheme.light(
  // Primary colors
  primary: uiConstants.lightPrimary,
  onPrimary: uiConstants.lightOnPrimary,
  primaryContainer: uiConstants.lightPrimaryContainer,
  onPrimaryContainer: uiConstants.lightOnPrimaryContainer,
  primaryFixed: uiConstants.lightPrimaryContainer,
  primaryFixedDim: uiConstants.lightPrimaryFixedDim,
  onPrimaryFixed: uiConstants.lightOnPrimaryContainer,
  onPrimaryFixedVariant: uiConstants.lightPrimary,

  // Secondary colors
  secondary: uiConstants.lightSecondary,
  onSecondary: uiConstants.lightOnSecondary,
  secondaryContainer: uiConstants.lightSecondaryContainer,
  onSecondaryContainer: uiConstants.lightOnSecondaryContainer,
  secondaryFixed: uiConstants.lightOnSecondaryContainer,
  secondaryFixedDim: uiConstants.lightSecondaryFixedDim,
  onSecondaryFixed: uiConstants.lightOnSecondaryFixed,
  onSecondaryFixedVariant: uiConstants.lightOnSurfaceVariant,

  // Tertiary colors
  tertiary: uiConstants.lightTertiary,
  onTertiary: uiConstants.lightOnTertiary,
  tertiaryContainer: uiConstants.lightTertiaryContainer,
  onTertiaryContainer: uiConstants.lightOnTertiaryContainer,
  tertiaryFixed: uiConstants.lightTertiaryContainer,
  tertiaryFixedDim: uiConstants.lightTertiaryFixedDim,
  onTertiaryFixed: uiConstants.lightOnTertiaryContainer,
  onTertiaryFixedVariant: uiConstants.lightOnTertiaryFixedVariant,

  // Error colors
  error: uiConstants.lightError,
  onError: uiConstants.lightOnError,
  errorContainer: uiConstants.lightErrorContainer,
  onErrorContainer: uiConstants.lightOnErrorContainer,

  // Surface colors
  surface: uiConstants.lightSurface,
  onSurface: uiConstants.lightOnSurface,
  surfaceDim: uiConstants.lightSurfaceDim,
  surfaceBright: uiConstants.lightSurfaceBright,
  surfaceContainerLowest: uiConstants.lightSurfaceContainerLowest,
  surfaceContainerLow: uiConstants.lightSurfaceContainerLow,
  surfaceContainer: uiConstants.lightSurfaceContainer,
  surfaceContainerHigh: uiConstants.lightSurfaceContainerHigh,
  surfaceContainerHighest: uiConstants.lightSurfaceContainerHighest,

  // Outline colors
  outline: uiConstants.lightOutline,
  outlineVariant: uiConstants.lightOutlineVariant,

  // Other colors
  shadow: uiConstants.lightShadow,
  scrim: uiConstants.lightScrim,
  inverseSurface: uiConstants.lightInverseSurface,
  onInverseSurface: uiConstants.lightOnInverseSurface,
  inversePrimary: uiConstants.lightInversePrimary,
  surfaceTint: uiConstants.lightSurfaceTint,
  onSurfaceVariant: uiConstants.lightOnSurfaceVariant,
);

TextTheme _lightTextTheme = TextTheme(
  displayLarge: TextStyle(
    fontFamily: GoogleFonts.nunito().fontFamily,
    fontSize: 57,
    fontWeight: FontWeight.w400,
    color: _lightColorScheme.onSurface,
  ),
  displayMedium: TextStyle(
    fontFamily: GoogleFonts.nunito().fontFamily,
    fontSize: 45,
    fontWeight: FontWeight.w400,
    color: _lightColorScheme.onSurface,
  ),
  displaySmall: TextStyle(
    fontFamily: GoogleFonts.nunito().fontFamily,
    fontSize: 36,
    fontWeight: FontWeight.w400,
    color: _lightColorScheme.onSurface,
  ),
  headlineLarge: TextStyle(
    fontFamily: GoogleFonts.nunito().fontFamily,
    fontSize: 32,
    fontWeight: FontWeight.w400,
    color: _lightColorScheme.onSurface,
  ),
  headlineMedium: TextStyle(
    fontFamily: GoogleFonts.nunito().fontFamily,
    fontSize: 28,
    fontWeight: FontWeight.w400,
    color: _lightColorScheme.onSurface,
  ),
  headlineSmall: TextStyle(
    fontFamily: GoogleFonts.nunito().fontFamily,
    fontSize: 24,
    fontWeight: FontWeight.w400,
    color: _lightColorScheme.onSurface,
  ),
  titleLarge: TextStyle(
    fontFamily: GoogleFonts.nunito().fontFamily,
    fontSize: 22,
    fontWeight: FontWeight.w400,
    color: _lightColorScheme.onSurface,
  ),
  titleMedium: TextStyle(
    fontFamily: GoogleFonts.nunito().fontFamily,
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: _lightColorScheme.onSurface,
  ),
  titleSmall: TextStyle(
    fontFamily: GoogleFonts.nunito().fontFamily,
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: _lightColorScheme.onSurface,
  ),
  bodyLarge: TextStyle(
    fontFamily: GoogleFonts.nunito().fontFamily,
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: _lightColorScheme.onSurface,
  ),
  bodyMedium: TextStyle(
    fontFamily: GoogleFonts.nunito().fontFamily,
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: _lightColorScheme.onSurface,
  ),
  bodySmall: TextStyle(
    fontFamily: GoogleFonts.nunito().fontFamily,
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: _lightColorScheme.onSurface,
  ),
  labelLarge: TextStyle(
    fontFamily: GoogleFonts.nunito().fontFamily,
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: _lightColorScheme.onSurface,
  ),
  labelMedium: TextStyle(
    fontFamily: GoogleFonts.nunito().fontFamily,
    fontSize: 12,
    fontWeight: FontWeight.w500,
    color: _lightColorScheme.onSurface,
  ),
  labelSmall: TextStyle(
    fontFamily: GoogleFonts.nunito().fontFamily,
    fontSize: 11,
    fontWeight: FontWeight.w500,
    color: _lightColorScheme.onSurface,
  ),
);

AppBarTheme _lightAppBarTheme = AppBarTheme(
  backgroundColor: _lightColorScheme.surface,
  foregroundColor: _lightColorScheme.onSurface,
  elevation: 0,
  scrolledUnderElevation: uiConstants.elevation4,
  shadowColor: _lightColorScheme.shadow,
  surfaceTintColor: _lightColorScheme.surfaceTint,
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.vertical(bottom: Radius.zero),
  ),
  iconTheme: IconThemeData(
    color: _lightColorScheme.onSurface,
    size: uiConstants.appBarIconSize,
  ),
  actionsIconTheme: IconThemeData(
    color: _lightColorScheme.onSurface,
    size: uiConstants.appBarIconSize,
  ),
  centerTitle: false,
  titleSpacing: uiConstants.appBarTitleSpacing,
  toolbarHeight: uiConstants.appBarToolbarHeight,
  leadingWidth: uiConstants.appBarLeadingWidth,
  titleTextStyle: TextStyle(
    fontFamily: GoogleFonts.nunito().fontFamily,
    fontSize: uiConstants.appBarTitleFontSize,
    fontWeight: FontWeight.w600,
    color: _lightColorScheme.onSurface,
  ),
  toolbarTextStyle: TextStyle(
    fontFamily: GoogleFonts.nunito().fontFamily,
    fontSize: uiConstants.appBarToolbarFontSize,
    fontWeight: FontWeight.w400,
    color: _lightColorScheme.onSurface,
  ),
  systemOverlayStyle: SystemUiOverlayStyle(
    statusBarColor: uiConstants.transparent,
    statusBarIconBrightness: Brightness.dark,
    statusBarBrightness: Brightness.light,
    systemNavigationBarColor: _lightColorScheme.surface,
    systemNavigationBarIconBrightness: Brightness.dark,
  ),
  actionsPadding: EdgeInsets.symmetric(
    horizontal: uiConstants.appBarActionsPadding,
  ),
);

TooltipThemeData _lightTooltipTheme = TooltipThemeData(
  constraints: BoxConstraints(minHeight: uiConstants.tooltipMinHeight),
  padding: EdgeInsets.symmetric(
    horizontal: uiConstants.tooltipPaddingHorizontal,
    vertical: uiConstants.tooltipPaddingVertical,
  ),
  margin: EdgeInsets.all(uiConstants.tooltipMargin),
  verticalOffset: uiConstants.tooltipVerticalOffset,
  preferBelow: true,
  excludeFromSemantics: false,
  enableFeedback: true,
  decoration: ShapeDecoration(
    color: _lightColorScheme.inverseSurface,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(uiConstants.radius8),
    ),
    shadows: [
      BoxShadow(
        color: _lightColorScheme.shadow.withValues(
          alpha: uiConstants.opacity20,
        ),
        offset: const Offset(0, 2),
        blurRadius: uiConstants.elevation4,
        spreadRadius: 0,
      ),
    ],
  ),
  textStyle: TextStyle(
    fontFamily: GoogleFonts.nunito().fontFamily,
    fontSize: uiConstants.tooltipFontSize,
    fontWeight: FontWeight.w500,
    color: _lightColorScheme.onInverseSurface,
    letterSpacing: uiConstants.tooltipLetterSpacing,
  ),
  textAlign: TextAlign.center,
  waitDuration: Duration(milliseconds: uiConstants.tooltipWaitDurationMs),
  showDuration: Duration(milliseconds: uiConstants.tooltipShowDurationMs),
);

// Botão Filled melhorado com estados interativos
FilledButtonThemeData _lightFilledButtonTheme = FilledButtonThemeData(
  style: _lightButtonBaseStyle.copyWith(
    backgroundColor: WidgetStateProperty.resolveWith<Color>((
      Set<WidgetState> states,
    ) {
      if (states.contains(WidgetState.disabled)) {
        return _lightColorScheme.primary.withValues(alpha: 0.38);
      }
      if (states.contains(WidgetState.pressed)) {
        return _lightColorScheme.primary.withValues(alpha: 0.9);
      }
      if (states.contains(WidgetState.hovered)) {
        return _lightColorScheme.primary.withValues(alpha: 0.92);
      }
      return _lightColorScheme.primary;
    }),
    foregroundColor: WidgetStateProperty.resolveWith<Color>((
      Set<WidgetState> states,
    ) {
      if (states.contains(WidgetState.disabled)) {
        return _lightColorScheme.onPrimary.withValues(alpha: 0.38);
      }
      return _lightColorScheme.onPrimary;
    }),
    elevation: WidgetStateProperty.resolveWith<double>((
      Set<WidgetState> states,
    ) {
      if (states.contains(WidgetState.disabled)) return 0;
      if (states.contains(WidgetState.pressed)) return uiConstants.elevation2;
      if (states.contains(WidgetState.hovered)) return uiConstants.elevation4;
      return uiConstants.elevation2;
    }),
    shadowColor: WidgetStateProperty.all(_lightColorScheme.shadow),
    overlayColor: WidgetStateProperty.resolveWith<Color?>((
      Set<WidgetState> states,
    ) {
      if (states.contains(WidgetState.hovered)) {
        return _lightColorScheme.primary.withValues(alpha: 0.08);
      }
      if (states.contains(WidgetState.focused)) {
        return _lightColorScheme.primary.withValues(alpha: 0.12);
      }
      if (states.contains(WidgetState.pressed)) {
        return _lightColorScheme.primary.withValues(alpha: 0.12);
      }
      return null;
    }),
  ),
);

final _lightButtonBaseStyle = ButtonStyle(
  padding: WidgetStateProperty.all(
    EdgeInsets.symmetric(
      horizontal: uiConstants.buttonPaddingHorizontal,
      vertical: uiConstants.buttonPaddingVertical,
    ),
  ),
  minimumSize: WidgetStateProperty.all(
    Size.fromHeight(uiConstants.buttonHeight),
  ),
  shape: WidgetStateProperty.all(
    RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(uiConstants.radius16),
    ),
  ),
  textStyle: WidgetStateProperty.all(
    TextStyle(
      fontFamily: GoogleFonts.nunito().fontFamily,
      fontSize: uiConstants.buttonFontSize,
      fontWeight: FontWeight.w600,
      letterSpacing: uiConstants.buttonLetterSpacing,
    ),
  ),
  iconSize: WidgetStateProperty.all(uiConstants.buttonIconSize),
);

// Botão Elevated melhorado com estados interativos
ElevatedButtonThemeData _lightElevatedButtonTheme = ElevatedButtonThemeData(
  style: _lightButtonBaseStyle.copyWith(
    backgroundColor: WidgetStateProperty.resolveWith<Color>((
      Set<WidgetState> states,
    ) {
      if (states.contains(WidgetState.disabled)) {
        return _lightColorScheme.onSurface.withValues(alpha: 0.12);
      }
      if (states.contains(WidgetState.pressed)) {
        return _lightColorScheme.primary;
      }
      if (states.contains(WidgetState.hovered)) {
        return _lightColorScheme.primary.withValues(alpha: 0.95);
      }
      return _lightColorScheme.primary;
    }),
    foregroundColor: WidgetStateProperty.resolveWith<Color>((
      Set<WidgetState> states,
    ) {
      if (states.contains(WidgetState.disabled)) {
        return _lightColorScheme.onSurface.withValues(alpha: 0.38);
      }
      return _lightColorScheme.onPrimary;
    }),
    elevation: WidgetStateProperty.resolveWith<double>((
      Set<WidgetState> states,
    ) {
      if (states.contains(WidgetState.disabled)) return 0;
      if (states.contains(WidgetState.pressed)) return uiConstants.elevation2;
      if (states.contains(WidgetState.hovered)) return uiConstants.elevation8;
      return uiConstants.elevation4;
    }),
    shadowColor: WidgetStateProperty.all(_lightColorScheme.shadow),
    overlayColor: WidgetStateProperty.resolveWith<Color?>((
      Set<WidgetState> states,
    ) {
      if (states.contains(WidgetState.hovered)) {
        return _lightColorScheme.onPrimary.withValues(alpha: 0.08);
      }
      if (states.contains(WidgetState.focused)) {
        return _lightColorScheme.onPrimary.withValues(alpha: 0.12);
      }
      if (states.contains(WidgetState.pressed)) {
        return _lightColorScheme.onPrimary.withValues(alpha: 0.12);
      }
      return null;
    }),
  ),
);

// Botão Outlined melhorado com estados interativos
OutlinedButtonThemeData _lightOutlinedButtonTheme = OutlinedButtonThemeData(
  style: _lightButtonBaseStyle.copyWith(
    backgroundColor: WidgetStateProperty.resolveWith<Color>((
      Set<WidgetState> states,
    ) {
      if (states.contains(WidgetState.hovered)) {
        return _lightColorScheme.primary.withValues(alpha: 0.08);
      }
      if (states.contains(WidgetState.pressed)) {
        return _lightColorScheme.primary.withValues(alpha: 0.12);
      }
      return Colors.transparent;
    }),
    foregroundColor: WidgetStateProperty.resolveWith<Color>((
      Set<WidgetState> states,
    ) {
      if (states.contains(WidgetState.disabled)) {
        return _lightColorScheme.onSurface.withValues(alpha: 0.38);
      }
      return _lightColorScheme.primary;
    }),
    side: WidgetStateProperty.resolveWith<BorderSide>((
      Set<WidgetState> states,
    ) {
      if (states.contains(WidgetState.disabled)) {
        return BorderSide(
          color: _lightColorScheme.onSurface.withValues(alpha: 0.12),
          width: 1.0,
        );
      }
      if (states.contains(WidgetState.hovered)) {
        return BorderSide(color: _lightColorScheme.primary, width: 1.5);
      }
      return BorderSide(color: _lightColorScheme.primary, width: 1.0);
    }),
    overlayColor: WidgetStateProperty.resolveWith<Color?>((
      Set<WidgetState> states,
    ) {
      if (states.contains(WidgetState.hovered)) {
        return _lightColorScheme.primary.withValues(alpha: 0.04);
      }
      if (states.contains(WidgetState.focused)) {
        return _lightColorScheme.primary.withValues(alpha: 0.08);
      }
      if (states.contains(WidgetState.pressed)) {
        return _lightColorScheme.primary.withValues(alpha: 0.12);
      }
      return null;
    }),
  ),
);

// Botão Text melhorado com estados interativos
TextButtonThemeData _lightTextButtonTheme = TextButtonThemeData(
  style: _lightButtonBaseStyle.copyWith(
    backgroundColor: WidgetStateProperty.resolveWith<Color>((
      Set<WidgetState> states,
    ) {
      if (states.contains(WidgetState.hovered)) {
        return _lightColorScheme.primary.withValues(alpha: 0.08);
      }
      if (states.contains(WidgetState.pressed)) {
        return _lightColorScheme.primary.withValues(alpha: 0.12);
      }
      return Colors.transparent;
    }),
    foregroundColor: WidgetStateProperty.resolveWith<Color>((
      Set<WidgetState> states,
    ) {
      if (states.contains(WidgetState.disabled)) {
        return _lightColorScheme.onSurface.withValues(alpha: 0.38);
      }
      return _lightColorScheme.primary;
    }),
    overlayColor: WidgetStateProperty.resolveWith<Color?>((
      Set<WidgetState> states,
    ) {
      if (states.contains(WidgetState.hovered)) {
        return _lightColorScheme.primary.withValues(alpha: 0.08);
      }
      if (states.contains(WidgetState.focused)) {
        return _lightColorScheme.primary.withValues(alpha: 0.12);
      }
      if (states.contains(WidgetState.pressed)) {
        return _lightColorScheme.primary.withValues(alpha: 0.12);
      }
      return null;
    }),
  ),
);

ThemeData customLightTheme = ThemeData(
  useMaterial3: true,
  colorScheme: _lightColorScheme,
  textTheme: _lightTextTheme,
  appBarTheme: _lightAppBarTheme,
  tooltipTheme: _lightTooltipTheme,
  filledButtonTheme: _lightFilledButtonTheme,
  elevatedButtonTheme: _lightElevatedButtonTheme,
  outlinedButtonTheme: _lightOutlinedButtonTheme,
  textButtonTheme: _lightTextButtonTheme,
);

import '../../utils/imports/common_libs.dart';

ColorScheme _darkColorScheme = ColorScheme.dark(
  // Primary colors
  primary: uiConstants.darkPrimary,
  onPrimary: uiConstants.darkOnPrimary,
  primaryContainer: uiConstants.darkPrimaryContainer,
  onPrimaryContainer: uiConstants.darkOnPrimaryContainer,
  primaryFixed: uiConstants.darkPrimaryContainer,
  primaryFixedDim: uiConstants.darkPrimaryFixedDim,
  onPrimaryFixed: uiConstants.darkOnPrimaryContainer,
  onPrimaryFixedVariant: uiConstants.darkPrimary,

  // Secondary colors
  secondary: uiConstants.darkSecondary,
  onSecondary: uiConstants.darkOnSecondary,
  secondaryContainer: uiConstants.darkSecondaryContainer,
  onSecondaryContainer: uiConstants.darkOnSecondaryContainer,
  secondaryFixed: uiConstants.darkOnSecondaryContainer,
  secondaryFixedDim: uiConstants.darkSecondaryFixedDim,
  onSecondaryFixed: uiConstants.darkOnSecondaryContainer,
  onSecondaryFixedVariant: uiConstants.darkOnSurfaceVariant,

  // Tertiary colors
  tertiary: uiConstants.darkTertiary,
  onTertiary: uiConstants.darkOnTertiary,
  tertiaryContainer: uiConstants.darkTertiaryContainer,
  onTertiaryContainer: uiConstants.darkOnTertiaryContainer,
  tertiaryFixed: uiConstants.darkTertiaryContainer,
  tertiaryFixedDim: uiConstants.darkTertiaryFixedDim,
  onTertiaryFixed: uiConstants.darkOnTertiaryContainer,
  onTertiaryFixedVariant: uiConstants.darkOnTertiaryFixedVariant,

  // Error colors
  error: uiConstants.darkError,
  onError: uiConstants.darkOnError,
  errorContainer: uiConstants.darkErrorContainer,
  onErrorContainer: uiConstants.darkOnErrorContainer,

  // Surface colors
  surface: uiConstants.darkSurface,
  onSurface: uiConstants.darkOnSurface,
  surfaceDim: uiConstants.darkSurfaceDim,
  surfaceBright: uiConstants.darkSurfaceBright,
  surfaceContainerLowest: uiConstants.darkSurfaceContainerLowest,
  surfaceContainerLow: uiConstants.darkSurfaceContainerLow,
  surfaceContainer: uiConstants.darkSurfaceContainer,
  surfaceContainerHigh: uiConstants.darkSurfaceContainerHigh,
  surfaceContainerHighest: uiConstants.darkSurfaceContainerHighest,

  // Outline colors
  outline: uiConstants.darkOutline,
  outlineVariant: uiConstants.darkOutlineVariant,

  // Other colors
  shadow: uiConstants.darkShadow,
  scrim: uiConstants.darkScrim,
  inverseSurface: uiConstants.darkInverseSurface,
  onInverseSurface: uiConstants.darkOnInverseSurface,
  inversePrimary: uiConstants.darkInversePrimary,
  surfaceTint: uiConstants.darkSurfaceTint,
  onSurfaceVariant: uiConstants.darkOnSurfaceVariant,
);

TextTheme _darkTextTheme = TextTheme(
  displayLarge: TextStyle(
    fontFamily: GoogleFonts.nunito().fontFamily,
    fontSize: 57,
    fontWeight: FontWeight.w400,
    color: _darkColorScheme.onSurface,
  ),
  displayMedium: TextStyle(
    fontFamily: GoogleFonts.nunito().fontFamily,
    fontSize: 45,
    fontWeight: FontWeight.w400,
    color: _darkColorScheme.onSurface,
  ),
  displaySmall: TextStyle(
    fontFamily: GoogleFonts.nunito().fontFamily,
    fontSize: 36,
    fontWeight: FontWeight.w400,
    color: _darkColorScheme.onSurface,
  ),
  headlineLarge: TextStyle(
    fontFamily: GoogleFonts.nunito().fontFamily,
    fontSize: 32,
    fontWeight: FontWeight.w400,
    color: _darkColorScheme.onSurface,
  ),
  headlineMedium: TextStyle(
    fontFamily: GoogleFonts.nunito().fontFamily,
    fontSize: 28,
    fontWeight: FontWeight.w400,
    color: _darkColorScheme.onSurface,
  ),
  headlineSmall: TextStyle(
    fontFamily: GoogleFonts.nunito().fontFamily,
    fontSize: 24,
    fontWeight: FontWeight.w400,
    color: _darkColorScheme.onSurface,
  ),
  titleLarge: TextStyle(
    fontFamily: GoogleFonts.nunito().fontFamily,
    fontSize: 22,
    fontWeight: FontWeight.w400,
    color: _darkColorScheme.onSurface,
  ),
  titleMedium: TextStyle(
    fontFamily: GoogleFonts.nunito().fontFamily,
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: _darkColorScheme.onSurface,
  ),
  titleSmall: TextStyle(
    fontFamily: GoogleFonts.nunito().fontFamily,
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: _darkColorScheme.onSurface,
  ),
  bodyLarge: TextStyle(
    fontFamily: GoogleFonts.nunito().fontFamily,
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: _darkColorScheme.onSurface,
  ),
  bodyMedium: TextStyle(
    fontFamily: GoogleFonts.nunito().fontFamily,
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: _darkColorScheme.onSurface,
  ),
  bodySmall: TextStyle(
    fontFamily: GoogleFonts.nunito().fontFamily,
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: _darkColorScheme.onSurface,
  ),
  labelLarge: TextStyle(
    fontFamily: GoogleFonts.nunito().fontFamily,
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: _darkColorScheme.onSurface,
  ),
  labelMedium: TextStyle(
    fontFamily: GoogleFonts.nunito().fontFamily,
    fontSize: 12,
    fontWeight: FontWeight.w500,
    color: _darkColorScheme.onSurface,
  ),
  labelSmall: TextStyle(
    fontFamily: GoogleFonts.nunito().fontFamily,
    fontSize: 11,
    fontWeight: FontWeight.w500,
    color: _darkColorScheme.onSurface,
  ),
);

AppBarTheme _darkAppBarTheme = AppBarTheme(
  backgroundColor: _darkColorScheme.surface,
  foregroundColor: _darkColorScheme.onSurface,
  elevation: 0,
  scrolledUnderElevation: 0,
  shadowColor: _darkColorScheme.shadow,
  surfaceTintColor: _darkColorScheme.surfaceTint,
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.vertical(bottom: Radius.zero),
  ),
  iconTheme: IconThemeData(
    color: _darkColorScheme.onSurface,
    size: uiConstants.appBarIconSize,
  ),
  actionsIconTheme: IconThemeData(
    color: _darkColorScheme.onSurface,
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
    color: _darkColorScheme.onSurface,
  ),
  toolbarTextStyle: TextStyle(
    fontFamily: GoogleFonts.nunito().fontFamily,
    fontSize: uiConstants.appBarToolbarFontSize,
    fontWeight: FontWeight.w400,
    color: _darkColorScheme.onSurface,
  ),
  systemOverlayStyle: SystemUiOverlayStyle(
    statusBarColor: uiConstants.transparent,
    statusBarIconBrightness: Brightness.light,
    statusBarBrightness: Brightness.dark,
    systemNavigationBarColor: _darkColorScheme.surface,
    systemNavigationBarIconBrightness: Brightness.light,
  ),
  actionsPadding: EdgeInsets.symmetric(
    horizontal: uiConstants.appBarActionsPadding,
  ),
);

TooltipThemeData _darkTooltipTheme = TooltipThemeData(
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
    color: _darkColorScheme.inverseSurface,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(uiConstants.radius8),
    ),
    shadows: [
      BoxShadow(
        color: _darkColorScheme.shadow.withValues(alpha: uiConstants.opacity20),
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
    color: _darkColorScheme.onInverseSurface,
    letterSpacing: uiConstants.tooltipLetterSpacing,
  ),
  textAlign: TextAlign.center,
  waitDuration: Duration(milliseconds: uiConstants.tooltipWaitDurationMs),
  showDuration: Duration(milliseconds: uiConstants.tooltipShowDurationMs),
);

final _darkButtonBaseStyle = ButtonStyle(
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

// Botão Filled melhorado com estados interativos
FilledButtonThemeData _darkFilledButtonTheme = FilledButtonThemeData(
  style: _darkButtonBaseStyle.copyWith(
    backgroundColor: WidgetStateProperty.resolveWith<Color>((
      Set<WidgetState> states,
    ) {
      if (states.contains(WidgetState.disabled)) {
        return _darkColorScheme.primary.withValues(alpha: 0.38);
      }
      if (states.contains(WidgetState.pressed)) {
        return _darkColorScheme.primary.withValues(alpha: 0.9);
      }
      if (states.contains(WidgetState.hovered)) {
        return _darkColorScheme.primary.withValues(alpha: 0.92);
      }
      return _darkColorScheme.primary;
    }),
    foregroundColor: WidgetStateProperty.resolveWith<Color>((
      Set<WidgetState> states,
    ) {
      if (states.contains(WidgetState.disabled)) {
        return _darkColorScheme.onPrimary.withValues(alpha: 0.38);
      }
      return _darkColorScheme.onPrimary;
    }),
    elevation: WidgetStateProperty.resolveWith<double>((
      Set<WidgetState> states,
    ) {
      if (states.contains(WidgetState.disabled)) return 0;
      if (states.contains(WidgetState.pressed)) return uiConstants.elevation2;
      if (states.contains(WidgetState.hovered)) return uiConstants.elevation4;
      return uiConstants.elevation2;
    }),
    shadowColor: WidgetStateProperty.all(_darkColorScheme.shadow),
    overlayColor: WidgetStateProperty.resolveWith<Color?>((
      Set<WidgetState> states,
    ) {
      if (states.contains(WidgetState.hovered)) {
        return _darkColorScheme.primary.withValues(alpha: 0.08);
      }
      if (states.contains(WidgetState.focused)) {
        return _darkColorScheme.primary.withValues(alpha: 0.12);
      }
      if (states.contains(WidgetState.pressed)) {
        return _darkColorScheme.primary.withValues(alpha: 0.12);
      }
      return null;
    }),
  ),
);

// Botão Elevated melhorado com estados interativos
ElevatedButtonThemeData _darkElevatedButtonTheme = ElevatedButtonThemeData(
  style: _darkButtonBaseStyle.copyWith(
    backgroundColor: WidgetStateProperty.resolveWith<Color>((
      Set<WidgetState> states,
    ) {
      if (states.contains(WidgetState.disabled)) {
        return _darkColorScheme.onSurface.withValues(alpha: 0.12);
      }
      if (states.contains(WidgetState.pressed)) {
        return _darkColorScheme.primary;
      }
      if (states.contains(WidgetState.hovered)) {
        return _darkColorScheme.primary.withValues(alpha: 0.95);
      }
      return _darkColorScheme.primary;
    }),
    foregroundColor: WidgetStateProperty.resolveWith<Color>((
      Set<WidgetState> states,
    ) {
      if (states.contains(WidgetState.disabled)) {
        return _darkColorScheme.onSurface.withValues(alpha: 0.38);
      }
      return _darkColorScheme.onPrimary;
    }),
    elevation: WidgetStateProperty.resolveWith<double>((
      Set<WidgetState> states,
    ) {
      if (states.contains(WidgetState.disabled)) return 0;
      if (states.contains(WidgetState.pressed)) return uiConstants.elevation2;
      if (states.contains(WidgetState.hovered)) return uiConstants.elevation8;
      return uiConstants.elevation4;
    }),
    shadowColor: WidgetStateProperty.all(_darkColorScheme.shadow),
    overlayColor: WidgetStateProperty.resolveWith<Color?>((
      Set<WidgetState> states,
    ) {
      if (states.contains(WidgetState.hovered)) {
        return _darkColorScheme.onPrimary.withValues(alpha: 0.08);
      }
      if (states.contains(WidgetState.focused)) {
        return _darkColorScheme.onPrimary.withValues(alpha: 0.12);
      }
      if (states.contains(WidgetState.pressed)) {
        return _darkColorScheme.onPrimary.withValues(alpha: 0.12);
      }
      return null;
    }),
  ),
);

// Botão Outlined melhorado com estados interativos
OutlinedButtonThemeData _darkOutlinedButtonTheme = OutlinedButtonThemeData(
  style: _darkButtonBaseStyle.copyWith(
    backgroundColor: WidgetStateProperty.all(Colors.transparent),
    foregroundColor: WidgetStateProperty.resolveWith<Color>((
      Set<WidgetState> states,
    ) {
      if (states.contains(WidgetState.disabled)) {
        return _darkColorScheme.onSurface.withValues(alpha: 0.38);
      }
      return _darkColorScheme.primary;
    }),
    side: WidgetStateProperty.resolveWith<BorderSide>((
      Set<WidgetState> states,
    ) {
      if (states.contains(WidgetState.disabled)) {
        return BorderSide(
          color: _darkColorScheme.onSurface.withValues(alpha: 0.12),
          width: 1,
        );
      }
      if (states.contains(WidgetState.pressed)) {
        return BorderSide(
          color: _darkColorScheme.primary.withValues(alpha: 0.9),
          width: 1,
        );
      }
      if (states.contains(WidgetState.hovered)) {
        return BorderSide(
          color: _darkColorScheme.primary.withValues(alpha: 0.92),
          width: 1,
        );
      }
      return BorderSide(color: _darkColorScheme.outline, width: 1);
    }),
    overlayColor: WidgetStateProperty.resolveWith<Color?>((
      Set<WidgetState> states,
    ) {
      if (states.contains(WidgetState.hovered)) {
        return _darkColorScheme.primary.withValues(alpha: 0.08);
      }
      if (states.contains(WidgetState.focused)) {
        return _darkColorScheme.primary.withValues(alpha: 0.12);
      }
      if (states.contains(WidgetState.pressed)) {
        return _darkColorScheme.primary.withValues(alpha: 0.12);
      }
      return null;
    }),
  ),
);

// Botão Text melhorado com estados interativos
TextButtonThemeData _darkTextButtonTheme = TextButtonThemeData(
  style: _darkButtonBaseStyle.copyWith(
    backgroundColor: WidgetStateProperty.all(Colors.transparent),
    foregroundColor: WidgetStateProperty.resolveWith<Color>((
      Set<WidgetState> states,
    ) {
      if (states.contains(WidgetState.disabled)) {
        return _darkColorScheme.onSurface.withValues(alpha: 0.38);
      }
      return _darkColorScheme.primary;
    }),
    overlayColor: WidgetStateProperty.resolveWith<Color?>((
      Set<WidgetState> states,
    ) {
      if (states.contains(WidgetState.hovered)) {
        return _darkColorScheme.primary.withValues(alpha: 0.08);
      }
      if (states.contains(WidgetState.focused)) {
        return _darkColorScheme.primary.withValues(alpha: 0.12);
      }
      if (states.contains(WidgetState.pressed)) {
        return _darkColorScheme.primary.withValues(alpha: 0.12);
      }
      return null;
    }),
  ),
);

ThemeData customDarkTheme = ThemeData(
  useMaterial3: true,
  colorScheme: _darkColorScheme,
  textTheme: _darkTextTheme,
  appBarTheme: _darkAppBarTheme,
  tooltipTheme: _darkTooltipTheme,
  filledButtonTheme: _darkFilledButtonTheme,
  elevatedButtonTheme: _darkElevatedButtonTheme,
  outlinedButtonTheme: _darkOutlinedButtonTheme,
  textButtonTheme: _darkTextButtonTheme,
  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: _darkColorScheme.surfaceContainerHighest,
    hoverColor: _darkColorScheme.surfaceContainerHigh,
    focusColor: _darkColorScheme.primary.withValues(alpha: 0.12),
    contentPadding: EdgeInsets.symmetric(
      horizontal: uiConstants.spacing2,
      vertical: uiConstants.spacing2,
    ),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(uiConstants.radius12),
      borderSide: BorderSide.none,
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(uiConstants.radius12),
      borderSide: BorderSide.none,
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(uiConstants.radius12),
      borderSide: BorderSide(color: _darkColorScheme.primary, width: 2.0),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(uiConstants.radius12),
      borderSide: BorderSide(color: _darkColorScheme.error, width: 2.0),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(uiConstants.radius12),
      borderSide: BorderSide(color: _darkColorScheme.error, width: 2.0),
    ),
    labelStyle: _darkTextTheme.labelLarge?.copyWith(
      color: _darkColorScheme.onSurfaceVariant,
    ),
    hintStyle: _darkTextTheme.bodyMedium?.copyWith(
      color: _darkColorScheme.onSurfaceVariant.withValues(alpha: 0.6),
    ),
  ),
  platform: TargetPlatform.android,
);

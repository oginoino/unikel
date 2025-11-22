import '../../utils/imports/common_libs.dart';
import 'glass_theme_extention.dart';
// Certifique-se de importar o arquivo da extensão criada acima
// import 'path/to/glass_theme_extension.dart';

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
  surface: uiConstants.lightSurface.withValues(
    alpha: 0.8,
  ), // Semi-transparent base
  onSurface: uiConstants.lightOnSurface,
  surfaceDim: uiConstants.lightSurfaceDim,
  surfaceBright: uiConstants.lightSurfaceBright,
  surfaceContainerLowest: uiConstants.lightSurfaceContainerLowest.withValues(
    alpha: 0.5,
  ),
  surfaceContainerLow: uiConstants.lightSurfaceContainerLow.withValues(
    alpha: 0.5,
  ),
  surfaceContainer: uiConstants.lightSurfaceContainer.withValues(alpha: 0.5),
  surfaceContainerHigh: uiConstants.lightSurfaceContainerHigh.withValues(
    alpha: 0.5,
  ),
  surfaceContainerHighest: uiConstants.lightSurfaceContainerHighest.withValues(
    alpha: 0.5,
  ),

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

// EXTENSÃO GLASSMORPHISM LIGHT
GlassTheme _lightGlassTheme = GlassTheme(
  glassColor: uiConstants.glassWhiteLow,
  glassBorderColor: uiConstants.glassWhiteMedium,
  glassBorderColorStart: uiConstants.glassBorderLightStart,
  glassBorderColorEnd: uiConstants.glassBorderLightEnd,
  blurAmount: uiConstants.glassBlurMedium,
  borderWidth: uiConstants.glassBorderWidthThin,
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
  // Glassmorphism: AppBar transparente para mostrar o gradiente de fundo
  backgroundColor: uiConstants.glassWhiteDim,
  foregroundColor: _lightColorScheme.onSurface,
  elevation: 0,
  scrolledUnderElevation: 0,
  shadowColor: Colors.transparent,
  surfaceTintColor: Colors.transparent,
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
    systemNavigationBarColor: uiConstants.glassWhiteLow,
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
    color: _lightColorScheme.inverseSurface.withValues(
      alpha: 0.8,
    ), // Glassy tooltip
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(uiConstants.radius8),
    ),
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

FilledButtonThemeData _lightFilledButtonTheme = FilledButtonThemeData(
  style: _lightButtonBaseStyle.copyWith(
    // 1. Fundo Translúcido (Glassy)
    backgroundColor: WidgetStateProperty.resolveWith<Color>((
      Set<WidgetState> states,
    ) {
      if (states.contains(WidgetState.disabled)) {
        return _lightColorScheme.primary.withValues(alpha: 0.38);
      }
      if (states.contains(WidgetState.pressed)) {
        // Mais opaco ao pressionar para feedback visual
        return _lightColorScheme.primary.withValues(alpha: 0.70);
      }
      if (states.contains(WidgetState.hovered)) {
        // Levemente mais visível no hover
        return _lightColorScheme.primary.withValues(alpha: 0.60);
      }
      // Estado normal: Transparência média (0.5) para ver o fundo através dele
      return _lightColorScheme.primary.withValues(alpha: 0.50);
    }),

    // 2. Cor do Texto/Ícone
    foregroundColor: WidgetStateProperty.resolveWith<Color>((
      Set<WidgetState> states,
    ) {
      if (states.contains(WidgetState.disabled)) {
        return _lightColorScheme.onPrimary.withValues(alpha: 0.38);
      }
      // Mantemos sólido para legibilidade ou levemente ajustado
      return _lightColorScheme.onPrimary;
    }),

    // 3. Elevação Zero (Glass é flat)
    elevation: WidgetStateProperty.all(0),
    shadowColor: WidgetStateProperty.all(Colors.transparent),

    // 4. Borda de Vidro (O Segredo do Glassmorphism)
    // Adiciona uma borda fina e clara para simular o reflexo da luz nas arestas
    side: WidgetStateProperty.resolveWith<BorderSide>((
      Set<WidgetState> states,
    ) {
      if (states.contains(WidgetState.disabled)) {
        return BorderSide.none;
      }
      // Borda branca translúcida (simula luz batendo na borda)
      // Se tiver uiConstants, use: uiConstants.glassBorderLightStart
      return BorderSide(
        color: Colors.white.withValues(alpha: 0.30),
        width: 1.0,
      );
    }),

    // 5. Overlay (Splash) sutil
    overlayColor: WidgetStateProperty.resolveWith<Color?>((
      Set<WidgetState> states,
    ) {
      if (states.contains(WidgetState.pressed)) {
        return Colors.white.withValues(alpha: 0.1);
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
      // Borda sutil para glass buttons
      side: BorderSide(color: uiConstants.glassWhiteLow, width: 0.5),
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

// Botão Elevated (Glassy)
ElevatedButtonThemeData _lightElevatedButtonTheme = ElevatedButtonThemeData(
  style: _lightButtonBaseStyle.copyWith(
    backgroundColor: WidgetStateProperty.resolveWith<Color>((
      Set<WidgetState> states,
    ) {
      if (states.contains(WidgetState.disabled)) {
        return _lightColorScheme.onSurface.withValues(alpha: 0.12);
      }
      return uiConstants.glassWhiteMedium; // Fundo vidro branco
    }),
    foregroundColor: WidgetStateProperty.resolveWith<Color>((
      Set<WidgetState> states,
    ) {
      if (states.contains(WidgetState.disabled)) {
        return _lightColorScheme.onSurface.withValues(alpha: 0.38);
      }
      return _lightColorScheme.primary;
    }),
    elevation: WidgetStateProperty.all(0),
    side: WidgetStateProperty.all(
      BorderSide(color: uiConstants.glassBorderLightStart, width: 1),
    ),
  ),
);

// Botão Outlined
OutlinedButtonThemeData _lightOutlinedButtonTheme = OutlinedButtonThemeData(
  style: _lightButtonBaseStyle.copyWith(
    backgroundColor: WidgetStateProperty.all(Colors.transparent),
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
      return BorderSide(
        color: _lightColorScheme.primary.withValues(alpha: 0.7),
        width: 1.0,
      );
    }),
    foregroundColor: WidgetStateProperty.all(_lightColorScheme.primary),
  ),
);

// Botão Text
TextButtonThemeData _lightTextButtonTheme = TextButtonThemeData(
  style: _lightButtonBaseStyle.copyWith(
    backgroundColor: WidgetStateProperty.all(Colors.transparent),
    foregroundColor: WidgetStateProperty.all(_lightColorScheme.primary),
  ),
);

// ============================================================================
// LIGHT THEME INPUT DECORATION (GLASS)
// ============================================================================

InputDecorationTheme _lightInputDecorationTheme = InputDecorationTheme(
  // Base styling - Glassmorphism
  filled: true,
  // Fundo branco com baixa opacidade para efeito vidro
  fillColor: uiConstants.glassWhiteLow,
  hoverColor: uiConstants.glassWhiteMedium,
  focusColor: uiConstants.glassWhiteMedium,

  isDense: false,
  visualDensity: VisualDensity.standard,
  contentPadding: EdgeInsets.symmetric(
    horizontal: uiConstants.spacing6,
    vertical: uiConstants.spacing5,
  ),

  labelStyle: _lightTextTheme.titleLarge?.copyWith(
    color: _lightColorScheme.onSurfaceVariant,
    fontWeight: FontWeight.w500,
  ),
  floatingLabelStyle: _lightTextTheme.titleLarge?.copyWith(
    color: _lightColorScheme.primary,
    fontWeight: FontWeight.w600,
  ),
  hintStyle: _lightTextTheme.titleLarge?.copyWith(
    color: _lightColorScheme.onSurfaceVariant.withValues(alpha: 0.5),
  ),
  helperStyle: _lightTextTheme.bodyMedium?.copyWith(
    color: _lightColorScheme.onSurfaceVariant.withValues(alpha: 0.7),
  ),
  errorStyle: _lightTextTheme.bodyMedium?.copyWith(
    color: _lightColorScheme.error,
    fontWeight: FontWeight.w500,
  ),

  // Borders - Using Glass Borders (Light Gradients logic via colors)
  border: OutlineInputBorder(
    borderRadius: BorderRadius.circular(uiConstants.radius16),
    borderSide: BorderSide.none,
  ),

  // Enabled: Borda sutil (reflexo)
  enabledBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(uiConstants.radius16),
    borderSide: BorderSide(
      color: uiConstants.glassBorderLightStart,
      width: uiConstants.glassBorderWidthThin,
    ),
  ),

  // Focused: Cor primária sólida ou gradiente forte
  focusedBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(uiConstants.radius16),
    borderSide: BorderSide(color: _lightColorScheme.primary, width: 2.0),
  ),

  errorBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(uiConstants.radius16),
    borderSide: BorderSide(color: _lightColorScheme.error, width: 2.0),
  ),
  focusedErrorBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(uiConstants.radius16),
    borderSide: BorderSide(color: _lightColorScheme.error, width: 2.0),
  ),
  disabledBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(uiConstants.radius16),
    borderSide: BorderSide(
      color: _lightColorScheme.onSurface.withValues(alpha: 0.05),
      width: 1.0,
    ),
  ),
);

ThemeData customLightTheme = ThemeData(
  useMaterial3: true,
  // IMPORTANTE: Scaffold transparente para ver o background/gradiente global
  scaffoldBackgroundColor: uiConstants.lightBackground,
  colorScheme: _lightColorScheme,
  textTheme: _lightTextTheme,
  appBarTheme: _lightAppBarTheme,
  tooltipTheme: _lightTooltipTheme,
  filledButtonTheme: _lightFilledButtonTheme,
  elevatedButtonTheme: _lightElevatedButtonTheme,
  outlinedButtonTheme: _lightOutlinedButtonTheme,
  textButtonTheme: _lightTextButtonTheme,
  inputDecorationTheme: _lightInputDecorationTheme,
  extensions: [_lightGlassTheme], // Adiciona a extensão
);

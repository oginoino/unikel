import '../../utils/imports/common_libs.dart';
import 'glass_theme_extention.dart';
// Certifique-se de importar o arquivo da extensão criada
// import 'path/to/glass_theme_extension.dart';

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
  onSecondaryFixed: uiConstants.darkOnSecondaryFixed,

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

  // Surface colors - Aumentada opacidade para melhor contraste
  surface: uiConstants.darkSurface.withValues(alpha: 0.85), // Semi-transparente melhorado
  onSurface: uiConstants.darkOnSurface,
  surfaceDim: uiConstants.darkSurfaceDim,
  surfaceBright: uiConstants.darkSurfaceBright,
  surfaceContainerLowest: uiConstants.darkSurfaceContainerLowest.withValues(
    alpha: 0.7,
  ),
  surfaceContainerLow: uiConstants.darkSurfaceContainerLow.withValues(
    alpha: 0.75,
  ),
  surfaceContainer: uiConstants.darkSurfaceContainer.withValues(alpha: 0.8),
  surfaceContainerHigh: uiConstants.darkSurfaceContainerHigh.withValues(
    alpha: 0.85,
  ),
  surfaceContainerHighest: uiConstants.darkSurfaceContainerHighest.withValues(
    alpha: 0.9,
  ),

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

// EXTENSÃO GLASSMORPHISM DARK
GlassTheme _darkGlassTheme = GlassTheme(
  glassColor: uiConstants.glassBlackMedium, // Vidro Escuro
  glassBorderColor: uiConstants.glassBorderDarkStart, // Borda clara fina (luz)
  glassBorderColorStart: uiConstants.glassBorderDarkStart,
  glassBorderColorEnd: uiConstants.glassBorderDarkEnd,
  blurAmount: uiConstants.glassBlurMedium,
  borderWidth: uiConstants.glassBorderWidthThin,
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
  backgroundColor: uiConstants.glassBlackDim, // Muito transparente
  foregroundColor: _darkColorScheme.onSurface,
  elevation: 0,
  scrolledUnderElevation: 0,
  shadowColor: Colors.transparent,
  surfaceTintColor: Colors.transparent,
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
    systemNavigationBarColor: uiConstants.glassBlackLow,
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
    color: _darkColorScheme.inverseSurface.withValues(alpha: 0.8),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(uiConstants.radius8),
    ),
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
      // Borda sutil de vidro
      side: BorderSide(color: uiConstants.glassWhiteSeeThrough, width: 0.5),
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

FilledButtonThemeData _darkFilledButtonTheme = FilledButtonThemeData(
  style: _darkButtonBaseStyle.copyWith(
    // 1. Fundo Translúcido (Glassy Dark)
    backgroundColor: WidgetStateProperty.resolveWith<Color>((
      Set<WidgetState> states,
    ) {
      if (states.contains(WidgetState.disabled)) {
        return _darkColorScheme.primary.withValues(alpha: 0.38);
      }
      if (states.contains(WidgetState.pressed)) {
        // Mais opaco ao pressionar para feedback visual
        return _darkColorScheme.primary.withValues(alpha: 0.70);
      }
      if (states.contains(WidgetState.hovered)) {
        // Levemente mais visível no hover
        return _darkColorScheme.primary.withValues(alpha: 0.60);
      }
      // Estado normal: Transparência média (0.50) para o efeito de vidro
      return _darkColorScheme.primary.withValues(alpha: 0.50);
    }),

    // 2. Cor do Texto/Ícone (Mantida)
    foregroundColor: WidgetStateProperty.resolveWith<Color>((
      Set<WidgetState> states,
    ) {
      if (states.contains(WidgetState.disabled)) {
        return _darkColorScheme.onPrimary.withValues(alpha: 0.38);
      }
      return _darkColorScheme.onPrimary;
    }),

    // 3. Elevação Zero (Glass é flat)
    elevation: WidgetStateProperty.all(0),
    shadowColor: WidgetStateProperty.all(Colors.transparent),

    // 4. Borda de Vidro (Reflexo no Dark Theme)
    // Uma borda branca/clara com opacidade muito baixa para simular o reflexo da luz
    side: WidgetStateProperty.resolveWith<BorderSide>((
      Set<WidgetState> states,
    ) {
      if (states.contains(WidgetState.disabled)) {
        return BorderSide.none;
      }
      return BorderSide(
        // Cor branca/clara com opacidade baixa
        color: Colors.white.withValues(alpha: 0.20),
        width: 1.0,
      );
    }),

    // 5. Overlay (Splash) sutil
    overlayColor: WidgetStateProperty.resolveWith<Color?>((
      Set<WidgetState> states,
    ) {
      if (states.contains(WidgetState.pressed)) {
        // Brilho branco muito sutil ao interagir no tema escuro
        return Colors.white.withValues(alpha: 0.05);
      }
      return null;
    }),
  ),
);

// Botão Elevated (Glassy Dark)
ElevatedButtonThemeData _darkElevatedButtonTheme = ElevatedButtonThemeData(
  style: _darkButtonBaseStyle.copyWith(
    backgroundColor: WidgetStateProperty.resolveWith<Color>((
      Set<WidgetState> states,
    ) {
      if (states.contains(WidgetState.disabled)) {
        return _darkColorScheme.onSurface.withValues(alpha: 0.12);
      }
      return uiConstants.glassBlackMedium; // Fundo preto translúcido
    }),
    foregroundColor: WidgetStateProperty.resolveWith<Color>((
      Set<WidgetState> states,
    ) {
      if (states.contains(WidgetState.disabled)) {
        return _darkColorScheme.onSurface.withValues(alpha: 0.38);
      }
      return _darkColorScheme.onPrimary;
    }),
    elevation: WidgetStateProperty.all(0),
    // Borda clara fina para contraste no fundo escuro
    side: WidgetStateProperty.all(
      BorderSide(color: uiConstants.glassBorderDarkStart, width: 1),
    ),
  ),
);

// Botão Outlined
OutlinedButtonThemeData _darkOutlinedButtonTheme = OutlinedButtonThemeData(
  style: _darkButtonBaseStyle.copyWith(
    backgroundColor: WidgetStateProperty.all(Colors.transparent),
    foregroundColor: WidgetStateProperty.resolveWith<Color>((
      Set<WidgetState> states,
    ) {
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
      // Borda primaria + transparencia
      return BorderSide(
        color: _darkColorScheme.primary.withValues(alpha: 0.7),
        width: 1,
      );
    }),
  ),
);

// Botão Text
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
  ),
);

// ============================================================================
// DARK THEME INPUT DECORATION (GLASS)
// ============================================================================

InputDecorationTheme _darkInputDecorationTheme = InputDecorationTheme(
  // Base styling
  filled: true,
  // Fundo preto translúcido
  fillColor: uiConstants.glassBlackLow,
  hoverColor: uiConstants.glassBlackMedium,
  focusColor: uiConstants.glassBlackMedium,

  isDense: false,
  visualDensity: VisualDensity.standard,
  contentPadding: EdgeInsets.symmetric(
    horizontal: uiConstants.spacing6,
    vertical: uiConstants.spacing5,
  ),

  labelStyle: _darkTextTheme.titleLarge?.copyWith(
    color: _darkColorScheme.onSurfaceVariant,
    fontWeight: FontWeight.w500,
  ),
  floatingLabelStyle: _darkTextTheme.titleLarge?.copyWith(
    color: _darkColorScheme.primary,
    fontWeight: FontWeight.w600,
  ),
  hintStyle: _darkTextTheme.titleLarge?.copyWith(
    color: _darkColorScheme.onSurfaceVariant.withValues(alpha: 0.5),
  ),
  helperStyle: _darkTextTheme.bodyMedium?.copyWith(
    color: _darkColorScheme.onSurfaceVariant.withValues(alpha: 0.7),
  ),
  errorStyle: _darkTextTheme.bodyMedium?.copyWith(
    color: _darkColorScheme.error,
    fontWeight: FontWeight.w500,
  ),
  counterStyle: _darkTextTheme.bodySmall?.copyWith(
    color: _darkColorScheme.onSurfaceVariant.withValues(alpha: 0.6),
  ),

  border: OutlineInputBorder(
    borderRadius: BorderRadius.circular(uiConstants.radius16),
    borderSide: BorderSide.none,
  ),

  // Enabled: Borda branca/cinza muito sutil para definir o shape no escuro
  enabledBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(uiConstants.radius16),
    borderSide: BorderSide(
      color: uiConstants.glassBorderDarkStart,
      width: uiConstants.glassBorderWidthThin,
    ),
  ),

  focusedBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(uiConstants.radius16),
    borderSide: BorderSide(color: _darkColorScheme.primary, width: 2.0),
  ),

  errorBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(uiConstants.radius16),
    borderSide: BorderSide(color: _darkColorScheme.error, width: 2.0),
  ),

  focusedErrorBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(uiConstants.radius16),
    borderSide: BorderSide(color: _darkColorScheme.error, width: 2.0),
  ),

  disabledBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(uiConstants.radius16),
    borderSide: BorderSide(
      color: _darkColorScheme.onSurface.withValues(alpha: 0.12),
      width: 1.0,
    ),
  ),

  outlineBorder: BorderSide(
    color: _darkColorScheme.outlineVariant,
    width: 1.5,
    style: BorderStyle.solid,
  ),
);

ThemeData customDarkTheme = ThemeData(
  useMaterial3: true,
  // Scaffold transparente para ver o gradiente global
  scaffoldBackgroundColor: uiConstants.darkBackground,
  colorScheme: _darkColorScheme,
  textTheme: _darkTextTheme,
  appBarTheme: _darkAppBarTheme,
  tooltipTheme: _darkTooltipTheme,
  filledButtonTheme: _darkFilledButtonTheme,
  elevatedButtonTheme: _darkElevatedButtonTheme,
  outlinedButtonTheme: _darkOutlinedButtonTheme,
  textButtonTheme: _darkTextButtonTheme,
  inputDecorationTheme: _darkInputDecorationTheme,
  visualDensity: VisualDensity.standard,
  extensions: [_darkGlassTheme], // Adiciona a extensão
);

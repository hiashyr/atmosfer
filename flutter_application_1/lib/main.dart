import 'package:flutter/material.dart';
import 'dart:math';
import 'package:flutter_svg/flutter_svg.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _themeIndex = 0;
  final ValueNotifier<int> _themeNotifier = ValueNotifier<int>(0);

  void _changeTheme(int index) {
    setState(() {
      _themeIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = appThemeData[_themeIndex] ?? appThemeData[0]!;
    return MaterialApp(
      title: 'Activity',
      theme: ThemeData(
        extensions: [theme],
      ),
      home: ActivityScreen(
        themeNotifier: _themeNotifier,
        changeTheme: _changeTheme,
      ),
    );
  }
}

class ActivityScreen extends StatefulWidget {
  final ValueNotifier<int> themeNotifier;
  final Function(int) changeTheme;
  const ActivityScreen({required this.themeNotifier, required this.changeTheme, super.key});

  @override
  _ActivityScreenState createState() => _ActivityScreenState();
}

class _ActivityScreenState extends State<ActivityScreen> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<AppTheme>()!;

    return Scaffold(
      extendBody: true,
      backgroundColor: theme.mainBackground,
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/images/background1.png',
              fit: BoxFit.cover,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
            ),
          ),
          Positioned.fill(
            child: ValueListenableBuilder<int>(
              valueListenable: widget.themeNotifier,
              builder: (context, themeIndex, child) {
                final theme = Theme.of(context).extension<AppTheme>()!;
                return Image.asset(
                  'assets/images/background2.png',
                  fit: BoxFit.cover,
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  color: theme.backgroundOverlay,
                  colorBlendMode: BlendMode.srcATop,
                );
              },
            ),
          ),
          Positioned(
            top: 200,
            left: -25,
            child: SvgPicture.asset(
              'assets/images/vector1.svg',
              width: 300,
            ),
          ),
          Positioned(
            top: 200,
            right: 0,
            child: SvgPicture.asset(
              'assets/images/vector2.svg',
            ),
          ),
          Positioned(
            top: 135,
            left: 350,
            child: Image.asset(
              'assets/images/bottle.png',
              width: 240,
              height: 360,
            ),
          ),
          Positioned(
            top: 410,
            right: 360,
            child: Image.asset(
              'assets/images/dumbbell.png',
              width: 180,
              height: 180,
            ),
          ),
          Positioned(
            bottom: 115,
            right: 30,
            child: Image.asset(
              'assets/images/coin.png',
              width: 120,
              height: 100,
            ),
          ),
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Text(
                      'АКТИВНОСТЬ',
                      style: theme.titleTextStyle,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      margin: const EdgeInsets.only(top: 0),
                      width: MediaQuery.of(context).size.width * 0.8,
                      child: Stack(
                        clipBehavior: Clip.none,
                        alignment: Alignment.centerLeft,
                        children: [
                          ColorFiltered(
                            colorFilter: ColorFilter.mode(
                              theme.forthetextBlend,
                              BlendMode.srcATop,
                            ),
                            child: Image.asset(
                              'assets/images/forthetext.png',
                              fit: BoxFit.fill,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(20),
                            child: Text(
                              'Подключи источник активности и',
                              style: theme.activityTextStyle,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 5),
                  LayoutBuilder(
                    builder: (context, constraints) {
                      double stepHeight = constraints.maxWidth > 600 ? 40 : 0;
                      double screenWidth = MediaQuery.of(context).size.width;
                      double blockWidth = screenWidth * 0.8;

                      return Column(
                        children: [
                          Transform.translate(
                            offset: const Offset(-25, 0),
                            child: ActivityStep(
                              stepNumber: '1',
                              text: 'Тренируйся и выполняй норму активности',
                              angle: pi / -50,
                              theme: {
                                'box': theme.box,
                                'button': theme.button,
                                'stepText': theme.stepTextColor,
                                'text': theme.stepTextColor,
                                'step_number': theme.stepNumber,
                              },
                              width: blockWidth,
                            ),
                          ),
                          SizedBox(height: stepHeight),
                          Transform.translate(
                            offset: const Offset(20, 0),
                            child: ActivityStep(
                              stepNumber: '2',
                              text: 'Получай баллы здоровья и оплачивай ими покупки',
                              angle: pi / -92.78,
                              theme: {
                                'box': theme.box,
                                'button': theme.button,
                                'stepText': theme.stepTextColor,
                                'text': theme.stepTextColor,
                                'step_number': theme.stepNumber,
                              },
                              width: blockWidth,
                            ),
                          ),
                          SizedBox(height: stepHeight),
                          Transform.translate(
                            offset: const Offset(65, 0),
                            child: ActivityStep(
                              stepNumber: '3',
                              text: 'Соревнуйся с друзьями и повышай рейтинг своего региона',
                              angle: pi / 84.11,
                              theme: {
                                'box': theme.box,
                                'button': theme.button,
                                'stepText': theme.stepTextColor,
                                'text': theme.stepTextColor,
                                'step_number': theme.stepNumber,
                              },
                              width: blockWidth,
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                  const SizedBox(height: 40),
                  Align(
                    alignment: Alignment.center,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: theme.button,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 50, vertical: 25),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      child: Text(
                        'ПОДКЛЮЧИТЬ',
                        style: theme.buttonTextStyle,
                      ),
                    ),
                  ),
                  const SizedBox(height: 60),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10).copyWith(bottom: 20),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 15),
          decoration: BoxDecoration(
            color: theme.button,
            borderRadius: BorderRadius.circular(30),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildMenuIcon('assets/icons/logo.svg', theme.iconColor),
              _buildMenuIcon('assets/icons/house.svg', theme.iconColor),
              _buildMenuIcon('assets/icons/pulse.svg', theme.iconColor),
              _buildMenuIcon('assets/icons/reward.svg', theme.iconColor),
              _buildMenuIcon('assets/icons/human.svg', theme.iconColor),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          widget.themeNotifier.value = (widget.themeNotifier.value + 1) % 5;
          widget.changeTheme(widget.themeNotifier.value);
        },
        backgroundColor: theme.button,
        child: Icon(Icons.color_lens, color: theme.iconColor),
      ),
    );
  }

  Widget _buildMenuIcon(String assetPath, Color iconColor) {
    return SvgPicture.asset(
      assetPath,
      color: iconColor,
      width: 20,
      height: 20,
    );
  }
}

class ActivityStep extends StatelessWidget {
  final String stepNumber;
  final String text;
  final double angle;
  final Map<String, Color> theme;
  final double? width;

  const ActivityStep({
    required this.stepNumber,
    required this.text,
    this.angle = 0.0,
    required this.theme,
    this.width,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: angle,
      child: Container(
        width: width,
        margin: const EdgeInsets.only(bottom: 30),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: theme['box'],
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            CircleAvatar(
              backgroundColor: theme['button'],
              radius: 15,
              child: Text(
                stepNumber,
                style: TextStyle(
                  fontFamily: 'Steppe',
                  color: theme['step_number'],
                  fontWeight: FontWeight.w100,
                  fontSize: 16,
                ),
              ),
            ),
            const SizedBox(width: 15),
            Expanded(
              child: Text(
                text,
                style: TextStyle(
                  fontFamily: 'Steppe',
                  color: theme['text'],
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

@immutable
class AppTheme extends ThemeExtension<AppTheme> {
  final Color textLogo;
  final Color buttonTextColor;
  final Color stepTextColor;
  final Color stepNumber;
  final Color textH1;
  final Color button;
  final Color box;
  final Color iconColor;
  final Color forthetextBlend;
  final Color backgroundOverlay;
  final Color mainBackground;
  final TextStyle titleTextStyle;
  final TextStyle buttonTextStyle;
  final TextStyle activityTextStyle;

  const AppTheme({
    required this.textLogo,
    required this.buttonTextColor,
    required this.stepTextColor,
    required this.stepNumber,
    required this.textH1,
    required this.button,
    required this.box,
    required this.iconColor,
    required this.forthetextBlend,
    required this.backgroundOverlay,
    required this.mainBackground,
    required this.titleTextStyle,
    required this.buttonTextStyle,
    required this.activityTextStyle,
  });

  @override
  AppTheme copyWith({
    Color? textLogo,
    Color? buttonTextColor,
    Color? stepTextColor,
    Color? stepNumber,
    Color? textH1,
    Color? button,
    Color? box,
    Color? iconColor,
    Color? forthetextBlend,
    Color? backgroundOverlay,
    Color? mainBackground,
    TextStyle? titleTextStyle,
    TextStyle? buttonTextStyle,
    TextStyle? activityTextStyle,
  }) {
    return AppTheme(
      textLogo: textLogo ?? this.textLogo,
      buttonTextColor: buttonTextColor ?? this.buttonTextColor,
      stepTextColor: stepTextColor ?? this.stepTextColor,
      stepNumber: stepNumber ?? this.stepNumber,
      textH1: textH1 ?? this.textH1,
      button: button ?? this.button,
      box: box ?? this.box,
      iconColor: iconColor ?? this.iconColor,
      forthetextBlend: forthetextBlend ?? this.forthetextBlend,
      backgroundOverlay: backgroundOverlay ?? this.backgroundOverlay,
      mainBackground: mainBackground ?? this.mainBackground,
      titleTextStyle: titleTextStyle ?? this.titleTextStyle,
      buttonTextStyle: buttonTextStyle ?? this.buttonTextStyle,
      activityTextStyle: activityTextStyle ?? this.activityTextStyle,
    );
  }

  @override
  ThemeExtension<AppTheme> lerp(ThemeExtension<AppTheme>? other, double t) {
    if (other is! AppTheme) {
      return this;
    }
    return AppTheme(
      textLogo: Color.lerp(textLogo, other.textLogo, t)!,
      buttonTextColor: Color.lerp(buttonTextColor, other.buttonTextColor, t)!,
      stepTextColor: Color.lerp(stepTextColor, other.stepTextColor, t)!,
      stepNumber: Color.lerp(stepNumber, other.stepNumber, t)!,
      textH1: Color.lerp(textH1, other.textH1, t)!,
      button: Color.lerp(button, other.button, t)!,
      box: Color.lerp(box, other.box, t)!,
      iconColor: Color.lerp(iconColor, other.iconColor, t)!,
      forthetextBlend: Color.lerp(forthetextBlend, other.forthetextBlend, t)!,
      backgroundOverlay: Color.lerp(backgroundOverlay, other.backgroundOverlay, t)!,
      mainBackground: Color.lerp(mainBackground, other.mainBackground, t)!,
      titleTextStyle: TextStyle.lerp(titleTextStyle, other.titleTextStyle, t)!,
      buttonTextStyle: TextStyle.lerp(buttonTextStyle, other.buttonTextStyle, t)!,
      activityTextStyle: TextStyle.lerp(activityTextStyle, other.activityTextStyle, t)!,
    );
  }
}

final appThemeData = {
  0: AppTheme(
    textLogo: Colors.white,
    buttonTextColor: Colors.white,
    stepTextColor: Colors.white,
    stepNumber: Colors.white,
    textH1: Colors.white,
    button: Colors.blue,
    box: Colors.black.withValues(alpha: 0.7),
    iconColor: Colors.white,
    forthetextBlend: Colors.blue,
    backgroundOverlay: Colors.transparent,
    mainBackground: Colors.black,
    titleTextStyle: const TextStyle(
      fontFamily: 'Steppe',
      color: Colors.white,
      fontSize: 18,
      fontWeight: FontWeight.w100,
    ),
    buttonTextStyle: const TextStyle(
      fontFamily: 'Steppe',
      fontSize: 16,
      color: Colors.white,
    ),
    activityTextStyle: const TextStyle(
      fontFamily: 'Steppe',
      color: Colors.white,
      fontSize: 24,
      fontWeight: FontWeight.w100,
    ),
  ),
  1: AppTheme(
    textLogo: Colors.black,
    buttonTextColor: Colors.white,
    stepTextColor: Colors.black,
    stepNumber: Colors.white,
    textH1: Colors.white,
    button: Colors.blue,
    box: Colors.white.withValues(alpha: 0.7),
    iconColor: Colors.white,
    forthetextBlend: Colors.blue,
    backgroundOverlay: Colors.transparent,
    mainBackground: Colors.white,
    titleTextStyle: const TextStyle(
      fontFamily: 'Steppe',
      color: Colors.black,
      fontSize: 18,
      fontWeight: FontWeight.w100,
    ),
    buttonTextStyle: const TextStyle(
      fontFamily: 'Steppe',
      fontSize: 16,
      color: Colors.white,
    ),
    activityTextStyle: const TextStyle(
      fontFamily: 'Steppe',
      color: Colors.white,
      fontSize: 24,
      fontWeight: FontWeight.w100,
    ),
  ),
  2: AppTheme(
    textLogo: Colors.white,
    buttonTextColor: Colors.black,
    stepTextColor: Colors.white,
    stepNumber: Colors.black,
    textH1: Colors.black,
    button: Colors.yellow,
    box: Colors.black.withValues(alpha: 0.7),
    iconColor: Colors.white,
    forthetextBlend: Colors.yellow,
    backgroundOverlay: Colors.yellow,
    mainBackground: Colors.black,
    titleTextStyle: const TextStyle(
      fontFamily: 'Steppe',
      color: Colors.white,
      fontSize: 18,
      fontWeight: FontWeight.w100,
    ),
    buttonTextStyle: const TextStyle(
      fontFamily: 'Steppe',
      fontSize: 16,
      color: Colors.black,
    ),
    activityTextStyle: const TextStyle(
      fontFamily: 'Steppe',
      color: Colors.black,
      fontSize: 24,
      fontWeight: FontWeight.w100,
    ),
  ),
  3: AppTheme(
    textLogo: Colors.white,
    buttonTextColor: Colors.black,
    stepTextColor: Colors.white,
    stepNumber: Colors.black,
    textH1: Colors.black,
    button: Colors.white,
    box: Colors.black.withValues(alpha: 0.7),
    iconColor: Colors.black,
    forthetextBlend: Colors.white,
    backgroundOverlay: Colors.white,
    mainBackground: Colors.black,
    titleTextStyle: const TextStyle(
      fontFamily: 'Steppe',
      color: Colors.white,
      fontSize: 18,
      fontWeight: FontWeight.w100,
    ),
    buttonTextStyle: const TextStyle(
      fontFamily: 'Steppe',
      fontSize: 16,
      color: Colors.black,
    ),
    activityTextStyle: const TextStyle(
      fontFamily: 'Steppe',
      color: Colors.black,
      fontSize: 24,
      fontWeight: FontWeight.w100,
    ),
  ),
  4: AppTheme(
    textLogo: Colors.white,
    buttonTextColor: Colors.white,
    stepTextColor: Colors.white,
    stepNumber: Colors.white,
    textH1: Colors.white,
    button: Colors.red,
    box: Colors.black.withValues(alpha: 0.7),
    iconColor: Colors.white,
    forthetextBlend: Colors.red,
    backgroundOverlay: Colors.red,
    mainBackground: Colors.black,
    titleTextStyle: const TextStyle(
      fontFamily: 'Steppe',
      color: Colors.white,
      fontSize: 18,
      fontWeight: FontWeight.w100,
    ),
    buttonTextStyle: const TextStyle(
      fontFamily: 'Steppe',
      fontSize: 16,
      color: Colors.white,
    ),
    activityTextStyle: const TextStyle(
      fontFamily: 'Steppe',
      color: Colors.white,
      fontSize: 24,
      fontWeight: FontWeight.w100,
    ),
  ),
};
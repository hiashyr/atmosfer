import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Activity',
      home: ActivityScreen(),
    );
  }
}

class ActivityScreen extends StatefulWidget {
  const ActivityScreen({super.key});

  @override
  _ActivityScreenState createState() => _ActivityScreenState();
}

class _ActivityScreenState extends State<ActivityScreen> {
  final ValueNotifier<int> _themeNotifier = ValueNotifier<int>(0);

  Color text_logo = Colors.white;
  Color buttonTextColor = Colors.white;
  Color stepTextColor = Colors.white;
  Color step_number = Colors.white;
  Color text_h1 = Colors.white;
  Color button = Colors.blue;
  Color box = Colors.black.withValues(alpha: 0.7);
  Color iconColor = Colors.white;
  Color forthetextBlend = Colors.blue;
  Color backgroundOverlay = Colors.transparent;

  Color mainBackground = Colors.black;

   late TextStyle _titleTextStyle;
  late TextStyle _buttonTextStyle;
  late TextStyle _activityTextStyle;


    @override
  void initState() {
    super.initState();
    _updateTextStyles();
  }

  void _updateTextStyles() {
    _titleTextStyle = TextStyle(
      fontFamily: 'Steppe',
      color: text_logo.withValues(alpha: 0.9),
      fontSize: 18,
      fontWeight: FontWeight.w100,
    );

    _buttonTextStyle = TextStyle(
      fontFamily: 'Steppe',
      fontSize: 16,
      color: buttonTextColor,
    );

    _activityTextStyle = TextStyle(
      fontFamily: 'Steppe',
      color: text_h1.withValues(alpha: 0.8),
      fontSize: 24,
      fontWeight: FontWeight.w100,
    );
  }


  void _changeTheme(int themeIndex) {
  setState(() {
    final commonTheme = {
      0: {
        'text_logo': Colors.white,
        'buttonTextColor': Colors.white,
        'stepTextColor': Colors.white,
        'step_number': Colors.white,
        'text_h1': Colors.white,
        'button': Colors.blue,
        'box': Colors.black.withValues(alpha: 0.7),
        'iconColor': Colors.white,
        'forthetextBlend': Colors.blue,
        'backgroundOverlay': Colors.transparent,
        'mainBackground': Colors.black,
      },
      1: {
        'text_logo': Colors.black,
        'buttonTextColor': Colors.white,
        'stepTextColor': Colors.black,
        'step_number': Colors.white,
        'text_h1': Colors.white,
        'button': Colors.blue,
        'box': Colors.white.withValues(alpha: 0.7),
        'iconColor': Colors.white,
        'forthetextBlend': Colors.blue,
        'backgroundOverlay': Colors.transparent,
        'mainBackground': Colors.white,
      },
      2: {
        'text_logo': Colors.white,
        'buttonTextColor': Colors.black,
        'stepTextColor': Colors.white,
        'step_number': Colors.black,
        'text_h1': Colors.black,
        'button': Colors.yellow,
        'box': Colors.black.withValues(alpha: 0.7),
        'iconColor': Colors.white,
        'forthetextBlend': Colors.yellow,
        'backgroundOverlay': Colors.yellow,
        'mainBackground': Colors.black,
      },
      3: {
        'text_logo': Colors.white,
        'buttonTextColor': Colors.black,
        'stepTextColor': Colors.white,
        'step_number': Colors.black,
        'text_h1': Colors.black,
        'button': Colors.white,
        'box': Colors.black.withValues(alpha: 0.7),
        'iconColor': Colors.black,
        'forthetextBlend': Colors.white,
        'backgroundOverlay': Colors.white,
        'mainBackground': Colors.black,
      },
      4: {
        'text_logo': Colors.white,
        'buttonTextColor': Colors.white,
        'stepTextColor': Colors.white,
        'step_number': Colors.white,
        'text_h1': Colors.white,
        'button': Colors.red,
        'box': Colors.black.withValues(alpha: 0.7),
        'iconColor': Colors.white,
        'forthetextBlend': Colors.red,
        'backgroundOverlay': Colors.red,
        'mainBackground': Colors.black,
      },
    };

    final themeData = commonTheme[themeIndex] ?? commonTheme[0]!;

    text_logo = themeData['text_logo']!;
    buttonTextColor = themeData['buttonTextColor']!;
    stepTextColor = themeData['stepTextColor']!;
    step_number = themeData['step_number']!;
    text_h1 = themeData['text_h1']!;
    button = themeData['button']!;
    box = themeData['box']!;
    iconColor = themeData['iconColor']!;
    forthetextBlend = themeData['forthetextBlend']!;
    backgroundOverlay = themeData['backgroundOverlay']!;
    mainBackground = themeData['mainBackground']!;
    _updateTextStyles();
  });
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: mainBackground,
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
              valueListenable: _themeNotifier,
              builder: (context, themeIndex, child) {
                return Image.asset(
                  'assets/images/background2.png',
                  fit: BoxFit.cover,
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  color: backgroundOverlay,
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
                      style: _titleTextStyle,
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
                              forthetextBlend,
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
                                style: _activityTextStyle,
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
                                'box': box,
                                'button': button,
                                'stepText': stepTextColor,
                                'text': stepTextColor,
                                'step_number': step_number,
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
                                'box': box,
                                'button': button,
                                'stepText': stepTextColor,
                                'text': stepTextColor,
                                 'step_number': step_number,
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
                                'box': box,
                                'button': button,
                                'stepText': stepTextColor,
                                'text': stepTextColor,
                                'step_number': step_number,
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
                        backgroundColor: button,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 50, vertical: 25),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      child: Text(
                        'ПОДКЛЮЧИТЬ',
                        style: _buttonTextStyle,
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
            color: button,
            borderRadius: BorderRadius.circular(30),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildMenuIcon('assets/icons/logo.svg', iconColor),
              _buildMenuIcon('assets/icons/house.svg', iconColor),
              _buildMenuIcon('assets/icons/pulse.svg', iconColor),
              _buildMenuIcon('assets/icons/reward.svg', iconColor),
              _buildMenuIcon('assets/icons/human.svg', iconColor),
            ],
          ),
        ),
      ),
        floatingActionButton: FloatingActionButton(
        onPressed: () {
          _themeNotifier.value = (_themeNotifier.value + 1) % 5;
          _changeTheme(_themeNotifier.value);
        },
        backgroundColor: button,
         child: Icon(Icons.color_lens, color: iconColor),
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
import 'package:auto_route/auto_route.dart';
import 'package:bbun/modules/bbun/presentation/widgets/bbun_pressable.dart';
import 'package:bbun/modules/user/presentation/bloc/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:bbun/modules/bbun/presentation/widgets/bbun_card.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

@RoutePage()
class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage>
    with SingleTickerProviderStateMixin {
  final List<Map<String, double>> _beginPositions = [
    {"left": -500, "top": 300 + 50, "angle": -0.6},
    {"left": 500, "top": 300 + 210, "angle": 1.1},
    {"left": -500, "top": 300 + 370, "angle": -0.45},
    {"left": 500, "top": 300 + 520, "angle": 0.3},
  ];
  final List<Map<String, double>> _endPositions = [
    {"left": -10, "top": 300 + 100, "angle": -0.1},
    {"left": 65, "top": 300 + 260, "angle": 0.6},
    {"left": 25, "top": 300 + 420, "angle": 0.05},
    {"left": 100, "top": 300 + 570, "angle": -0.2},
  ];

  final List<BbunCard> _cards = List.generate(
    4,
    (index) => BbunCard(
      name: "양예진",
      studentId: "2021512$index",
      email: "yangyj$index@gm.gist.ac.kr",
      issueDate: "2025.01.2${index + 7}",
    ),
  );

  late AnimationController _controller;
  late List<Animation<double>> _animations;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    );

    _animations = List.generate(
      _cards.length,
      (index) {
        final startInterval = index * 0.2;
        final endInterval = startInterval + 0.6;
        return CurvedAnimation(
          parent: _controller,
          curve: Interval(
            startInterval.clamp(0.0, 1.0),
            endInterval.clamp(0.0, 1.0),
            curve: Curves.easeOut,
          ),
        );
      },
    );

    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final scale = screenWidth / 411.42;

    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, authState) {
        return Scaffold(
          backgroundColor: Color(0xFFFBFBFB),
          body: SingleChildScrollView(
            child: Column(children: [
              SizedBox(
                width: screenWidth,
                height: 1080 * scale,
                child: Stack(
                  children: [
                    Positioned(
                      top: 0,
                      left: 0,
                      child: Container(
                        width: screenWidth,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Color(0xFFFDFD96),
                              Color(0xFFFBFBFB),
                            ],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                          ),
                        ),
                        child: SvgPicture.asset(
                          "assets/icons/main_page_deco.svg",
                          width: screenWidth,
                        ),
                      ),
                    ),
                    Positioned(
                      top: 216 * scale,
                      left: 44 * scale,
                      child: Text(
                        "뻔라인",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontFamily: 'HSSanTokki',
                          fontSize: 50 * scale,
                          fontWeight: FontWeight.w400,
                          height: 0,
                        ),
                      ),
                    ),
                    Positioned(
                      top: 285 * scale,
                      left: 44 * scale,
                      child: Text(
                        "뻔카드 확인을 위해서 최초 프로필 등록이 필\n요합니다. 프로필 등록을 마친 후 뻔라인과 뻔\n카드를 확인해보세요.",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 18 * scale,
                          fontWeight: FontWeight.w500,
                          height: 1,
                        ),
                      ),
                    ),
                    ...List.generate(
                      _cards.length,
                      (index) {
                        final beginPosition = _beginPositions[index];
                        final endPosition = _endPositions[index];
                        final animation = _animations[index];

                        return AnimatedBuilder(
                          animation: animation,
                          builder: (context, child) {
                            final top = Tween<double>(
                              begin: beginPosition["top"]! * scale,
                              end: endPosition["top"]! * scale,
                            ).animate(animation).value;

                            final left = Tween<double>(
                              begin: beginPosition["left"]! * scale,
                              end: endPosition["left"]! * scale,
                            ).animate(animation).value;

                            final angle = Tween<double>(
                              begin: beginPosition["angle"]!,
                              end: endPosition["angle"]!,
                            ).animate(animation).value;

                            return Positioned(
                              top: top,
                              left: left,
                              child: Transform.rotate(
                                angle: angle,
                                child: child!,
                              ),
                            );
                          },
                          child: _cards[index],
                        );
                      },
                    ),
                  ],
                ),
              ),
              Container(
                width: screenWidth,
                height: 257,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color(0xFFFBFBFB),
                      Color(0xFFFDFD96),
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: 30,
                    ),
                    SizedBox(
                      width: 317 * scale,
                      child: BbunPressable(
                        onPressed: () {
                          print(context.read<AuthBloc>().state);
                        },
                        decoration: BoxDecoration(
                          color: Color(0xFFFFE24A),
                          borderRadius: BorderRadius.circular(38 * scale),
                          border: Border.all(
                            color: Colors.black,
                            width: 1.5 * scale,
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Center(
                            child: Text(
                              '프로필 등록 하러 가기',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 18 * scale,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ]),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

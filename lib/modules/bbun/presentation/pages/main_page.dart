import 'dart:ui';

import 'package:auto_route/auto_route.dart';
import 'package:bbun/di/locator.dart';
import 'package:bbun/gen/assets.gen.dart';
import 'package:bbun/modules/bbun/presentation/bloc/bbun_bloc.dart';
import 'package:bbun/modules/bbun/presentation/bloc/bbun_list_bloc.dart';
import 'package:bbun/modules/bbun/presentation/pages/profile_edit_page.dart';
import 'package:bbun/modules/bbun/presentation/widgets/bbun_pressable.dart';
import 'package:bbun/modules/user/presentation/bloc/auth_bloc.dart';
import 'package:bbun/routes/app_router.dart';
import 'package:flutter/material.dart';
import 'package:bbun/modules/bbun/presentation/widgets/bbun_card.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage>
    with SingleTickerProviderStateMixin {
  final List<Map<String, double>> _beginPositions = [
    {"left": -500, "top": 20, "angle": -0.6},
    {"left": 500, "top": 180, "angle": 1.1},
    {"left": -500, "top": 340, "angle": -0.45},
    {"left": 500, "top": 490, "angle": 0.3},
  ];
  final List<Map<String, double>> _endPositions = [
    {"left": -10, "top": 70, "angle": -0.1},
    {"left": 65, "top": 230, "angle": 0.6},
    {"left": 25, "top": 390, "angle": 0.05},
    {"left": 100, "top": 540, "angle": -0.2},
  ];
  final List<Map<String, Color>> _colorSchemes = [
    {
      "text": Color(0xFF886CD6),
      "inner": Color(0xFFDDD1FF),
      "outer": Color(0xFFA48EE4),
    },
    {
      "text": Color(0xFF2681D7),
      "inner": Color(0xFFC5E3FF),
      "outer": Color(0xFF70B6F7),
    },
    {
      "text": Color(0xFFEBB608),
      "inner": Color(0xFFFDFD96),
      "outer": Color(0xFFF1DA66),
    },
    {
      "text": Color(0xFFFC639B),
      "inner": Color(0xFFFFD6E5),
      "outer": Color(0xFFFF9BBF),
    },
  ];

  final Map<int, double> _height = {
    0: 0,
    1: 270,
    2: 510,
    3: 600,
    4: 750,
  };

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
      4,
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

    return BlocProvider(
      create: (_) => sl<BbunBloc>()..add(const BbunEvent.load()),
      child: BlocProvider(
        create: (_) => sl<BbunListBloc>()..add(const BbunListEvent.load()),
        child: BlocBuilder<AuthBloc, AuthState>(
          builder: (context, authState) {
            return BlocBuilder<BbunListBloc, BbunListState>(
              builder: (context, bbunListState) {
                return BlocBuilder<BbunBloc, BbunState>(
                  builder: (context, bbunState) {
                    if (!bbunListState.hasResult || !bbunState.hasResult) {
                      return Scaffold(
                        backgroundColor: Color(0xFFFBFBFB),
                        body: Center(
                          child: CircularProgressIndicator(),
                        ),
                      );
                    }

                    return Scaffold(
                      backgroundColor: Color(0xFFFBFBFB),
                      body: SingleChildScrollView(
                        child: Column(children: [
                          Container(
                            width: screenWidth,
                            height: 360 * scale,
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
                            child: Stack(
                              children: [
                                Assets.icons.mainPageDeco
                                    .svg(width: screenWidth),
                                Positioned(
                                  top: 216 * scale,
                                  left: 44 * scale,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "뻔라인",
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                          fontFamily: 'HSSanTokki',
                                          fontSize: 50 * scale,
                                          fontWeight: FontWeight.w400,
                                          height: 0,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 20 * scale,
                                      ),
                                      Text(
                                        bbunState.isBbunRegistered
                                            ? (((bbunListState.mapOrNull(
                                                        loaded: (loaded) =>
                                                            loaded.total)!) >
                                                    1)
                                                ? "뻔카드를 클릭하여 각 뻔선뻔후의 자세한 정보\n를 확인해보세요. 새로운 멤버가 카드 등록 시\n메일로 알려드립니다."
                                                : "아직 등록된 뻔선뻔후가 없습니다. 새로운 멤\n버가 카드 등록 시 메일로 알려드립니다.")
                                            : "뻔카드 확인을 위해서 최초 프로필 등록이 필\n요합니다. 프로필 등록을 마친 후 뻔라인과 뻔\n카드를 확인해보세요.",
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                          fontSize: 18 * scale,
                                          fontWeight: FontWeight.w500,
                                          height: 1,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: screenWidth,
                            height: _height[bbunListState.mapOrNull(
                                    loaded: (loaded) => loaded.total)!]! *
                                scale,
                            child: Stack(
                              children: [
                                ...List.generate(
                                  bbunListState.mapOrNull(
                                      loaded: (loaded) => loaded.total)!,
                                  (index) {
                                    final beginPosition =
                                        _beginPositions[index];
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
                                      child: IndexedStack(
                                        index: index,
                                        children: bbunListState.mapOrNull(
                                          loaded: (loaded) => loaded.bbunline
                                              .map((user) => BbunCard(
                                                    name: user.name,
                                                    studentId: user.studentId,
                                                    email: user.email,
                                                    issueDate: user.createdAt!,
                                                    textColor:
                                                        _colorSchemes[index]
                                                            ["text"]!,
                                                    innerColor:
                                                        _colorSchemes[index]
                                                            ["inner"]!,
                                                    outerColor:
                                                        _colorSchemes[index]
                                                            ["outer"]!,
                                                  ))
                                              .toList(),
                                        )!,
                                      ),
                                    );
                                  },
                                ),
                                Visibility(
                                  visible: !bbunState.isBbunRegistered,
                                  child: Positioned.fill(
                                    child: BackdropFilter(
                                      filter: ImageFilter.blur(
                                          sigmaX: 5, sigmaY: 5), // 블러 강도 조절
                                      child: Container(
                                        color: Color(0xFFFBFBFB).withOpacity(
                                            0.2), // 블러 위에 반투명 레이어 추가
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Container(
                            width: screenWidth,
                            height: 257 * scale,
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
                                      context.router
                                          .push(const ProfileEditRoute());
                                    },
                                    decoration: BoxDecoration(
                                      color: Color(0xFFFFE24A),
                                      borderRadius:
                                          BorderRadius.circular(38 * scale),
                                      border: Border.all(
                                        color: Colors.black,
                                        width: 1.5 * scale,
                                      ),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(16.0),
                                      child: Center(
                                        child: Text(
                                          bbunState.isBbunRegistered
                                              ? '프로필 수정 하러 가기'
                                              : '프로필 등록 하러 가기',
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
              },
            );
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

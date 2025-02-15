import 'package:auto_route/auto_route.dart';
import 'package:bbun/modules/bbun/presentation/widgets/bbun_pressable.dart';
import 'package:bbun/modules/user/presentation/bloc/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:bbun/routes/app_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

@RoutePage()
class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final scale = screenWidth / 411.42;

    return BlocBuilder<AuthBloc, AuthState>(builder: (context, authState) {
      return Scaffold(
        body: SingleChildScrollView(
          child: Stack(
            children: [
              Container(
                width: screenWidth,
                height: 800 * scale,
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
              ),
              SvgPicture.asset(
                "assets/icons/onboarding_line.svg",
                width: screenWidth,
              ),
              Positioned(
                top: 65 * scale,
                left: 108 * scale,
                child: SvgPicture.asset(
                  "assets/icons/one_leaf.svg",
                  width: 61.43 * scale,
                ),
              ),
              Positioned(
                top: 202 * scale,
                left: 285 * scale,
                child: SvgPicture.asset(
                  "assets/icons/two_leaf.svg",
                  width: 61.43 * scale,
                ),
              ),
              Positioned(
                top: 640 * scale,
                left: 96 * scale,
                child: SvgPicture.asset(
                  "assets/icons/three_leaf.svg",
                  width: 61.43 * scale,
                ),
              ),
              Positioned(
                top: 749 * scale,
                left: 318 * scale,
                child: SvgPicture.asset(
                  "assets/icons/four_leaf.svg",
                  width: 61.43 * scale,
                ),
              ),
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 280 * scale,
                    ),
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: "뻔라인\n스케이팅",
                                style: TextStyle(
                                  fontFamily: 'HSSanTokki',
                                  fontSize: 90 * scale,
                                  fontWeight: FontWeight.w400,
                                  height: 1,
                                  foreground: Paint()
                                    ..color = Color(0xFFFFE24A)
                                    ..style = PaintingStyle.stroke
                                    ..strokeWidth = 8 * scale,
                                ),
                              ),
                            ],
                          ),
                        ),
                        RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: '뻔',
                                style: TextStyle(
                                  fontFamily: 'HSSanTokki',
                                  fontSize: 90 * scale,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xFFFBFBFB),
                                  height: 1,
                                ),
                              ),
                              TextSpan(
                                text: '라인',
                                style: TextStyle(
                                  fontFamily: 'HSSanTokki',
                                  fontSize: 90 * scale,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xFFFDFD96),
                                ),
                              ),
                              TextSpan(
                                text: '\n스케이',
                                style: TextStyle(
                                  fontFamily: 'HSSanTokki',
                                  fontSize: 90 * scale,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xFFFDFD96),
                                ),
                              ),
                              TextSpan(
                                text: '팅',
                                style: TextStyle(
                                  fontFamily: 'HSSanTokki',
                                  fontSize: 90 * scale,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xFFFBFBFB),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20 * scale),
                    Text(
                      "뻔선뻔후는 이런 시스템입니다\n뻔라인을 잘 따라가보세요",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 18 * scale,
                        fontWeight: FontWeight.w500,
                        height: 1,
                      ),
                    ),
                    SizedBox(height: 30 * scale),
                    SizedBox(
                      width: 317 * scale,
                      height: 50 * scale,
                      child: BbunPressable(
                        onPressed: () {
                          context.read<AuthBloc>().add(const AuthEvent.login());
                          context.read<AuthBloc>().stream.listen((state) {
                            if (state.hasUser) {
                              context.router.push(const MainRoute());
                            } else if (state.hasError) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text('로그인에 실패했습니다')),
                              );
                            }
                          });
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
                          padding: EdgeInsets.all(10.0),
                          child: Center(
                            child: Text(
                              '로그인 하러 가기',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 18 * scale,
                                fontWeight: FontWeight.w600,
                                height: 1,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}

import 'package:auto_route/auto_route.dart';
import 'package:bbun/presentation/widgets/bbun_pressable.dart';
import 'package:flutter/material.dart';
import 'package:bbun/routes/app_router.dart';

@RoutePage()
class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "뻔라인\n스케이팅",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'HSSanTokki',
                fontSize: 90,
                fontWeight: FontWeight.w400,
                height: 0,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              "뻔선뻔후는 이런 시스템입니다\n뻔라인을 잘 따라가보세요",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 30),
            SizedBox(
              width: 317,
              child: BbunPressable(
                onPressed: () {
                  context.router.push(const MainRoute());
                },
                decoration: BoxDecoration(
                  color: Color(0xFFFFE24A),
                  borderRadius: BorderRadius.circular(38),
                  border: Border.all(
                    color: Colors.black,
                    width: 1.5,
                  ),
                ),
                child: const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Center(
                    child: Text(
                      '로그인 하러 가기',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
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
    );
  }
}

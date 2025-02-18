import 'package:auto_route/auto_route.dart';
import 'package:bbun/modules/bbun/presentation/widgets/bbun_notebook.dart';
import 'package:bbun/modules/bbun/presentation/widgets/bbun_pressable.dart';
import 'package:bbun/routes/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

@RoutePage()
class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final scale = screenWidth / 411.42;

    return Scaffold(
        backgroundColor: Color(0xFFFBFBFB),
        body: SingleChildScrollView(
            child: Center(
                child: Stack(children: [
          // 상단 그라데이션
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Column(
              children: [
                Container(
                  width: screenWidth > 475 ? 475 : screenWidth,
                  height: 257,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: [Color(0xFFFBFBFB), Color(0xFFFDFD96)],
                    ),
                  ),
                  child: SvgPicture.asset(
                    "assets/icons/detail_page_deco.svg",
                    width: screenWidth,
                    fit: BoxFit.fitWidth,
                  ),
                ),
              ],
            ),
          ),

          // 하단 그라데이션
          Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Column(
                children: [
                  Container(
                    width: screenWidth > 475 ? 475 : screenWidth,
                    height: 257,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                            colors: [Color(0xFFFDFD96), Color(0xFFFBFBFB)])),
                  ),
                ],
              )),

          Positioned(
            child: Column(
              children: [
                SizedBox(
                  height: 200,
                  width: screenWidth,
                ),

                // 학생 이름
                Container(
                  width: screenWidth > 475 ? 475 : screenWidth,
                  padding: const EdgeInsets.symmetric(horizontal: 36),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        '홍길동',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 50,
                          fontFamily: 'HSSanTokki',
                          fontWeight: FontWeight.w400,
                          height: 0,
                        ),
                      ),
                      // TODO: 본인 디테일 페이지 일 때만 수정 버튼 보이게 처리
                      SizedBox(width: 10),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 4),
                        child: GestureDetector(
                          onTap: () {
                            context.pushRoute(ProfileEditRoute());
                          },
                          child: SvgPicture.asset(
                            "assets/icons/edit.svg",
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 28),

                // 노트 부분
                BbunNotebook(),
                SizedBox(
                    height: 50 * (screenWidth > 475 ? (475 / 411.42) : scale)),

                // 하단 버튼
                Container(
                  width: screenWidth > 475 ? 475 : screenWidth,
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 36),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                          width: 50,
                          height: 50,
                          child: BbunPressable(
                              onPressed: () {
                                // TODO: 디테일 페이지 넘기기 구현
                              },
                              decoration: BoxDecoration(
                                color: Color(0xFFFFE24A),
                                border: Border.all(
                                  color: Colors.black,
                                  width: 1.5,
                                ),
                                borderRadius: BorderRadius.circular(25),
                              ),
                              child: Center(
                                  child: Icon(Icons.keyboard_arrow_left,
                                      size: 30)))),
                      SizedBox(
                          width: 110,
                          height: 50,
                          child: Flexible(
                            child: BbunPressable(
                                onPressed: () {
                                  context.pushRoute(MainRoute());
                                },
                                decoration: BoxDecoration(
                                    color: Color(0xFFFFE24A),
                                    border: Border.all(
                                      color: Colors.black,
                                      width: 1.5,
                                    ),
                                    borderRadius: BorderRadius.circular(25)),
                                child: Center(
                                    child: Text(
                                  '뒤로 가기',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                    fontFamily: 'Pretendard',
                                    fontWeight: FontWeight.w600,
                                  ),
                                ))),
                          )),
                      SizedBox(
                          width: 50,
                          height: 50,
                          child: BbunPressable(
                              onPressed: () {
                                // TODO: 디테일 페이지 넘기기 구현
                              },
                              decoration: BoxDecoration(
                                color: Color(0xFFFFE24A),
                                border: Border.all(
                                  color: Colors.black,
                                  width: 1.5,
                                ),
                                borderRadius: BorderRadius.circular(25),
                              ),
                              child: Center(
                                  child: Icon(Icons.keyboard_arrow_right,
                                      size: 30)))),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 200,
                ),
              ],
            ),
          ),
        ]))));
  }
}

import 'package:auto_route/auto_route.dart';
import 'package:bbun/di/locator.dart';
import 'package:bbun/gen/assets.gen.dart';
import 'package:bbun/modules/bbun/presentation/bloc/bbun_bloc.dart';
import 'package:bbun/modules/bbun/presentation/bloc/bbun_list_bloc.dart';
import 'package:bbun/modules/bbun/presentation/widgets/bbun_notebook.dart';
import 'package:bbun/modules/bbun/presentation/widgets/bbun_pressable.dart';
import 'package:bbun/routes/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

@RoutePage()
class DetailPage extends StatefulWidget {
  final int index;
  final int total;

  const DetailPage({super.key, required this.index, required this.total});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  late final PageController _pageController;
  late int currentIndex;
  late int totalPages;

  @override
  void initState() {
    super.initState();
    currentIndex = widget.index;
    totalPages = widget.total;
    _pageController = PageController(initialPage: widget.index);
  }

  void goToNextPage() {
    if (currentIndex < totalPages - 1) {
      setState(() {
        currentIndex++;
      });
      _pageController.animateToPage(
        currentIndex,
        duration: Duration(milliseconds: 100),
        curve: Curves.easeInOut,
      );
    }
  }

  void goToPreviousPage() {
    if (currentIndex > 0) {
      setState(() {
        currentIndex--;
      });
      _pageController.animateToPage(
        currentIndex,
        duration: Duration(milliseconds: 100),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final scale = screenWidth / 411.42;

    return BlocProvider(
      create: (_) => sl<BbunBloc>()..add(const BbunEvent.load()),
      child: BlocProvider(
        create: (_) => sl<BbunListBloc>()..add(const BbunListEvent.load()),
        child: BlocBuilder<BbunListBloc, BbunListState>(
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
                final user =
                    bbunState.mapOrNull(loaded: (loaded) => loaded.user);
                final bbunline = bbunListState.mapOrNull(
                    loaded: (loaded) => loaded.bbunline);
                final userIndex =
                    bbunline!.indexWhere((bbun) => bbun.uuid == user!.uuid);
                return Scaffold(
                  backgroundColor: Color(0xFFFBFBFB),
                  body: PageView.builder(
                    controller: _pageController, // 초기 페이지 설정됨
                    itemCount: totalPages,
                    onPageChanged: (index) {
                      setState(() {
                        currentIndex = index;
                      });
                    },
                    itemBuilder: (context, index) {
                      return SingleChildScrollView(
                        child: Center(
                          child: Stack(
                            children: [
                              // 상단 그라데이션
                              Positioned(
                                top: 0,
                                left: 0,
                                right: 0,
                                child: Column(
                                  children: [
                                    Container(
                                        width: screenWidth,
                                        height: 257 * scale,
                                        decoration: BoxDecoration(
                                          gradient: LinearGradient(
                                            begin: Alignment.bottomCenter,
                                            end: Alignment.topCenter,
                                            colors: [
                                              Color(0xFFFBFBFB),
                                              Color(0xFFFDFD96)
                                            ],
                                          ),
                                        ),
                                        child: Assets.icons.detailPageDeco.svg(
                                          width: screenWidth,
                                          fit: BoxFit.fitWidth,
                                        )),
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
                                      width: screenWidth,
                                      height: 257 * scale,
                                      decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                          begin: Alignment.bottomCenter,
                                          end: Alignment.topCenter,
                                          colors: [
                                            Color(0xFFFDFD96),
                                            Color(0xFFFBFBFB)
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                              Positioned(
                                child: Column(
                                  children: [
                                    SizedBox(
                                        height: 200 * scale,
                                        width: screenWidth),

                                    // 학생 이름 (임시로 인덱스 표시)
                                    Container(
                                      width: screenWidth,
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 36 * scale),
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          Text(
                                            bbunline![currentIndex]
                                                .name, // currentIndex를 사용
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 50 * scale,
                                              fontFamily: 'HSSanTokki',
                                              fontWeight: FontWeight.w400,
                                              height: 0,
                                            ),
                                          ),
                                          SizedBox(width: 10 * scale),
                                          (userIndex == currentIndex)
                                              ? Padding(
                                                  padding: EdgeInsets.only(
                                                      bottom: 4 * scale),
                                                  child: GestureDetector(
                                                    onTap: () {
                                                      context.pushRoute(
                                                          ProfileEditRoute());
                                                    },
                                                    child:
                                                        Assets.icons.edit.svg(
                                                      width: 35 * scale,
                                                    ),
                                                  ),
                                                )
                                              : SizedBox()
                                        ],
                                      ),
                                    ),
                                    SizedBox(height: 28 * scale),

                                    // 노트 부분
                                    BbunNotebook(
                                      name: bbunline![currentIndex].name,
                                      studentId:
                                          bbunline![currentIndex].studentId,
                                      email: bbunline![currentIndex].email,
                                      issueDate:
                                          bbunline![currentIndex].updatedAt!,
                                      index: currentIndex,
                                      department:
                                          bbunline![currentIndex].department,
                                      mbti: bbunline![currentIndex].mbti,
                                      instaId: bbunline![currentIndex].instaId,
                                    ),
                                    SizedBox(height: 50 * scale),

                                    // 하단 버튼 (이전, 뒤로가기, 다음)
                                    Container(
                                      width: screenWidth,
                                      padding: EdgeInsets.symmetric(
                                          vertical: 10 * scale,
                                          horizontal: 36 * scale),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          // 이전 페이지 버튼
                                          SizedBox(
                                            width: 50 * scale,
                                            height: 50 * scale,
                                            child: BbunPressable(
                                              onPressed: currentIndex > 0
                                                  ? goToPreviousPage
                                                  : null,
                                              decoration: BoxDecoration(
                                                color: currentIndex > 0
                                                    ? Color(0xFFFFE24A)
                                                    : Colors.grey,
                                                border: Border.all(
                                                    color: Colors.black,
                                                    width: 1.5 * scale),
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        25 * scale),
                                              ),
                                              child: Center(
                                                child: Icon(
                                                    Icons.keyboard_arrow_left,
                                                    size: 30 * scale),
                                              ),
                                            ),
                                          ),

                                          // 뒤로 가기 버튼
                                          SizedBox(
                                            width: 110 * scale,
                                            height: 50 * scale,
                                            child: BbunPressable(
                                              onPressed: () {
                                                context.pushRoute(MainRoute());
                                              },
                                              decoration: BoxDecoration(
                                                color: Color(0xFFFFE24A),
                                                border: Border.all(
                                                    color: Colors.black,
                                                    width: 1.5 * scale),
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        25 * scale),
                                              ),
                                              child: Center(
                                                child: Text(
                                                  '뒤로 가기',
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 18 * scale,
                                                    fontFamily: 'Pretendard',
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),

                                          // 다음 페이지 버튼
                                          SizedBox(
                                            width: 50 * scale,
                                            height: 50 * scale,
                                            child: BbunPressable(
                                              onPressed:
                                                  currentIndex < totalPages - 1
                                                      ? goToNextPage
                                                      : null,
                                              decoration: BoxDecoration(
                                                color: currentIndex <
                                                        totalPages - 1
                                                    ? Color(0xFFFFE24A)
                                                    : Colors.grey,
                                                border: Border.all(
                                                    color: Colors.black,
                                                    width: 1.5 * scale),
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        25 * scale),
                                              ),
                                              child: Center(
                                                child: Icon(
                                                    Icons.keyboard_arrow_right,
                                                    size: 30 * scale),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(height: 200 * scale),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}

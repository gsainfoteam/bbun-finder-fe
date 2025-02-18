import 'package:auto_route/auto_route.dart';
import 'package:bbun/di/locator.dart';
import 'package:bbun/modules/bbun/presentation/bloc/bbun_bloc.dart';
import 'package:bbun/modules/bbun/presentation/bloc/bbun_list_bloc.dart';
import 'package:bbun/modules/bbun/presentation/widgets/bbun_card.dart';
import 'package:bbun/modules/bbun/presentation/widgets/bbun_pressable.dart';
import 'package:bbun/modules/bbun/presentation/widgets/bbun_checkbox.dart';
import 'package:bbun/modules/bbun/presentation/widgets/bbun_delete.dart';
import 'package:bbun/modules/bbun/presentation/widgets/bbun_displayfield.dart';
import 'package:bbun/modules/bbun/presentation/widgets/bbun_inputfield.dart';
import 'package:bbun/routes/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class ProfileEditPage extends StatefulWidget {
  const ProfileEditPage({super.key});

  @override
  State<ProfileEditPage> createState() => _ProfileEditPageState();
}

class _ProfileEditPageState extends State<ProfileEditPage> {
  bool isChecked = false;

  final TextEditingController departmentController = TextEditingController();
  final TextEditingController mbtiController = TextEditingController();
  final TextEditingController igIdController = TextEditingController();

  @override
  void dispose() {
    // 위젯이 파괴될 때, 텍스트 컨트롤러를 메모리에서 해제
    departmentController.dispose();
    mbtiController.dispose();
    igIdController.dispose();
    super.dispose();
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
                                  width: screenWidth,
                                  height: 257,
                                  decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                          begin: Alignment.bottomCenter,
                                          end: Alignment.topCenter,
                                          colors: [
                                        Color(0xFFFDFD96),
                                        Color(0xFFFBFBFB)
                                      ])),
                                ),
                              ],
                            )),

                        Positioned(
                          child: Column(
                            children: [
                              SizedBox(
                                height: 165,
                                width: screenWidth,
                              ),

                              // 뒤로 가기
                              Container(
                                width: screenWidth,
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 36),
                                child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      GestureDetector(
                                        child: Icon(
                                          Icons.arrow_back,
                                          size: 30,
                                        ),
                                        onTap: () {
                                          Navigator.of(context).pop(true);
                                        },
                                      ),
                                    ]),
                              ),
                              SizedBox(height: 5),

                              // 내 프로필
                              Container(
                                width: screenWidth,
                                padding: EdgeInsets.symmetric(
                                    horizontal: 36 * scale),
                                child: Text(
                                  '내 프로필',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 50 * scale,
                                    fontFamily: 'HSSanTokki',
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),

                              // 개인 정보 동의 안내
                              Container(
                                width: screenWidth,
                                padding: EdgeInsets.symmetric(
                                    horizontal: 36 * scale),
                                child: Text(
                                  bbunState.isBbunRegistered
                                      ? "개인 정보 제공 동의를 철회하려면 회원 탈퇴가 필요합니다."
                                      : "개인 정보 제공에 동의해야 프로필 설정을 완료하고 서비스를 이용할 수 있습니다.",
                                  style: TextStyle(
                                      fontSize: 18 * scale,
                                      fontFamily: 'Pretendard',
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                              const SizedBox(height: 20),

                              // 뻔카드
                              BbunCard(
                                name: user!.name,
                                studentId: user.studentId,
                                email: user.email,
                                issueDate: user.updatedAt!,
                                index: bbunState.isBbunRegistered
                                    ? bbunline!.indexWhere(
                                        (bbun) => bbun.uuid == user.uuid)
                                    : bbunListState.getTotal,
                                isBbunRegistered: bbunState.isBbunRegistered,
                              ),
                              const SizedBox(height: 35),

                              Container(
                                width: screenWidth,
                                padding: EdgeInsets.symmetric(
                                    horizontal: 36 * scale),
                                child: Column(
                                  children: [
                                    BbunDisplayField(
                                        labelText: '학번',
                                        displayText: user.studentId),
                                    SizedBox(height: 10 * scale),

                                    BbunDisplayField(
                                        labelText: '이름',
                                        displayText: user.name),
                                    SizedBox(height: 10 * scale),

                                    BbunDisplayField(
                                      labelText: '이메일',
                                      displayText: user.email,
                                    ),
                                    SizedBox(height: 10 * scale),
                                    BbunInputfield(
                                      labelText: '학과 (선택)',
                                      hintText: (user.department != null &&
                                              user.department!.isNotEmpty)
                                          ? user.department!
                                          : '학과를 입력하세요',
                                      controller: departmentController,
                                    ),
                                    SizedBox(height: 10 * scale),

                                    BbunInputfield(
                                      labelText: 'MBTI (선택)',
                                      hintText: (user.mbti != null &&
                                              user.mbti!.isNotEmpty)
                                          ? user.mbti!
                                          : 'MBTI를 입력하세요',
                                      controller: mbtiController,
                                    ),
                                    SizedBox(height: 10 * scale),

                                    BbunInputfield(
                                      labelText: '인스타그램 아이디 (선택)',
                                      hintText: (user.instaId != null &&
                                              user.instaId!.isNotEmpty)
                                          ? user.instaId!
                                          : '@instagram',
                                      controller: igIdController,
                                    ),
                                    SizedBox(height: 10 * scale),

                                    bbunState.isBbunRegistered
                                        ?
                                        // 탈퇴 박스
                                        BbunDelete()
                                        :
                                        // 개인정보 동의 체크박스
                                        BbunCheckbox(
                                            isChecked: isChecked,
                                            onChanged: (value) {
                                              setState(() {
                                                isChecked = value; // 체크 상태 갱신
                                              });
                                            },
                                          ),
                                    SizedBox(height: 20 * scale),

                                    // 제출 버튼
                                    SizedBox(
                                      child: BbunPressable(
                                        onPressed: (isChecked &&
                                                    !bbunState
                                                        .isBbunRegistered) ||
                                                (bbunState.isBbunRegistered)
                                            ? () {
                                                setState(() {
                                                  bbunState.isBbunRegistered
                                                      ? context
                                                          .read<BbunBloc>()
                                                          .add(BbunEvent.update(
                                                              departmentController
                                                                  .text,
                                                              mbtiController
                                                                  .text,
                                                              igIdController
                                                                  .text,
                                                              "미구현"))
                                                      : context
                                                          .read<BbunBloc>()
                                                          .add(BbunEvent.register(
                                                              departmentController
                                                                  .text,
                                                              mbtiController
                                                                  .text,
                                                              igIdController
                                                                  .text,
                                                              "미구현"));
                                                });
                                                context.router.popUntil(
                                                    (route) => route.isActive);
                                                context.router
                                                    .replace(MainRoute());
                                              }
                                            : null,
                                        decoration: BoxDecoration(
                                          color: !isChecked &&
                                                  !bbunState.isBbunRegistered
                                              ? Color(0xFFE2E2E2)
                                              : Color(0xFFFFE24A),
                                          borderRadius:
                                              BorderRadius.circular(38 * scale),
                                          border: !isChecked &&
                                                  !bbunState.isBbunRegistered
                                              ? Border.all(
                                                  color: Colors
                                                      .transparent, // 기본 상태에서는 테두리 없음
                                                )
                                              : Border.all(
                                                  color: Colors.black,
                                                  width: 1.5 * scale,
                                                ),
                                        ),
                                        child: Padding(
                                          padding: EdgeInsets.all(16.0 * scale),
                                          child: Center(
                                            child: Text(
                                              bbunState.isBbunRegistered
                                                  ? "수정"
                                                  : "제출",
                                              style: TextStyle(
                                                  color: !isChecked &&
                                                          !bbunState
                                                              .isBbunRegistered
                                                      ? Color(0xFFB6B6B6)
                                                      : Colors.black,
                                                  fontSize: 18 * scale,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 200,
                              ),
                            ],
                          ),
                        ),
                      ]),
                    ),
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

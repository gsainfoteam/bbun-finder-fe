import 'package:auto_route/auto_route.dart';
import 'package:bbun/modules/bbun/presentation/widgets/bbun_card.dart';
import 'package:bbun/modules/bbun/presentation/widgets/bbun_checkbox.dart';
import 'package:bbun/modules/bbun/presentation/widgets/bbun_delete.dart';
import 'package:bbun/modules/bbun/presentation/widgets/bbun_displayfield.dart';
import 'package:bbun/modules/bbun/presentation/widgets/bbun_inputfield.dart';
import 'package:bbun/modules/bbun/presentation/widgets/bbun_pressable.dart';
import 'package:bbun/routes/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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

  // dummy
  final String dummyName = "홍길동";
  final String dummyStudentId = "20231234";
  final String dummyEmail = "hong@example.com";
  final String dummyIssueDate = "2025-02-15";
  final bool dummyIsBbunReg = true;
  ImageProvider? dummyProfileImage;
  String? dummyDepart;
  String? dummyMBTI;
  String? dummyIGID;

  @override
  void dispose() {
    // 위젯이 파괴될 때, 텍스트 컨트롤러를 메모리에서 해제
    departmentController.dispose();
    mbtiController.dispose();
    igIdController.dispose();
    super.dispose();
  }

  // TODO: 변경 불가 인적 사항 IdP 통해 불러와서 보여주는 로직 추가
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

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
                    height: 165,
                    width: screenWidth,
                  ),

                  // 뒤로 가기
                  Container(
                    width: screenWidth > 475 ? 475 : screenWidth,
                    padding: const EdgeInsets.symmetric(horizontal: 36),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          GestureDetector(
                            child: Icon(
                              Icons.arrow_back,
                              size: 30,
                            ),
                            onTap: () {
                              Navigator.of(context).pop();
                            },
                          ),
                        ]),
                  ),
                  SizedBox(height: 5),

                  // 내 프로필
                  Container(
                    width: screenWidth > 475 ? 475 : screenWidth,
                    padding: const EdgeInsets.symmetric(horizontal: 36),
                    child: Text(
                      '내 프로필',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 50,
                        fontFamily: 'HSSanTokki',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),

                  // 개인 정보 동의 안내
                  Container(
                    width: screenWidth > 475 ? 475 : screenWidth,
                    padding: const EdgeInsets.symmetric(horizontal: 36),
                    child: const Text(
                      "개인 정보 제공에 동의해야 프로필 설정을 완료하고 서비스를 이용할 수 있습니다.",
                      style: TextStyle(
                          fontSize: 18,
                          fontFamily: 'Pretendard',
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  const SizedBox(height: 20),

                  // 뻔카드
                  BbunCard(
                    name: dummyName,
                    studentId: dummyStudentId,
                    email: dummyEmail,
                    issueDate: DateTime.parse("2025-01-28"),
                    textColor: Color(0xFFFC639B),
                    innerColor: Color(0xFFFFD6E5),
                    outerColor: Color(0xFFFF9BBF),
                  ),
                  const SizedBox(height: 15),

                  Container(
                    width: screenWidth > 475 ? 475 : screenWidth,
                    padding: const EdgeInsets.symmetric(horizontal: 36),
                    child: GestureDetector(
                      onTap: () {
                        // TODO: 뻔카드 색 & 캐릭터 변경되는 구현 필요
                        print("캐릭터 변경");
                      },
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            "assets/icons/refresh.svg",
                            width: 24,
                          ),
                          SizedBox(width: 10),
                          Text(
                            '캐릭터 변경',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontFamily: 'Pretendard',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),

                  Container(
                    width: screenWidth > 475 ? 475 : screenWidth,
                    padding: const EdgeInsets.symmetric(horizontal: 36),
                    child: Column(
                      children: [
                        // 학번 (변경 불가)
                        BbunDisplayField(
                            labelText: '학번', displayText: dummyStudentId),
                        const SizedBox(height: 10),

                        // 이름 (변경 불가)
                        BbunDisplayField(
                            labelText: '이름', displayText: dummyName),
                        const SizedBox(height: 10),

                        // 이메일 (변경 불가)
                        BbunDisplayField(
                          labelText: '이메일',
                          displayText: dummyEmail,
                        ),
                        const SizedBox(height: 10), // 학과 (변경 가능)
                        BbunInputfield(
                          labelText: '학과 (선택)',
                          hintText:
                              (dummyDepart != null && dummyDepart!.isNotEmpty)
                                  ? dummyDepart!
                                  : '학과를 입력하세요',
                          controller: departmentController,
                        ),
                        const SizedBox(height: 10),

                        // MBTI (변경 가능)
                        BbunInputfield(
                          labelText: 'MBTI (선택)',
                          hintText: (dummyMBTI != null && dummyMBTI!.isNotEmpty)
                              ? dummyMBTI!
                              : 'MBTI를 입력하세요',
                          controller: mbtiController,
                        ),
                        const SizedBox(height: 10),

                        // 인스타그램 아이디 (변경 가능)
                        BbunInputfield(
                          labelText: '인스타그램 아이디 (선택)',
                          hintText: (dummyIGID != null && dummyIGID!.isNotEmpty)
                              ? dummyIGID!
                              : '@instagram',
                          controller: igIdController,
                        ),
                        const SizedBox(height: 10),

                        dummyIsBbunReg
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
                        const SizedBox(height: 20),

                        // 제출 버튼
                        SizedBox(
                          child: BbunPressable(
                            onPressed: (!isChecked && !dummyIsBbunReg)
                                ? null
                                : () {
                                    setState(() {
                                      dummyDepart = departmentController.text;
                                      dummyMBTI = mbtiController.text;
                                      dummyIGID = igIdController.text;
                                    });
                                  },
                            decoration: BoxDecoration(
                              color: !isChecked && !dummyIsBbunReg
                                  ? Color(0xFFE2E2E2)
                                  : Color(0xFFFFE24A),
                              borderRadius: BorderRadius.circular(38),
                              border: !isChecked && !dummyIsBbunReg
                                  ? Border.all(
                                      color:
                                          Colors.transparent, // 기본 상태에서는 테두리 없음
                                    )
                                  : Border.all(
                                      color: Colors.black,
                                      width: 1.5,
                                    ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Center(
                                child: Text(
                                  dummyIsBbunReg ? "수정" : "제출",
                                  style: TextStyle(
                                      color: !isChecked && !dummyIsBbunReg
                                          ? Color(0xFFB6B6B6)
                                          : Colors.black,
                                      fontSize: 18,
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
  }
}

import 'package:bbun/gen/assets.gen.dart';
import 'package:bbun/modules/bbun/presentation/widgets/bbun_card.dart';
import 'package:flutter/material.dart';

class BbunNotebook extends StatefulWidget {
  final String name;
  final String studentId;
  final String email;
  final DateTime issueDate;
  final ImageProvider? profileImage;
  final int index;
  final String? department;
  final String? mbti;
  final String? instaId;

  const BbunNotebook(
      {super.key,
      required this.name,
      required this.studentId,
      required this.email,
      required this.issueDate,
      this.profileImage,
      required this.index,
      required this.department,
      required this.mbti,
      required this.instaId});

  @override
  State<BbunNotebook> createState() => _BbunNotebookState();
}

class _BbunNotebookState extends State<BbunNotebook> {
  final card = BbunCard(
    name: "양예진",
    studentId: "20215121",
    email: "yangyj@gm.gist.ac.kr",
    issueDate: DateTime(1),
    index: 1,
  );

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      final parentWidth = constraints.maxWidth;
      final scale = parentWidth / 411.42;

      return FractionallySizedBox(
        widthFactor: 1.0,
        child: SizedBox(
          height: 581.01 * scale,
          child: Stack(
            children: [
              // 노트 속지
              Positioned(
                top: 0,
                left: 0,
                child: Assets.images.paper.image(width: 411.42 * scale),
              ),
              // 병아리
              Positioned(
                top: 306 * scale,
                left: 290.73 * scale,
                child: Assets.icons.chick.svg(
                  width: 61.9 * scale,
                ),
              ),

              // 뻔 카드
              // TODO: 지금 빈 상자라서 진짜 뻔 카드로 교체 필요
              Positioned(
                  top: 63 * scale,
                  left: 90.195 * scale,
                  child: Transform.rotate(
                      angle: 0.11397,
                      child: BbunCard(
                          name: widget.name,
                          studentId: widget.studentId,
                          email: widget.email,
                          issueDate: widget.issueDate,
                          index: widget.index))),
              // 별 클립
              Positioned(
                top: 38.85 * scale,
                left: 295.05 * scale,
                child: Assets.icons.starClip.svg(
                  width: 82.3725 * scale,
                ),
              ),
              // 학생 상세 정보
              Positioned(
                top: 378 * scale,
                left: 36 * scale,
                child: Transform.rotate(
                  angle: -0.0523,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            '전공',
                            style: TextStyle(
                              fontFamily: 'CornCorn',
                              fontSize: 20 * scale,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(
                            width: 8 * scale,
                          ),
                          Text(
                            widget.department!,
                            style: TextStyle(
                              fontFamily: 'CornCorn',
                              fontSize: 20 * scale,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      Assets.icons.devider1.svg(
                        width: 320.96 * scale,
                      ),
                      SizedBox(height: 5 * scale),
                      Row(
                        children: [
                          Text(
                            'MBTI',
                            style: TextStyle(
                              fontFamily: 'CornCorn',
                              fontSize: 20 * scale,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(
                            width: 8 * scale,
                          ),
                          Text(
                            widget.mbti!,
                            style: TextStyle(
                              fontFamily: 'CornCorn',
                              fontSize: 20 * scale,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      Assets.icons.devider2.svg(
                        width: 320.96 * scale,
                      ),
                      SizedBox(height: 6 * scale),
                      Row(
                        children: [
                          Text(
                            '인스타그램',
                            style: TextStyle(
                              fontFamily: 'CornCorn',
                              fontSize: 20 * scale,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(
                            width: 8 * scale,
                          ),
                          Text(
                            widget.instaId!,
                            style: TextStyle(
                              fontFamily: 'CornCorn',
                              fontSize: 20 * scale,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      Assets.icons.devider3.svg(
                        width: 320.96 * scale,
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      );
    });
  }
}

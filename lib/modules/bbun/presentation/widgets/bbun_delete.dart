import 'package:bbun/gen/assets.gen.dart';
import 'package:bbun/modules/bbun/presentation/widgets/bbun_dialog.dart';
import 'package:flutter/material.dart';

class BbunDelete extends StatelessWidget {
  const BbunDelete({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final scale = screenWidth / 411.42;
    return Container(
      padding:
          EdgeInsets.symmetric(horizontal: 10 * scale, vertical: 12 * scale),
      decoration: BoxDecoration(
        border: Border.all(width: 1.50 * scale),
        borderRadius: BorderRadius.circular(16 * scale),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 7 * scale),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '회원 탈퇴',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18 * scale,
                    fontFamily: 'Pretendard',
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  '개인 정보 동의를 철회하려면 회원 탈퇴가 필요합니다. 이 행위는 되돌릴 수 없습니다.',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14 * scale,
                    fontFamily: 'Pretendard',
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 10 * scale),
                Container(
                  padding: EdgeInsets.only(left: 4 * scale),
                  child: GestureDetector(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return BbunDialog();
                        },
                      );
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Assets.icons.delete.svg(
                          width: 18 * scale,
                        ),
                        SizedBox(width: 12 * scale),
                        Expanded(
                          child: Text(
                            '탈퇴하기',
                            style: TextStyle(
                              color: Color(0xFFF10000),
                              fontSize: 18 * scale,
                              fontFamily: 'Pretendard',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

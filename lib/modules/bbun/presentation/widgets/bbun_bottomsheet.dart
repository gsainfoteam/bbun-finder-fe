import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class BbunBottomsheet extends StatelessWidget {
  const BbunBottomsheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 5),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 68,
            height: 5,
            decoration: BoxDecoration(
              color: Color(0xFFE3E3E3),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          const SizedBox(height: 25),
          // 라이브러리에서 선택
          SizedBox(
            child: GestureDetector(
              onTap: () {
                // TODO: 라이브러리에서 선택 로직 구현
                print("라이브러리에서 선택");
                Navigator.pop(context);
              },
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    'assets/icons/gallery.svg',
                    width: 18,
                  ),
                  const SizedBox(width: 15),
                  Expanded(
                    child: Text(
                      '라이브러리에서 선택',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontFamily: 'Pretendard',
                        fontWeight: FontWeight.w500,
                        height: 1,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 30),

          // 현재 사진 삭제
          SizedBox(
            child: GestureDetector(
              onTap: () {
                // TODO: 현재 사진 삭제 로직 구현
                print("현재 사진 삭제");
                Navigator.pop(context);
              },
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    'assets/icons/delete.svg',
                    width: 18,
                  ),
                  const SizedBox(width: 15),
                  Expanded(
                    child: Text(
                      '현재 사진 삭제',
                      style: TextStyle(
                        color: Color(0xFFF10000),
                        fontSize: 18,
                        fontFamily: 'Pretendard',
                        fontWeight: FontWeight.w500,
                        height: 1,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 60),
        ],
      ),
    );
  }
}

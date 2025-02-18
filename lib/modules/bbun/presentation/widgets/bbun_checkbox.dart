import 'package:flutter/material.dart';

class BbunCheckbox extends StatefulWidget {
  final bool isChecked;
  final ValueChanged<bool> onChanged;

  const BbunCheckbox({
    super.key,
    required this.isChecked,
    required this.onChanged,
  });

  @override
  State<BbunCheckbox> createState() => _BbunCheckboxState();
}

class _BbunCheckboxState extends State<BbunCheckbox> {
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
            height: 50 * scale,
            padding: EdgeInsets.symmetric(horizontal: 7 * scale),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '개인 정보 제공에 동의하십니까?',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18 * scale,
                    fontFamily: 'Pretendard',
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  '동의하지 않을 시 서비스 이용이 불가능합니다.',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14 * scale,
                    fontFamily: 'Pretendard',
                    fontWeight: FontWeight.w500,
                    height: 1.5,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 5 * scale),
          Container(
            padding: EdgeInsets.only(left: 8 * scale),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    widget.onChanged(!widget.isChecked); // 상태 토글
                  },
                  child: Container(
                    width: 20 * scale,
                    height: 20 * scale,
                    decoration: BoxDecoration(
                      color:
                          widget.isChecked ? Color(0xFFFFE24A) : Colors.white,
                      border: Border.all(
                        width: 1.50 * scale,
                        color:
                            widget.isChecked ? Color(0xFFFFE24A) : Colors.black,
                      ),
                    ),
                    child: widget.isChecked
                        ? Icon(
                            Icons.check,
                            color: Colors.white,
                            size: 16 * scale,
                          )
                        : null,
                  ),
                ),
                SizedBox(width: 10 * scale),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 10 * scale),
                    child: Text(
                      '동의합니다',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18 * scale,
                        fontFamily: 'Pretendard',
                        fontWeight: FontWeight.w500,
                        height: 1,
                      ),
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

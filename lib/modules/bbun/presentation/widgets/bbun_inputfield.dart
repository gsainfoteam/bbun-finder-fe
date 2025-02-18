import 'package:flutter/material.dart';

class BbunInputfield extends StatelessWidget {
  final String labelText;
  final String hintText;
  final TextEditingController controller;

  const BbunInputfield({
    super.key,
    required this.labelText,
    required this.hintText,
    required this.controller,
  });

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
          // Label Text
          Container(
            padding: EdgeInsets.symmetric(horizontal: 7 * scale),
            child: Text(
              labelText,
              style: TextStyle(
                color: Colors.black,
                fontSize: 18 * scale,
                fontFamily: 'Pretendard',
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          SizedBox(height: 10 * scale),
          // Input Field
          Container(
            padding: EdgeInsets.symmetric(
                horizontal: 16 * scale, vertical: 2 * scale),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(22 * scale),
              border: Border.all(width: 1.50 * scale),
            ),
            child: TextFormField(
              cursorHeight: 18 * scale,
              cursorColor: Color(0xFFFFE24A),
              controller: controller,
              style: TextStyle(
                color: Colors.black,
                fontSize: 18 * scale,
                fontFamily: 'Pretendard',
                fontWeight: FontWeight.w500,
              ),
              decoration: InputDecoration(
                hintText: hintText,
                hintStyle: TextStyle(
                  color: Color(0xFFB6B6B6),
                  fontSize: 18 * scale,
                  fontFamily: 'Pretendard',
                  fontWeight: FontWeight.w500,
                ),
                border: InputBorder.none,
                isDense: true,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

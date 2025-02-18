import 'package:flutter/material.dart';

class BbunDisplayField extends StatelessWidget {
  final String labelText;
  final String displayText;

  const BbunDisplayField({
    super.key,
    required this.labelText,
    required this.displayText,
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
          SizedBox(height: 8 * scale),
          // Display Text (non-editable)
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 7 * scale),
            child: Text(
              displayText,
              style: TextStyle(
                color: Colors.black,
                fontSize: 18 * scale,
                fontFamily: 'Pretendard',
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

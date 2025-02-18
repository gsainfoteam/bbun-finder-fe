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
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
      decoration: BoxDecoration(
        border: Border.all(width: 1.50),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Label Text
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 7),
            child: Text(
              labelText,
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontFamily: 'Pretendard',
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          const SizedBox(height: 8),
          // Display Text (non-editable)
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 7),
            child: Text(
              displayText,
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
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

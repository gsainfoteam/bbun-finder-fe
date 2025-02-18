import 'package:bbun/gen/assets.gen.dart';
import 'package:flutter/material.dart';

class BbunCard extends StatelessWidget {
  static const List<Map<String, Color>> _colorSchemes = [
    {
      "text": Color(0xFF886CD6),
      "inner": Color(0xFFDDD1FF),
      "outer": Color(0xFFA48EE4),
    },
    {
      "text": Color(0xFF2681D7),
      "inner": Color(0xFFC5E3FF),
      "outer": Color(0xFF70B6F7),
    },
    {
      "text": Color(0xFFEBB608),
      "inner": Color(0xFFFDFD96),
      "outer": Color(0xFFF1DA66),
    },
    {
      "text": Color(0xFFFC639B),
      "inner": Color(0xFFFFD6E5),
      "outer": Color(0xFFFF9BBF),
    },
  ];

  static final List<SvgGenImage> _svgIcons = [
    Assets.icons.default1,
    Assets.icons.default2,
    Assets.icons.default4,
    Assets.icons.default3,
  ];

  final String name;
  final String studentId;
  final String email;
  final DateTime issueDate;
  final ImageProvider? profileImage;
  final int index;

  const BbunCard(
      {super.key,
      required this.name,
      required this.studentId,
      required this.email,
      required this.issueDate,
      this.profileImage,
      required this.index});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final scale = screenWidth / 411.42;
    return Container(
      width: 321 * scale,
      height: 175 * scale,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15 * scale),
        border: Border.all(
          color: Colors.black,
          width: 2 * scale,
        ),
      ),
      child: Column(
        children: [
          SizedBox(
            height: 9 * scale,
          ),
          Row(
            children: [
              SizedBox(
                width: 10 * scale,
              ),
              Text(
                "funline sk8ter ID Card",
                style: TextStyle(
                  fontSize: 10 * scale,
                  color: _colorSchemes[index]["text"]!,
                  fontWeight: FontWeight.w400,
                  height: 1.1,
                ),
              ),
              Spacer(),
              Text(
                ">>>",
                style: TextStyle(
                  fontSize: 10 * scale,
                  color: _colorSchemes[index]["text"]!,
                  fontWeight: FontWeight.w300,
                  height: 1.1,
                ),
              ),
              SizedBox(
                width: 9 * scale,
              ),
            ],
          ),
          SizedBox(
            height: 2 * scale,
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                gradient: RadialGradient(
                  colors: [
                    _colorSchemes[index]["inner"]!,
                    _colorSchemes[index]["outer"]!,
                  ],
                  radius: 0.92,
                ),
              ),
              padding: EdgeInsets.symmetric(
                horizontal: 15.5 * scale,
                vertical: 8.5 * scale,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 90 * scale,
                    height: 113.39 * scale,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5 * scale),
                      border: Border.all(
                        color: Colors.black,
                        width: 2 * scale,
                      ),
                      image: profileImage != null
                          ? DecorationImage(
                              image: profileImage!, fit: BoxFit.cover)
                          : null,
                    ),
                    child: profileImage == null ? _svgIcons[index].svg() : null,
                  ),
                  SizedBox(
                    width: 10 * scale,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "NAME",
                        style: TextStyle(
                          fontSize: 12 * scale,
                          color: _colorSchemes[index]["text"]!,
                          fontWeight: FontWeight.w400,
                          height: 1.1,
                        ),
                      ),
                      SizedBox(
                        height: 3 * scale,
                      ),
                      Text(
                        name,
                        style: TextStyle(
                          fontSize: 18 * scale,
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                          height: 1.1,
                        ),
                      ),
                      SizedBox(
                        height: 5 * scale,
                      ),
                      Text(
                        "STUDENT ID",
                        style: TextStyle(
                          fontSize: 12 * scale,
                          color: _colorSchemes[index]["text"]!,
                          fontWeight: FontWeight.w400,
                          height: 1.1,
                        ),
                      ),
                      SizedBox(
                        height: 3 * scale,
                      ),
                      Text(
                        studentId,
                        style: TextStyle(
                          fontSize: 18 * scale,
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                          height: 1.1,
                        ),
                      ),
                      SizedBox(
                        height: 5 * scale,
                      ),
                      Text(
                        "E-MAIL",
                        style: TextStyle(
                          fontSize: 12 * scale,
                          color: _colorSchemes[index]["text"]!,
                          fontWeight: FontWeight.w400,
                          height: 1.1,
                        ),
                      ),
                      SizedBox(
                        height: 3 * scale,
                      ),
                      Text(
                        email,
                        style: TextStyle(
                          fontSize: 14 * scale,
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                          height: 1.1,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Row(
            children: [
              Spacer(),
              Text(
                "issue date $issueDate",
                style: TextStyle(
                  fontSize: 9 * scale,
                  color: _colorSchemes[index]["text"]!,
                  fontWeight: FontWeight.w400,
                  height: 1.1,
                ),
              ),
              SizedBox(
                width: 10 * scale,
              ),
            ],
          ),
          SizedBox(
            height: 4 * scale,
          ),
        ],
      ),
    );
  }
}

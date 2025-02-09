import 'package:flutter/material.dart';

class BbunCard extends StatelessWidget {
  final String name;
  final String studentId;
  final String email;
  final String issueDate;
  final ImageProvider? profileImage;

  const BbunCard({
    super.key,
    required this.name,
    required this.studentId,
    required this.email,
    required this.issueDate,
    this.profileImage,
  });

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
                  color: Color(0xFF886CD6),
                  fontWeight: FontWeight.w400,
                  height: 1.1,
                ),
              ),
              Spacer(),
              Text(
                ">>>",
                style: TextStyle(
                  fontSize: 10 * scale,
                  color: Color(0xFF886CD6),
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
                    Color(0xFFDDD1FF),
                    Color(0xFFA48EE4),
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
                    child: profileImage == null
                        ? Icon(Icons.person,
                            size: 70 * scale, color: Colors.grey)
                        : null,
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
                          color: Color(0xFF886CD6),
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
                          color: Color(0xFF886CD6),
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
                          color: Color(0xFF886CD6),
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
                  color: Color(0xFF886CD6),
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

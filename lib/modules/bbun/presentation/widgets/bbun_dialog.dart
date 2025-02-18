import 'package:bbun/di/locator.dart';
import 'package:bbun/modules/bbun/presentation/bloc/bbun_bloc.dart';
import 'package:bbun/routes/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:auto_route/auto_route.dart';

class BbunDialog extends StatelessWidget {
  const BbunDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final scale = screenWidth / 411.42;
    return BlocProvider(
        create: (_) => sl<BbunBloc>()..add(const BbunEvent.load()),
        child: BlocBuilder<BbunBloc, BbunState>(builder: (context, bbunState) {
          return Dialog(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16 * scale),
                color: Colors.white,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(height: 20 * scale),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20 * scale),
                    child: Text(
                      '정말 탈퇴하시겠습니까?',
                      style: TextStyle(
                        fontSize: 18 * scale,
                        fontFamily: 'Pretendard',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  SizedBox(height: 10 * scale),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20 * scale),
                    child: Text(
                      '회원 탈퇴 시 모든 정보가 삭제되며 더이상 서비스를 이용할 수 없습니다.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16 * scale,
                        fontFamily: 'Pretendard',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Divider(height: 1, color: Colors.grey[300]),
                  IntrinsicHeight(
                    child: Row(
                      children: [
                        Expanded(
                          child: TextButton(
                            onPressed: () => Navigator.pop(context),
                            style: ButtonStyle(
                              shape: WidgetStateProperty.all<
                                  RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(
                                            16.0 * scale)) // border radius 조정
                                    ),
                              ),
                              overlayColor:
                                  WidgetStateProperty.resolveWith<Color>(
                                (Set<WidgetState> states) {
                                  if (states.contains(WidgetState.pressed)) {
                                    return Color(0xFFE2E2E2);
                                  }
                                  return Colors.transparent;
                                },
                              ),
                            ),
                            child: Padding(
                              padding:
                                  EdgeInsets.symmetric(vertical: 7 * scale),
                              child: Text(
                                '취소',
                                style: TextStyle(
                                  fontSize: 18 * scale,
                                  fontFamily: 'Pretendard',
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                        ),
                        VerticalDivider(width: 1, color: Colors.grey[300]),
                        Expanded(
                          child: TextButton(
                            onPressed: () {
                              context
                                  .read<BbunBloc>()
                                  .add(const BbunEvent.delete());
                              context.router
                                  .popUntil((route) => route.isActive);
                              context.router.replace(MainRoute());
                            },
                            style: ButtonStyle(
                              shape: WidgetStateProperty.all<
                                  RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.only(
                                        bottomRight:
                                            Radius.circular(16.0 * scale))),
                              ),
                              overlayColor:
                                  WidgetStateProperty.resolveWith<Color>(
                                (Set<WidgetState> states) {
                                  if (states.contains(WidgetState.pressed)) {
                                    return Color(0xFFE2E2E2);
                                  }
                                  return Colors.transparent;
                                },
                              ),
                            ),
                            child: Padding(
                              padding:
                                  EdgeInsets.symmetric(vertical: 7 * scale),
                              child: Text(
                                '탈퇴',
                                style: TextStyle(
                                  fontSize: 18 * scale,
                                  fontFamily: 'Pretendard',
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xFFF10000),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        }));
  }
}

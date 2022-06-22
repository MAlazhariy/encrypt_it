import 'package:easy_localization/easy_localization.dart';
import 'package:encryption_app/layout/home_screen.dart';
import 'package:encryption_app/shared/network/local/on_board_cache.dart';
import 'package:encryption_app/shared/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sizer/sizer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'page_1.dart';
import 'page_2.dart';
import 'page_3.dart';


class OnBoardScreen extends StatefulWidget {
  const OnBoardScreen({Key? key}) : super(key: key);

  @override
  OnBoardScreenState createState() => OnBoardScreenState();
}

class OnBoardScreenState extends State<OnBoardScreen> {
  double currentIndex = 0;
  bool isLast = false;

  PageController boardController = PageController();

  List<Widget> boardItems = const [
    BoardPage1(),
    BoardPage2(),
    BoardPage3(),
  ];

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: [SystemUiOverlay.bottom]);
    return Scaffold(
      backgroundColor: const Color(0xFFECF0F3),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(
            vertical: 20.sp,
            // horizontal: 20.sp,
          ),
          alignment: Alignment.center,
          child: Column(
            children: [
              /// skip button
              // Align(
              //     alignment: AlignmentDirectional.topEnd,
              //     child: GestureDetector(
              //       child: Text(
              //         !isLast ? 'skip'.tr() : '',
              //         style: TextStyle(
              //           color: Theme.of(context).colorScheme.onSecondary,
              //           fontSize: 9.sp,
              //           fontWeight: FontWeight.w500,
              //         ),
              //       ),
              //       onTap: (){
              //         if (!isLast) {
              //           setState(() {
              //             boardController.animateToPage(
              //               boardItems.length - 1,
              //               duration: const Duration(
              //                 milliseconds: 400,
              //               ),
              //               curve: Curves.fastLinearToSlowEaseIn,
              //             );
              //           });
              //         }
              //         else {
              //           null;
              //         }
              //       },
              //     ),
              //   ),

              /// page design
              Expanded(
                child: PageView.builder(
                  onPageChanged: (int value) {
                    setState(() {
                      currentIndex = value.toDouble();
                      isLast = (currentIndex == boardItems.length - 1)
                          ? true
                          : false;
                    });
                  },
                  itemBuilder: (context, index) {
                    return boardItems[index];
                  },
                  physics: const BouncingScrollPhysics(),
                  itemCount: boardItems.length,
                  controller: boardController,
                ),
              ),

              /// main button
              LayoutBuilder(
                builder: (_, constraints) {
                  return Tooltip(
                    message: isLast ? 'get_started'.tr() : 'next'.tr(),
                    child: MaterialButton(
                      autofocus: true,
                      onPressed: () {
                        if (isLast) {
                          BoardCache.boardHasOpened();
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                              builder: (context) => HomeScreen(),
                            ),
                            (route) => false,
                          );
                        } else {
                          /// go to next page
                          setState(() {
                            boardController.nextPage(
                              duration: const Duration(
                                milliseconds: 700,
                              ),
                              curve: Curves.fastLinearToSlowEaseIn,
                            );
                          });
                        }
                      },
                      color: isLast
                          ? mainColor
                          : darkBlueColor,
                      minWidth: constraints.maxWidth - 30.w,
                      padding: EdgeInsets.symmetric(
                        vertical: 10.sp,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.sp),
                      ),
                      splashColor: Colors.white.withAlpha(25),
                      highlightColor: Colors.white.withAlpha(10),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            isLast ? 'get_started'.tr() : 'next'.tr(),
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12.sp,
                              fontWeight:
                                  isLast ? FontWeight.w600 : FontWeight.w500,
                            ),
                          ),
                          if (!isLast)
                            SizedBox(
                              width: 2.sp,
                            ),
                          if (!isLast)
                            const Icon(
                              Icons.navigate_next,
                              color: Colors.white,
                            ),
                        ],
                      ),
                    ),
                  );
                },
              ),

              SizedBox(
                height: 25.sp,
              ),

              /// indicator
              Align(
                child: SmoothPageIndicator(
                  controller: boardController,
                  count: boardItems.length,
                  effect: WormEffect(
                    activeDotColor: const Color(0xFF454649),
                    dotColor: const Color(0xFF454649).withAlpha(90),
                    dotHeight: 2.w,
                    dotWidth: 2.w,
                    spacing: 1.5.w,
                    offset: currentIndex,
                  ),
                  onDotClicked: (int index) {
                    setState(() {
                      boardController.animateToPage(
                        index,
                        duration: const Duration(
                          milliseconds: 300,
                        ),
                        curve: Curves.fastLinearToSlowEaseIn,
                      );
                    });
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

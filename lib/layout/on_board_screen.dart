import 'package:easy_localization/easy_localization.dart';
import 'package:encryption_app/layout/home_screen.dart';
import 'package:encryption_app/shared/components/constants.dart';
import 'package:encryption_app/shared/network/local/on_board_cache.dart';
import 'package:encryption_app/shared/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sizer/sizer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

/// board pages
class BoardPage1 extends StatelessWidget {
  const BoardPage1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 20.sp,
      ),
      child: Column(
        children: [
          SizedBox(
            height: 5.sp,
          ),

          // image
          SizedBox(
            // height: 50.h,
            child: Image.asset(
              (currentLang(context) == 'ar')
                  ? 'assets/images/encryption animation ar.gif'
                  : 'assets/images/encryption animation.gif',
              fit: BoxFit.fitWidth,
            ),
          ),

          // headline title
          Text(
            'onBoard_headline_1'.tr(),
            style: TextStyle(
              color: darkGrayColor,
              fontFamily: 'Cairo',
              fontWeight: FontWeight.w600,
              fontSize: 13.sp,
            ),
            textAlign: TextAlign.center,
          ),

          // subtitle
          Text(
            'onBoard_subtitle_1'.tr(),
            style: TextStyle(
              color: lightGrayColor,
              fontFamily: 'Cairo',
              fontWeight: FontWeight.w500,
              fontSize: 10.sp,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

class BoardPage2 extends StatelessWidget {
  const BoardPage2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 20.sp,
      ),
      child: Column(
        children: [
          SizedBox(
            height: 5.sp,
          ),

          // image
          SizedBox(
            child: Image.asset(
              'assets/images/main-animation.gif',
              // 'assets/images/icon.png',
              fit: BoxFit.contain,
              color: lightGrayColor,
              // color: darkGrayColor.withAlpha(250),
            ),
          ),

          // headline title
          Text(
            'onBoard_headline_2'.tr(),
            style: TextStyle(
              color: darkGrayColor,
              fontFamily: 'Cairo',
              fontWeight: FontWeight.w600,
              fontSize: 13.sp,
            ),
            textAlign: TextAlign.center,
          ),

          // subtitle
          Text(
            'onBoard_subtitle_2'.tr(),
            style: TextStyle(
              color: lightGrayColor,
              fontFamily: 'Cairo',
              fontWeight: FontWeight.w500,
              fontSize: 10.sp,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

class BoardPage3 extends StatelessWidget {
  const BoardPage3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 20.sp,
      ),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // image
            SizedBox(
              child: Icon(
                Icons.favorite_outlined,
                color: mainColor,
                size: 100.sp,
              ),
            ),

            SizedBox(
              height: 10.sp,
            ),

            // headline title
            Text(
              'onBoard_headline_3'.tr(),
              style: TextStyle(
                color: mainColor,
                fontFamily: 'Cairo',
                fontWeight: FontWeight.w500,
                fontSize: 12.sp,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}


/// On boarding screen widget
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
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: [SystemUiOverlay.bottom]);
    return Scaffold(
      backgroundColor: contrastColor,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: 20.sp,
            // horizontal: 20.sp,
          ),
          child: Column(
            children: [
              /// skip button
              // Align(
              //     alignment: AlignmentDirectional.topEnd,
              //     child: GestureDetector(
              //       child: Text(
              //         !isLast ? 'skip'.tr() : '',
              //         style: TextStyle(
              //           color: lightGrayColor,
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

              /// pages design
              Expanded(
                child: PageView.builder(
                  onPageChanged: (int value) {
                    setState(() {
                      currentIndex = value.toDouble();
                      isLast = (currentIndex == boardItems.length - 1) ? true : false;
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
                builder: (_, constraints){
                  return MaterialButton(
                    autofocus: true,

                    onPressed: (){
                      if (isLast) {
                        BoardCache.boardHasOpened();
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(builder: (context) => HomeScreen(),),
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
                    color: isLast ? mainColor : darkGrayColor,
                    minWidth: constraints.maxWidth - 30.w,
                    padding: EdgeInsets.symmetric(
                      vertical: 10.sp,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.sp),
                    ),
                    splashColor: contrastColor.withAlpha(25),
                    highlightColor: contrastColor.withAlpha(10),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          isLast ? 'get_started'.tr() : 'next'.tr(),
                          style: TextStyle(
                            color: contrastColor,
                            fontSize: 12.sp,
                            fontWeight:
                            isLast ? FontWeight.w600 : FontWeight.w500,
                          ),
                        ),

                        if(!isLast)
                          SizedBox(width: 2.sp,),

                        if(!isLast)
                          const Icon(
                            Icons.navigate_next,
                            color: contrastColor,
                          ),
                      ],
                    ),
                  );
                },
              ),

              SizedBox(height: 25.sp,),

              /// indicator
              Align(
                child: SmoothPageIndicator(
                  controller: boardController,
                  count: boardItems.length,
                  effect: WormEffect(
                    activeDotColor: lightGrayColor,
                    dotColor: Colors.grey.withAlpha(90),
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


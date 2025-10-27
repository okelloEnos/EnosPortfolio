import 'package:enos_portfolio/features/home/ui/widgets/about_section.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../util/breakpoints.dart';
import '../../../../util/custom_colors.dart';
import '../widgets/downward_arrow.dart';
import '../widgets/footer.dart';
import '../widgets/landing_section.dart';
import '../widgets/lower_container.dart';
import '../widgets/nav_bar.dart';
import '../widgets/project_section.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late final List<Map> intrests;
  late final GlobalKey intrestsKey;
  late final GlobalKey skillsKey;
  late final GlobalKey homeKey;
  late final ScrollController scrollController;
  late final RxBool showFloatingButton;

  @override
  void initState() {
    intrestsKey = GlobalKey();
    skillsKey = GlobalKey();
    homeKey = GlobalKey();
    scrollController = ScrollController();
    showFloatingButton = false.obs;

    intrests = [
      {
        'intrest': 'Beatbox',
        'color': CustomColors.primary,
        'textColor': CustomColors.darkBackground,
      },
      {
        'intrest': 'Chess',
        'color': CustomColors.brightBackground,
        'textColor': CustomColors.primary,
      },
      {
        'intrest': 'Soccer',
        'color': CustomColors.primary,
        'textColor': CustomColors.darkBackground,
      },
      {
        'intrest': 'Listening to music',
        'color': CustomColors.brightBackground,
        'textColor': CustomColors.primary,
      },
      {
        'intrest': 'Watching movies',
        'color': CustomColors.brightBackground,
        'textColor': CustomColors.primary,
      },
      {
        'intrest': 'Math',
        'color': CustomColors.primary,
        'textColor': CustomColors.darkBackground,
      },
      {
        'intrest': 'Learning English',
        'color': CustomColors.brightBackground,
        'textColor': CustomColors.primary,
      },
      {
        'intrest': 'Solving Problems',
        'color': CustomColors.primary,
        'textColor': CustomColors.darkBackground,
      },
    ];

    scrollController.addListener(() {
      if (scrollController.offset >= Breakpoints.floatingButton) {
        showFloatingButton.value = true;
      } else {
        showFloatingButton.value = false;
      }
    });
    super.initState();
  }

  void _scrollToNextSection() {
    final context = intrestsKey.currentContext;
    if (context != null) {
      Scrollable.ensureVisible(
        context,
        duration: const Duration(milliseconds: 800),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    // double width = MediaQuery.sizeOf(context).width;
    // double height = MediaQuery.sizeOf(context).height;

    // // If NavBar overlay is ~75px, subtract it so hero fits exactly under navbar.
    // // If NavBar is overlayed on top of hero, you can use fullHeight = media.size.height;
    // final double navBarHeight = 75.0;
    // final double fullHeight = media.size.height - navBarHeight;
    return Scaffold(
      floatingActionButton: ObxValue<RxBool>(
              (data) => Visibility(
            visible: data.value,
            child: FloatingActionButton(
                onPressed: () => scrollController.animateTo(
                    scrollController.position.minScrollExtent,
                    duration: const Duration(milliseconds: 700),
                    curve: Curves.easeInOut),
                backgroundColor: CustomColors.primary,
                child: const Icon(Icons.arrow_upward,
                    color: CustomColors.darkBackground)),
          ),
          showFloatingButton),
      body: Container(
        color: CustomColors.brightBackground,
        // color: Colors.red,
        width: width,
        child: SingleChildScrollView(
          controller: scrollController,
          child: Stack(
            children: [
              Column(
                children: [
                  const SizedBox(height: 75.0),
                  Stack(
                    children: [
                      LandingSection(width: width, height: height - 75.0),
                      FadeOnScrollArrow(
                        scrollController: scrollController,
                        nextSectionKey: intrestsKey,
                        fadeDistance: 250.0, // tweak to taste
                        bottomPadding: 20.0,
                      ),
                    ],
                  ),
                  AboutSection(width: width, height: height - 75.0),
                  ProjectSection(width: width, height: height - 75.0),
                  LowerContainer(
                      width: width,
                      intrests: intrests,
                      intrestsKey: intrestsKey,
                      skillsKey: skillsKey),
                  Container(
                    width: width,
                    height: 0.1,
                    color:CustomColors.gray,
                  ),
                  Footer(width: width,scrollController: scrollController,),
                ],
              ),
              NavBar(
                width: width,
                skillsKey: skillsKey,
                interestsKey: intrestsKey,
                key: homeKey,
                scrollController: scrollController,
              ),
            ],
          ),
        ),
      ),
    );
    // return Scaffold(
    //   floatingActionButton: ObxValue<RxBool>(
    //           (data) => Visibility(
    //         visible: data.value,
    //         child: FloatingActionButton(
    //             onPressed: () => scrollController.animateTo(
    //                 scrollController.position.minScrollExtent,
    //                 duration: const Duration(milliseconds: 700),
    //                 curve: Curves.easeInOut),
    //             backgroundColor: CustomColors.primary,
    //             child: const Icon(Icons.arrow_upward,
    //                 color: CustomColors.darkBackground)),
    //       ),
    //       showFloatingButton),
    //   body: Container(
    //     // color: CustomColors.brightBackground,
    //     color: Colors.red,
    //     width: width,
    //     child: SingleChildScrollView(
    //       controller: scrollController,
    //       child: Stack(
    //         children: [
    //           Column(
    //             children: [
    //               const SizedBox(height: 75.0),
    //               UpperContainer(width: width),
    //               LowerContainer(
    //                   width: width,
    //                   intrests: intrests,
    //                   intrestsKey: intrestsKey,
    //                   skillsKey: skillsKey),
    //               Container(
    //                 width: width,
    //                 height: 0.1,
    //                 color:CustomColors.gray,
    //               ),
    //               Footer(width: width,scrollController: scrollController,),
    //             ],
    //           ),
    //           NavBar(
    //             width: width,
    //             skillsKey: skillsKey,
    //             interestsKey: intrestsKey,
    //             key: homeKey,
    //             scrollController: scrollController,
    //           ),
    //         ],
    //       ),
    //     ),
    //   ),
    // );
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

}

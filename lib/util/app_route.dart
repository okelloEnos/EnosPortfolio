import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:page_transition/page_transition.dart';
import '../common_widgets/routing_error_page.dart';

/// app route configuration
final GoRouter appRouter = GoRouter(
  initialLocation: '/',
  routes: <RouteBase>[
    // GoRoute(
    //   path: '/',
    //   name: '/',
    //   builder: (context, state) => const SplashScreen(),
    //   routes: [
    //     GoRoute(
    //       path: 'login',
    //       name: 'login',
    //         pageBuilder: (context, state) => pageBuilderWithTransition(
    //             context: context,
    //             state: state,
    //             duration: pageTransitionValue,
    //             transitionType: PageTransitionType.rightToLeft,
    //             child: const LogInScreen()),
    //       routes: [
    //         GoRoute(
    //           path: 'forgot_password',
    //           name: 'forgot_password',
    //           pageBuilder: (context, state) => pageBuilderWithTransition(
    //               context: context,
    //               state: state,
    //               duration: pageTransitionValue,
    //               transitionType: PageTransitionType.rightToLeft,
    //               child: const ForgotPasswordScreen()),
    //           routes: [
    //             GoRoute(
    //               path: 'verify_otp',
    //               name: 'verify_otp',
    //                 pageBuilder: (context, state) => pageBuilderWithTransition(
    //                     context: context,
    //                     state: state,
    //                     duration: pageTransitionValue,
    //                     transitionType: PageTransitionType.rightToLeft,
    //                     child: const VerifyOtpScreen(phoneNumber: "0716229563",)),
    //               routes: [
    //                 GoRoute(
    //                   path: 'new_password',
    //                   name: 'new_password',
    //                   pageBuilder: (context, state) => pageBuilderWithTransition(
    //                       context: context,
    //                       state: state,
    //                       duration: pageTransitionValue,
    //                       transitionType: PageTransitionType.rightToLeft,
    //                       child: const NewPasswordScreen()),
    //                 ),
    //               ]
    //             ),
    //           ],
    //         ),
    //       ]
    //     ),
    //
    //   ]
    // ),
    // GoRoute(
    //   path: '/home',
    //   name: 'home',
    //   pageBuilder: (context, state) => pageBuilderWithTransition(
    //       context: context,
    //       state: state,
    //       duration: 2000,
    //       transitionType: PageTransitionType.bottomToTop,
    //       child: const HomeScreen()),
    //   routes: [
    //     GoRoute(
    //       path: 'change_pin',
    //       name: 'change_pin',
    //       pageBuilder: (context, state) => pageBuilderWithTransition(
    //           context: context,
    //           state: state,
    //           duration: pageTransitionValue,
    //           transitionType: PageTransitionType.rightToLeft,
    //           child: const ChangePinScreen()),
    //     ),
    //     GoRoute(
    //       path: 'chat',
    //       name: 'chat',
    //       pageBuilder: (context, state) => pageBuilderWithTransition(
    //           context: context,
    //           state: state,
    //           duration: pageTransitionValue,
    //           transitionType: PageTransitionType.rightToLeft,
    //           child: const CrispChatScreen()),
    //     ),
    //     GoRoute(
    //       path: 'create_lead_step_one',
    //       name: 'create_lead_step_one',
    //       pageBuilder: (context, state) => pageBuilderWithTransition(
    //           context: context,
    //           state: state,
    //           duration: pageTransitionValue,
    //           transitionType: PageTransitionType.rightToLeft,
    //           child: const CreatingLeadStepOneScreen()),
    //       routes: [
    //         GoRoute(
    //           path: 'create_lead_step_two',
    //           name: 'create_lead_step_two',
    //           pageBuilder: (context, state) => pageBuilderWithTransition(
    //               context: context,
    //               state: state,
    //               duration: pageTransitionValue,
    //               transitionType: PageTransitionType.rightToLeft,
    //               child: const CreatingLeadStepTwoScreen()),
    //           routes: [
    //             GoRoute(
    //               path: 'create_lead_step_three',
    //               name: 'create_lead_step_three',
    //               pageBuilder: (context, state) => pageBuilderWithTransition(
    //                   context: context,
    //                   state: state,
    //                   duration: pageTransitionValue,
    //                   transitionType: PageTransitionType.rightToLeft,
    //                   child: const CreatingLeadStepThreeScreen()),
    //             ),
    //           ]
    //         ),
    //       ]
    //     ),
    //   ]
    // ),
  ],
  errorBuilder: (context, state) => const RoutingErrorPage(),
);

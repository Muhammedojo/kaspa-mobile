import 'package:go_router/go_router.dart';
import '../../features/cooperative/presentation/controller/cooperative_details.dart';
import '../../features/cooperative/presentation/controller/register_cooperative.dart';
import '../../features/farmers/presentation/controller/register_farmer.dart';
import '../../features/cooperative/presentation/controller/cooperative.dart';
import '../../features/auth/presentation/controller/privacy_policy.dart';
import '../../features/auth/presentation/controller/terms.dart';
import '../../features/auth/presentation/controller/change_password.dart';
import '../../features/auth/presentation/controller/auth_option.dart';
import '../../features/auth/presentation/controller/login.dart';
import '../../features/auth/presentation/controller/reset_code.dart';
import '../../features/auth/presentation/controller/reset_password.dart';
import '../../features/auth/presentation/controller/splash.dart';
import '../../features/farmers/presentation/controller/farmer.dart';
import '../../features/home/presentation/controller/home.dart';
import '../../features/home/presentation/controller/homepage.dart';
import '../../features/insights/presentation/controller/insight.dart';
import '../data/model/cooperative.dart';
import '../utils/global_variables.dart';
import 'route_constant.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    navigatorKey: GlobalVariables.rootNavigatorKey,
    initialLocation: "/",
    routes: [
      GoRoute(
        path: '/',
        name: RouteConstant.splash,
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: '/${RouteConstant.authOption}',
        name: RouteConstant.authOption,
        builder: (context, state) => const AuthOptionScreen(),
      ),
      GoRoute(
        path: '/${RouteConstant.resetPassword}',
        name: RouteConstant.resetPassword,
        builder: (context, state) => const ResetPasswordScreen(),
      ),
      GoRoute(
        path: '/${RouteConstant.resetCode}',
        name: RouteConstant.resetCode,
        builder:
            (context, state) => const ResetCodeScreen(email: '', token: ''),
      ),
      GoRoute(
        path: '/${RouteConstant.changePassword}',
        name: RouteConstant.changePassword,
        builder: (context, state) => const ChangePasswordScreen(),
      ),
      GoRoute(
        path: '/${RouteConstant.terms}',
        name: RouteConstant.terms,
        builder: (context, state) => const TermsScreen(),
      ),
      GoRoute(
        path: '/${RouteConstant.privacyPolicy}',
        name: RouteConstant.privacyPolicy,
        builder: (context, state) => const PrivacyPolicyScreen(),
      ),
      GoRoute(
        path: '/${RouteConstant.login}',
        name: RouteConstant.login,
        builder: (context, state) => const LoginScreen(),
      ),
      StatefulShellRoute.indexedStack(
        builder:
            (context, state, navigationShell) =>
                HomeScreen(navigationShell: navigationShell),
        branches: [
          StatefulShellBranch(
            navigatorKey: GlobalVariables.shellNavigatorHomeKey,
            routes: [
              GoRoute(
                path: '/${RouteConstant.homePage}',
                name: RouteConstant.homePage,
                pageBuilder:
                    (context, state) =>
                        const NoTransitionPage(child: HomePageScreen()),
                routes: [],
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: GlobalVariables.shellNavigatorFarmerKey,
            routes: [
              GoRoute(
                path: '/${RouteConstant.farmer}',
                name: RouteConstant.farmer,
                pageBuilder:
                    (context, state) =>
                        const NoTransitionPage(child: FarmerScreen()),
                routes: [],
              ),
              GoRoute(
                path: '/${RouteConstant.registerFarmer}',
                name: RouteConstant.registerFarmer,
                pageBuilder:
                    (context, state) =>
                        const NoTransitionPage(child: RegisterFarmerScreen()),
                routes: [],
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: GlobalVariables.shellNavigatorCooperativeKey,
            routes: [
              GoRoute(
                path: '/${RouteConstant.cooperative}',
                name: RouteConstant.cooperative,
                pageBuilder:
                    (context, state) =>
                        const NoTransitionPage(child: CooperativeScreen()),
                routes: [
                  GoRoute(
                    path: '/${RouteConstant.registerCooperative}',
                    name: RouteConstant.registerCooperative,
                    pageBuilder:
                        (context, state) => NoTransitionPage(
                          child: RegisterCooperativeScreen(
                          
                          ),
                        ),
                  ),
                  GoRoute(
                    path: '/${RouteConstant.cooperativeDetails}',
                    name: RouteConstant.cooperativeDetails,
                    pageBuilder:
                        (context, state) => NoTransitionPage(
                          child: CooperativeDetailsScreen(
                            cooperative: Cooperative(),
                           
                          ),
                        ),
                  ),
                ],
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: GlobalVariables.shellNavigatorInsightKey,
            routes: [
              GoRoute(
                path: '/${RouteConstant.insight}',
                name: RouteConstant.insight,
                pageBuilder:
                    (context, state) =>
                        const NoTransitionPage(child: InsightScreen()),
                routes: [],
              ),
            ],
          ),
        ],
      ),
    ],
  );
}

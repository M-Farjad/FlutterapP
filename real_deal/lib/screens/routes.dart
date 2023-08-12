import 'package:get/get.dart';
import 'package:real_deal/controllers/login_controller.dart';

import '../controllers/profile_controller.dart';
import '../controllers/register_controller.dart';
import '../values/values.dart';
import 'cart/cart_screen.dart';
import 'category/category_screen.dart';
import 'login auth/forget_password_screen.dart';
import 'home/home_screen.dart';
import 'login auth/login_screen.dart';
import 'main/main_screen.dart';
import 'onboarding/onboading_screen.dart';
import 'profile_screen.dart';
import 'login auth/complete_registration/location_screen.dart';
import 'login auth/register_screen.dart';
import 'login auth/complete_registration/registration_screen.dart';
import 'login auth/complete_registration/verification_screen.dart';
import 'splash_screen.dart';
import 'onboarding/welcome_screen.dart';

class Routes {
  Routes._();
  static List<GetPage<dynamic>>? routeList = [
    GetPage(name: NamedRoutes.splash, page: () => const SplashScreen()),
    GetPage(name: NamedRoutes.onboard, page: () => const OnboardingScreen()),
    GetPage(name: NamedRoutes.welcome, page: () => const WelcomeScreen()),
    GetPage(
      name: NamedRoutes.login,
      page: () => LoginScreen(),
      binding: BindingsBuilder(() {
        Get.lazyPut(() => LoginController());
      }),
    ),
    GetPage(
      name: NamedRoutes.register,
      page: () => RegisterScreen(),
      binding: BindingsBuilder(() {
        Get.lazyPut(() => RegisterController());
      }),
    ),
    GetPage(name: NamedRoutes.verification, page: () => VerificationScreen()),
    GetPage(name: NamedRoutes.registration, page: () => RegistrationScreen()),
    GetPage(name: NamedRoutes.location, page: () => LocationScreen()),
    GetPage(name: NamedRoutes.forgetPassword, page: () => ForgetPassScreen()),
    GetPage(
      name: NamedRoutes.profile,
      page: () => ProfileScreen(),
      binding: BindingsBuilder(() {
        Get.lazyPut(() => ProfileController());
      }),
    ),
    GetPage(
      name: NamedRoutes.home,
      page: () => HomeScreen(),
      binding: BindingsBuilder(() {
        Get.lazyPut(() => LoginController());
      }),
    ),
    GetPage(
      name: NamedRoutes.main,
      page: () => const MainScreen(),
      binding: BindingsBuilder(() {
        Get.lazyPut(() => ProfileController());
        Get.lazyPut(() => LoginController());
      }),
    ),
    GetPage(name: NamedRoutes.category, page: () => CategoryScreen()),
    GetPage(name: NamedRoutes.cart, page: () => const CartScreen()),
  ];
}

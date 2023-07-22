import 'package:get/get.dart';

import '../values/values.dart';
import 'cart/cart_screen.dart';
import 'category/category_screen.dart';
import 'forget_password/forget_password_screen.dart';
import 'home/home_screen.dart';
import 'login/login_screen.dart';
import 'main/main_screen.dart';
import 'onboarding/onboading_screen.dart';
import 'profile_screen.dart';
import 'register/location/location_screen.dart';
import 'register/register_screen.dart';
import 'register/registration/registration_screen.dart';
import 'register/verification/verification_screen.dart';
import 'splash_screen.dart';
import 'welcome/welcome_screen.dart';

class Routes {
  Routes._();
  static List<GetPage<dynamic>>? routeList = [
    GetPage(name: NamedRoutes.splash, page: () => const SplashScreen()),
    GetPage(name: NamedRoutes.onboard, page: () => const OnboardingScreen()),
    GetPage(name: NamedRoutes.welcome, page: () => const WelcomeScreen()),
    GetPage(name: NamedRoutes.login, page: () => LoginScreen()),
    GetPage(name: NamedRoutes.register, page: () => RegisterScreen()),
    GetPage(name: NamedRoutes.verification, page: () => VerificationScreen()),
    GetPage(name: NamedRoutes.registration, page: () => RegistrationScreen()),
    GetPage(name: NamedRoutes.location, page: () => LocationScreen()),
    GetPage(name: NamedRoutes.forgetPassword, page: () => ForgetPassScreen()),
    GetPage(name: NamedRoutes.profile, page: () => const ProfileScreen()),
    GetPage(name: NamedRoutes.home, page: () => HomeScreen()),
    GetPage(name: NamedRoutes.main, page: () => MainScreen()),
    GetPage(name: NamedRoutes.category, page: () => CategoryScreen()),
    GetPage(name: NamedRoutes.cart, page: () => const CartScreen()),
  ];
}

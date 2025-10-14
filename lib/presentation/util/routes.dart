import 'package:flutter/material.dart';
import 'package:sheba_ai/presentation/screen/auth/sign_in_screen.dart';
import 'package:sheba_ai/presentation/screen/auth/sign_up_screen.dart';
import 'package:sheba_ai/presentation/screen/cart/cart_screen.dart';
import 'package:sheba_ai/presentation/screen/chat/chat_screen.dart';
import 'package:sheba_ai/presentation/screen/checkout/checkout_screen.dart';
import 'package:sheba_ai/presentation/screen/intro/intro_screen.dart';
import 'package:sheba_ai/presentation/screen/main/main_screen.dart';
import 'package:sheba_ai/presentation/screen/my_orders/my_orders_screen.dart';
import 'package:sheba_ai/presentation/screen/order_success/order_success_screen.dart';
import 'package:sheba_ai/presentation/screen/prescription/prescription_screen.dart';
import 'package:sheba_ai/presentation/screen/profile/profile_screen.dart';
import 'package:sheba_ai/presentation/screen/reminder/reminder_screen.dart';
import 'package:sheba_ai/presentation/screen/splash/splash_screen.dart';
import 'package:sheba_ai/presentation/screen/store/medicine_details_screen.dart';
import 'package:sheba_ai/presentation/screen/store/store_screen.dart';

class Routes {
  static const String signIn = 'signIn';
  static const String signUp = 'signUp';

  static const String splash = 'splash';
  static const String main = 'main';
  static const String intro = 'intro';

  static const String prescription = 'prescription';
  static const String store = 'store';
  static const String medicineDetails = 'medicineDetails';
  static const String chat = 'chat';
  static const String reminder = 'reminder';
  static const String profile = 'profile';
  static const String cart = 'cart';
  static const String checkout = 'checkout';
  static const String myOrders = 'myOrders';
  static const String orderSuccess = 'orderSuccess';

  static PageRoute generateRoutes(RouteSettings settings) {
    return PageRouteBuilder(
      settings: settings,
      pageBuilder: (context, animation, secondaryAnimation) {
        switch (settings.name) {
          case intro:
            return IntroScreen();
          case splash:
            return const SplashScreen();
          case signIn:
            return const SignInScreen();
          case signUp:
            return const SignUpScreen();
          case main:
            return const MainScreen();
          case prescription:
            return const PrescriptionScreen();
          case store:
            return const StoreScreen();
          case medicineDetails:
            return MedicineDetailsScreen();
          case chat:
            return const ChatScreen();
          case reminder:
            return const ReminderScreen();
          case profile:
            return const ProfileScreen();
          case cart:
            return const CartScreen();
          case checkout:
            return const CheckoutScreen();
          case myOrders:
            return const MyOrdersScreen();
            case orderSuccess:
            return const OrderSuccessScreen();
          default:
            return const MainScreen();
        }
      },
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(1.0, 0.0);
        const end = Offset.zero;
        const curve = Curves.easeInOut;

        var tween = Tween(
          begin: begin,
          end: end,
        ).chain(CurveTween(curve: curve));
        var offsetAnimation = animation.drive(tween);

        return SlideTransition(position: offsetAnimation, child: child);
      },
      transitionDuration: const Duration(milliseconds: 300),
    );
  }
}

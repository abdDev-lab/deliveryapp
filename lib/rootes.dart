import 'package:deliveryapp/core/constant/appRoutes.dart';
import 'package:deliveryapp/core/middleware/appmiddleware.dart';
import 'package:deliveryapp/view/screen/auth/loginpage.dart';
import 'package:deliveryapp/view/screen/deliveryOrder.dart';
import 'package:deliveryapp/view/screen/homescreen.dart';
import 'package:get/get.dart';

List<GetPage<dynamic>>? routes = [
  GetPage(
    name: "/",
    page: () => const LoginPage(),
    middlewares: [AppMiddleware()],
  ),
  GetPage(
    name: AppRoutes.home,
    page: () => const HomeScreen(),
    transition: Transition.noTransition,
  ),
  GetPage(
    name: AppRoutes.deliveryorder,
    page: () => const DeliveryOrder(),
    transition: Transition.downToUp,
  ),
];

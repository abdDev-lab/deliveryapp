import 'package:deliveryapp/controller/auth/loginController.dart';
import 'package:deliveryapp/core/class/handlingdata.dart';
import 'package:deliveryapp/core/constant/appRoutes.dart';
import 'package:deliveryapp/core/constant/appasset.dart';
import 'package:deliveryapp/core/functions/alert_exit_app.dart';
import 'package:deliveryapp/core/functions/validinput.dart';
import 'package:deliveryapp/view/widget/authPageWidget/costumbuttonAuth.dart';
import 'package:deliveryapp/view/widget/authPageWidget/costumtextfield.dart';
import 'package:deliveryapp/view/widget/authPageWidget/costumtitle.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uicons/uicons.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(LoginControllerImp());
    return Scaffold(
        backgroundColor: Colors.white,
        body: WillPopScope(
          onWillPop: alertExitApp,
          child: SafeArea(
              child: GetBuilder<LoginControllerImp>(
                  builder: (controller) => HandlingDataRequestforPage(
                      pageroute: AppRoutes.login,
                      statusRequest: controller.statusRequest,
                      widget: ListView(
                        physics: const NeverScrollableScrollPhysics(),
                        padding: const EdgeInsets.only(bottom: 10),
                        children: [
                          Form(
                            key: controller.formstate,
                            child: Column(
                              children: [
                                Container(
                                  height: 255,
                                  margin: const EdgeInsets.only(bottom: 10),
                                  width: double.infinity,
                                  child: Image.asset(AppAsset.deliveryorder),
                                ),
                                CostumTitleAuth(
                                  title: "loginTitle".tr,
                                  body: "loginbody".tr,
                                ),
                                Container(
                                  height: 20,
                                ),
                                CostumeTextField(
                                  isNumber: false,
                                  validator: (val) {
                                    return valideInput(val!, 10, 50, "email");
                                  },
                                  hinttext: "email".tr,
                                  iconData: UIcons.regularStraight.user,
                                  controller: controller.email,
                                ),
                                Container(
                                  height: 5,
                                ),
                                GetBuilder<LoginControllerImp>(
                                  builder: (controller) => CostumeTextField(
                                    obscureText: controller.isvisible,
                                    isNumber: false,
                                    onIcon: () {
                                      controller.isVisible();
                                    },
                                    validator: (val) {
                                      return valideInput(
                                          val!, 8, 20, "password");
                                    },
                                    hinttext: "password".tr,
                                    iconData: controller.lockicon,
                                    controller: controller.password,
                                  ),
                                ),
                                Container(
                                  margin: const EdgeInsets.only(bottom: 10),
                                  alignment: Alignment.centerRight,
                                  width: 340,
                                  height: 40,
                                  child: TextButton(
                                      onPressed: () {
                                        Get.offNamed(AppRoutes.forgetpassword);
                                      },
                                      child: Text(
                                        "forgotpassword".tr,
                                        style: const TextStyle(
                                            letterSpacing: 0.2,
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black),
                                        textAlign: TextAlign.end,
                                      )),
                                ),
                                CostumButtonAuth(
                                  buttonTitle: "login1".tr,
                                  onPressed: () {
                                    controller.login();
                                  },
                                ),
                              ],
                            ),
                          )
                        ],
                      )))),
        ));
  }
}

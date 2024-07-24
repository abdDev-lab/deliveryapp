import 'package:deliveryapp/controller/settingsPageController.dart';
import 'package:deliveryapp/core/constant/appRoutes.dart';
import 'package:deliveryapp/core/localization/localChange.dart';
import 'package:deliveryapp/view/widget/settingsPageWidget/costum_accountCard.dart';
import 'package:deliveryapp/view/widget/settingsPageWidget/costum_listTile.dart';
import 'package:deliveryapp/view/widget/settingsPageWidget/costum_listTileToggle.dart';
import 'package:deliveryapp/view/widget/settingsPageWidget/costum_logout.dart';
import 'package:deliveryapp/view/widget/costum_titlePage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uicons/uicons.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SettingsControllerImp());
    LocalChange localChangecontroller = Get.find();
    return Scaffold(
        body: GetBuilder<SettingsControllerImp>(
      builder: (controller) => SafeArea(
          child: ListView(
        padding: const EdgeInsets.only(left: 16, right: 16),
        children: [
          CostumTitlePage(title: "settingstitle".tr),
          CostumAccountCard(
              username: controller.myServices.sharedPreferences
                  .getString("username")!,
              email:
                  controller.myServices.sharedPreferences.getString("email")!,
              image: "defaultuserimage.png"),
          Container(
            margin: const EdgeInsets.only(top: 32),
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.circular(12),
              boxShadow: Get.isDarkMode
                  ? null
                  : [
                      BoxShadow(
                          blurRadius: 8,
                          color: const Color.fromARGB(255, 217, 217, 217)
                              .withOpacity(0.5),
                          offset: const Offset(0, 0))
                    ],
            ),
            child: Column(
              children: [
                CostumListTileToggle(
                  title: "darkmode".tr,
                  icon: UIcons.regularStraight.moon,
                  onToggle: (val) {
                    controller.changeDarkMode(val);
                  },
                  value: controller.darkmode,
                ),
                CostumListTileToggle(
                    value: controller.notification,
                    title: "pushnotifications".tr,
                    icon: controller.notification
                        ? UIcons.regularRounded.bell_ring
                        : UIcons.regularRounded.bell,
                    onToggle: (val) {
                      controller.changeNotification(val);
                    }),
                CostumListTile(
                    title: "language".tr,
                    icon: UIcons.regularRounded.globe,
                    onPress: () {
                      Get.defaultDialog(
                          radius: 10,
                          contentPadding: const EdgeInsets.all(16),
                          title: "chooselang".tr,
                          titleStyle: const TextStyle(fontSize: 20),
                          content: Column(
                            children: [
                              InkWell(
                                onTap: () {
                                  localChangecontroller.changeLang("ar");
                                  controller.changelanguage("ar");
                                  Get.offAllNamed(AppRoutes.home);
                                },
                                child: ListTile(
                                    title: const Text(
                                      "العربية",
                                      style: TextStyle(fontFamily: "Cairo"),
                                    ),
                                    trailing: Visibility(
                                      visible: controller.arabic,
                                      child: Icon(UIcons.regularRounded.check),
                                    )),
                              ),
                              InkWell(
                                onTap: () {
                                  localChangecontroller.changeLang("en");
                                  controller.changelanguage("en");
                                  Get.offAllNamed(AppRoutes.home);
                                },
                                child: ListTile(
                                  title: const Text(
                                    "English",
                                    style: TextStyle(fontFamily: "Poppins"),
                                  ),
                                  trailing: Visibility(
                                    visible: controller.english,
                                    child: Icon(UIcons.regularRounded.check),
                                  ),
                                ),
                              )
                            ],
                          ));
                    }),
                ...List.generate(
                    controller.data.length,
                    (index) => CostumListTile(
                        title: controller.data[index]["title"],
                        icon: controller.data[index]["icon"],
                        onPress: controller.data[index]["onpress"])),
              ],
            ),
          ),
          const CostummLogOutButton(),
        ],
      )),
    ));
  }
}

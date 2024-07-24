import 'package:deliveryapp/core/class/statusrequest.dart';

import 'package:deliveryapp/core/constant/appColor.dart';
import 'package:deliveryapp/core/constant/appasset.dart';
import 'package:deliveryapp/view/widget/homeWidgets/costum_shimmerview.dart';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class HandlingData extends StatelessWidget {
  final StatusRequest statusRequest;
  final Widget widget;
  final String pageroute;
  const HandlingData(
      {super.key,
      required this.statusRequest,
      required this.widget,
      required this.pageroute});

  @override
  Widget build(BuildContext context) {
    return statusRequest == StatusRequest.loading
        ? SizedBox(
            height: 580,
            child: Center(child: Lottie.asset(AppAsset.loading, width: 200)))
        : statusRequest == StatusRequest.offlinefailure
            ? SizedBox(
                height: 500,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Lottie.asset(AppAsset.offline),
                      MaterialButton(
                        onPressed: () {
                          //retry ;
                          Get.offAllNamed(pageroute);
                        },
                        child: Text(
                          "Retry",
                          style: TextStyle(color: AppColor.mainColor),
                        ),
                      )
                    ],
                  ),
                ),
              )
            : statusRequest == StatusRequest.serverfailure
                ? SizedBox(
                    height: 600,
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("Offline"),
                          MaterialButton(
                            onPressed: () {
                              //retry ;
                              Get.offAllNamed(pageroute);
                            },
                            child: Text(
                              "Retry",
                              style: TextStyle(color: AppColor.mainColor),
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                : statusRequest == StatusRequest.failure
                    ? SizedBox(
                        height: 580,
                        child: Center(
                            child: Lottie.asset(AppAsset.noData, width: 200)))
                    : widget;
  }
}

class HandlingDataRequest extends StatelessWidget {
  final StatusRequest statusRequest;
  final Widget widget;
  final String pageroute;
  const HandlingDataRequest({
    super.key,
    required this.statusRequest,
    required this.widget,
    required this.pageroute,
  });

  @override
  Widget build(BuildContext context) {
    return statusRequest == StatusRequest.loading
        ? SizedBox(
            height: 580,
            child: Center(child: Lottie.asset(AppAsset.loading, width: 200)))
        : statusRequest == StatusRequest.offlinefailure
            ? SizedBox(
                height: 500,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Lottie.asset(AppAsset.offline, width: 200),
                      MaterialButton(
                        onPressed: () {
                          //retry ;
                          Get.offAllNamed(pageroute);
                        },
                        child: Text(
                          "Retry",
                          style: TextStyle(color: AppColor.mainColor),
                        ),
                      )
                    ],
                  ),
                ),
              )
            : statusRequest == StatusRequest.serverfailure
                ? SizedBox(
                    height: 500,
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("OfflineServer"),
                          MaterialButton(
                            onPressed: () {
                              //retry ;
                              Get.offAllNamed(pageroute);
                            },
                            child: Text(
                              "Retry",
                              style: TextStyle(color: AppColor.mainColor),
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                : widget;
  }
}

class HandlingDataRequestforPage extends StatelessWidget {
  final StatusRequest statusRequest;
  final Widget widget;
  final String pageroute;
  const HandlingDataRequestforPage({
    super.key,
    required this.statusRequest,
    required this.widget,
    required this.pageroute,
  });

  @override
  Widget build(BuildContext context) {
    return statusRequest == StatusRequest.loading
        ? Center(child: Lottie.asset(AppAsset.loading, width: 200))
        : statusRequest == StatusRequest.offlinefailure
            ? Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Lottie.asset(AppAsset.offline, width: 200),
                    MaterialButton(
                      onPressed: () {
                        //retry ;
                        Get.offAllNamed(pageroute);
                      },
                      child: Text(
                        "Retry",
                        style: TextStyle(color: AppColor.mainColor),
                      ),
                    )
                  ],
                ),
              )
            : statusRequest == StatusRequest.serverfailure
                ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("OfflineServer"),
                        MaterialButton(
                          onPressed: () {
                            //retry ;
                            Get.offAllNamed(pageroute);
                          },
                          child: Text(
                            "Retry",
                            style: TextStyle(color: AppColor.mainColor),
                          ),
                        )
                      ],
                    ),
                  )
                : widget;
  }
}

class HandlingDataForWidget extends StatelessWidget {
  final StatusRequest statusRequest;
  final Widget widget;

  const HandlingDataForWidget({
    super.key,
    required this.statusRequest,
    required this.widget,
  });

  @override
  Widget build(BuildContext context) {
    return statusRequest == StatusRequest.loading
        ? Center(child: Lottie.asset(AppAsset.loading, width: 200))
        : statusRequest == StatusRequest.failure
            ? Center(child: Lottie.asset(AppAsset.noData, width: 200))
            : widget;
  }
}

class HandlingDataShimmerView extends StatelessWidget {
  final StatusRequest statusRequest;
  final Widget widget;
  const HandlingDataShimmerView({
    super.key,
    required this.statusRequest,
    required this.widget,
  });

  @override
  Widget build(BuildContext context) {
    return statusRequest == StatusRequest.loading
        ? const CostumShimmerView()
        : statusRequest == StatusRequest.failure
            ? Center(child: Lottie.asset(AppAsset.noData, width: 200))
            : widget;
  }
}

// ignore_for_file: file_names

class AppLink {
  static const String server = "https://abdoudevpro.site/deliveryapp";

  static const String testlink = "$server/test.php";
  //Images
  static const String userimageslink = "$server/upload";

  //Auth
  static const String loginlink = "$server/auth/login.php";
  static const String signupverifylink = "$server/auth/verifycode.php";
  static const String resendCodelink = "$server/auth/resend.php";
 

  //Search
 

  //Orders
  static const String orderslink = "$server/orders/view.php";
  static const String homelink = "$server/orders/home.php";
  static const String approvelink = "$server/orders/approve.php";
  static const String donelink = "$server/orders/done.php";




  //static const String ordersdetailslink = "$server/orders/ordersdetails.php"

  //Notifications
  static const String notificationslink =
      "$server/notifications/viewnotifications.php";
  static const String notificationsreadlink =
      "$server/notifications/readnotifications.php";
}

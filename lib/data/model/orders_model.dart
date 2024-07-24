class OrdersModel {
  int? ordersId;
  int? ordersUserid;
  double? ordersLocLat;
  double? ordersLocLang;
  int? ordersDeliverytype;
  int? ordersDeliveryprice;
  double? ordersPrice;
  int? ordersPaymentmethod;
  int? ordersCoupon;
  String? ordersDatetime;
  int? ordersStatus;

  OrdersModel(
      {this.ordersId,
      this.ordersUserid,
      this.ordersLocLat,
      this.ordersLocLang,
      this.ordersDeliverytype,
      this.ordersDeliveryprice,
      this.ordersPrice,
      this.ordersPaymentmethod,
      this.ordersCoupon,
      this.ordersDatetime,
      this.ordersStatus});

  OrdersModel.fromJson(Map<String, dynamic> json) {
    ordersId = json['orders_id'];
    ordersUserid = json['orders_userid'];
    ordersLocLat = json['orders_loc_lat'];
    ordersLocLang = json['orders_loc_lang'];
    ordersDeliverytype = json['orders_deliverytype'];
    ordersDeliveryprice = json['orders_deliveryprice'];
    ordersPrice = json['orders_price'];
    ordersPaymentmethod = json['orders_paymentmethod'];
    ordersCoupon = json['orders_coupon'];
    ordersDatetime = json['orders_datetime'];
    ordersStatus = json['orders_status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['orders_id'] = this.ordersId;
    data['orders_userid'] = this.ordersUserid;
    data['orders_loc_lat'] = this.ordersLocLat;
    data['orders_loc_lang'] = this.ordersLocLang;
    data['orders_deliverytype'] = this.ordersDeliverytype;
    data['orders_deliveryprice'] = this.ordersDeliveryprice;
    data['orders_price'] = this.ordersPrice;
    data['orders_paymentmethod'] = this.ordersPaymentmethod;
    data['orders_coupon'] = this.ordersCoupon;
    data['orders_datetime'] = this.ordersDatetime;
    data['orders_status'] = this.ordersStatus;
    return data;
  }
}

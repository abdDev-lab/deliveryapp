class DeliveryStatistic {
  int? totalamount;
  int? ordersdelivered;
  int? ordersstatus4delivered;

  DeliveryStatistic(
      {this.totalamount, this.ordersdelivered, this.ordersstatus4delivered});

  DeliveryStatistic.fromJson(Map<String, dynamic> json) {
    totalamount = json['totalamount'];
    ordersdelivered = json['ordersdelivered'];
    ordersstatus4delivered = json['ordersstatus4delivered'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['totalamount'] = this.totalamount;
    data['ordersdelivered'] = this.ordersdelivered;
    data['ordersstatus4delivered'] = this.ordersstatus4delivered;
    return data;
  }
}
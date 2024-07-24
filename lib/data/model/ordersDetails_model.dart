class OrdersDetailsModel {
  int? cartId;
  int? cartUserid;
  int? cartProductid;
  int? cartProductcount;
  String? cartProductcolor;
  dynamic cartProductsizeorstorage;
  int? cartOrders;
  int? productId;
  String? productName;
  String? productNameAr;
  String? productDesc;
  String? productDescAr;
  double? productPrice;
  String? productImage;
  int? productCount;
  double? productRating;
  int? productActive;
  int? productDiscount;
  String? sex;
  String? productDate;
  int? productCat;
  int? subcatId;
  int? catId;
  double? productpricewithcount;
  double? productpricewithdiscount;
  int? ordersStatus;

  OrdersDetailsModel(
      {this.cartId,
      this.cartUserid,
      this.cartProductid,
      this.cartProductcount,
      this.cartProductcolor,
      this.cartProductsizeorstorage,
      this.cartOrders,
      this.productId,
      this.productName,
      this.productNameAr,
      this.productDesc,
      this.productDescAr,
      this.productPrice,
      this.productImage,
      this.productCount,
      this.productRating,
      this.productActive,
      this.productDiscount,
      this.sex,
      this.productDate,
      this.productCat,
      this.subcatId,
      this.catId,
      this.productpricewithcount,
      this.productpricewithdiscount,
      this.ordersStatus});

  OrdersDetailsModel.fromJson(Map<String, dynamic> json) {
    cartId = json['cart_id'];
    cartUserid = json['cart_userid'];
    cartProductid = json['cart_productid'];
    cartProductcount = json['cart_productcount'];
    cartProductcolor = json['cart_productcolor'];
    cartProductsizeorstorage = json['cart_productsizeorstorage'];
    cartOrders = json['cart_orders'];
    productId = json['product_id'];
    productName = json['product_name'];
    productNameAr = json['product_name_ar'];
    productDesc = json['product_desc'];
    productDescAr = json['product_desc_ar'];
    productPrice = json['product_price'];
    productImage = json['product_image'];
    productCount = json['product_count'];
    productRating = json['product_rating'];
    productActive = json['product_active'];
    productDiscount = json['product_discount'];
    sex = json['sex'];
    productDate = json['product_date'];
    productCat = json['product_cat'];
    subcatId = json['subcat_id'];
    catId = json['cat_id'];
    productpricewithcount = json['productpricewithcount'];
    productpricewithdiscount = json['productpricewithdiscount'];
    ordersStatus = json['orders_status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['cart_id'] = this.cartId;
    data['cart_userid'] = this.cartUserid;
    data['cart_productid'] = this.cartProductid;
    data['cart_productcount'] = this.cartProductcount;
    data['cart_productcolor'] = this.cartProductcolor;
    data['cart_productsizeorstorage'] = this.cartProductsizeorstorage;
    data['cart_orders'] = this.cartOrders;
    data['product_id'] = this.productId;
    data['product_name'] = this.productName;
    data['product_name_ar'] = this.productNameAr;
    data['product_desc'] = this.productDesc;
    data['product_desc_ar'] = this.productDescAr;
    data['product_price'] = this.productPrice;
    data['product_image'] = this.productImage;
    data['product_count'] = this.productCount;
    data['product_rating'] = this.productRating;
    data['product_active'] = this.productActive;
    data['product_discount'] = this.productDiscount;
    data['sex'] = this.sex;
    data['product_date'] = this.productDate;
    data['product_cat'] = this.productCat;
    data['subcat_id'] = this.subcatId;
    data['cat_id'] = this.catId;
    data['productpricewithcount'] = this.productpricewithcount;
    data['productpricewithdiscount'] = this.productpricewithdiscount;
    data['orders_status'] = this.ordersStatus;
    return data;
  }
}

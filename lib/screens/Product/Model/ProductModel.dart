class ProductModel {
  String? id,
      product_name,
      product_price,
      product_offer,
      product_category,
      product_image,
      product_desc,
      product_rate;

  ProductModel({
    this.id,
    this.product_name,
    this.product_price,
    this.product_offer,
    this.product_category,
    this.product_image,
    this.product_desc,
    this.product_rate,
  });

  ProductModel ProductFromJson(Map m1) {
    id = m1['id'];
    product_name = m1['product_name'];
    product_price = m1['product_price'];
    product_offer = m1['product_offer'];
    product_category = m1['product_category'];
    product_image = m1['product_image'];
    product_desc = m1['product_desc'];
    product_rate = m1['product_rate'];

    ProductModel p1 = ProductModel(
      id: id,
      product_category: product_category,
      product_desc: product_desc,
      product_image: product_image,
      product_name: product_name,
      product_offer: product_offer,
      product_price: product_price,
      product_rate: product_rate,
    );

    return p1;
  }
}

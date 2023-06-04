import 'dart:convert';

List<ProductModel> productListFromJson(String jsonString) {
  final List<dynamic> jsonData = json.decode(jsonString) as List<dynamic>;
  return jsonData
      .map((json) => ProductModel.fromJson(json as Map<String, dynamic>))
      .toList();
}

class ProductModel {
  final int? id;
  final String? brand;
  final String? name;
  final String? price;
  final String? priceSign;
  final String? currency;
  final String? imageLink;
  final String? productLink;
  final String? websiteLink;
  final String? description;
  final dynamic rating;
  final String? category;
  final String? productType;
  final List<String>? tagList;
  final String? createdAt;
  final String? updatedAt;
  final String? productApiUrl;
  final String? apiFeaturedImage;
  final List<ProductColors>? productColors;

  ProductModel({
    this.id,
    this.brand,
    this.name,
    this.price,
    this.priceSign,
    this.currency,
    this.imageLink,
    this.productLink,
    this.websiteLink,
    this.description,
    this.rating,
    this.category,
    this.productType,
    this.tagList,
    this.createdAt,
    this.updatedAt,
    this.productApiUrl,
    this.apiFeaturedImage,
    this.productColors,
  });

  ProductModel.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int?,
        brand = json['brand'] as String?,
        name = json['name'] as String?,
        price = json['price'] as String?,
        priceSign = json['price_sign'] as String?,
        currency = json['currency'] as String?,
        imageLink = json['image_link'] as String?,
        productLink = json['product_link'] as String?,
        websiteLink = json['website_link'] as String?,
        description = json['description'] as String?,
        rating = json['rating'],
        category = json['category'] as String?,
        productType = json['product_type'] as String?,
        tagList = (json['tag_list'] as List?)
            ?.map((dynamic e) => e as String)
            .toList(),
        createdAt = json['created_at'] as String?,
        updatedAt = json['updated_at'] as String?,
        productApiUrl = json['product_api_url'] as String?,
        apiFeaturedImage = json['api_featured_image'] as String?,
        productColors = (json['product_colors'] as List?)
            ?.map((dynamic e) =>
                ProductColors.fromJson(e as Map<String, dynamic>))
            .toList();

  Map<String, dynamic> toJson() => {
        'id': id,
        'brand': brand,
        'name': name,
        'price': price,
        'price_sign': priceSign,
        'currency': currency,
        'image_link': imageLink,
        'product_link': productLink,
        'website_link': websiteLink,
        'description': description,
        'rating': rating,
        'category': category,
        'product_type': productType,
        'tag_list': tagList,
        'created_at': createdAt,
        'updated_at': updatedAt,
        'product_api_url': productApiUrl,
        'api_featured_image': apiFeaturedImage,
        'product_colors': productColors?.map((e) => e.toJson()).toList()
      };
}

class ProductColors {
  final String? hexValue;
  final String? colourName;

  ProductColors({
    this.hexValue,
    this.colourName,
  });

  ProductColors.fromJson(Map<String, dynamic> json)
      : hexValue = json['hex_value'] as String?,
        colourName = json['colour_name'] as String?;

  Map<String, dynamic> toJson() =>
      {'hex_value': hexValue, 'colour_name': colourName};
}

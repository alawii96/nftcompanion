class OpenSeaSingleAsset {
  int? id;
  int? numSales;
  Null? backgroundColor;
  String? imageUrl;
  String? imagePreviewUrl;
  String? imageThumbnailUrl;
  String? imageOriginalUrl;
  Null? animationUrl;
  Null? animationOriginalUrl;
  String? name;
  Null? description;
  String? externalLink;
  String? permalink;
  Null? decimals;
  String? tokenMetadata;
  bool? isNsfw;

  Null? sellOrders;

  Null? lastSale;
  Null? topBid;
  Null? listingDate;
  bool? isPresale;
  Null? transferFeePaymentToken;
  Null? transferFee;
  List<Null>? relatedAssets;
  Null? orders;
  List<Null>? auctions;
  bool? supportsWyvern;
  Null? ownership;
  Null? highestBuyerCommitment;
  String? tokenId;

  OpenSeaSingleAsset(
      {this.id,
      this.numSales,
      this.backgroundColor,
      this.imageUrl,
      this.imagePreviewUrl,
      this.imageThumbnailUrl,
      this.imageOriginalUrl,
      this.animationUrl,
      this.animationOriginalUrl,
      this.name,
      this.description,
      this.externalLink,
      this.permalink,
      this.decimals,
      this.tokenMetadata,
      this.isNsfw,
      this.sellOrders,
      this.lastSale,
      this.topBid,
      this.listingDate,
      this.isPresale,
      this.transferFeePaymentToken,
      this.transferFee,
      this.relatedAssets,
      this.orders,
      this.auctions,
      this.supportsWyvern,
      this.ownership,
      this.highestBuyerCommitment,
      this.tokenId});

  OpenSeaSingleAsset.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    numSales = json['num_sales'];
    backgroundColor = json['background_color'];
    imageUrl = json['image_url'];
    imagePreviewUrl = json['image_preview_url'];
    imageThumbnailUrl = json['image_thumbnail_url'];
    imageOriginalUrl = json['image_original_url'];
  }
}

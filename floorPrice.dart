class FloorPrice {
  String? transactionHash;
  String? transactionIndex;
  List<String>? tokenIds;
  String? sellerAddress;
  String? buyerAddress;
  String? tokenAddress;
  String? marketplaceAddress;
  String? price;
  String? blockTimestamp;
  String? blockNumber;
  String? blockHash;

  FloorPrice(
      {this.transactionHash,
      this.transactionIndex,
      this.tokenIds,
      this.sellerAddress,
      this.buyerAddress,
      this.tokenAddress,
      this.marketplaceAddress,
      this.price,
      this.blockTimestamp,
      this.blockNumber,
      this.blockHash});

  FloorPrice.fromJson(Map<String, dynamic> json) {
    transactionHash = json['transaction_hash'];
    transactionIndex = json['transaction_index'];
    tokenIds = json['token_ids'].cast<String>();
    sellerAddress = json['seller_address'];
    buyerAddress = json['buyer_address'];
    tokenAddress = json['token_address'];
    marketplaceAddress = json['marketplace_address'];
    price = json['price'];
    blockTimestamp = json['block_timestamp'];
    blockNumber = json['block_number'];
    blockHash = json['block_hash'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['transaction_hash'] = this.transactionHash;
    data['transaction_index'] = this.transactionIndex;
    data['token_ids'] = this.tokenIds;
    data['seller_address'] = this.sellerAddress;
    data['buyer_address'] = this.buyerAddress;
    data['token_address'] = this.tokenAddress;
    data['marketplace_address'] = this.marketplaceAddress;
    data['price'] = this.price;
    data['block_timestamp'] = this.blockTimestamp;
    data['block_number'] = this.blockNumber;
    data['block_hash'] = this.blockHash;
    return data;
  }
}

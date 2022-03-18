class LastTrades {
  int? total;
  int? page;
  int? pageSize;
  List<Result>? result;

  LastTrades({this.total, this.page, this.pageSize, this.result});

  LastTrades.fromJson(Map<String, dynamic> json) {
    total = json['total'];
    page = json['page'];
    pageSize = json['page_size'];
    if (json['result'] != null) {
      result = <Result>[];
      json['result'].forEach((v) {
        result!.add(new Result.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['total'] = this.total;
    data['page'] = this.page;
    data['page_size'] = this.pageSize;
    if (this.result != null) {
      data['result'] = this.result!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Result {
  String? transactionHash;
  String? transactionIndex;
  List<String>? tokenIds;
  String? sellerAddress;
  String? buyerAddress;
  String? tokenAddress;
  String? marketplaceAddress;
  String? price;
  String? priceTokenAddress;
  DateTime? blockTimestamp;
  String? blockNumber;
  String? blockHash;

  Result(
      {this.transactionHash,
      this.transactionIndex,
      this.tokenIds,
      this.sellerAddress,
      this.buyerAddress,
      this.tokenAddress,
      this.marketplaceAddress,
      this.price,
      this.priceTokenAddress,
      this.blockTimestamp,
      this.blockNumber,
      this.blockHash});

  Result.fromJson(Map<String, dynamic> json) {
    int year = int.parse(json['block_timestamp'].substring(0, 4));
    int month = int.parse(json['block_timestamp'].substring(5, 7));

    int day = int.parse(json['block_timestamp'].substring(8, 10));
    int hour = int.parse(json['block_timestamp'].substring(11, 13));
    int minute = int.parse(json['block_timestamp'].substring(14, 16));
    transactionHash = json['transaction_hash'];
    transactionIndex = json['transaction_index'];
    tokenIds = json['token_ids'].cast<String>();
    sellerAddress = json['seller_address'];
    buyerAddress = json['buyer_address'];
    tokenAddress = json['token_address'];
    marketplaceAddress = json['marketplace_address'];
    price = json['price'];
    priceTokenAddress = json['price_token_address'].toString();
    blockTimestamp = DateTime(year, month, day, hour, minute);
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
    data['price_token_address'] = this.priceTokenAddress;
    data['block_timestamp'] = this.blockTimestamp;
    data['block_number'] = this.blockNumber;
    data['block_hash'] = this.blockHash;
    return data;
  }
}

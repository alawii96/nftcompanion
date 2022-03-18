class NFTMetaData {
  String? tokenAddress;
  String? name;
  String? symbol;
  String? contractType;
  String? syncedAt;

  NFTMetaData(
      {this.tokenAddress,
      this.name,
      this.symbol,
      this.contractType,
      this.syncedAt});

  NFTMetaData.fromJson(Map<String, dynamic> json) {
    tokenAddress = json['token_address'];
    name = json['name'];
    symbol = json['symbol'];
    contractType = json['contract_type'];
    syncedAt = json['synced_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['token_address'] = this.tokenAddress;
    data['name'] = this.name;
    data['symbol'] = this.symbol;
    data['contract_type'] = this.contractType;
    data['synced_at'] = this.syncedAt;
    return data;
  }
}

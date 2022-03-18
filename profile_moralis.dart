class ProfileMoralis {
  int? total;
  int? page;
  int? pageSize;
  String? cursor;
  List<Result>? result;
  String? status;

  ProfileMoralis.empty() {
    ProfileMoralis(total: 0, status: "", result: [], page: 0, cursor: "");
  }

  ProfileMoralis(
      {this.total,
      this.page,
      this.pageSize,
      this.cursor,
      this.result,
      this.status});

  ProfileMoralis.fromJson(Map<String, dynamic> json) {
    total = json['total'];
    page = json['page'];
    pageSize = json['page_size'];
    cursor = json['cursor'];
    if (json['result'] != null) {
      result = <Result>[];
      json['result'].forEach((v) {
        result!.add(new Result.fromJson(v));
      });
    }
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['total'] = this.total;
    data['page'] = this.page;
    data['page_size'] = this.pageSize;
    data['cursor'] = this.cursor;
    if (this.result != null) {
      data['result'] = this.result!.map((v) => v.toJson()).toList();
    }
    data['status'] = this.status;
    return data;
  }
}

class Result {
  String? tokenAddress;
  String? tokenId;
  String? blockNumberMinted;
  String? ownerOf;
  String? blockNumber;
  String? amount;
  String? contractType;
  String? name;
  String? symbol;
  String? tokenUri;
  String? metadata;
  String? syncedAt;
  int? isValid;
  int? syncing;
  int? frozen;

  Result(
      {this.tokenAddress,
      this.tokenId,
      this.blockNumberMinted,
      this.ownerOf,
      this.blockNumber,
      this.amount,
      this.contractType,
      this.name,
      this.symbol,
      this.tokenUri,
      this.metadata,
      this.syncedAt,
      this.isValid,
      this.syncing,
      this.frozen});

  Result.fromJson(Map<String, dynamic> json) {
    tokenAddress = json['token_address'];
    tokenId = json['token_id'];
    blockNumberMinted = json['block_number_minted'];
    ownerOf = json['owner_of'];
    blockNumber = json['block_number'];
    amount = json['amount'];
    contractType = json['contract_type'];
    name = json['name'];
    symbol = json['symbol'];
    tokenUri = json['token_uri'];
    metadata = json['metadata'];
    syncedAt = json['synced_at'];
    isValid = json['is_valid'];
    syncing = json['syncing'];
    frozen = json['frozen'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['token_address'] = this.tokenAddress;
    data['token_id'] = this.tokenId;
    data['block_number_minted'] = this.blockNumberMinted;
    data['owner_of'] = this.ownerOf;
    data['block_number'] = this.blockNumber;
    data['amount'] = this.amount;
    data['contract_type'] = this.contractType;
    data['name'] = this.name;
    data['symbol'] = this.symbol;
    data['token_uri'] = this.tokenUri;
    data['metadata'] = this.metadata;
    data['synced_at'] = this.syncedAt;
    data['is_valid'] = this.isValid;
    data['syncing'] = this.syncing;
    data['frozen'] = this.frozen;
    return data;
  }
}

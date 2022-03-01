class CheckCounterPrintModel {
  bool success;
  dynamic error;
  String message;
  CheckCounterPrintModelData data;

  CheckCounterPrintModel({
    this.success,
    this.error,
    this.message,
    this.data,
  });

  CheckCounterPrintModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    error = json['error'];
    message = json['message'];
    data = json['data'] != null
        ? new CheckCounterPrintModelData.fromJson(json['data'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['error'] = this.error;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    return data;
  }
}

class CheckCounterPrintModelData {
  var transaksiId;
  String tipeUser;
  int counter;
  String updatedAt;
  String createdAt;
  int id;

  CheckCounterPrintModelData({
    this.transaksiId,
    this.tipeUser,
    this.counter,
    this.updatedAt,
    this.createdAt,
    this.id,
  });

  CheckCounterPrintModelData.fromJson(Map<String, dynamic> json) {
    transaksiId = json["transaksi_id"];
    tipeUser = json["tipe_user"];
    counter = json["counter"];
    updatedAt = json["updated_at"];
    createdAt = json["created_at"];
    id = json["id"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['transaksi_id'] = this.transaksiId;
    data['tipe_user'] = this.tipeUser;
    data['counter'] = this.counter;
    data['updated_at'] = this.updatedAt;
    data['created_at'] = this.createdAt;
    data['id'] = this.id;
    return data;
  }
}
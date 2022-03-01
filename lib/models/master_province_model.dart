class MasterProvinceModel {
  bool success;
  dynamic error;
  String message;
  List<dynamic> data;

  MasterProvinceModel({
    this.success,
    this.error,
    this.message,
    this.data,
  });

  MasterProvinceModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    error = json['error'];
    message = json['message'];
    data = json['data'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['error'] = this.error;
    data['message'] = this.message;
    data['data'] = this.data;
    return data;
  }
}
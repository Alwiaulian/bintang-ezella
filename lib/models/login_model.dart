class LoginModel {
  bool success;
  dynamic error;
  String message;
  Data data;

  LoginModel({
    this.success,
    this.error,
    this.message,
    this.data,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        success: json["success"],
        error: json["error"],
        message: json["message"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "error": error,
        "message": message,
        "data": data.toJson(),
      };
}

class Data {
  String namaLengkap;
  String email;
  String namaJabatan;
  String noHp;
  String apiToken;

  Data({
    this.namaLengkap,
    this.email,
    this.namaJabatan,
    this.noHp,
    this.apiToken,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        namaLengkap: json["nama_lengkap"],
        email: json["email"],
        namaJabatan: json["nama_jabatan"],
        noHp: json["no_hp"],
        apiToken: json["api_token"],
      );

  Map<String, dynamic> toJson() => {
        "nama_lengkap": namaLengkap,
        "email": email,
        "nama_jabatan": namaJabatan,
        "no_hp": noHp,
        "api_token": apiToken,
      };
}

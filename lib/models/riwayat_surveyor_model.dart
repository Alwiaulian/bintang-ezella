class RiwayatSurveyorModel {
  bool success;
  dynamic error;
  String message;
  RiwayatSurveyorModelData data;

  RiwayatSurveyorModel({
    this.success,
    this.error,
    this.message,
    this.data,
  });

  RiwayatSurveyorModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    error = json['error'];
    message = json['message'];
    data = json['data'] != null
        ? new RiwayatSurveyorModelData.fromJson(json['data'])
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

class RiwayatSurveyorModelData {
  String totalTunai;
  String totalCicilan;
  String totalBatal;
  List<RiwayatSurveyorModelDetailData> data;

  var length;

  RiwayatSurveyorModelData({
    this.totalTunai,
    this.totalCicilan,
    this.totalBatal,
    this.data,
  });

  RiwayatSurveyorModelData.fromJson(Map<String, dynamic> json) {
    totalTunai = json["total_amount_tunai"];
    totalCicilan = json["total_amount_cicilan"];
    totalBatal = json["total_amount_batal"];
    if (json['data'] != null) {
      data = new List<RiwayatSurveyorModelDetailData>();
      json['data'].forEach((v) {
        data.add(new RiwayatSurveyorModelDetailData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['total_amount_tunai'] = this.totalTunai;
    data['total_amount_cicilan'] = this.totalCicilan;
    data['total_amount_batal'] = this.totalBatal;
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class RiwayatSurveyorModelDetailData {
  int id;
  String tanggalSurvey;

  String tanggalSurveyRaw;
  String statusPembelian;
  String namaCustomer;
  String namaProduk;
  String harga;
  String noFaktur;
  String tanggalJatuhTempo;

  RiwayatSurveyorModelDetailData({
    this.id,
    this.tanggalSurvey,
    this.tanggalSurveyRaw,
    this.statusPembelian,
    this.namaCustomer,
    this.namaProduk,
    this.harga,
    this.noFaktur,
    this.tanggalJatuhTempo,
  });

  RiwayatSurveyorModelDetailData.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    tanggalSurvey = json["tanggal_survey"];

    tanggalSurveyRaw = json["tanggal_survey_raw"];
    statusPembelian = json["status_pembelian"];
    namaCustomer = json["nama_customer"];
    namaProduk = json["nama_produk"];
    harga = json["harga"];
    noFaktur = json["no_faktur"];
    tanggalJatuhTempo = json["tanggal_jatuh_tempo"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['tanggal_survey'] = tanggalSurvey;
    data['tanggal_survey_raw'] = tanggalSurveyRaw;
    data['status_pembelian'] = statusPembelian;
    data['nama_customer'] = namaCustomer;
    data['nama_produk'] = namaProduk;
    data['harga'] = harga;
    data['no_faktur'] = noFaktur;
    data['tanggal_jatuh_tempo'] = tanggalJatuhTempo;
    return data;
  }
}

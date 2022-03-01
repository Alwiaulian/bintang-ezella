class JadwalSurveyorModel {
  bool success;
  dynamic error;
  String message;
  JadwalSurveyorModelData data;

  JadwalSurveyorModel({
    this.success,
    this.error,
    this.message,
    this.data,
  });

  JadwalSurveyorModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    error = json['error'];
    message = json['message'];
    data = json['data'] != null
        ? new JadwalSurveyorModelData.fromJson(json['data'])
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

class JadwalSurveyorModelData {
  int id;
  String tanggalSurvey;
  String tanggalSurveyRaw;
  String tanggalJatuhTempo;
  String namaCustomer;
  String provinsi;
  String kota;
  String kelurahan;
  String namaProduk;
  String statusPembelian;
  String dp;
  // List<JadwalSurveyorModelDetailData> data;

  JadwalSurveyorModelData({
    this.id,
    this.tanggalSurvey,
    this.tanggalSurveyRaw,
    this.tanggalJatuhTempo,
    this.namaCustomer,
    this.provinsi,
    this.kota,
    this.kelurahan,
    this.namaProduk,
    this.statusPembelian,
    this.dp,
    // this.data,
  });

  JadwalSurveyorModelData.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    tanggalSurvey = json["tanggal_survey"];
    tanggalSurveyRaw = json["tanggal_survey_raw"];
    tanggalJatuhTempo = json["tanggal_jatuh_tempo"];
    namaCustomer = json["nama_customer"];
    provinsi = json["provinsi"];
    kota = json["kota"];
    kelurahan = json["kelurahan"];
    namaProduk = json["nama_produk"];
    statusPembelian = json["status_pembelian"];
    dp = json["dp"];
    // if (json['data'] != null) {
    //   data = new List<JadwalSurveyorModelDetailData>();
    //   json['data'].forEach((v) {
    //     data.add(new JadwalSurveyorModelDetailData.fromJson(v));
    //   });
    // }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['tanggal_survey'] = this.tanggalSurvey;
    data['tanggal_survey_raw'] = this.tanggalSurveyRaw;
    data['tanggal_jatuh_tempo'] = this.tanggalJatuhTempo;
    data['nama_customer'] = this.namaCustomer;
    data['provinsi'] = this.provinsi;
    data['kota'] = this.kota;
    data['kelurahan'] = this.kelurahan;
    data['nama_produk'] = this.namaProduk;
    data['status_pembelian'] = this.statusPembelian;
    data['dp'] = this.dp;

    // if (this.data != null) {
    //   data['data'] = this.data.map((v) => v.toJson()).toList();
    // }
    return data;
  }
}

// class JadwalSurveyorModelDetailData {
//   String tanggalSurvey;
//   String statusPembelian;
//   String namaCustomer;
//   String namaProduk;
//   String harga;
//   String noFaktur;
//   String tanggalJatuhTempo;

//   JadwalSurveyorModelDetailData({
//     this.tanggalSurvey,
//     this.statusPembelian,
//     this.namaCustomer,
//     this.namaProduk,
//     this.harga,
//     this.noFaktur,
//     this.tanggalJatuhTempo,
//   });

//   JadwalSurveyorModelDetailData.fromJson(Map<String, dynamic> json) {
//     tanggalSurvey = json["tanggal_survey"];
//     statusPembelian = json["status_pembelian"];
//     namaCustomer = json["nama_customer"];
//     namaProduk = json["nama_produk"];
//     harga = json["harga"];
//     noFaktur = json["no_faktur"];
//     tanggalJatuhTempo = json["tanggal_jatuh_tempo"];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['tanggal_survey'] = tanggalSurvey;
//     data['status_pembelian'] = statusPembelian;
//     data['nama_customer'] = namaCustomer;
//     data['nama_produk'] = namaProduk;
//     data['harga'] = harga;
//     data['no_faktur'] = noFaktur;
//     data['tanggal_jatuh_tempo'] = tanggalJatuhTempo;
//     return data;
//   }
// }

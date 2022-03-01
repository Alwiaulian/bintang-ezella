class RiwayatPenagihanModel {
  bool success;
  dynamic error;
  String message;
  RiwayatPenagihanModelData data;

  RiwayatPenagihanModel({
    this.success,
    this.error,
    this.message,
    this.data,
  });

  RiwayatPenagihanModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    error = json['error'];
    message = json['message'];
    data = json['data'] != null
        ? new RiwayatPenagihanModelData.fromJson(json['data'])
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

class RiwayatPenagihanModelData {
  String totalBayar;
  String totalBelumBayar;
  List<RiwayatPenagihanModelDetailData> data;

  RiwayatPenagihanModelData({
    this.totalBayar,
    this.totalBelumBayar,
    this.data,
  });

  RiwayatPenagihanModelData.fromJson(Map<String, dynamic> json) {
    totalBayar = json["total_bayar"];
    totalBelumBayar = json["total_belum_bayar"];
    if (json['data'] != null) {
      data = new List<RiwayatPenagihanModelDetailData>();
      json['data'].forEach((v) {
        data.add(new RiwayatPenagihanModelDetailData.fromJson(v));
      });
    }
  }

  get length => null;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['total_bayar'] = this.totalBayar;
    data['total_belum_bayar'] = this.totalBelumBayar;
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class RiwayatPenagihanModelDetailData {
  int id;
  String tanggalPenagihan;
  String statusBayar;
  String jumlahBayar;
  String harusBayar;
  String noFaktur;
  String namaCustomer;
  String namaProduk;
  String namaKolektor;
  String namaRegional;
  int cicilanKe;
  String tanggalJatuhTempo;

  RiwayatPenagihanModelDetailData({
    this.id,
    this.tanggalPenagihan,
    this.statusBayar,
    this.jumlahBayar,
    this.harusBayar,
    this.noFaktur,
    this.namaCustomer,
    this.namaProduk,
    this.namaKolektor,
    this.namaRegional,
    this.cicilanKe,
    this.tanggalJatuhTempo,
  });

  RiwayatPenagihanModelDetailData.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    tanggalPenagihan = json["tanggal_penagihan"];
    statusBayar = json["status_bayar"];
    jumlahBayar = json["jumlah_bayar"];
    harusBayar = json["harus_bayar"];
    noFaktur = json["no_faktur"];
    namaCustomer = json["nama_customer"];
    namaProduk = json["nama_produk"];
    namaKolektor = json["nama_kolektor"];
    namaRegional = json["nama_regional"];
    cicilanKe = json["cicilan_ke"];
    tanggalJatuhTempo = json["tanggal_jatuh_tempo"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['tanggal_penagihan'] = tanggalPenagihan;
    data['status_bayar'] = statusBayar;
    data['jumlah_bayar'] = jumlahBayar;
    data['harus_bayar'] = harusBayar;
    data['no_faktur'] = noFaktur;
    data['nama_customer'] = namaCustomer;
    data['nama_produk'] = namaProduk;
    data['nama_kolektor'] = namaKolektor;
    data['nama_regional'] = namaRegional;
    data['cicilan_ke'] = cicilanKe;
    data['tanggal_jatuh_tempo'] = tanggalJatuhTempo;
    return data;
  }
}

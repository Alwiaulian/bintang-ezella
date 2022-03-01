class JadwalPenagihanModel {
  bool success;
  dynamic error;
  String message;
  JadwalPenagihanModelData data;

  JadwalPenagihanModel({
    this.success,
    this.error,
    this.message,
    this.data,
  });

  JadwalPenagihanModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    error = json['error'];
    message = json['message'];
    data = json['data'] != null
        ? new JadwalPenagihanModelData.fromJson(json['data'])
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

class JadwalPenagihanModelData {
  String tanggalPenagihan;
  List<JadwalPenagihanModelDetailData> jadwal;

  JadwalPenagihanModelData({
    this.tanggalPenagihan,
    this.jadwal,
  });

  JadwalPenagihanModelData.fromJson(Map<String, dynamic> json) {
    tanggalPenagihan = json["tanggal_penagihan"];
    if (json['jadwal'] != null) {
      jadwal = new List<JadwalPenagihanModelDetailData>();
      json['jadwal'].forEach((v) {
        jadwal.add(new JadwalPenagihanModelDetailData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['tanggal_penagihan'] = this.tanggalPenagihan;
    if (this.jadwal != null) {
      data['jadwal'] = this.jadwal.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class JadwalPenagihanModelDetailData {
  int id;
  String tanggalPenagihan;
  String tanggalPenagihanRaw;
  String namaCustomer;
  String namaKolektor;
  String namaRegional;
  int cicilanKe;
  String harusBayar;
  String tanggalJatuhTempo;
  int jumlahSales;

  JadwalPenagihanModelDetailData(
    this.id,
    this.tanggalPenagihanRaw,
    this.namaCustomer,
    this.namaKolektor,
    this.namaRegional,
    this.cicilanKe,
    this.harusBayar,
    this.tanggalJatuhTempo,
  );

  JadwalPenagihanModelDetailData.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    tanggalPenagihan = json["tanggal_penagihan"];
    tanggalPenagihanRaw = json["tanggal_penagihan_raw"];
    namaCustomer = json["nama_customer"];
    namaKolektor = json["nama_kolektor"];
    namaRegional = json["nama_regional"];
    cicilanKe = json["cicilan_ke"];
    harusBayar = json["harus_bayar"];
    tanggalJatuhTempo = json["tanggal_jatuh_tempo"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['tanggal_penagihan'] = tanggalPenagihan;
    data['tanggal_penagihan_raw'] = tanggalPenagihanRaw;
    data['nama_customer'] = namaCustomer;
    data['nama_kolektor'] = namaKolektor;
    data['nama_regional'] = namaRegional;
    data['cicilan_ke'] = cicilanKe;
    data['harus_bayar'] = harusBayar;
    data['tanggal_jatuh_tempo'] = tanggalJatuhTempo;
    return data;
  }
}

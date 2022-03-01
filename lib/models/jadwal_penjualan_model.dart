class JadwalPenjualanModel {
  bool success;
  dynamic error;
  String message;
  JadwalPenjualanModelData data;

  JadwalPenjualanModel({
    this.success,
    this.error,
    this.message,
    this.data,
  });

  JadwalPenjualanModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    error = json['error'];
    message = json['message'];
    data = json['data'] != null
        ? new JadwalPenjualanModelData.fromJson(json['data'])
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

class JadwalPenjualanModelData {
  String tanggal;
  List<JadwalPenjualanModelDetailData> jadwal;

  JadwalPenjualanModelData({
    this.tanggal,
    this.jadwal,
  });

  JadwalPenjualanModelData.fromJson(Map<String, dynamic> json) {
    tanggal = json["tanggal"];
    if (json['jadwal'] != null) {
      jadwal = new List<JadwalPenjualanModelDetailData>();
      json['jadwal'].forEach((v) {
        jadwal.add(new JadwalPenjualanModelDetailData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['tanggal'] = this.tanggal;
    if (this.jadwal != null) {
      data['jadwal'] = this.jadwal.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class JadwalPenjualanModelDetailData {
  int id;
  String tanggalRaw;
  String waktuMulai;
  String waktuSelesai;
  String keterangan;
  String namaSupervisor;
  String namaKota;
  String namaDaerah;
  int jumlahSales;

  JadwalPenjualanModelDetailData({
    this.id,
    this.tanggalRaw,
    this.waktuMulai,
    this.waktuSelesai,
    this.keterangan,
    this.namaSupervisor,
    this.namaKota,
    this.namaDaerah,
    int jumlahSales,
  });

  JadwalPenjualanModelDetailData.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    tanggalRaw = json["tanggalRaw"];
    waktuMulai = json["waktu_mulai_kerja"];
    waktuSelesai = json["waktu_selesai_kerja"];
    keterangan = json["keterangan"];
    namaSupervisor = json["nama_supervisor"];
    namaKota = json["nama_kota"];
    namaDaerah = json["nama_daerah"];
    jumlahSales = json["jumlah_sales"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['tanggalRaw'] = tanggalRaw;
    data['waktu_mulai_kerja'] = waktuMulai;
    data['waktu_selesai_kerja'] = waktuSelesai;
    data['keterangan'] = keterangan;
    data['nama_supervisor'] = namaSupervisor;
    data['nama_kota'] = namaKota;
    data['nama_daerah'] = namaDaerah;
    data['jumlah_sales'] = jumlahSales;
    return data;
  }
}

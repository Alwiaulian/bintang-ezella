import 'package:flutter/src/material/dropdown.dart';

class RincianPenagihanModel {
  bool success;
  dynamic error;
  String message;
  RincianPenagihanModelData data;

  RincianPenagihanModel({
    this.success,
    this.error,
    this.message,
    this.data,
  });
  RincianPenagihanModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    error = json['error'];
    message = json['message'];
    data = json['data'] != null
        ? new RincianPenagihanModelData.fromJson(json['data'])
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

class RincianPenagihanModelData {
  RincianPenagihanModelCustomerData customer;
  RincianPenagihanModelProdukData produk;
  RincianPenagihanModelPenagihanData penagihan;
  List<dynamic> pembayaran;
  List<dynamic> aktivitas;

  RincianPenagihanModelData(
      {this.customer,
      this.produk,
      this.penagihan,
      this.pembayaran,
      this.aktivitas});
  RincianPenagihanModelData.fromJson(Map<String, dynamic> json) {
    customer = json['data_customer'] != null
        ? new RincianPenagihanModelCustomerData.fromJson(json['data_customer'])
        : null;
    produk = json['data_produk'] != null
        ? new RincianPenagihanModelProdukData.fromJson(json['data_produk'])
        : null;
    penagihan = json['info_penagihan'] != null
        ? new RincianPenagihanModelPenagihanData.fromJson(
            json['info_penagihan'])
        : null;
    pembayaran = json['status_pembayaran'];
    aktivitas = json['keterangan_aktivitas'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.customer != null) {
      data['data_customer'] = this.customer.toJson();
    }
    if (this.produk != null) {
      data['data_produk'] = this.produk.toJson();
    }
    if (this.penagihan != null) {
      data['info_penagihan'] = this.penagihan.toJson();
    }
    data['status_pembayaran'] = pembayaran;
    data['keterangan_aktivitas'] = aktivitas;

    return data;
  }
}

class RincianPenagihanModelCustomerData {
  String namaLengkap;
  String alamatLengkap;
  String noHp;
  String alamatEmail;
  String jatuhTempo;

  RincianPenagihanModelCustomerData(
      {this.namaLengkap,
      this.alamatLengkap,
      this.noHp,
      this.alamatEmail,
      this.jatuhTempo});

  RincianPenagihanModelCustomerData.fromJson(Map<String, dynamic> json) {
    namaLengkap = json["nama_lengkap"];
    alamatLengkap = json["alamat_lengkap"];
    noHp = json["no_hp"];
    alamatEmail = json["alamat_email"];

    jatuhTempo = json["jatuh_tempo"];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['nama_lengkap'] = namaLengkap;
    data['alamat_lengkap'] = alamatLengkap;
    data['no_hp'] = noHp;
    data['alamat_email'] = alamatEmail;
    data['jatuh_tempo'] = jatuhTempo;

    return data;
  }
}

class RincianPenagihanModelProdukData {
  String namaProduk;
  String gambarProduk;
  String hargaProduk;

  RincianPenagihanModelProdukData({
    this.namaProduk,
    this.gambarProduk,
    this.hargaProduk,
  });

  RincianPenagihanModelProdukData.fromJson(Map<String, dynamic> json) {
    namaProduk = json["nama_produk"];
    gambarProduk = json["gambar_produk"];
    hargaProduk = json["harga_produk"];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['nama_produk'] = namaProduk;
    data['gambar_produk'] = gambarProduk;
    data['harga_produk'] = hargaProduk;
    return data;
  }
}

class RincianPenagihanModelPenagihanData {
  String noFaktur;
  String uangMuka;
  String jumlahCicilan;
  String sisaCicilan;
  String cicilanPerBulan;
  String lamaCicilan;
  int cicilanKe;
  int harusBayar;

  RincianPenagihanModelPenagihanData({
    this.noFaktur,
    this.uangMuka,
    this.jumlahCicilan,
    this.sisaCicilan,
    this.cicilanPerBulan,
    this.lamaCicilan,
    this.cicilanKe,
    this.harusBayar,
  });

  RincianPenagihanModelPenagihanData.fromJson(Map<String, dynamic> json) {
    noFaktur = json["no_faktur"];
    uangMuka = json["uang_muka"];
    jumlahCicilan = json["jumlah_cicilan"];
    sisaCicilan = json["sisa_cicilan"];
    cicilanPerBulan = json["cicilan_per_bulan"];
    lamaCicilan = json["lama_cicilan"];
    cicilanKe = json["cicilan_ke"];
    harusBayar = json["harus_bayar"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["no_faktur"] = noFaktur;
    data["uang_muka"] = uangMuka;
    data["jumlah_cicilan"] = jumlahCicilan;
    data["sisa_cicilan"] = sisaCicilan;
    data["cicilan_per_bulan"] = cicilanPerBulan;
    data["lama_cicilan"] = lamaCicilan;
    data["cicilan_ke"] = cicilanKe;
    data["harus_bayar"] = harusBayar;
    return data;
  }
}

class RincianPenagihanModelPembayaranData {
  RincianPenagihanModelPembayaranData();

  RincianPenagihanModelPembayaranData.fromJson(List<dynamic> json);

  List<dynamic> toJson() {
    final List<dynamic> data = new List<dynamic>();
    return data;
  }
}

class RincianPenagihanModelAktivitasData {
  RincianPenagihanModelAktivitasData();

  RincianPenagihanModelAktivitasData.fromJson(List<dynamic> json);

  List<dynamic> toJson() {
    final List<dynamic> data = new List<dynamic>();
    return data;
  }
}

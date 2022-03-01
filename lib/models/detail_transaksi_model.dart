class DetailTransaksiModel {
  bool success;
  dynamic error;
  String message;
  DetailTransaksiModelData data;

  DetailTransaksiModel({
    this.success,
    this.error,
    this.message,
    this.data,
  });

  DetailTransaksiModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    error = json['error'];
    message = json['message'];
    data = json['data'] != null
        ? new DetailTransaksiModelData.fromJson(json['data'])
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

class DetailTransaksiModelData {
  DetailTransaksiModelPesananData pesanan;
  DetailTransaksiModelPelangganData pelanggan;
  DetailTransaksiModelDataTransaksiData dataTransaksi;
  DetailTransaksiModelPembayaranData pembayaran;

  DetailTransaksiModelData({
    this.pesanan,
    this.pelanggan,
    this.dataTransaksi,
    this.pembayaran,
  });

  DetailTransaksiModelData.fromJson(Map<String, dynamic> json) {
    pesanan = json['pesanan'] != null
        ? new DetailTransaksiModelPesananData.fromJson(json['pesanan'])
        : null;
    pelanggan = json['pelanggan'] != null
        ? new DetailTransaksiModelPelangganData.fromJson(json['pelanggan'])
        : null;
    dataTransaksi = json['data_transaksi'] != null
        ? new DetailTransaksiModelDataTransaksiData.fromJson(
            json['data_transaksi'])
        : null;
    pembayaran = json['pembayaran'] != null
        ? new DetailTransaksiModelPembayaranData.fromJson(json['pembayaran'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.pesanan != null) {
      data['pesanan'] = this.pesanan.toJson();
    }
    if (this.pelanggan != null) {
      data['pelanggan'] = this.pelanggan.toJson();
    }
    if (this.dataTransaksi != null) {
      data['data_transaksi'] = this.dataTransaksi.toJson();
    }
    if (this.pembayaran != null) {
      data['pembayaran'] = this.pembayaran.toJson();
    }
    return data;
  }
}

class DetailTransaksiModelPesananData {
  String namaProduk;
  int hargaProduk;
  String gambarProduk;

  DetailTransaksiModelPesananData({
    this.namaProduk,
    this.hargaProduk,
    this.gambarProduk,
  });

  DetailTransaksiModelPesananData.fromJson(Map<String, dynamic> json) {
    namaProduk = json["nama_produk"];
    hargaProduk = json["harga_produk"];
    gambarProduk = json["gambar_produk"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['nama_produk'] = namaProduk;
    data['harga_produk'] = hargaProduk;
    data['gambar_produk'] = gambarProduk;
    return data;
  }
}

class DetailTransaksiModelPelangganData {
  String namaLengkap;
  String noHp;
  String alamat;

  DetailTransaksiModelPelangganData({
    this.namaLengkap,
    this.noHp,
    this.alamat,
  });

  DetailTransaksiModelPelangganData.fromJson(Map<String, dynamic> json) {
    namaLengkap = json["nama_lengkap"];
    noHp = json["no_hp"];
    alamat = json["alamat"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['nama_lengkap'] = namaLengkap;
    data['no_hp'] = noHp;
    data['alamat'] = alamat;
    return data;
  }
}

class DetailTransaksiModelDataTransaksiData {
  String namaSales;
  String namaSupervisor;
  String namaDemoBroker;
  String createdAt;

  DetailTransaksiModelDataTransaksiData({
    this.namaSales,
    this.namaSupervisor,
    this.namaDemoBroker,
    this.createdAt,
  });

  DetailTransaksiModelDataTransaksiData.fromJson(Map<String, dynamic> json) {
    namaSales = json["nama_sales"];
    namaSupervisor = json["nama_supervisor"];
    namaDemoBroker = json["nama_demo_broker"];
    createdAt = json["created_at"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['nama_sales'] = namaSales;
    data['nama_supervisor'] = namaSupervisor;
    data['nama_demo_broker'] = namaDemoBroker;
    data['created_at'] = createdAt;
    return data;
  }
}

class DetailTransaksiModelPembayaranData {
  String noFaktur;
  String statusPenjualan;
  String tipeCicilan;
  String tanggalJatuhTempoPertama;
  var uangMuka;
  var totalAmountPenjualan;
  var cicilanPerBulan;
  String keterangan;

  DetailTransaksiModelPembayaranData({
    this.noFaktur,
    this.statusPenjualan,
    this.tipeCicilan,
    this.tanggalJatuhTempoPertama,
    this.uangMuka,
    this.totalAmountPenjualan,
    this.cicilanPerBulan,
    this.keterangan,
  });

  DetailTransaksiModelPembayaranData.fromJson(Map<String, dynamic> json) {
    noFaktur = json["no_faktur"];
    statusPenjualan = json["status_penjualan"];
    tipeCicilan = json["tipe_cicilan"];
    tanggalJatuhTempoPertama = json["tanggal_jatuh_tempo_pertama"];
    uangMuka = json["uang_muka"];
    totalAmountPenjualan = json["total_amount_penjualan"];
    cicilanPerBulan = json["cicilan_per_bulan"];
    keterangan = json["keterangan"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["no_faktur"] = noFaktur;
    data["status_penjualan"] = statusPenjualan;
    data["tipe_cicilan"] = tipeCicilan;
    data["tanggal_jatuh_tempo_pertama"] = tanggalJatuhTempoPertama;
    data["uang_muka"] = uangMuka;
    data["total_amount_penjualan"] = totalAmountPenjualan;
    data["cicilan_per_bulan"] = cicilanPerBulan;
    data["keterangan"] = keterangan;
    return data;
  }
}

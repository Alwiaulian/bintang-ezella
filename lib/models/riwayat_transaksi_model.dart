class RiwayatTransaksiModel {
  bool success;
  dynamic error;
  String message;
  RiwayatTransaksiModelData data;

  RiwayatTransaksiModel({
    this.success,
    this.error,
    this.message,
    this.data,
  });

  RiwayatTransaksiModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    error = json['error'];
    message = json['message'];
    data = json['data'] != null
        ? new RiwayatTransaksiModelData.fromJson(json['data'])
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

class RiwayatTransaksiModelData {
  String tanggal_pembelian;
  String total_penjualan;
  List<RiwayatTransaksiModelDetailData> data_transaksi;

  RiwayatTransaksiModelData({
    this.tanggal_pembelian,
    this.total_penjualan,
    this.data_transaksi,
  });

  RiwayatTransaksiModelData.fromJson(Map<String, dynamic> json) {
    tanggal_pembelian = json["tanggal_pembelian"];
    total_penjualan = json["total_penjualan"];
    if (json['data_transaksi'] != null) {
      data_transaksi = new List<RiwayatTransaksiModelDetailData>();
      json['data_transaksi'].forEach((v) {
        data_transaksi.add(new RiwayatTransaksiModelDetailData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['tanggal_pembelian'] = this.tanggal_pembelian;
    data['total_penjualan'] = this.total_penjualan;
    if (this.data_transaksi != null) {
      data['data_transaksi'] =
          this.data_transaksi.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class RiwayatTransaksiModelDetailData {
  int id;
  String noFaktur;
  String tanggalPembelian;
  String namaSales;
  String namaRegional;
  String statusPenjualan;
  String namaCustomer;
  String namaProduk;
  String totalPenjualan;

  RiwayatTransaksiModelDetailData({
    this.id,
    this.noFaktur,
    this.tanggalPembelian,
    this.namaSales,
    this.namaRegional,
    this.statusPenjualan,
    this.namaCustomer,
    this.namaProduk,
    this.totalPenjualan,
  });

  RiwayatTransaksiModelDetailData.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    noFaktur = json["no_faktur"];
    tanggalPembelian = json["tanggal_pembelian"];
    namaSales = json["nama_sales"];
    namaRegional = json["nama_regional"];
    statusPenjualan = json["status_penjualan"];
    namaCustomer = json["nama_customer"];
    namaProduk = json["nama_produk"];
    totalPenjualan = json["total_penjualan"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['no_faktur'] = noFaktur;
    data['tanggal_pembelian'] = tanggalPembelian;
    data['nama_sales'] = namaSales;
    data['nama_regional'] = namaRegional;
    data['status_penjualan'] = statusPenjualan;
    data['nama_customer'] = namaCustomer;
    data['nama_produk'] = namaProduk;
    data['total_penjualan'] = totalPenjualan;
    return data;
  }
}

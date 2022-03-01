class RiwayatPenagihanDetailModel {
  bool success;
  dynamic error;
  String message;
  RiwayatPenagihanDetailModelData data;

  RiwayatPenagihanDetailModel({
    this.success,
    this.error,
    this.message,
    this.data,
  });
  RiwayatPenagihanDetailModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    error = json['error'];
    message = json['message'];
    data = json['data'] != null
        ? new RiwayatPenagihanDetailModelData.fromJson(json['data'])
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

class RiwayatPenagihanDetailModelData {
  RiwayatPenagihanModelCustomerData customer;
  RiwayatPenagihanModelProdukData produk;
  RiwayatPenagihanModelPenagihanData penagihan;
  List<dynamic> pembayaran;
  List<dynamic> aktivitas;

  RiwayatPenagihanDetailModelData(
      {this.customer,
      this.produk,
      this.penagihan,
      this.pembayaran,
      this.aktivitas});

  RiwayatPenagihanDetailModelData.fromJson(Map<String, dynamic> json) {
    customer = json['data_customer'] != null
        ? new RiwayatPenagihanModelCustomerData.fromJson(json['data_customer'])
        : null;
    produk = json['data_produk'] != null
        ? new RiwayatPenagihanModelProdukData.fromJson(json['data_produk'])
        : null;
    penagihan = json['info_penagihan'] != null
        ? new RiwayatPenagihanModelPenagihanData.fromJson(
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

class RiwayatPenagihanModelCustomerData {
  String namaLengkap;
  String alamatLengkap;
  String noHp;
  String alamatEmail;
  String jatuhTempo;

  RiwayatPenagihanModelCustomerData(
      {this.namaLengkap,
      this.alamatLengkap,
      this.noHp,
      this.alamatEmail,
      this.jatuhTempo});

  RiwayatPenagihanModelCustomerData.fromJson(Map<String, dynamic> json) {
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

class RiwayatPenagihanModelProdukData {
  String namaProduk;
  String gambarProduk;
  String hargaProduk;

  RiwayatPenagihanModelProdukData({
    this.namaProduk,
    this.gambarProduk,
    this.hargaProduk,
  });

  RiwayatPenagihanModelProdukData.fromJson(Map<String, dynamic> json) {
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

class RiwayatPenagihanModelPenagihanData {
  String noFaktur;
  String uangMuka;
  String jumlahCicilan;
  String sisaCicilan;
  String cicilanPerBulan;
  String lamaCicilan;
  int cicilanKe;
  int harusBayar;
  int jumlahBayar;
  String status_pembayaran;
  String aktivitas_kolektor;
  String keterangan;
  String nama_sales;
  String nama_supervisor;
  String nama_demo_broker;
  String nama_surveyor;
  String nama_kolektor;
  RiwayatPenagihanModelPenagihanData(
      {this.noFaktur,
      this.uangMuka,
      this.jumlahCicilan,
      this.sisaCicilan,
      this.cicilanPerBulan,
      this.lamaCicilan,
      this.cicilanKe,
      this.harusBayar,
      this.jumlahBayar,
      this.status_pembayaran,
      this.aktivitas_kolektor,
      this.keterangan,
      this.nama_sales,
      this.nama_supervisor,
      this.nama_demo_broker,
      this.nama_surveyor,
      this.nama_kolektor});

  RiwayatPenagihanModelPenagihanData.fromJson(Map<String, dynamic> json) {
    noFaktur = json["no_faktur"];
    uangMuka = json["uang_muka"];
    jumlahCicilan = json["jumlah_cicilan"];
    sisaCicilan = json["sisa_cicilan"];
    cicilanPerBulan = json["cicilan_per_bulan"];
    lamaCicilan = json["lama_cicilan"];
    cicilanKe = json["cicilan_ke"];
    harusBayar = json["harus_bayar"];
    jumlahBayar = json["jumlah_bayar"];
    status_pembayaran = json["status_pembayaran"];
    aktivitas_kolektor = json["aktivitas_kolektor"];
    keterangan = json["keterangan"];
    nama_sales = json["nama_sales"];
    nama_supervisor = json["nama_supervisor"];
    nama_demo_broker = json["nama_demo_broker"];
    nama_surveyor = json["nama_surveyor"];
    nama_kolektor = json["nama_kolektor"];
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
    data["jumlah_bayar"] = jumlahBayar;
    data["status_pembayaran"] = status_pembayaran;
    data["aktivitas_kolektor"] = aktivitas_kolektor;
    data["keterangan"] = keterangan;
    data["nama_sales"] = nama_sales;
    data["nama_supervisor"] = nama_supervisor;
    data["nama_demo_broker"] = nama_demo_broker;
    data["nama_surveyor"] = nama_surveyor;
    data["nama_kolektor"] = nama_kolektor;

    return data;
  }
}

class TambahTransaksiModel {
  bool success;
  dynamic error;
  String message;
  TambahTransaksiModelData data;

  TambahTransaksiModel({
    this.success,
    this.error,
    this.message,
    this.data,
  });

  TambahTransaksiModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    error = json['error'];
    message = json['message'];
    data = json['data'] != null
        ? new TambahTransaksiModelData.fromJson(json['data'])
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

class TambahTransaksiModelData {
  List<dynamic> statusPenjualan;
  List<dynamic> lamaAngsuran;
  List<TambahTransaksiModelDemoBrokerData> demoBroker;
  TambahTransaksiModelProdukData produk;
  List<TambahTransaksiModelCustomerData> customer;

  TambahTransaksiModelData({
    this.statusPenjualan,
    this.lamaAngsuran,
    this.demoBroker,
    this.produk,
    this.customer,
  });

  TambahTransaksiModelData.fromJson(Map<String, dynamic> json) {
    statusPenjualan = json['status_penjualan'];
    lamaAngsuran = json['lama_angsuran'];
    if (json['demo_broker'] != null) {
      demoBroker = new List<TambahTransaksiModelDemoBrokerData>();
      json['demo_broker'].forEach((v) {
        demoBroker.add(new TambahTransaksiModelDemoBrokerData.fromJson(v));
      });
    }
    produk = json['produk'] != null
        ? new TambahTransaksiModelProdukData.fromJson(json['produk'])
        : null;
    if (json['customer'] != null) {
      customer = new List<TambahTransaksiModelCustomerData>();
      json['customer'].forEach((v) {
        customer.add(new TambahTransaksiModelCustomerData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status_penjualan'] = statusPenjualan;
    data['lama_angsuran'] = lamaAngsuran;
    if (this.demoBroker != null) {
      data['demo_broker'] = this.demoBroker.map((v) => v.toJson()).toList();
    }
    if (this.produk != null) {
      data['produk'] = this.produk.toJson();
    }
    if (this.customer != null) {
      data['customer'] = this.customer.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class TambahTransaksiModelDemoBrokerData {
  int value;
  String label;
  int supervisorId; 
  String profilePhotoUrl;

  TambahTransaksiModelDemoBrokerData({
    this.value,
    this.label,
    this.supervisorId,
    this.profilePhotoUrl,
  });

  TambahTransaksiModelDemoBrokerData.fromJson(Map<String, dynamic> json) {
    value = json["value"];
    label = json["label"];
    supervisorId = json["supervisor_id"];
    profilePhotoUrl = json["profile_photo_url"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['value'] = value;
    data['label'] = label;
    data['supervisor_id'] = supervisorId;
    data['profile_photo_url'] = profilePhotoUrl;
    return data;
  }
}

class TambahTransaksiModelProdukData {
  int value;
  String label;
  int id;
  String slug;
  int merkId;
  int kategoriProdukId;
  String namaProduk;
  String gambarProduk;
  String deskripsiProduk;
  String statusProduk;
  int hargaJualTunai;
  int hargaJualCicilan3X;
  int hargaJualCicilan5X;
  int hargaJualCicilan7X;
  int hargaJualCicilan8X;
  int hargaJualCicilan9X;
  int hargaJualCicilan10X;
  String createdBy;
  String updatedBy;
  String deletedBy;
  String createdAt;
  String updatedAt;
  String deletedAt;
  int dpCicilan3X;
  int dpCicilan5X;
  int dpCicilan7X;
  int dpCicilan8X;
  int dpCicilan9X;
  int dpCicilan10X;
  int diskonHargaJualTunai;
  int diskonHargaJualCicilan3X;
  int diskonHargaJualCicilan5X;
  int diskonHargaJualCicilan7X;
  int diskonHargaJualCicilan8X;
  int diskonHargaJualCicilan9X;
  int diskonHargaJualCicilan10X;
  int diskonDpCicilan3X;
  int diskonDpCicilan5X;
  int diskonDpCicilan7X;
  int diskonDpCicilan8X;
  int diskonDpCicilan9X;
  int diskonDpCicilan10X;
  TambahTransaksiModelProdukMerkData merk;
  TambahTransaksiModelProdukKategoriData kategoriProduk;

  TambahTransaksiModelProdukData({
    this.value,
    this.label,
    this.id,
    this.slug,
    this.merkId,
    this.kategoriProdukId,
    this.namaProduk,
    this.gambarProduk,
    this.deskripsiProduk,
    this.statusProduk,
    this.hargaJualTunai,
    this.hargaJualCicilan3X,
    this.hargaJualCicilan5X,
    this.hargaJualCicilan7X,
    this.hargaJualCicilan8X,
    this.hargaJualCicilan9X,
    this.hargaJualCicilan10X,
    this.createdBy,
    this.updatedBy,
    this.deletedBy,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.dpCicilan3X,
    this.dpCicilan5X,
    this.dpCicilan7X,
    this.dpCicilan8X,
    this.dpCicilan9X,
    this.dpCicilan10X,
    this.diskonHargaJualTunai,
    this.diskonHargaJualCicilan3X,
    this.diskonHargaJualCicilan5X,
    this.diskonHargaJualCicilan7X,
    this.diskonHargaJualCicilan8X,
    this.diskonHargaJualCicilan9X,
    this.diskonHargaJualCicilan10X,
    this.diskonDpCicilan3X,
    this.diskonDpCicilan5X,
    this.diskonDpCicilan7X,
    this.diskonDpCicilan8X,
    this.diskonDpCicilan9X,
    this.diskonDpCicilan10X,
    this.merk,
    this.kategoriProduk,
  });

  TambahTransaksiModelProdukData.fromJson(Map<String, dynamic> json) {
    value = json["value"];
    label = json["label"];
    id = json["id"];
    slug = json["slug"];
    merkId = json["merk_id"];
    kategoriProdukId = json["kategori_produk_id"];
    namaProduk = json["nama_produk"];
    gambarProduk = json["gambar_produk"];
    deskripsiProduk = json["deskripsi_produk"];
    statusProduk = json["status_produk"];
    hargaJualTunai = json["harga_jual_tunai"];
    hargaJualCicilan3X = json["harga_jual_cicilan_3x"];
    hargaJualCicilan5X = json["harga_jual_cicilan_5x"];
    hargaJualCicilan7X = json["harga_jual_cicilan_7x"];
    hargaJualCicilan8X = json["harga_jual_cicilan_8x"];
    hargaJualCicilan9X = json["harga_jual_cicilan_9x"];
    hargaJualCicilan10X = json["harga_jual_cicilan_10x"];
    createdBy = json["created_by"];
    updatedBy = json["updated_by"];
    deletedBy = json["deleted_by"];
    createdAt = json["created_at"];
    updatedAt = json["updated_at"];
    deletedAt = json["deleted_at"];
    dpCicilan3X = json["dp_cicilan_3x"];
    dpCicilan5X = json["dp_cicilan_5x"];
    dpCicilan7X = json["dp_cicilan_7x"];
    dpCicilan8X = json["dp_cicilan_8x"];
    dpCicilan9X = json["dp_cicilan_9x"];
    dpCicilan10X = json["dp_cicilan_10x"];
    diskonHargaJualTunai = json["diskon_harga_jual_tunai"];
    diskonHargaJualCicilan3X = json["diskon_harga_jual_cicilan_3x"];
    diskonHargaJualCicilan5X = json["diskon_harga_jual_cicilan_5x"];
    diskonHargaJualCicilan7X = json["diskon_harga_jual_cicilan_7x"];
    diskonHargaJualCicilan8X = json["diskon_harga_jual_cicilan_8x"];
    diskonHargaJualCicilan9X = json["diskon_harga_jual_cicilan_9x"];
    diskonHargaJualCicilan10X = json["diskon_harga_jual_cicilan_10x"];
    diskonDpCicilan3X = json["diskon_dp_cicilan_3x"];
    diskonDpCicilan5X = json["diskon_dp_cicilan_5x"];
    diskonDpCicilan7X = json["diskon_dp_cicilan_7x"];
    diskonDpCicilan8X = json["diskon_dp_cicilan_8x"];
    diskonDpCicilan9X = json["diskon_dp_cicilan_9x"];
    diskonDpCicilan10X = json["diskon_dp_cicilan_10x"];
    merk = json['merk'] != null
        ? new TambahTransaksiModelProdukMerkData.fromJson(json['merk'])
        : null;
    kategoriProduk = json['kategori_produk'] != null
        ? new TambahTransaksiModelProdukKategoriData.fromJson(
            json['kategori_produk'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["value"] = value;
    data["label"] = label;
    data["id"] = id;
    data["slug"] = slug;
    data["merk_id"] = merkId;
    data["kategori_produk_id"] = kategoriProdukId;
    data["nama_produk"] = namaProduk;
    data["gambar_produk"] = gambarProduk;
    data["deskripsi_produk"] = deskripsiProduk;
    data["status_produk"] = statusProduk;
    data["harga_jual_tunai"] = hargaJualTunai;
    data["harga_jual_cicilan_3x"] = hargaJualCicilan3X;
    data["harga_jual_cicilan_5x"] = hargaJualCicilan5X;
    data["harga_jual_cicilan_7x"] = hargaJualCicilan7X;
    data["harga_jual_cicilan_8x"] = hargaJualCicilan8X;
    data["harga_jual_cicilan_9x"] = hargaJualCicilan9X;
    data["harga_jual_cicilan_10x"] = hargaJualCicilan10X;
    data["created_by"] = createdBy;
    data["updated_by"] = updatedBy;
    data["deleted_by"] = deletedBy;
    data["created_at"] = createdAt;
    data["updated_at"] = updatedAt;
    data["deleted_at"] = deletedAt;
    data["dp_cicilan_3x"] = dpCicilan3X;
    data["dp_cicilan_5x"] = dpCicilan5X;
    data["dp_cicilan_7x"] = dpCicilan7X;
    data["dp_cicilan_8x"] = dpCicilan8X;
    data["dp_cicilan_9x"] = dpCicilan9X;
    data["dp_cicilan_10x"] = dpCicilan10X;
    data["diskon_harga_jual_tunai"] = diskonHargaJualTunai;
    data["diskon_harga_jual_cicilan_3x"] = diskonHargaJualCicilan3X;
    data["diskon_harga_jual_cicilan_5x"] = diskonHargaJualCicilan5X;
    data["diskon_harga_jual_cicilan_7x"] = diskonHargaJualCicilan7X;
    data["diskon_harga_jual_cicilan_8x"] = diskonHargaJualCicilan8X;
    data["diskon_harga_jual_cicilan_9x"] = diskonHargaJualCicilan9X;
    data["diskon_harga_jual_cicilan_10x"] = diskonHargaJualCicilan10X;
    data["diskon_dp_cicilan_3x"] = diskonDpCicilan3X;
    data["diskon_dp_cicilan_5x"] = diskonDpCicilan5X;
    data["diskon_dp_cicilan_7x"] = diskonDpCicilan7X;
    data["diskon_dp_cicilan_8x"] = diskonDpCicilan8X;
    data["diskon_dp_cicilan_9x"] = diskonDpCicilan9X;
    data["diskon_dp_cicilan_10x"] = diskonDpCicilan10X;
    if (this.merk != null) {
      data['merk'] = this.merk.toJson();
    }
    if (this.kategoriProduk != null) {
      data['kategori_produk'] = this.kategoriProduk.toJson();
    }
    return data;
  }
}

class TambahTransaksiModelCustomerData {
  String noHandphone;
  String alamatLengkap;
  int value;
  String label;
  List<TambahTransaksiModelCustomerSalesData> sales;

  TambahTransaksiModelCustomerData({
    this.noHandphone,
    this.alamatLengkap,
    this.value,
    this.label,
    this.sales,
  });

  TambahTransaksiModelCustomerData.fromJson(Map<String, dynamic> json) {
    noHandphone = json["no_handphone"];
    alamatLengkap = json["alamat_lengkap"];
    value = json["value"];
    label = json["label"];
    if (json['sales'] != null) {
      sales = new List<TambahTransaksiModelCustomerSalesData>();
      json['sales'].forEach((v) {
        sales.add(new TambahTransaksiModelCustomerSalesData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['no_handphone'] = noHandphone;
    data['alamat_lengkap'] = alamatLengkap;
    data['value'] = value;
    data['label'] = label;
    if (this.sales != null) {
      data['sales'] = this.sales.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class TambahTransaksiModelProdukMerkData {
  int id;
  String slug;
  String namaMerk;
  String logoMerk;
  String keterangan;
  String createdAt;
  String updatedAt;
  String deletedAt;
  String createdBy;
  String updatedBy;
  String deletedBy;

  TambahTransaksiModelProdukMerkData({
    this.id,
    this.slug,
    this.namaMerk,
    this.logoMerk,
    this.keterangan,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.createdBy,
    this.updatedBy,
    this.deletedBy,
  });

  TambahTransaksiModelProdukMerkData.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    slug = json["slug"];
    namaMerk = json["nama_merk"];
    logoMerk = json["logo_merk"];
    keterangan = json["keterangan"];
    createdAt = json["created_at"];
    updatedAt = json["updated_at"];
    deletedAt = json["deleted_at"];
    createdBy = json["created_by"];
    updatedBy = json["updated_by"];
    deletedBy = json["deleted_by"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["id"] = id;
    data["slug"] = slug;
    data["nama_merk"] = namaMerk;
    data["logo_merk"] = logoMerk;
    data["keterangan"] = keterangan;
    data["created_at"] = createdAt;
    data["updated_at"] = updatedAt;
    data["deleted_at"] = deletedAt;
    data["created_by"] = createdBy;
    data["updated_by"] = updatedBy;
    data["deleted_by"] = deletedBy;
    return data;
  }
}

class TambahTransaksiModelProdukKategoriData {
  int id;
  String slug;
  String namaKategoriProduk;
  String keterangan;
  String createdAt;
  String updatedAt;
  String deletedAt;
  String createdBy;
  String updatedBy;
  String deletedBy;

  TambahTransaksiModelProdukKategoriData({
    this.id,
    this.slug,
    this.namaKategoriProduk,
    this.keterangan,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.createdBy,
    this.updatedBy,
    this.deletedBy,
  });

  TambahTransaksiModelProdukKategoriData.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    slug = json["slug"];
    namaKategoriProduk = json["nama_kategori_produk"];
    keterangan = json["keterangan"];
    createdAt = json["created_at"];
    updatedAt = json["updated_at"];
    deletedAt = json["deleted_at"];
    createdBy = json["created_by"];
    updatedBy = json["updated_by"];
    deletedBy = json["deleted_by"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["id"] = id;
    data["slug"] = slug;
    data["nama_kategori_produk"] = namaKategoriProduk;
    data["keterangan"] = keterangan;
    data["created_at"] = createdAt;
    data["updated_at"] = updatedAt;
    data["deleted_at"] = deletedAt;
    data["created_by"] = createdBy;
    data["updated_by"] = updatedBy;
    data["deleted_by"] = deletedBy;
    return data;
  }
}

class TambahTransaksiModelCustomerSalesData {
  int value;
  String label;
  String profilePhotoUrl;

  TambahTransaksiModelCustomerSalesData({
    this.value,
    this.label,
    this.profilePhotoUrl,
  });

  TambahTransaksiModelCustomerSalesData.fromJson(Map<String, dynamic> json) {
    value = json["value"];
    label = json["label"];
    profilePhotoUrl = json["profile_photo_url"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['value'] = value;
    data['label'] = label;
    data['profile_photo_url'] = profilePhotoUrl;
    return data;
  }
}

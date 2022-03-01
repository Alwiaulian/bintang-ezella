class DaftarProdukModel {
  bool success;
  dynamic error;
  String message;
  DaftarProdukModelData data;

  DaftarProdukModel({
    this.success,
    this.error,
    this.message,
    this.data,
  });

  factory DaftarProdukModel.fromJson(Map<String, dynamic> json) {
    return DaftarProdukModel(
      success: json["success"],
      error: json["error"],
      message: json["message"],
      data: DaftarProdukModelData.fromJson(json['data']),
      // data: List<DaftarProdukModelData>.from(json["data"].map((x) => DaftarProdukModelData.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() => {
        "success": success,
        "error": error,
        "message": message,
        "data": data,
      };
}

class DaftarProdukModelData {
  int id;
  String namaProduk;
  String gambarProduk;
  String deskripsiProduk;
  String hargaJualTunai;
  String namaKategoriProduk;
  String namaMerk;

  DaftarProdukModelData({this.id, this.namaProduk, this.gambarProduk, this.deskripsiProduk, this.hargaJualTunai, this.namaKategoriProduk, this.namaMerk});

  factory DaftarProdukModelData.fromJson(Map<String, dynamic> json) {
    return DaftarProdukModelData(
      id: json["id"],
      namaProduk: json["nama_produk"],
      gambarProduk: json["gambar_produk"],
      deskripsiProduk: json["deskripsi_produk"],
      hargaJualTunai: json["harga_jual_tunai"],
      namaKategoriProduk: json["nama_kategori_produk"],
      namaMerk: json["nama_merk"],
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "nama_produk": namaProduk,
        "gambar_produk": gambarProduk,
        "deskripsi_produk": deskripsiProduk,
        "harga_jual_tunai": hargaJualTunai,
        "nama_kategori_produk": namaKategoriProduk,
        "nama_merk": namaMerk,
      };
}
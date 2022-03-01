class TambahPelangganModel {
  bool success;
  dynamic error;
  String message;
  TambahPelangganModelData data;

  TambahPelangganModel({
    this.success,
    this.error,
    this.message,
    this.data,
  });

  TambahPelangganModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    error = json['error'];
    message = json['message'];
    data = json['data'] != null
        ? new TambahPelangganModelData.fromJson(json['data'])
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

class TambahPelangganModelData {
  List<dynamic> jenisKelamin;
  TambahPelangganModelRegionalData regional;

  TambahPelangganModelData({
    this.jenisKelamin,
    this.regional,
  });

  TambahPelangganModelData.fromJson(Map<String, dynamic> json) {
    jenisKelamin = json['jenis_kelamin'];
    regional = json['regional'] != null
        ? new TambahPelangganModelRegionalData.fromJson(json['regional'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['jenis_kelamin'] = jenisKelamin;
    if (this.regional != null) {
      data['regional'] = this.regional.toJson();
    }
    return data;
  }
}

class TambahPelangganModelRegionalData {
  int id;
  String namaRegional;
  String keteranganRegional;
  List<TambahPelangganModelRegionalWilayahData> wilayah;

  TambahPelangganModelRegionalData({
    this.id,
    this.namaRegional,
    this.keteranganRegional,
    this.wilayah,
  });

  TambahPelangganModelRegionalData.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    namaRegional = json["nama_regional"];
    keteranganRegional = json["keterangan_regional"];
    if (json['wilayah'] != null) {
      wilayah = new List<TambahPelangganModelRegionalWilayahData>();
      json['wilayah'].forEach((v) {
        wilayah.add(new TambahPelangganModelRegionalWilayahData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['nama_regional'] = namaRegional;
    data['keterangan_regional'] = keteranganRegional;
    if (this.wilayah != null) {
      data['wilayah'] = this.wilayah.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class TambahPelangganModelRegionalWilayahData {
  int id;
  String namaProvinsi;
  String namaKota;
  String namaKelurahan;
  String offset;

  TambahPelangganModelRegionalWilayahData({
    this.id,
    this.namaProvinsi,
    this.namaKota,
    this.namaKelurahan,
  });

  TambahPelangganModelRegionalWilayahData.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    namaProvinsi = json["nama_provinsi"];
    namaKota = json["nama_kota"];
    namaKelurahan = json["nama_kelurahan"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["id"] = id;
    data["nama_provinsi"] = namaProvinsi;
    data["nama_kota"] = namaKota;
    data["nama_kelurahan"] = namaKelurahan;
    data["offset"] = offset;
    return data;
  }
}

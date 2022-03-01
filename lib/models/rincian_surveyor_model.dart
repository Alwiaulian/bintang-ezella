class RincianSurveyorModel {
  bool success;
  dynamic error;
  String message;
  RincianSurveyorModelData data;

  RincianSurveyorModel({
    this.success,
    this.error,
    this.message,
    this.data,
  });

  RincianSurveyorModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    error = json['error'];
    message = json['message'];
    data = json['data'] != null
        ? new RincianSurveyorModelData.fromJson(json['data'])
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

class RincianSurveyorModelData {
  int id;
  String no_faktur;
  String nama_customer;
  String alamat_lengkap;
  String no_hp;
  String alamat_email;
  String nama_produk;
  String tanggal_jatuh_tempo;
  var uang_muka;
  List<dynamic> status_pembelian;
  List<dynamic> lama_cicil;
  var harga_jual_tunai;
  var harga_cicilan_3x;
  var dp_cicilan_3x;
  var cicilan_per_bulan_3x;
  var harga_cicilan_5x;
  var dp_cicilan_5x;
  var cicilan_per_bulan_5x;
  var harga_cicilan_7x;
  var dp_cicilan_7x;
  var cicilan_per_bulan_7x;
  var harga_cicilan_8x;
  var dp_cicilan_8x;
  var cicilan_per_bulan_8x;
  var harga_cicilan_9x;
  var dp_cicilan_9x;
  var cicilan_per_bulan_9x;
  var harga_cicilan_10x;
  var dp_cicilan_10x;
  var cicilan_per_bulan_10x;
  List<dynamic> status_batal;
  List<dynamic> status;
  List<dynamic> keterangan;

  RincianSurveyorModelData(
      {this.id,
      this.no_faktur,
      this.nama_customer,
      this.alamat_lengkap,
      this.no_hp,
      this.alamat_email,
      this.nama_produk,
      this.tanggal_jatuh_tempo,
      this.uang_muka,
      this.status_pembelian,
      this.lama_cicil,
      this.harga_jual_tunai,
      this.harga_cicilan_3x,
      this.dp_cicilan_3x,
      this.cicilan_per_bulan_3x,
      this.harga_cicilan_5x,
      this.dp_cicilan_5x,
      this.cicilan_per_bulan_5x,
      this.harga_cicilan_7x,
      this.dp_cicilan_7x,
      this.cicilan_per_bulan_7x,
      this.harga_cicilan_8x,
      this.dp_cicilan_8x,
      this.cicilan_per_bulan_8x,
      this.harga_cicilan_9x,
      this.dp_cicilan_9x,
      this.cicilan_per_bulan_9x,
      this.harga_cicilan_10x,
      this.dp_cicilan_10x,
      this.cicilan_per_bulan_10x,
      this.status_batal,
      this.status,
      this.keterangan});

  RincianSurveyorModelData.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    no_faktur = json["no_faktur"];
    nama_customer = json["nama_customer"];
    alamat_lengkap = json["alamat_lengkap"];
    no_hp = json["no_hp"];
    alamat_email = json["alamat_email"];
    nama_produk = json["nama_produk"];
    tanggal_jatuh_tempo = json["tanggal_jatuh_tempo"];
    uang_muka = json["uang_muka"];
    status_pembelian = json["status_pembelian"];
    lama_cicil = json["lama_cicil"];
    harga_jual_tunai = json["harga_jual_tunai"];
    harga_cicilan_3x = json["harga_cicilan_3x"];
    dp_cicilan_3x = json["dp_cicilan_3x"];
    cicilan_per_bulan_3x = json["cicilan_per_bulan_3x"];
    harga_cicilan_5x = json["harga_cicilan_5x"];
    dp_cicilan_5x = json["dp_cicilan_5x"];
    cicilan_per_bulan_5x = json["cicilan_per_bulan_5x"];
    harga_cicilan_7x = json["harga_cicilan_7x"];
    dp_cicilan_7x = json["dp_cicilan_7x"];
    cicilan_per_bulan_7x = json["cicilan_per_bulan_7x"];
    harga_cicilan_8x = json["harga_cicilan_8x"];
    dp_cicilan_8x = json["dp_cicilan_8x"];
    cicilan_per_bulan_8x = json["cicilan_per_bulan_8x"];
    harga_cicilan_9x = json["harga_cicilan_9x"];
    dp_cicilan_9x = json["dp_cicilan_9x"];
    cicilan_per_bulan_9x = json["cicilan_per_bulan_9x"];
    harga_cicilan_10x = json["harga_cicilan_10x"];
    dp_cicilan_10x = json["dp_cicilan_10x"];
    cicilan_per_bulan_10x = json["cicilan_per_bulan_10x"];
    status_batal = json["status_batal"];
    status = json["status"];
    keterangan = json["keterangan"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['no_faktur'] = this.no_faktur;
    data['nama_customer'] = this.nama_customer;
    data['alamat_lengkap'] = this.alamat_lengkap;
    data['no_hp'] = this.no_hp;
    data['alamat_email'] = this.alamat_email;
    data['nama_produk'] = this.nama_produk;
    data['tanggal_jatuh_tempo'] = this.tanggal_jatuh_tempo;
    data['uang_muka'] = this.uang_muka;
    data['status_pembelian'] = this.status_pembelian;
    data['lama_cicil'] = this.lama_cicil;
    data['harga_jual_tunai'] = this.harga_jual_tunai;
    data['harga_cicilan_3x'] = this.harga_cicilan_3x;
    data['dp_cicilan_3x'] = this.dp_cicilan_3x;
    data['cicilan_per_bulan_3x'] = this.cicilan_per_bulan_3x;
    data['harga_cicilan_5x'] = this.harga_cicilan_5x;
    data['dp_cicilan_5x'] = this.dp_cicilan_5x;
    data['cicilan_per_bulan_5x'] = this.cicilan_per_bulan_5x;
    data['harga_cicilan_7x'] = this.harga_cicilan_7x;
    data['dp_cicilan_7x'] = this.dp_cicilan_7x;
    data['cicilan_per_bulan_7x'] = this.cicilan_per_bulan_7x;
    data['harga_cicilan_8x'] = this.harga_cicilan_8x;
    data['dp_cicilan_8x'] = this.dp_cicilan_8x;
    data['cicilan_per_bulan_8x'] = this.cicilan_per_bulan_8x;
    data['harga_cicilan_9x'] = this.harga_cicilan_9x;
    data['dp_cicilan_9x'] = this.dp_cicilan_9x;
    data['cicilan_per_bulan_9x'] = this.cicilan_per_bulan_9x;
    data['harga_cicilan_10x'] = this.harga_cicilan_10x;
    data['dp_cicilan_10x'] = this.dp_cicilan_10x;
    data['cicilan_per_bulan_10x'] = this.cicilan_per_bulan_10x;
    data['status_batal'] = this.status_batal;
    data['status'] = this.status;
    data['keterangan'] = this.keterangan;

    return data;
  }
}

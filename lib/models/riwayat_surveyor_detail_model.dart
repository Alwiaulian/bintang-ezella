class RiwayatSurveyorDetailModel {
  bool success;
  dynamic error;
  String message;
  RiwayatSurveyorDetailModelData data;

  RiwayatSurveyorDetailModel({
    this.success,
    this.error,
    this.message,
    this.data,
  });

  RiwayatSurveyorDetailModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    error = json['error'];
    message = json['message'];
    data = json['data'] != null
        ? new RiwayatSurveyorDetailModelData.fromJson(json['data'])
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

class RiwayatSurveyorDetailModelData {
  int id;
  String no_faktur;
  String nama_customer;
  String alamat_lengkap;
  String no_hp;
  String alamat_email;
  String nama_produk;
  String tanggal_jatuh_tempo;
  String tanggal_jatuh_tempo_raw;
  String tanggal_survey_raw;
  String tanggal_survey;
  var nama_sales;
  var nama_supervisor;
  var nama_demo_broker;
  var nama_surveyor;
  var cicilan_per_bulan;
  var harga;
  var uang_muka;
  var status_pembelian;
  var lama_cicilan;
  var status_batal;
  var status;
  var keterangan;

  RiwayatSurveyorDetailModelData(
      {this.id,
      this.no_faktur,
      this.nama_customer,
      this.alamat_lengkap,
      this.no_hp,
      this.alamat_email,
      this.nama_produk,
      this.tanggal_jatuh_tempo,
      this.tanggal_jatuh_tempo_raw,
      this.tanggal_survey_raw,
      this.tanggal_survey,
      this.nama_sales,
      this.nama_supervisor,
      this.nama_demo_broker,
      this.nama_surveyor,
      this.cicilan_per_bulan,
      this.harga,
      this.uang_muka,
      this.status_pembelian,
      this.lama_cicilan,
      this.status,
      this.keterangan});

  RiwayatSurveyorDetailModelData.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    no_faktur = json["no_faktur"];
    nama_customer = json["nama_customer"];
    alamat_lengkap = json["alamat_lengkap"];
    no_hp = json["no_hp"];
    alamat_email = json["alamat_email"];
    nama_produk = json["nama_produk"];
    cicilan_per_bulan = json["cicilan_per_bulan"];
    tanggal_jatuh_tempo = json["tanggal_jatuh_tempo"];
    tanggal_jatuh_tempo_raw = json["tanggal_jatuh_tempo_raw"];
    tanggal_survey_raw = json["tanggal_survey_raw"];
    tanggal_survey = json["tanggal_survey"];
    nama_sales = json["nama_sales"];
    nama_supervisor = json["nama_supervisor"];
    nama_demo_broker = json["nama_demo_broker"];
    nama_surveyor = json["nama_surveyor"];
    harga = json["harga"];
    uang_muka = json["uang_muka"];
    status_pembelian = json["status_pembelian"];
    lama_cicilan = json["lama_cicilan"];
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
    data['cicilan_per_bulan'] = this.cicilan_per_bulan;
    data['tanggal_jatuh_tempo'] = this.tanggal_jatuh_tempo;
    data['tanggal_jatuh_tempo_raw'] = this.tanggal_jatuh_tempo_raw;
    data['tanggal_survey_raw'] = this.tanggal_survey_raw;
    data['tanggal_survey'] = this.tanggal_survey;
    data['nama_sales'] = this.nama_sales;
    data['nama_supervisor'] = this.nama_supervisor;
    data['nama_demo_broker'] = this.nama_demo_broker;
    data['nama_surveyor'] = this.nama_surveyor;
    data['harga'] = this.harga;
    data['uang_muka'] = this.uang_muka;
    data['status_pembelian'] = this.status_pembelian;
    data['lama_cicilan'] = this.lama_cicilan;
    data['status_batal'] = this.status_batal;
    data['status'] = this.status;
    data['keterangan'] = this.keterangan;

    return data;
  }
}

import 'dart:convert';
import 'dart:io';

import 'package:bintang_ezella_mobile_app/core/api/master_city_api.dart';
import 'package:bintang_ezella_mobile_app/core/api/master_district_api.dart';
import 'package:bintang_ezella_mobile_app/core/api/master_province_api.dart';
import 'package:bintang_ezella_mobile_app/core/api/tambah_pelanggan_api.dart';
import 'package:bintang_ezella_mobile_app/core/constant/flutter_no_sql.dart';
import 'package:bintang_ezella_mobile_app/core/constant/no_sql_key.dart';
import 'package:bintang_ezella_mobile_app/core/util/flutter_toast.dart';
import 'package:bintang_ezella_mobile_app/core/util/log.dart';
import 'package:bintang_ezella_mobile_app/models/login_model.dart';
import 'package:bintang_ezella_mobile_app/models/master_city_model.dart';
import 'package:bintang_ezella_mobile_app/models/master_district_model.dart';
import 'package:bintang_ezella_mobile_app/models/master_province_model.dart';
import 'package:bintang_ezella_mobile_app/models/tambah_pelanggan_model.dart';
import 'package:bintang_ezella_mobile_app/ui/router/dialog_router.dart';
import 'package:bintang_ezella_mobile_app/ui/router/router.dart';
import 'package:bintang_ezella_mobile_app/ui/view/main/supervisor/tambah_transaksi_page.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'base_provider.dart';

class SupervisorTambahPelangganProvider extends BaseProvider {
  bool loading = true;
  SupervisorTambahPelangganProvider(BuildContext context, int produkId)
      : super(context) {
    this.produk_id = produkId;
    getDataSupervisorTambahPelanggan();
  }

  getDataSupervisorTambahPelanggan() async {
    loading = true;
    await getSupervisorTambahPelangganData();
    await getSupervisorLoginData();
    await getMasterProvinceData();
    notifyListeners();
    loading = false;
  }

  LoginModel loginModel;
  TambahPelangganModelData tambahPelangganModelData;
  MasterProvinceModel masterProvinceModel;
  MasterCityModel masterCityModel;
  MasterDistrictModel masterDistrictModel;

  getSupervisorTambahPelangganData() async {
    var data = await TambahPelangganApi.getFormHelper();
    if (data['error'] == "AuthenticationException") {
      AppRouter.navToLoginPage(context);
      FlutterToast.showSuccess(context: context, message: 'Unauthorized!');
      FlutterNoSql.clearToken();
      // FlutterNoSql.clearProjectId();
      FlutterNoSql.clearJsonString(key: NoSqlKey.loginApiKey);
    }
    if (data == null) return;
    if (data['success'] == true) {
      tambahPelangganModelData =
          TambahPelangganModelData.fromJson(data['data']);
      // L.log('data project_id: '+project_id.toString());
      notifyListeners();
    }
  }

  getSupervisorLoginData() async {
    loginModel = LoginModel.fromJson(
        json.decode(FlutterNoSql.getJsonString(key: NoSqlKey.loginApiKey)));
  }

  getMasterProvinceData() async {
    var data = await MasterProvinceApi.getDataMasterProvince();
    if (data == null) return;
    if (data['success'] == true) {
      masterProvinceModel = MasterProvinceModel.fromJson(data);
    }
  }

  getMasterCityData(String province) async {
    DialogRouter.displayProgressDialog(context);
    var data = await MasterCityApi.getDataMasterCity(province);
    if (data == null) return;
    if (data['success'] == true) {
      masterCityModel = MasterCityModel.fromJson(data);
    }
    Future.delayed(Duration(seconds: 2))
        .then((value) => DialogRouter.closeProgressDialog(context));
  }

  getMasterDistrictData(String city) async {
    DialogRouter.displayProgressDialog(context);
    var data = await MasterDistrictApi.getDataMasterDistrict(city);
    if (data == null) return;
    if (data['success'] == true) {
      masterDistrictModel = MasterDistrictModel.fromJson(data);
    }
    Future.delayed(Duration(seconds: 2))
        .then((value) => DialogRouter.closeProgressDialog(context));
  }

  int produk_id;
  String nama_lengkap;
  String jenis_kelamin;
  String tanggal_lahir;
  String no_handphone;
  String alamat_email;
  String regional_id;
  String provinsi_id;
  String provinsi;
  String kota;
  String kelurahan;
  String alamat_lengkap;
  File foto_customer;
  File foto_e_ktp;
  String status = '1';
  String strTanggalLahir = '';

  upload() async {
    if (nama_lengkap == null) {
      FlutterToast.showErrorToast(
          context: context, message: 'Please enter name');
      return;
    }
    if (jenis_kelamin == null) {
      FlutterToast.showErrorToast(
          context: context, message: 'Please select gender');
      return;
    }
    if (no_handphone == null) {
      FlutterToast.showErrorToast(
          context: context, message: 'Please enter no hp');
      return;
    }
    if (regional_id == null) {
      FlutterToast.showErrorToast(
          context: context, message: 'Please enter regional');
      return;
    }
    if (provinsi_id == null) {
      FlutterToast.showErrorToast(
          context: context, message: 'Please enter wilayah');
      return;
    }
    if (alamat_lengkap == null) {
      FlutterToast.showErrorToast(
          context: context, message: 'Please enter address');
      return;
    }

    if (tanggal_lahir != "" && tanggal_lahir != null) {
      DateTime tempDate = DateTime.parse(tanggal_lahir);
      var outputFormat = DateFormat("yyyy-MM-dd");
      strTanggalLahir = outputFormat.format(tempDate);
    }

    DialogRouter.displayProgressDialog(context);
    var data = await TambahPelangganApi.saveData(
      nama_lengkap: nama_lengkap,
      jenis_kelamin: jenis_kelamin,
      tanggal_lahir: strTanggalLahir,
      no_handphone: no_handphone,
      alamat_email: alamat_email,
      regional_id: regional_id,
      provinsi_id: provinsi_id,
      provinsi: provinsi,
      kota: kota,
      kelurahan: kelurahan,
      alamat_lengkap: alamat_lengkap,
      foto_customer: foto_customer,
      foto_e_ktp: foto_e_ktp,
      status: status,
    );

    DialogRouter.closeProgressDialog(context);

    if (data == null) return;
    if (data['success'] == true) {
      FlutterToast.showSuccess(context: context, message: data['message']);
      if (produk_id != null) {
        Future.delayed(Duration(seconds: 2)).then((value) => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => TambahTransaksiPage(produk_id),
              ),
            ));
      }
    } else {
      FlutterToast.showErrorToast(context: context, message: data['message']);
    }
  }
}

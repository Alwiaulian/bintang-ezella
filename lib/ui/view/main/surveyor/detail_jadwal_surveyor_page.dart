// import 'dart:html';
import 'dart:io';

import 'package:bintang_ezella_mobile_app/core/providers/listener_provider.dart';
import 'package:bintang_ezella_mobile_app/core/providers/surveyor_rincian_provider.dart';
import 'package:bintang_ezella_mobile_app/ui/router/router.dart';
import 'package:bintang_ezella_mobile_app/ui/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:intl/intl.dart';

class DetailJadwalSurveyorPage extends StatefulWidget {
  final int id;
  const DetailJadwalSurveyorPage(this.id);

  @override
  _DetailJadwalSurveyorPageState createState() =>
      _DetailJadwalSurveyorPageState();
}

class _DetailJadwalSurveyorPageState extends State<DetailJadwalSurveyorPage> {
  //  ApiHelper api = ApiHelper();
  // File _image;
  // TextEditingController _txtNameImage = TextEditingController();
  String _valStatus;
  String _valStatusKeterangan;
  String _valStatusBatal;
  String _valStatus_cicilan;
  String _valStatusPembelian;
  String _valPilihKeterangan;
  String _valKeterangan;
  String _valTipeCicilan;
  File fotoBatal;

  String valCicilanPerBulan;
  String valDpCicilan;
  String valSisaDpCicilan;
  String valKelebihanDpCicilan;
  String valTanggalJatuhTempo;
  String valHargaBarang;
  bool _isVisibleHargaBarang = false;
  bool _isVisibleSisaPembayaran = false;
  bool _isVisibleDpCicilan = false;
  bool _isVisibleCicilanPerBulan = false;
  bool _isVisibleSisaDpCicilan = false;
  bool _isVisibleTanggalJatuhTempo = false;
  bool _isVisibleKeterangan = false;
  bool _isVisibleTipeCicilan = false;
  bool _isVisibleStatusBatal = false;
  bool _isVisibleTanggalSurveyBaru = false;
  bool _isVisiblePilihKeterangan = false;
  bool _isVisibleStatusPembelian = false;

  TextEditingController hargaBarangController = new TextEditingController();
  TextEditingController sisaPembayaranController = new TextEditingController();
  TextEditingController dpCicilanController = new TextEditingController();
  TextEditingController cicilanPerBulanController = new TextEditingController();
  TextEditingController sisaDpCicilanController = new TextEditingController();
  TextEditingController kelebihanDpCicilanController = new TextEditingController();
  TextEditingController tanggalJatuhTempoController =
      new TextEditingController();
  String _valTanggalSurveyBaru = 'Tanggal Penagihan Ulang';
  FocusNode n1 = FocusNode();
  FocusNode n2 = FocusNode();

  var dateFormatterHuman = new DateFormat('dd-MM-yyyy');
  var dateFormatterSystem = new DateFormat('yyyy-MM-dd');

  allUnFocus() {
    n1.unfocus();
    n2.unfocus();
  }

  @override
  Widget build(BuildContext context) {
    return ListenerProvider(
      model: RincianSurveyorProvider(context, widget.id.toString()),
      builder: (RincianSurveyorProvider provider) => provider.loading == true
          ? Container()
          : Scaffold(
              resizeToAvoidBottomInset: false,
              body: SafeArea(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: AppColors.whiteColor,
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 15,
                          ),
                          Container(
                            child: Row(
                              children: [
                                Container(
                                  height: 40,
                                  width: 40,
                                  child: IconButton(
                                    icon: Icon(Icons.arrow_back),
                                    iconSize: 24,
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  "Rincian Surveyor",
                                  style: AppTextStyle.boldTextStyle
                                      .copyWith(fontSize: 18),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Padding(
                          padding: EdgeInsets.only(
                              bottom: MediaQuery.of(context).viewInsets.bottom),
                          child: Column(
                            children: <Widget>[
                              Container(
                                padding: EdgeInsets.all(20),
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: AppColors.whiteColor,
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      // color: AppColors.lightBlueColor,
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        color: AppColors.lightGrayColor,
                                        borderRadius: BorderRadius.circular(10),
                                        boxShadow: [
                                          BoxShadow(
                                            color: AppColors.grayColor,
                                            // blurRadius: 4,
                                            offset: Offset(0, 0),
                                          ),
                                        ],
                                      ),
                                      padding: EdgeInsets.all(20),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                provider
                                                    .rincianSurveyorModelData
                                                    .nama_customer,
                                                style: AppTextStyle
                                                    .boldTextStyle
                                                    .copyWith(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.normal,
                                                ),
                                              ),
                                              Container(
                                                padding: EdgeInsets.fromLTRB(
                                                    5, 3, 5, 3),
                                                decoration: BoxDecoration(
                                                  color:
                                                      // (status_bayar == 'Bayar' || status_bayar == 'Tunai')
                                                      //     ? AppColors.greenColor
                                                      //     : (status_bayar == 'Belum Bayar' ||
                                                      //             status_bayar == 'Cicilan')
                                                      //         ? AppColors.yellowColor
                                                      //         : (status_bayar == 'Terlambat' ||
                                                      //                 status_bayar == 'Batal' ||
                                                      //                 status_bayar == 'Belum bayar')
                                                      //             ? AppColors.redColor
                                                      // :
                                                      AppColors.redColor,
                                                  borderRadius:
                                                      BorderRadius.circular(5),
                                                ),
                                                child: Text(
                                                  "Jatuh tempo " +
                                                      DateFormat('dd MMM yyyy').format(
                                                          DateTime.parse(provider
                                                              .rincianSurveyorModelData
                                                              .tanggal_jatuh_tempo)),
                                                  style: AppTextStyle
                                                      .boldTextStyle
                                                      .copyWith(
                                                          fontSize: 10,
                                                          color: AppColors
                                                              .whiteColor),
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 14,
                                          ),
                                          Divider(
                                            height: 2,
                                            color: AppColors.grayColor,
                                          ),
                                          Container(
                                            padding: EdgeInsets.only(top: 20),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  'Alamat lengkap',
                                                  style: AppTextStyle
                                                      .boldTextStyle
                                                      .copyWith(
                                                          fontSize: 12,
                                                          color: AppColors
                                                              .grayColor),
                                                ),
                                                SizedBox(
                                                  height: 6,
                                                ),
                                                Text(
                                                  provider
                                                      .rincianSurveyorModelData
                                                      .alamat_lengkap,
                                                  style: AppTextStyle
                                                      .regularTextStyle
                                                      .copyWith(
                                                    fontSize: 14,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Container(
                                            padding: EdgeInsets.only(top: 16),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  'No. Hp',
                                                  style: AppTextStyle
                                                      .boldTextStyle
                                                      .copyWith(
                                                          fontSize: 12,
                                                          color: AppColors
                                                              .grayColor),
                                                ),
                                                SizedBox(
                                                  height: 6,
                                                ),
                                                Text(
                                                  provider
                                                      .rincianSurveyorModelData
                                                      .no_hp,
                                                  style: AppTextStyle
                                                      .regularTextStyle
                                                      .copyWith(
                                                    fontSize: 14,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Container(
                                            padding: EdgeInsets.only(top: 16),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  'Alamat Email',
                                                  style: AppTextStyle
                                                      .boldTextStyle
                                                      .copyWith(
                                                          fontSize: 12,
                                                          color: AppColors
                                                              .grayColor),
                                                ),
                                                SizedBox(
                                                  height: 6,
                                                ),
                                                Text(
                                                  provider.rincianSurveyorModelData
                                                              .alamat_email ==
                                                          null
                                                      ? '-'
                                                      : provider
                                                          .rincianSurveyorModelData
                                                          .alamat_email,
                                                  style: AppTextStyle
                                                      .regularTextStyle
                                                      .copyWith(
                                                    fontSize: 14,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            height: 8,
                                          )
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                  ],
                                ),
                              ),
                              Divider(
                                height: 2,
                                color: AppColors.whiteColor,
                              ),
                              Container(
                                padding: EdgeInsets.all(20),
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: AppColors.whiteColor,
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      child: Text(
                                        'Info Detail',
                                        style: AppTextStyle.boldTextStyle
                                            .copyWith(
                                                fontSize: 13,
                                                color: AppColors.grayColor),
                                      ),
                                    ),
                                    SizedBox(height: 16),
                                    Container(
                                      child: Row(
                                        children: [
                                          Expanded(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  'No Kwitansi',
                                                  style: AppTextStyle
                                                      .regularTextStyle
                                                      .copyWith(
                                                          fontSize: 11,
                                                          color: AppColors
                                                              .grayColor),
                                                ),
                                                SizedBox(
                                                  height: 6,
                                                ),
                                                Text(
                                                  provider
                                                      .rincianSurveyorModelData
                                                      .no_faktur,
                                                  style: AppTextStyle
                                                      .regularTextStyle
                                                      .copyWith(
                                                    fontSize: 16,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(height: 16),
                                    Container(
                                      child: Row(
                                        children: [
                                          Expanded(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  'Nama Produk',
                                                  style: AppTextStyle
                                                      .regularTextStyle
                                                      .copyWith(
                                                          fontSize: 11,
                                                          color: AppColors
                                                              .grayColor),
                                                ),
                                                SizedBox(
                                                  height: 6,
                                                ),
                                                Text(
                                                  provider
                                                      .rincianSurveyorModelData
                                                      .nama_produk,
                                                  style: AppTextStyle
                                                      .regularTextStyle
                                                      .copyWith(
                                                    fontSize: 16,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(height: 16),
                                    Container(
                                      child: Row(
                                        children: [
                                          Expanded(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  'Uang Muka ',
                                                  style: AppTextStyle
                                                      .regularTextStyle
                                                      .copyWith(
                                                          fontSize: 11,
                                                          color: AppColors
                                                              .grayColor),
                                                ),
                                                SizedBox(
                                                  height: 6,
                                                ),
                                                Text(
                                                  NumberFormat.currency(
                                                          locale: 'id',
                                                          symbol: 'Rp. ',
                                                          decimalDigits: 0)
                                                      .format(provider
                                                          .rincianSurveyorModelData
                                                          .uang_muka)
                                                      .toString(),
                                                  style: AppTextStyle
                                                      .regularTextStyle
                                                      .copyWith(
                                                    fontSize: 16,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: 30,
                                    ),
                                    Container(
                                      child: Column(
                                        children: [
                                          Container(
                                            child: DropdownButtonFormField(
                                              decoration: InputDecoration(
                                                labelText: 'Status ',
                                                labelStyle: AppTextStyle
                                                    .regularTextStyle
                                                    .copyWith(fontSize: 14),
                                              ),
                                              isExpanded: true,
                                              hint: Text("Pilih Status "),
                                              value: _valStatus,
                                              items: provider
                                                  .rincianSurveyorModelData
                                                  .status
                                                  .map((item) {
                                                return DropdownMenuItem(
                                                  child: Text(item),
                                                  value: item,
                                                );
                                              }).toList(),
                                              onChanged: (value) {
                                                allUnFocus();
                                                provider.status = value;

                                                _isVisibleTipeCicilan = false;
                                                _isVisibleStatusBatal = false;
                                                _isVisibleDpCicilan = false;
                                                _isVisibleCicilanPerBulan =
                                                    false;
                                                _isVisibleSisaDpCicilan = false;
                                                _isVisibleTanggalJatuhTempo =
                                                    false;
                                                if (value ==
                                                    "Ketemu Customer") {
                                                  _isVisibleStatusPembelian =
                                                      true;
                                                  _isVisibleTanggalSurveyBaru =
                                                      false;
                                                  _isVisiblePilihKeterangan =
                                                      false;
                                                  _isVisibleKeterangan = true;
                                                } else if (value ==
                                                    "Tidak Ketemu Customer") {
                                                  _isVisibleTanggalSurveyBaru =
                                                      true;
                                                  _isVisiblePilihKeterangan =
                                                      true;
                                                  _isVisibleStatusPembelian =
                                                      false;
                                                  _isVisibleKeterangan = false;
                                                }

                                                setState(() {});
                                              },
                                            ),
                                          ),
                                          SizedBox(
                                            height: 8,
                                          ),
                                          Visibility(
                                            visible: _isVisibleStatusPembelian,
                                            child: Container(
                                              child: DropdownButtonFormField(
                                                decoration: InputDecoration(
                                                  labelText:
                                                      'Status Pembelian ',
                                                  labelStyle: AppTextStyle
                                                      .regularTextStyle
                                                      .copyWith(fontSize: 14),
                                                ),
                                                isExpanded: true,
                                                hint: Text("Pilih Status "),
                                                value: _valStatusPembelian,
                                                items: provider
                                                    .rincianSurveyorModelData
                                                    .status_pembelian
                                                    .map((item) {
                                                  return DropdownMenuItem(
                                                    child: Text(item),
                                                    value: item,
                                                  );
                                                }).toList(),
                                                onChanged: (value) {
                                                  allUnFocus();
                                                  provider.status_pembelian =
                                                      value;
                                                  // hargaBarangController.text = '';
                                                  dpCicilanController.text = '';
                                                  cicilanPerBulanController
                                                      .text = '';
                                                  sisaDpCicilanController.text =
                                                      '';
                                                  kelebihanDpCicilanController.text =
                                                      '';
                                                  tanggalJatuhTempoController
                                                      .text = '';
                                                  _isVisibleHargaBarang = false;
                                                  _isVisibleSisaPembayaran = false;
                                                  _isVisibleDpCicilan = false;
                                                  _isVisibleCicilanPerBulan =
                                                      false;
                                                  _isVisibleSisaDpCicilan =
                                                      false;
                                                  _isVisibleTanggalJatuhTempo =
                                                      false;
                                                  if (value == "Tunai") {
                                                    _isVisibleHargaBarang =
                                                        true;
                                                    _isVisibleSisaPembayaran =
                                                        true;
                                                    _isVisibleKeterangan = true;
                                                    _isVisibleTipeCicilan =
                                                        false;
                                                    _isVisibleStatusBatal =
                                                        false;
                                                    provider.harga_barang = provider
                                                        .rincianSurveyorModelData
                                                        .harga_jual_tunai
                                                        .toString();
                                                    hargaBarangController
                                                        .text = NumberFormat
                                                            .currency(
                                                                locale: 'id',
                                                                symbol: '',
                                                                decimalDigits:
                                                                    0)
                                                        .format(provider
                                                            .rincianSurveyorModelData
                                                            .harga_jual_tunai)
                                                        .toString();
                                                    sisaPembayaranController
                                                        .text = NumberFormat
                                                            .currency(
                                                                locale: 'id',
                                                                symbol: '',
                                                                decimalDigits:
                                                                    0)
                                                        .format(provider
                                                            .rincianSurveyorModelData
                                                            .harga_jual_tunai - provider.rincianSurveyorModelData.uang_muka)
                                                        .toString();
                                                  } else if (value ==
                                                      "Cicilan") {
                                                    _isVisibleTipeCicilan =
                                                        true;
                                                    _isVisibleStatusBatal =
                                                        false;
                                                  } else if (value == "Batal") {
                                                    _isVisibleStatusBatal =
                                                        true;
                                                    _isVisibleTipeCicilan =
                                                        false;
                                                  }

                                                  setState(() {});
                                                },
                                              ),
                                            ),
                                          ),
                                          Visibility(
                                            visible: _isVisibleStatusBatal,
                                            child: DropdownButtonFormField(
                                              decoration: InputDecoration(
                                                labelText: 'Status Batal ',
                                                labelStyle: AppTextStyle
                                                    .regularTextStyle
                                                    .copyWith(fontSize: 14),
                                              ),
                                              isExpanded: true,
                                              hint: Text("Pilih Status Batal "),
                                              value: _valStatusBatal,
                                              items: provider
                                                  .rincianSurveyorModelData
                                                  .status_batal
                                                  .map((item) {
                                                return DropdownMenuItem(
                                                  child: Text(item),
                                                  value: item,
                                                );
                                              }).toList(),
                                              onChanged: (value) {
                                                allUnFocus();
                                                provider.status_batal = value;
                                                setState(() {});
                                              },
                                            ),
                                          ),
                                          Visibility(
                                            visible: _isVisibleTipeCicilan,
                                            child: DropdownButtonFormField(
                                              decoration: InputDecoration(
                                                labelText: 'Cicilan ',
                                                labelStyle: AppTextStyle
                                                    .regularTextStyle
                                                    .copyWith(fontSize: 14),
                                              ),
                                              isExpanded: true,
                                              hint: Text("Pilih Cicilan "),
                                              value: _valStatus_cicilan,
                                              items: provider
                                                  .rincianSurveyorModelData
                                                  .lama_cicil
                                                  .map((item) {
                                                return DropdownMenuItem(
                                                  child: Text("Cicilan " +
                                                      item.toString() +
                                                      "x"),
                                                  value: item,
                                                );
                                              }).toList(),
                                              onChanged: (value) {
                                                allUnFocus();
                                                if (value == 3) {
                                                  valDpCicilan = provider
                                                          .rincianSurveyorModelData
                                                          .dp_cicilan_3x.toString();
                                                  valCicilanPerBulan = provider
                                                          .rincianSurveyorModelData
                                                          .cicilan_per_bulan_3x.toString();
                                                  valHargaBarang = provider
                                                          .rincianSurveyorModelData
                                                          .harga_cicilan_3x.toString();
                                                  if (provider
                                                          .rincianSurveyorModelData
                                                          .dp_cicilan_3x <
                                                      provider
                                                          .rincianSurveyorModelData
                                                          .uang_muka) {
                                                    var calcSisaDpCicilan = provider
                                                          .rincianSurveyorModelData
                                                          .uang_muka - provider
                                                          .rincianSurveyorModelData
                                                          .dp_cicilan_3x;
                                                    valSisaDpCicilan = '0';
                                                    valKelebihanDpCicilan =
                                                      NumberFormat.currency(
                                                              locale: 'id',
                                                              symbol: '',
                                                              decimalDigits: 0)
                                                          .format(
                                                              calcSisaDpCicilan)
                                                          .toString();
                                                  } else {
                                                    var calcSisaDpCicilan = provider
                                                          .rincianSurveyorModelData
                                                          .dp_cicilan_3x -
                                                      provider
                                                          .rincianSurveyorModelData
                                                          .uang_muka;
                                                    valSisaDpCicilan =
                                                      NumberFormat.currency(
                                                              locale: 'id',
                                                              symbol: '',
                                                              decimalDigits: 0)
                                                          .format(
                                                              calcSisaDpCicilan)
                                                          .toString();
                                                    valKelebihanDpCicilan = '0';
                                                  }
                                                } else if (value == 5) {
                                                  valDpCicilan = provider
                                                          .rincianSurveyorModelData
                                                          .dp_cicilan_5x
                                                      .toString();
                                                  valCicilanPerBulan = provider
                                                          .rincianSurveyorModelData
                                                          .cicilan_per_bulan_5x
                                                      .toString();
                                                  valHargaBarang = provider
                                                          .rincianSurveyorModelData
                                                          .harga_cicilan_5x
                                                      .toString();
                                                  if (provider
                                                          .rincianSurveyorModelData
                                                          .dp_cicilan_5x <
                                                      provider
                                                          .rincianSurveyorModelData
                                                          .uang_muka) {
                                                    var calcSisaDpCicilan = provider
                                                          .rincianSurveyorModelData
                                                          .uang_muka - provider
                                                          .rincianSurveyorModelData
                                                          .dp_cicilan_5x;
                                                    valSisaDpCicilan = '0';
                                                    valKelebihanDpCicilan =
                                                      NumberFormat.currency(
                                                              locale: 'id',
                                                              symbol: '',
                                                              decimalDigits: 0)
                                                          .format(
                                                              calcSisaDpCicilan)
                                                          .toString();
                                                  } else {
                                                    var calcSisaDpCicilan = provider
                                                          .rincianSurveyorModelData
                                                          .dp_cicilan_5x -
                                                      provider
                                                          .rincianSurveyorModelData
                                                          .uang_muka;
                                                    valSisaDpCicilan =
                                                      NumberFormat.currency(
                                                              locale: 'id',
                                                              symbol: '',
                                                              decimalDigits: 0)
                                                          .format(
                                                              calcSisaDpCicilan)
                                                          .toString();
                                                    valKelebihanDpCicilan = '0';
                                                  }
                                                } else if (value == 7) {
                                                  valDpCicilan = provider
                                                          .rincianSurveyorModelData
                                                          .dp_cicilan_7x
                                                      .toString();
                                                  valCicilanPerBulan = provider
                                                          .rincianSurveyorModelData
                                                          .cicilan_per_bulan_7x
                                                      .toString();
                                                  valHargaBarang = provider
                                                          .rincianSurveyorModelData
                                                          .harga_cicilan_7x
                                                      .toString();
                                                  if (provider
                                                          .rincianSurveyorModelData
                                                          .dp_cicilan_7x <
                                                      provider
                                                          .rincianSurveyorModelData
                                                          .uang_muka) {
                                                    var calcSisaDpCicilan = provider
                                                          .rincianSurveyorModelData
                                                          .uang_muka - provider
                                                          .rincianSurveyorModelData
                                                          .dp_cicilan_7x;
                                                    valSisaDpCicilan = '0';
                                                    valKelebihanDpCicilan =
                                                      NumberFormat.currency(
                                                              locale: 'id',
                                                              symbol: '',
                                                              decimalDigits: 0)
                                                          .format(
                                                              calcSisaDpCicilan)
                                                          .toString();
                                                  } else {
                                                    var calcSisaDpCicilan = provider
                                                          .rincianSurveyorModelData
                                                          .dp_cicilan_7x -
                                                      provider
                                                          .rincianSurveyorModelData
                                                          .uang_muka;
                                                    valSisaDpCicilan =
                                                      NumberFormat.currency(
                                                              locale: 'id',
                                                              symbol: '',
                                                              decimalDigits: 0)
                                                          .format(
                                                              calcSisaDpCicilan)
                                                          .toString();
                                                    valKelebihanDpCicilan = '0';
                                                  }
                                                } else if (value == 8) {
                                                  valDpCicilan = provider
                                                          .rincianSurveyorModelData
                                                          .dp_cicilan_8x
                                                      .toString();
                                                  valCicilanPerBulan = provider
                                                          .rincianSurveyorModelData
                                                          .cicilan_per_bulan_8x
                                                      .toString();
                                                  valHargaBarang = provider
                                                          .rincianSurveyorModelData
                                                          .harga_cicilan_8x
                                                      .toString();
                                                  if (provider
                                                          .rincianSurveyorModelData
                                                          .dp_cicilan_8x <
                                                      provider
                                                          .rincianSurveyorModelData
                                                          .uang_muka) {
                                                    var calcSisaDpCicilan = provider
                                                          .rincianSurveyorModelData
                                                          .uang_muka - provider
                                                          .rincianSurveyorModelData
                                                          .dp_cicilan_8x;
                                                    valSisaDpCicilan = '0';
                                                    valKelebihanDpCicilan =
                                                      NumberFormat.currency(
                                                              locale: 'id',
                                                              symbol: '',
                                                              decimalDigits: 0)
                                                          .format(
                                                              calcSisaDpCicilan)
                                                          .toString();
                                                  } else {
                                                    var calcSisaDpCicilan = provider
                                                          .rincianSurveyorModelData
                                                          .dp_cicilan_8x -
                                                      provider
                                                          .rincianSurveyorModelData
                                                          .uang_muka;
                                                    valSisaDpCicilan =
                                                      NumberFormat.currency(
                                                              locale: 'id',
                                                              symbol: '',
                                                              decimalDigits: 0)
                                                          .format(
                                                              calcSisaDpCicilan)
                                                          .toString();
                                                    valKelebihanDpCicilan = '0';
                                                  }
                                                } else if (value == 9) {
                                                  valDpCicilan = provider
                                                          .rincianSurveyorModelData
                                                          .dp_cicilan_9x
                                                      .toString();
                                                  valCicilanPerBulan = provider
                                                          .rincianSurveyorModelData
                                                          .cicilan_per_bulan_9x
                                                      .toString();
                                                  valHargaBarang = provider
                                                          .rincianSurveyorModelData
                                                          .harga_cicilan_9x
                                                      .toString();
                                                  if (provider
                                                          .rincianSurveyorModelData
                                                          .dp_cicilan_9x <
                                                      provider
                                                          .rincianSurveyorModelData
                                                          .uang_muka) {
                                                    var calcSisaDpCicilan = provider
                                                          .rincianSurveyorModelData
                                                          .uang_muka - provider
                                                          .rincianSurveyorModelData
                                                          .dp_cicilan_9x;
                                                    valSisaDpCicilan = '0';
                                                    valKelebihanDpCicilan =
                                                      NumberFormat.currency(
                                                              locale: 'id',
                                                              symbol: '',
                                                              decimalDigits: 0)
                                                          .format(
                                                              calcSisaDpCicilan)
                                                          .toString();
                                                  } else {
                                                    var calcSisaDpCicilan = provider
                                                          .rincianSurveyorModelData
                                                          .dp_cicilan_9x -
                                                      provider
                                                          .rincianSurveyorModelData
                                                          .uang_muka;
                                                    valSisaDpCicilan =
                                                      NumberFormat.currency(
                                                              locale: 'id',
                                                              symbol: '',
                                                              decimalDigits: 0)
                                                          .format(
                                                              calcSisaDpCicilan)
                                                          .toString();
                                                    valKelebihanDpCicilan = '0';
                                                  }
                                                } else if (value == 10) {
                                                  valDpCicilan = provider
                                                          .rincianSurveyorModelData
                                                          .dp_cicilan_10x
                                                      .toString();
                                                  valCicilanPerBulan = provider
                                                          .rincianSurveyorModelData
                                                          .cicilan_per_bulan_10x
                                                      .toString();
                                                  valHargaBarang = provider
                                                          .rincianSurveyorModelData
                                                          .harga_cicilan_10x
                                                      .toString();
                                                  if (provider
                                                          .rincianSurveyorModelData
                                                          .dp_cicilan_10x <
                                                      provider
                                                          .rincianSurveyorModelData
                                                          .uang_muka) {
                                                    var calcSisaDpCicilan = provider
                                                          .rincianSurveyorModelData
                                                          .uang_muka - provider
                                                          .rincianSurveyorModelData
                                                          .dp_cicilan_10x;
                                                    valSisaDpCicilan = '0';
                                                    valKelebihanDpCicilan =
                                                      NumberFormat.currency(
                                                              locale: 'id',
                                                              symbol: '',
                                                              decimalDigits: 0)
                                                          .format(
                                                              calcSisaDpCicilan)
                                                          .toString();
                                                  } else {
                                                    var calcSisaDpCicilan = provider
                                                          .rincianSurveyorModelData
                                                          .dp_cicilan_10x -
                                                      provider
                                                          .rincianSurveyorModelData
                                                          .uang_muka;
                                                    valSisaDpCicilan =
                                                      NumberFormat.currency(
                                                              locale: 'id',
                                                              symbol: '',
                                                              decimalDigits: 0)
                                                          .format(
                                                              calcSisaDpCicilan)
                                                          .toString();
                                                    valKelebihanDpCicilan = '0';
                                                  }
                                                }
                                                valTanggalJatuhTempo = provider
                                                    .rincianSurveyorModelData
                                                    .tanggal_jatuh_tempo;

                                                hargaBarangController.text = NumberFormat.currency(
                                                              locale: 'id',
                                                              symbol: '',
                                                              decimalDigits: 0)
                                                          .format(
                                                              int.parse(valHargaBarang))
                                                          .toString();
                                                sisaPembayaranController.text = '0';
                                                dpCicilanController.text = NumberFormat.currency(
                                                              locale: 'id',
                                                              symbol: '',
                                                              decimalDigits: 0)
                                                          .format(
                                                              int.parse(valDpCicilan))
                                                          .toString();
                                                cicilanPerBulanController.text = NumberFormat.currency(
                                                              locale: 'id',
                                                              symbol: '',
                                                              decimalDigits: 0)
                                                          .format(
                                                              int.parse(valCicilanPerBulan))
                                                          .toString();
                                                sisaDpCicilanController.text =
                                                    valSisaDpCicilan.toString();
                                                kelebihanDpCicilanController.text =
                                                    valKelebihanDpCicilan.toString();
                                                tanggalJatuhTempoController
                                                        .text =
                                                    valTanggalJatuhTempo
                                                        .toString();

                                                provider.lama_cicilan =
                                                    value.toString();
                                                provider.dp_cicilan =
                                                    valDpCicilan.toString();
                                                provider.cicilan_per_bulan =
                                                    valCicilanPerBulan
                                                        .toString();
                                                provider.harga_barang =
                                                    valHargaBarang.toString();

                                                _isVisibleHargaBarang = true;
                                                _isVisibleHargaBarang = true;
                                                _isVisibleDpCicilan = true;
                                                _isVisibleCicilanPerBulan =
                                                    true;
                                                _isVisibleSisaDpCicilan = true;
                                                _isVisibleTanggalJatuhTempo =
                                                    true;
                                                setState(() {});
                                              },
                                            ),
                                          ),
                                          Visibility(
                                            visible: _isVisibleHargaBarang,
                                            child: TextFormField(
                                              decoration: InputDecoration(
                                                enabled: false,
                                                prefix: Text("Rp. "),
                                                labelText: 'Harga Barang',
                                                hintText: '',
                                              ),
                                              controller: hargaBarangController,
                                            ),
                                          ),
                                          Visibility(
                                            visible: _isVisibleSisaPembayaran,
                                            child: TextFormField(
                                              decoration: InputDecoration(
                                                enabled: false,
                                                prefix: Text("Rp. "),
                                                labelText: 'Sisa Pembayaran',
                                                hintText: '',
                                              ),
                                              controller: sisaPembayaranController,
                                            ),
                                          ),
                                          Visibility(
                                            visible: _isVisibleDpCicilan,
                                            child: TextFormField(
                                              decoration: InputDecoration(
                                                enabled: false,
                                                prefix: Text("Rp. "),
                                                labelText: 'Dp Cicilan',
                                                hintText: '',
                                              ),
                                              controller: dpCicilanController,
                                            ),
                                          ),
                                          Visibility(
                                            visible: _isVisibleCicilanPerBulan,
                                            child: TextFormField(
                                              decoration: InputDecoration(
                                                enabled: false,
                                                prefix: Text("Rp. "),
                                                labelText: 'Cicilan per Bulan',
                                                hintText: '',
                                              ),
                                              controller:
                                                  cicilanPerBulanController,
                                            ),
                                          ),
                                          Visibility(
                                            visible: _isVisibleSisaDpCicilan,
                                            child: TextFormField(
                                              decoration: InputDecoration(
                                                enabled: false,
                                                prefix: Text("Rp. "),
                                                labelText: 'Kekurangan Dp',
                                                hintText: '',
                                              ),
                                              controller:
                                                  sisaDpCicilanController,
                                            ),
                                          ),
                                          Visibility(
                                            visible: _isVisibleSisaDpCicilan,
                                            child: TextFormField(
                                              decoration: InputDecoration(
                                                enabled: false,
                                                prefix: Text("Rp. "),
                                                labelText: 'Kelebihan Dp',
                                                hintText: '',
                                              ),
                                              controller:
                                                  kelebihanDpCicilanController,
                                            ),
                                          ),
                                          Visibility(
                                            visible:
                                                _isVisibleTanggalJatuhTempo,
                                            child: TextFormField(
                                              decoration: InputDecoration(
                                                enabled: false,
                                                labelText:
                                                    'Tanggal Jatuh Tempo',
                                                hintText: '',
                                              ),
                                              controller:
                                                  tanggalJatuhTempoController,
                                            ),
                                          ),
                                          Visibility(
                                            visible: _isVisibleKeterangan,
                                            child: Container(
                                              child: TextFormField(
                                                decoration: InputDecoration(
                                                  labelText: 'Keterangan ',
                                                  hintText: '',
                                                ),
                                                onChanged: (text) {
                                                  provider.keterangan = text;
                                                },
                                              ),
                                            ),
                                          ),
                                          Visibility(
                                            visible: _isVisiblePilihKeterangan,
                                            child: Container(
                                              child: DropdownButtonFormField(
                                                decoration: InputDecoration(
                                                  labelText: 'Keterangan ',
                                                  labelStyle: AppTextStyle
                                                      .regularTextStyle
                                                      .copyWith(fontSize: 14),
                                                ),
                                                isExpanded: true,
                                                hint: Text("Pilih Keterangan "),
                                                value: _valStatusKeterangan,
                                                items: provider
                                                    .rincianSurveyorModelData
                                                    .keterangan
                                                    .map((item) {
                                                  return DropdownMenuItem(
                                                    child: Text(item),
                                                    value: item,
                                                  );
                                                }).toList(),
                                                onChanged: (value) {
                                                  allUnFocus();
                                                  provider.keterangan = value;
                                                  _valStatusKeterangan = value;
                                                  setState(() {});
                                                },
                                              ),
                                            ),
                                          ),
                                          Visibility(
                                            visible: _isVisibleStatusBatal,
                                            child: Container(
                                              padding: EdgeInsets.only(
                                                left: 5,
                                                top: 10,
                                                right: 5,
                                              ),
                                              child: Column(
                                                children: [
                                                  Container(
                                                    width: double.infinity,
                                                    child: RaisedButton(
                                                      child: Text(
                                                          'Bukti Foto Batal'),
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(6),
                                                      ),
                                                      color:
                                                          AppColors.blueColor,
                                                      textColor:
                                                          AppColors.whiteColor,
                                                      onPressed: () async {
                                                        fotoBatal = await AppRouter
                                                            .navToTakePictureScreen(
                                                                context);
                                                        if (fotoBatal != null) {
                                                          provider.bukti_foto_batal =
                                                              fotoBatal;
                                                        }
                                                        setState(() {});
                                                      },
                                                    ),
                                                  ),
                                                  Container(
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            0.5,
                                                    height:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            0.65,
                                                    color: Colors.grey[200],
                                                    child: (fotoBatal != null)
                                                        ? Image.file(fotoBatal)
                                                        : SizedBox(),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          Visibility(
                                            visible:
                                                _isVisibleTanggalSurveyBaru,
                                            child: InkWell(
                                              child: Container(
                                                margin: EdgeInsets.only(top: 8),
                                                width: double.infinity,
                                                padding: EdgeInsets.only(
                                                    top: 20, bottom: 10),
                                                decoration: BoxDecoration(
                                                  border: Border(
                                                    bottom: BorderSide(
                                                      color:
                                                          AppColors.grayColor,
                                                      width: 1,
                                                    ),
                                                  ),
                                                ),
                                                child: Text(
                                                  _valTanggalSurveyBaru,
                                                  style: AppTextStyle
                                                      .regularTextStyle
                                                      .copyWith(
                                                          color: AppColors
                                                              .grayColor,
                                                          fontSize: 16),
                                                ),
                                              ),
                                              onTap: () {
                                                allUnFocus();

                                                DatePicker.showDatePicker(
                                                    context,
                                                    showTitleActions: true,
                                                    currentTime: null,
                                                    minTime: new DateTime.now(),
                                                    onConfirm: (date) {
                                                  setState(() {
                                                    // var sDtime = dateFormatterHuman.format(date);
                                                    provider.tanggal_survey_baru =
                                                        dateFormatterSystem
                                                            .parse(date
                                                                .toString()
                                                                .split(" ")[0]
                                                                .toString())
                                                            .toString();
                                                    _valTanggalSurveyBaru =
                                                        dateFormatterSystem
                                                            .parse(date
                                                                .toString()
                                                                .split(" ")[0]
                                                                .toString())
                                                            .toString();
                                                  });
                                                });
                                                // _selectDatePicker(context, (''));
                                              },
                                            ),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          SizedBox(
                                            height: 30,
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(top: 8),
                                            width: double.infinity,
                                            child: RaisedButton(
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(12),
                                              ),
                                              onPressed: () {
                                                allUnFocus();
                                                provider.saveSurveyor();
                                              },
                                              color: AppColors.blueColor,
                                              textColor: AppColors.whiteColor,
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      25.0, 17.0, 25.0, 17.0),
                                              child: Text("Simpan",
                                                  style:
                                                      TextStyle(fontSize: 18)),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}

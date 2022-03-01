// import 'dart:html';
import 'package:bintang_ezella_mobile_app/core/providers/listener_provider.dart';
import 'package:bintang_ezella_mobile_app/core/providers/surveyor_riwayat_detail_provider.dart';
import 'package:bintang_ezella_mobile_app/ui/theme/theme.dart';
import 'package:bintang_ezella_mobile_app/ui/view/main/surveyor/print_riwayat_surveyor_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:intl/intl.dart';
import 'package:bintang_ezella_mobile_app/ui/widget/shimmer_page.dart';

class RiwayatSurveyorDetailPage extends StatefulWidget {
  final int id;
  const RiwayatSurveyorDetailPage(this.id);

  @override
  RiwayatSurveyorDetailPageState createState() =>
      RiwayatSurveyorDetailPageState();
}

class RiwayatSurveyorDetailPageState extends State<RiwayatSurveyorDetailPage> {
  String _valStatus;
  String _valStatusKeterangan;
  String _valStatusBatal;
  String _valStatus_cicilan;
  String _valStatusPembelian;
  String _valPilihKeterangan;
  String _valKeterangan;
  String _valTipeCicilan;

  String valCicilanPerBulan;
  String valDpCicilan;
  String valSisaDpCicilan;
  String valTanggalJatuhTempo;
  String valHargaBarang;
  bool _isVisibleHargaBarang = false;
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
  TextEditingController dpCicilanController = new TextEditingController();
  TextEditingController cicilanPerBulanController = new TextEditingController();
  TextEditingController sisaDpCicilanController = new TextEditingController();
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
      model: RiwayatSurveyorDetailProvider(context, widget.id.toString()),
      builder: (RiwayatSurveyorDetailProvider provider) => provider.loading ==
              true
          ? ShimmerPage(
              header: "1",
            )
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
                                  "Rincian Riwayat Surveyor",
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
                      child: ListView(
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
                                                .riwayatSurveyorDetailModelData
                                                .nama_customer,
                                            style: AppTextStyle.boldTextStyle
                                                .copyWith(
                                              fontSize: 14,
                                              fontWeight: FontWeight.normal,
                                            ),
                                          ),
                                          Container(
                                            padding:
                                                EdgeInsets.fromLTRB(5, 3, 5, 3),
                                            decoration: BoxDecoration(
                                              color: AppColors.redColor,
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                            ),
                                            child: Text(
                                              "Jatuh tempo " +
                                                  provider
                                                      .riwayatSurveyorDetailModelData
                                                      .tanggal_jatuh_tempo,
                                              style: AppTextStyle.boldTextStyle
                                                  .copyWith(
                                                      fontSize: 10,
                                                      color:
                                                          AppColors.whiteColor),
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
                                              style: AppTextStyle.boldTextStyle
                                                  .copyWith(
                                                      fontSize: 12,
                                                      color:
                                                          AppColors.grayColor),
                                            ),
                                            SizedBox(
                                              height: 6,
                                            ),
                                            Text(
                                              provider
                                                  .riwayatSurveyorDetailModelData
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
                                              style: AppTextStyle.boldTextStyle
                                                  .copyWith(
                                                      fontSize: 12,
                                                      color:
                                                          AppColors.grayColor),
                                            ),
                                            SizedBox(
                                              height: 6,
                                            ),
                                            Text(
                                              provider
                                                  .riwayatSurveyorDetailModelData
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
                                              style: AppTextStyle.boldTextStyle
                                                  .copyWith(
                                                      fontSize: 12,
                                                      color:
                                                          AppColors.grayColor),
                                            ),
                                            SizedBox(
                                              height: 6,
                                            ),
                                            Text(
                                              provider.riwayatSurveyorDetailModelData
                                                          .alamat_email ==
                                                      null
                                                  ? '-'
                                                  : provider
                                                      .riwayatSurveyorDetailModelData
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
                                    style: AppTextStyle.boldTextStyle.copyWith(
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
                                                      color:
                                                          AppColors.grayColor),
                                            ),
                                            SizedBox(
                                              height: 6,
                                            ),
                                            Text(
                                              provider
                                                  .riwayatSurveyorDetailModelData
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
                                                      color:
                                                          AppColors.grayColor),
                                            ),
                                            SizedBox(
                                              height: 6,
                                            ),
                                            Text(
                                              provider
                                                  .riwayatSurveyorDetailModelData
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
                                              'Harga ',
                                              style: AppTextStyle
                                                  .regularTextStyle
                                                  .copyWith(
                                                      fontSize: 11,
                                                      color:
                                                          AppColors.grayColor),
                                            ),
                                            SizedBox(
                                              height: 6,
                                            ),
                                            Text(
                                              NumberFormat.currency(
                                                      locale: 'id',
                                                      symbol: 'Rp ',
                                                      decimalDigits: 0)
                                                  .format(provider
                                                      .riwayatSurveyorDetailModelData
                                                      .harga)
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
                                                      color:
                                                          AppColors.grayColor),
                                            ),
                                            SizedBox(
                                              height: 6,
                                            ),
                                            Text(
                                              NumberFormat.currency(
                                                      locale: 'id',
                                                      symbol: 'Rp ',
                                                      decimalDigits: 0)
                                                  .format(provider
                                                      .riwayatSurveyorDetailModelData
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
                                SizedBox(height: 16),
                                (provider.riwayatSurveyorDetailModelData
                                            .status_pembelian ==
                                        'Cicilan')
                                    ? Column(
                                        children: [
                                          Container(
                                            child: Row(
                                              children: [
                                                Expanded(
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        'Status Pembelian',
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
                                                            .riwayatSurveyorDetailModelData
                                                            .status_pembelian
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
                                          SizedBox(height: 16),
                                          Container(
                                            child: Row(
                                              children: [
                                                Expanded(
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        'Lama Cicilan',
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
                                                        provider.riwayatSurveyorDetailModelData
                                                                .lama_cicilan
                                                                .toString() +
                                                            " x",
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
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        'Cicilan Per Bulan',
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
                                                                symbol: 'Rp ',
                                                                decimalDigits:
                                                                    0)
                                                            .format(provider
                                                                .riwayatSurveyorDetailModelData
                                                                .cicilan_per_bulan)
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
                                          SizedBox(height: 16),
                                          Container(
                                            child: Row(
                                              children: [
                                                Expanded(
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        'Tanggal Survey',
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
                                                        (provider
                                                            .riwayatSurveyorDetailModelData
                                                            .tanggal_survey),
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
                                        ],
                                      )
                                    : Container(
                                        child: Row(
                                          children: [
                                            Expanded(
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    'Status Pembelian',
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
                                                        .riwayatSurveyorDetailModelData
                                                        .status_pembelian
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
                                              'Nama Surveyor',
                                              style: AppTextStyle
                                                  .regularTextStyle
                                                  .copyWith(
                                                      fontSize: 11,
                                                      color:
                                                          AppColors.grayColor),
                                            ),
                                            SizedBox(
                                              height: 6,
                                            ),
                                            Text(
                                              provider
                                                  .loginModel.data.namaLengkap,
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
                                  height: 60,
                                ),
                              ],
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(20),
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: AppColors.whiteColor,
                            ),
                            child: RaisedButton(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (_) => PrintRiwayatPage(
                                            widget.id.toString())));
                              },
                              color: AppColors.blueColor,
                              textColor: AppColors.whiteColor,
                              padding: const EdgeInsets.fromLTRB(
                                  25.0, 17.0, 25.0, 17.0),
                              child: Text("Cetak Ulang Struk".toUpperCase(),
                                  style: TextStyle(fontSize: 18)),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.fromLTRB(20, 0, 20, 20),
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: AppColors.whiteColor,
                            ),
                            child: RaisedButton(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              color: AppColors.whiteColor,
                              textColor: AppColors.mainColor,
                              padding: const EdgeInsets.fromLTRB(
                                  25.0, 17.0, 25.0, 17.0),
                              child: Text("Kembali".toUpperCase(),
                                  style: TextStyle(fontSize: 18)),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}

// import 'dart:html';
import 'package:bintang_ezella_mobile_app/core/providers/listener_provider.dart';
import 'package:bintang_ezella_mobile_app/core/providers/collector_rincian_penagihan_provider.dart';

import 'package:bintang_ezella_mobile_app/ui/theme/theme.dart';
// import 'package:bintang_ezella_mobile_app/ui/view/main/supervisor/tambah_pelanggan_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:intl/intl.dart';
import './riwayat_penagihan_page.dart';

// ignore: must_be_immutable
class DetailJadwalPenjualanPage extends StatefulWidget {
  final int id;
  const DetailJadwalPenjualanPage(this.id);

  @override
  _DetailJadwalPenjualanPageState createState() =>
      _DetailJadwalPenjualanPageState();
}

class _DetailJadwalPenjualanPageState extends State<DetailJadwalPenjualanPage> {
  String _valStatusPembayaran;
  String _valStatusKeterangan;
  String _valTanggalPenagihanUlang = 'Tanggal Penagihan Ulang';
  bool _isVisibleJumlahBayar = false;
  bool _isVisibleTanggalPenagihanUlang = false;
  TextEditingController jumlahBayarController = new TextEditingController();

  FocusNode n1 = FocusNode();
  FocusNode n2 = FocusNode();

  allUnFocus() {
    n1.unfocus();
    n2.unfocus();
  }

  var dateFormatterHuman = new DateFormat('dd-MM-yyyy');
  var dateFormatterSystem = new DateFormat('yyyy-MM-dd');

  @override
  Widget build(BuildContext context) {
    return ListenerProvider(
      model: CollectorRincianPenagihanProvider(context, widget.id.toString()),
      builder: (CollectorRincianPenagihanProvider provider) => provider
                  .loading ==
              true
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
                                  "Rincian Penagihan"
                                  // + id.toString()
                                  ,
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
                                              Expanded(
                                                child: Text(
                                                    provider
                                                        .rincianPenagihanModelData
                                                        .customer
                                                        .namaLengkap,
                                                    maxLines: 1,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    style: AppTextStyle
                                                        .boldTextStyle
                                                        .copyWith(
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.normal,
                                                    )),
                                              ),
                                              Container(
                                                padding: EdgeInsets.fromLTRB(
                                                    5, 3, 5, 3),
                                                decoration: BoxDecoration(
                                                  color: AppColors.redColor,
                                                  borderRadius:
                                                      BorderRadius.circular(5),
                                                ),
                                                child: Text(
                                                  "Jatuh tempo " +
                                                      DateFormat('dd MMM yyyy')
                                                          .format(DateTime
                                                              .parse(provider
                                                                  .rincianPenagihanModelData
                                                                  .customer
                                                                  .jatuhTempo)),
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
                                                      .rincianPenagihanModelData
                                                      .customer
                                                      .alamatLengkap,
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
                                                      .rincianPenagihanModelData
                                                      .customer
                                                      .noHp,
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
                                                  provider
                                                              .rincianPenagihanModelData
                                                              .customer
                                                              .alamatEmail !=
                                                          null
                                                      ? provider
                                                          .rincianPenagihanModelData
                                                          .customer
                                                          .namaLengkap
                                                      : '-',
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
                                    Container(
                                      child: Text(
                                        'Info Produk',
                                        style: AppTextStyle.boldTextStyle
                                            .copyWith(
                                                fontSize: 13,
                                                color: AppColors.grayColor),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 12,
                                    ),
                                    Container(
                                      child: Row(
                                        children: [
                                          Container(
                                            child: Image.network(
                                              provider.rincianPenagihanModelData
                                                  .produk.gambarProduk,
                                              width: 80,
                                              height: 80,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Expanded(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Container(
                                                  child: Text(
                                                    provider
                                                        .rincianPenagihanModelData
                                                        .produk
                                                        .namaProduk,
                                                    style: AppTextStyle
                                                        .regularTextStyle
                                                        .copyWith(fontSize: 13),
                                                  ),
                                                ),
                                                Container(
                                                  child: Text(
                                                    provider
                                                        .rincianPenagihanModelData
                                                        .produk
                                                        .hargaProduk,
                                                    style: AppTextStyle
                                                        .boldTextStyle
                                                        .copyWith(fontSize: 14),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                        ],
                                      ),
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
                                        'Info Penagihan',
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
                                                  'Uang Muka',
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
                                                      .rincianPenagihanModelData
                                                      .penagihan
                                                      .uangMuka,
                                                  style: AppTextStyle
                                                      .regularTextStyle
                                                      .copyWith(
                                                    fontSize: 12,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Expanded(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  'Jumlah Cicilan',
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
                                                      .rincianPenagihanModelData
                                                      .penagihan
                                                      .jumlahCicilan,
                                                  style: AppTextStyle
                                                      .regularTextStyle
                                                      .copyWith(
                                                    fontSize: 12,
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
                                                  'Sisa Cicilan',
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
                                                      .rincianPenagihanModelData
                                                      .penagihan
                                                      .sisaCicilan,
                                                  style: AppTextStyle
                                                      .regularTextStyle
                                                      .copyWith(
                                                    fontSize: 12,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Expanded(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  'Cicilan / Bulan',
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
                                                      .rincianPenagihanModelData
                                                      .penagihan
                                                      .cicilanPerBulan,
                                                  style: AppTextStyle
                                                      .regularTextStyle
                                                      .copyWith(
                                                    fontSize: 12,
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
                                                  'Lama Cicilan',
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
                                                      .rincianPenagihanModelData
                                                      .penagihan
                                                      .lamaCicilan,
                                                  style: AppTextStyle
                                                      .regularTextStyle
                                                      .copyWith(
                                                    fontSize: 12,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Expanded(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  'Cicilan ke-',
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
                                                      .rincianPenagihanModelData
                                                      .penagihan
                                                      .cicilanKe
                                                      .toString(),
                                                  style: AppTextStyle
                                                      .regularTextStyle
                                                      .copyWith(
                                                    fontSize: 12,
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
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            child: DropdownButtonFormField(
                                              decoration: InputDecoration(
                                                labelText: 'Status Pembayaran',
                                                labelStyle: AppTextStyle
                                                    .regularTextStyle
                                                    .copyWith(fontSize: 14),
                                              ),
                                              isExpanded: true,
                                              hint: Text(
                                                  "Pilih Status Pembayaran"),
                                              value: _valStatusPembayaran,
                                              items: provider
                                                  .rincianPenagihanModelData
                                                  .pembayaran
                                                  .map((item) {
                                                return DropdownMenuItem(
                                                  child: Text(item),
                                                  value: item,
                                                );
                                              }).toList(),
                                              onChanged: (value) {
                                                allUnFocus();

                                                if (value == "Bayar") {
                                                  provider.jumlah_bayar = provider
                                                      .rincianPenagihanModelData
                                                      .penagihan
                                                      .harusBayar
                                                      .toString();
                                                  jumlahBayarController
                                                      .text = NumberFormat
                                                          .currency(
                                                              locale: 'id',
                                                              symbol: '',
                                                              decimalDigits: 0)
                                                      .format(provider
                                                          .rincianPenagihanModelData
                                                          .penagihan
                                                          .harusBayar)
                                                      .toString();
                                                  _isVisibleJumlahBayar = true;
                                                  _isVisibleTanggalPenagihanUlang =
                                                      false;
                                                } else {
                                                  if (value == "Tidak Bayar") {
                                                    _isVisibleTanggalPenagihanUlang =
                                                        true;
                                                  } else {
                                                    _isVisibleTanggalPenagihanUlang =
                                                        false;
                                                  }
                                                  provider.jumlah_bayar = '0';
                                                  jumlahBayarController.text =
                                                      '0';
                                                  _isVisibleJumlahBayar = false;
                                                }
                                                provider.status_bayar =
                                                    value.toString();
                                                _valStatusPembayaran = value;

                                                setState(() {});
                                              },
                                            ),
                                          ),
                                          Visibility(
                                            visible: _isVisibleJumlahBayar,
                                            child: Container(
                                              margin: EdgeInsets.only(top: 8),
                                              child: TextFormField(
                                                style: AppTextStyle
                                                    .regularTextStyle
                                                    .copyWith(
                                                        color: AppColors
                                                            .blackColor),
                                                decoration: InputDecoration(
                                                  labelText: 'Jumlah Bayar',
                                                  prefix: Text('Rp.'),
                                                  labelStyle: AppTextStyle
                                                      .regularTextStyle
                                                      .copyWith(fontSize: 14),
                                                ),
                                                keyboardType:
                                                    TextInputType.number,
                                                controller:
                                                    jumlahBayarController,
                                                focusNode: n1,
                                                onChanged: (text) {
                                                  provider.jumlah_bayar =
                                                      text.replaceAll('.', '');
                                                  if (text != null &&
                                                      text != '') {
                                                    var string =
                                                        NumberFormat.currency(
                                                                locale: 'id',
                                                                symbol: '',
                                                                decimalDigits:
                                                                    0)
                                                            .format(int.parse(
                                                                text
                                                                    .toString()
                                                                    .replaceAll(
                                                                        '.',
                                                                        '')))
                                                            .toString();
                                                    jumlahBayarController
                                                            .value =
                                                        TextEditingValue(
                                                      text: string,
                                                      selection: TextSelection
                                                          .collapsed(
                                                              offset: string
                                                                  .length),
                                                    );

                                                    if (int.parse(text
                                                            .toString()
                                                            .replaceAll(
                                                                '.', '')) <
                                                        provider
                                                            .rincianPenagihanModelData
                                                            .penagihan
                                                            .harusBayar) {
                                                      _isVisibleTanggalPenagihanUlang =
                                                          true;
                                                    } else {
                                                      _isVisibleTanggalPenagihanUlang =
                                                          false;
                                                    }
                                                  }
                                                },
                                              ),
                                            ),
                                          ),
                                          Visibility(
                                            visible:
                                                _isVisibleTanggalPenagihanUlang,
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
                                                  _valTanggalPenagihanUlang,
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
                                                    provider.tanggal_penagihan_ulang =
                                                        dateFormatterSystem
                                                            .parse(date
                                                                .toString()
                                                                .split(" ")[0]
                                                                .toString())
                                                            .toString();
                                                    _valTanggalPenagihanUlang =
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
                                          Container(
                                            margin: EdgeInsets.only(top: 8),
                                            child: DropdownButtonFormField(
                                              decoration: InputDecoration(
                                                labelText:
                                                    'Keterangan Aktivitas',
                                                labelStyle: AppTextStyle
                                                    .regularTextStyle
                                                    .copyWith(fontSize: 14),
                                              ),
                                              isExpanded: true,
                                              hint: Text(
                                                  "Pilih Keterangan Aktivitas"),
                                              value: _valStatusKeterangan,
                                              items: provider
                                                  .rincianPenagihanModelData
                                                  .aktivitas
                                                  .map((item) {
                                                return DropdownMenuItem(
                                                  child: Text(item),
                                                  value: item,
                                                );
                                              }).toList(),
                                              onChanged: (value) {
                                                allUnFocus();

                                                provider.aktivitas_kolektor =
                                                    value.toString();
                                                provider.jadwal_penagihan_id =
                                                    widget.id.toString();
                                                provider.tanggal_penagihan =
                                                    DateFormat('yyyy-MM-dd')
                                                        .format(DateTime.now());
                                                _valStatusKeterangan = value;

                                                setState(() {});
                                              },
                                            ),
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(top: 8),
                                            child: TextFormField(
                                              style: AppTextStyle
                                                  .regularTextStyle
                                                  .copyWith(
                                                      color:
                                                          AppColors.blackColor),
                                              decoration: InputDecoration(
                                                labelText: 'Keterangan',
                                                labelStyle: AppTextStyle
                                                    .regularTextStyle
                                                    .copyWith(fontSize: 14),
                                              ),
                                              focusNode: n2,
                                              onChanged: (text) {
                                                provider.keterangan = text;
                                              },
                                            ),
                                          ),
                                          SizedBox(
                                            height: 20,
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
                                                provider.savePenagihan();
                                                // Navigator.push(
                                                //   context,
                                                //   MaterialPageRoute(
                                                //       builder: (context) =>
                                                //           RiwayatPenagihanPage()),
                                                // );
                                              },
                                              color: AppColors.blueColor,
                                              textColor: AppColors.whiteColor,
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      25.0, 17.0, 25.0, 17.0),
                                              child: Text(
                                                  "Simpan ".toUpperCase(),
                                                  style:
                                                      TextStyle(fontSize: 18)),
                                            ),
                                          ),
                                          // Container(
                                          //   margin: EdgeInsets.only(top: 8),
                                          //   width: double.infinity,
                                          //   child: TextButton(
                                          //     child: Text("Cetak Ulang",
                                          //         style: AppTextStyle.boldTextStyle
                                          //             .copyWith(
                                          //                 fontSize: 14,
                                          //                 color:
                                          //                     AppColors.mainColor)),
                                          //     style: ButtonStyle(
                                          //       padding: MaterialStateProperty.all<
                                          //           EdgeInsets>(
                                          //         EdgeInsets.all(20),
                                          //       ),
                                          //       shape: MaterialStateProperty.all<
                                          //           RoundedRectangleBorder>(
                                          //         RoundedRectangleBorder(
                                          //           borderRadius:
                                          //               BorderRadius.circular(18.0),
                                          //           side: BorderSide(
                                          //               color: AppColors.mainColor),
                                          //         ),
                                          //       ),
                                          //     ),
                                          //   ),
                                          // ),
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

// import 'dart:html';
import 'package:bintang_ezella_mobile_app/core/providers/listener_provider.dart';
import 'package:bintang_ezella_mobile_app/core/providers/collector_riwayat_penagihan_detail_provider.dart';

import 'package:bintang_ezella_mobile_app/ui/view/main/collector/print_riwayat_penagihan_page.dart';
import 'package:bintang_ezella_mobile_app/ui/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:intl/intl.dart';

class RiwayatPenagihanDetailPage extends StatefulWidget {
  final int id;
  const RiwayatPenagihanDetailPage(this.id);

  @override
  _RiwayatPenagihanDetailPageState createState() =>
      _RiwayatPenagihanDetailPageState();
}

class _RiwayatPenagihanDetailPageState
    extends State<RiwayatPenagihanDetailPage> {
  String _valStatusPembayaran;
  String _valStatusKeterangan;

  FocusNode n1 = FocusNode();
  FocusNode n2 = FocusNode();

  allUnFocus() {
    n1.unfocus();
    n2.unfocus();
  }

  @override
  Widget build(BuildContext context) {
    return ListenerProvider(
      model: CollectorRiwayatPenagihanDetailProvider(
          context, widget.id.toString()),
      builder: (CollectorRiwayatPenagihanDetailProvider provider) => provider
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
                                          Expanded(
                                            child: Text(
                                                // widget.id.toString()
                                                provider
                                                    .riwayatPenagihanDetailModelData
                                                    .customer
                                                    .namaLengkap,
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                                style: AppTextStyle
                                                    .boldTextStyle
                                                    .copyWith(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.normal,
                                                )),
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
                                                      .riwayatPenagihanDetailModelData
                                                      .customer
                                                      .jatuhTempo,
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
                                                  .riwayatPenagihanDetailModelData
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
                                                  .riwayatPenagihanDetailModelData
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
                                              provider.riwayatPenagihanDetailModelData
                                                          .customer.alamatEmail !=
                                                      null
                                                  ? provider
                                                      .riwayatPenagihanDetailModelData
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
                                    style: AppTextStyle.boldTextStyle.copyWith(
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
                                          provider
                                              .riwayatPenagihanDetailModelData
                                              .produk
                                              .gambarProduk,
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
                                                    .riwayatPenagihanDetailModelData
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
                                                    .riwayatPenagihanDetailModelData
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
                                    style: AppTextStyle.boldTextStyle.copyWith(
                                        fontSize: 13,
                                        color: AppColors.grayColor),
                                  ),
                                ),
                                SizedBox(height: 16),
                                Container(
                                    child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'No Faktur',
                                      style: AppTextStyle.boldTextStyle
                                          .copyWith(
                                              fontSize: 12,
                                              color: AppColors.grayColor),
                                    ),
                                    SizedBox(
                                      height: 6,
                                    ),
                                    Text(
                                      provider.riwayatPenagihanDetailModelData
                                          .penagihan.noFaktur,
                                      style: AppTextStyle.regularTextStyle
                                          .copyWith(
                                        fontSize: 12,
                                      ),
                                    ),
                                  ],
                                )),
                                SizedBox(
                                  height: 30,
                                ),
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
                                                  .riwayatPenagihanDetailModelData
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
                                                  .riwayatPenagihanDetailModelData
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
                                                  .riwayatPenagihanDetailModelData
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
                                                  .riwayatPenagihanDetailModelData
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
                                                  .riwayatPenagihanDetailModelData
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
                                                  .riwayatPenagihanDetailModelData
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
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Status Pembayaran',
                                      style: AppTextStyle.boldTextStyle
                                          .copyWith(
                                              fontSize: 12,
                                              color: AppColors.grayColor),
                                    ),
                                    SizedBox(
                                      height: 6,
                                    ),
                                    Text(
                                      provider.riwayatPenagihanDetailModelData
                                          .penagihan.status_pembayaran
                                      // .toString(),
                                      ,
                                      style: AppTextStyle.regularTextStyle
                                          .copyWith(
                                        fontSize: 12,
                                      ),
                                    ),
                                  ],
                                )),
                                SizedBox(
                                  height: 6,
                                ),

                                SizedBox(
                                  height: 20,
                                ),
                                Container(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Jumlah Bayar',
                                        style: AppTextStyle.boldTextStyle
                                            .copyWith(
                                                fontSize: 12,
                                                color: AppColors.grayColor),
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
                                                .riwayatPenagihanDetailModelData
                                                .penagihan
                                                .jumlahBayar)
                                            .toString(),
                                        style: AppTextStyle.regularTextStyle
                                            .copyWith(
                                          fontSize: 12,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),

                                SizedBox(
                                  height: 20,
                                ),
                                // Text("Status Pembayaran"),
                                Container(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Keterangan Aktivitas',
                                        style: AppTextStyle.boldTextStyle
                                            .copyWith(
                                                fontSize: 12,
                                                color: AppColors.grayColor),
                                      ),
                                      SizedBox(
                                        height: 6,
                                      ),
                                      Text(
                                        provider.riwayatPenagihanDetailModelData
                                            .penagihan.aktivitas_kolektor
                                        // .toString(),
                                        ,
                                        style: AppTextStyle.regularTextStyle
                                            .copyWith(
                                          fontSize: 12,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),

                                SizedBox(
                                  height: 20,
                                ),
                                Container(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Keterangan ',
                                        style: AppTextStyle.boldTextStyle
                                            .copyWith(
                                                fontSize: 12,
                                                color: AppColors.grayColor),
                                      ),
                                      SizedBox(
                                        height: 6,
                                      ),
                                      Text(
                                        provider.riwayatPenagihanDetailModelData
                                                    .penagihan.keterangan ==
                                                null
                                            ? ' - '
                                            : provider
                                                .riwayatPenagihanDetailModelData
                                                .penagihan
                                                .keterangan,
                                        style: AppTextStyle.regularTextStyle
                                            .copyWith(
                                          fontSize: 14,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),

                                // SizedBox(
                                //   height: 30,
                                // ),
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
                                        builder: (_) =>
                                            PrintRiwayatPenagihanPage(
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

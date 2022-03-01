import 'dart:convert';

import 'package:bintang_ezella_mobile_app/core/providers/listener_provider.dart';
import 'package:bintang_ezella_mobile_app/core/providers/supervisor_detail_transaksi_provider.dart';
import 'package:bintang_ezella_mobile_app/ui/theme/theme.dart';
import 'package:bintang_ezella_mobile_app/ui/view/main/supervisor/print_transaksi_page.dart';
import 'package:bintang_ezella_mobile_app/ui/widget/shimmer_page.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class RiwayatTransaksiDetailPage extends StatefulWidget {
  final String id;
  const RiwayatTransaksiDetailPage(this.id);

  @override
  _RiwayatTransaksiDetailPageState createState() =>
      _RiwayatTransaksiDetailPageState();
}

class _RiwayatTransaksiDetailPageState
    extends State<RiwayatTransaksiDetailPage> {
  @override
  Widget build(BuildContext context) {
    return ListenerProvider(
      model: SupervisorDetailTransaksiProvider(context, widget.id),
      builder: (SupervisorDetailTransaksiProvider provider) => provider
                  .loading ==
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
                      padding: EdgeInsets.symmetric(horizontal: 20),
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
                                  width: 12,
                                ),
                                Text(
                                  "Detail Transaksi Penjualan",
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
                        child: Column(
                          children: [
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
                                      'Pesanan',
                                      style: AppTextStyle.boldTextStyle
                                          .copyWith(fontSize: 13),
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
                                            provider.detailTransaksiModelData
                                                .pesanan.gambarProduk,
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
                                                      .detailTransaksiModelData
                                                      .pesanan
                                                      .namaProduk,
                                                  style: AppTextStyle
                                                      .regularTextStyle
                                                      .copyWith(fontSize: 13),
                                                ),
                                              ),
                                              Container(
                                                child: Text(
                                                  NumberFormat.currency(
                                                          locale: 'id',
                                                          symbol: 'Rp ',
                                                          decimalDigits: 0)
                                                      .format(provider
                                                          .detailTransaksiModelData
                                                          .pesanan
                                                          .hargaProduk),
                                                  style: AppTextStyle
                                                      .boldTextStyle
                                                      .copyWith(fontSize: 14),
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
                            Divider(
                              height: 2,
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
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Pelanggan',
                                          style: AppTextStyle.boldTextStyle
                                              .copyWith(fontSize: 13),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  Container(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'Nama',
                                                style: AppTextStyle
                                                    .regularTextStyle
                                                    .copyWith(
                                                  fontSize: 12,
                                                  color: AppColors
                                                      .bodyTextGreyColor,
                                                ),
                                              ),
                                              SizedBox(height: 5),
                                              Text(
                                                provider
                                                    .detailTransaksiModelData
                                                    .pelanggan
                                                    .namaLengkap,
                                                style: AppTextStyle
                                                    .regularTextStyle
                                                    .copyWith(
                                                  fontSize: 14,
                                                  color:
                                                      AppColors.bodyTextColor,
                                                ),
                                              ),
                                              SizedBox(height: 12),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'No. HP',
                                                style: AppTextStyle
                                                    .regularTextStyle
                                                    .copyWith(
                                                  fontSize: 12,
                                                  color: AppColors
                                                      .bodyTextGreyColor,
                                                ),
                                              ),
                                              SizedBox(height: 5),
                                              Text(
                                                provider
                                                    .detailTransaksiModelData
                                                    .pelanggan
                                                    .noHp,
                                                style: AppTextStyle
                                                    .regularTextStyle
                                                    .copyWith(
                                                  fontSize: 14,
                                                  color:
                                                      AppColors.bodyTextColor,
                                                ),
                                              ),
                                              SizedBox(height: 12),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'Alamat',
                                                style: AppTextStyle
                                                    .regularTextStyle
                                                    .copyWith(
                                                  fontSize: 12,
                                                  color: AppColors
                                                      .bodyTextGreyColor,
                                                ),
                                              ),
                                              SizedBox(height: 5),
                                              Text(
                                                provider
                                                    .detailTransaksiModelData
                                                    .pelanggan
                                                    .alamat,
                                                style: AppTextStyle
                                                    .regularTextStyle
                                                    .copyWith(
                                                  fontSize: 14,
                                                  color:
                                                      AppColors.bodyTextColor,
                                                ),
                                              ),
                                              SizedBox(height: 12),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Divider(
                              height: 2,
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
                                      'Pembayaran',
                                      style: AppTextStyle.boldTextStyle
                                          .copyWith(fontSize: 13),
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  Container(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'No Faktur',
                                                style: AppTextStyle
                                                    .regularTextStyle
                                                    .copyWith(
                                                  fontSize: 12,
                                                  color: AppColors
                                                      .bodyTextGreyColor,
                                                ),
                                              ),
                                              SizedBox(height: 5),
                                              Text(
                                                provider
                                                    .detailTransaksiModelData
                                                    .pembayaran
                                                    .noFaktur,
                                                style: AppTextStyle
                                                    .regularTextStyle
                                                    .copyWith(
                                                  fontSize: 14,
                                                  color:
                                                      AppColors.bodyTextColor,
                                                ),
                                              ),
                                              SizedBox(height: 12),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'Status Pembayaran',
                                                style: AppTextStyle
                                                    .regularTextStyle
                                                    .copyWith(
                                                  fontSize: 12,
                                                  color: AppColors
                                                      .bodyTextGreyColor,
                                                ),
                                              ),
                                              SizedBox(height: 5),
                                              Text(
                                                provider
                                                    .detailTransaksiModelData
                                                    .pembayaran
                                                    .statusPenjualan,
                                                style: AppTextStyle
                                                    .regularTextStyle
                                                    .copyWith(
                                                  fontSize: 14,
                                                  color:
                                                      AppColors.bodyTextColor,
                                                ),
                                              ),
                                              SizedBox(height: 12),
                                            ],
                                          ),
                                        ),
                                        if (provider.detailTransaksiModelData
                                                .pembayaran.statusPenjualan ==
                                            'Cicilan')
                                          Container(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  'Tipe',
                                                  style: AppTextStyle
                                                      .regularTextStyle
                                                      .copyWith(
                                                    fontSize: 12,
                                                    color: AppColors
                                                        .bodyTextGreyColor,
                                                  ),
                                                ),
                                                SizedBox(height: 5),
                                                Text(
                                                  provider
                                                      .detailTransaksiModelData
                                                      .pembayaran
                                                      .tipeCicilan,
                                                  style: AppTextStyle
                                                      .regularTextStyle
                                                      .copyWith(
                                                    fontSize: 14,
                                                    color:
                                                        AppColors.bodyTextColor,
                                                  ),
                                                ),
                                                SizedBox(height: 12),
                                              ],
                                            ),
                                          ),
                                        Container(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'Uang Muka / DP',
                                                style: AppTextStyle
                                                    .regularTextStyle
                                                    .copyWith(
                                                  fontSize: 12,
                                                  color: AppColors
                                                      .bodyTextGreyColor,
                                                ),
                                              ),
                                              SizedBox(height: 5),
                                              Text(
                                                NumberFormat.currency(
                                                        locale: 'id',
                                                        symbol: 'Rp ',
                                                        decimalDigits: 0)
                                                    .format(provider
                                                        .detailTransaksiModelData
                                                        .pembayaran
                                                        .uangMuka)
                                                    .toString(),
                                                style: AppTextStyle
                                                    .regularTextStyle
                                                    .copyWith(
                                                  fontSize: 14,
                                                  color:
                                                      AppColors.bodyTextColor,
                                                ),
                                              ),
                                              SizedBox(height: 12),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'Total Harga',
                                                style: AppTextStyle
                                                    .regularTextStyle
                                                    .copyWith(
                                                  fontSize: 12,
                                                  color: AppColors
                                                      .bodyTextGreyColor,
                                                ),
                                              ),
                                              SizedBox(height: 5),
                                              Text(
                                                NumberFormat.currency(
                                                        locale: 'id',
                                                        symbol: 'Rp ',
                                                        decimalDigits: 0)
                                                    .format(provider
                                                        .detailTransaksiModelData
                                                        .pembayaran
                                                        .totalAmountPenjualan)
                                                    .toString(),
                                                style: AppTextStyle
                                                    .regularTextStyle
                                                    .copyWith(
                                                  fontSize: 14,
                                                  color:
                                                      AppColors.bodyTextColor,
                                                ),
                                              ),
                                              SizedBox(height: 12),
                                            ],
                                          ),
                                        ),
                                        if (provider.detailTransaksiModelData
                                                .pembayaran.tipeCicilan ==
                                            'Cicilan')
                                          Container(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  'Cicilan per Bulan',
                                                  style: AppTextStyle
                                                      .regularTextStyle
                                                      .copyWith(
                                                    fontSize: 12,
                                                    color: AppColors
                                                        .bodyTextGreyColor,
                                                  ),
                                                ),
                                                SizedBox(height: 5),
                                                Text(
                                                  provider
                                                      .detailTransaksiModelData
                                                      .pembayaran
                                                      .cicilanPerBulan
                                                      .toString(),
                                                  style: AppTextStyle
                                                      .regularTextStyle
                                                      .copyWith(
                                                    fontSize: 14,
                                                    color:
                                                        AppColors.bodyTextColor,
                                                  ),
                                                ),
                                                SizedBox(height: 12),
                                              ],
                                            ),
                                          ),
                                        Container(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'Keterangan Tambahan',
                                                style: AppTextStyle
                                                    .regularTextStyle
                                                    .copyWith(
                                                  fontSize: 12,
                                                  color: AppColors
                                                      .bodyTextGreyColor,
                                                ),
                                              ),
                                              SizedBox(height: 5),
                                              Text(
                                                provider
                                                    .detailTransaksiModelData
                                                    .pembayaran
                                                    .keterangan,
                                                style: AppTextStyle
                                                    .regularTextStyle
                                                    .copyWith(
                                                  fontSize: 14,
                                                  color:
                                                      AppColors.bodyTextColor,
                                                ),
                                              ),
                                              SizedBox(height: 12),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Divider(
                              height: 2,
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
                                              PrintTransaksiPage(widget.id)));
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
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}

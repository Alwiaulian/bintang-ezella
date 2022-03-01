import 'dart:io';
import 'dart:math';

import 'package:bintang_ezella_mobile_app/ui/router/router.dart';
import 'package:bintang_ezella_mobile_app/ui/widget/shimmer_page.dart';

import '../../card/riwayat_surveyor_card.dart';
import 'package:bintang_ezella_mobile_app/ui/theme/theme.dart';
import 'package:bintang_ezella_mobile_app/core/providers/listener_provider.dart';
import 'package:bintang_ezella_mobile_app/core/providers/surveyor_riwayat_provider.dart';
import 'package:flutter_responsive_screen/flutter_responsive_screen.dart';
import 'package:flutter/material.dart';

class RiwayatSurveyorPage extends StatefulWidget {
  final String search;
  RiwayatSurveyorPage(this.search);
  @override
  State<RiwayatSurveyorPage> createState() => _RiwayatSurveyorPageState();
}

class _RiwayatSurveyorPageState extends State<RiwayatSurveyorPage> {
  String inputSearch;

  TextEditingController inputSearchController = new TextEditingController();

  @override
  void initState() {
    if (widget.search != '' && widget.search != null) {
      inputSearchController.text = widget.search;
      inputSearch = widget.search;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Function wp = Screen(MediaQuery.of(context).size).wp;
    final Function hp = Screen(MediaQuery.of(context).size).hp;

    return ListenerProvider(
      model: SurveyorRiwayatProvider(context, widget.search),
      builder: (SurveyorRiwayatProvider provider) => provider.loading == true
          ? ShimmerPage(
              header: '2',
              content: '2',
            )
          : Scaffold(
              // appBar: AppBar(
              //   title: Text(
              //     "Daftar Produk",
              //     style: AppTextStyle.boldTextStyle.copyWith(fontSize: 18),
              //   ),
              //   backgroundColor: AppColors.whiteColor,
              // ),
              resizeToAvoidBottomInset: false,

              body: SafeArea(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: AppColors.whiteColor,
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              blurRadius: 15.0,
                              offset: Offset(0.0, 0.75)),
                        ],
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 30,
                          ),
                          Container(
                            child: Text(
                              "Riwayat Surveyor",
                              style: AppTextStyle.boldTextStyle
                                  .copyWith(fontSize: 18),
                            ),
                          ),
                          SizedBox(
                            height: 13,
                          ),
                          Container(
                            child: Row(
                              children: [
                                Expanded(
                                  child: TextFormField(
                                    decoration: InputDecoration(
                                      hintText: 'Cari ',
                                      filled: true,
                                      fillColor: AppColors.inputFillColor,
                                      hintStyle: AppTextStyle.regularTextStyle
                                          .copyWith(
                                              color: AppColors.grayColor,
                                              fontSize: 14),
                                      prefixIcon: Icon(Icons.search),
                                      contentPadding: EdgeInsets.symmetric(
                                          horizontal: 10, vertical: 15),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: AppColors.mainColor,
                                            width: 1),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: AppColors.inputBorderColor,
                                            width: 1),
                                      ),
                                    ),
                                    controller: inputSearchController,
                                    onChanged: (value) {
                                      inputSearch = value;
                                    },
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.only(left: 14),
                                  child: OutlinedButton(
                                    style: ButtonStyle(
                                      padding: MaterialStateProperty.all(
                                          EdgeInsets.all(8)),
                                    ),
                                    onPressed: () {
                                      return AppRouter.navToMainSurveyor(
                                          context, 1, inputSearch);
                                    },
                                    child: Icon(
                                      Icons.search,
                                      color: AppColors.grayColor,
                                      size: 30,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.green.shade50,
                                      border: Border.all(
                                          color: AppColors.greenColor),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 6, vertical: 8),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Container(
                                          child: Text(
                                            'Tunai',
                                            style: AppTextStyle.regularTextStyle
                                                .copyWith(
                                                    fontSize: 11,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                    color:
                                                        AppColors.greenColor),
                                          ),
                                        ),
                                        Container(
                                          child: Text(
                                            (provider.riwayatSurveyorModelData !=
                                                    null)
                                                ? 'Rp. ' +
                                                    provider
                                                        .riwayatSurveyorModelData
                                                        .totalTunai
                                                        .toString()
                                                : '',
                                            style: AppTextStyle.boldTextStyle
                                                .copyWith(
                                                    fontSize: 14,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                    color:
                                                        AppColors.greenColor),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.yellow.shade50,
                                      border: Border.all(
                                          color: AppColors.yellowColor),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 6, vertical: 8),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Container(
                                          child: Text(
                                            'Cicilan',
                                            style: AppTextStyle.regularTextStyle
                                                .copyWith(
                                                    fontSize: 11,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                    color:
                                                        AppColors.yellowColor),
                                          ),
                                        ),
                                        Container(
                                          child: Text(
                                            (provider.riwayatSurveyorModelData !=
                                                    null)
                                                ? 'Rp. ' +
                                                    provider
                                                        .riwayatSurveyorModelData
                                                        .totalCicilan
                                                        .toString()
                                                : '',
                                            style: AppTextStyle.boldTextStyle
                                                .copyWith(
                                                    fontSize: 14,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                    color:
                                                        AppColors.yellowColor),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.red.shade50,
                                      border:
                                          Border.all(color: AppColors.redColor),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 6, vertical: 8),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Container(
                                          child: Text(
                                            'Batal',
                                            style: AppTextStyle.regularTextStyle
                                                .copyWith(
                                                    fontSize: 11,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                    color: AppColors.redColor),
                                          ),
                                        ),
                                        Container(
                                          child: Text(
                                            (provider.riwayatSurveyorModelData !=
                                                    null)
                                                ? 'Rp. ' +
                                                    provider
                                                        .riwayatSurveyorModelData
                                                        .totalBatal
                                                        .toString()
                                                : '',
                                            style: AppTextStyle.boldTextStyle
                                                .copyWith(
                                                    fontSize: 14,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                    color: AppColors.redColor),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    (provider.riwayatSurveyorModelData.data.length > 0)
                        ? Expanded(
                            child: RefreshIndicator(
                              onRefresh: () {
                                return AppRouter.navToMainSurveyor(
                                    context, 1, inputSearch);
                              },
                              child: ListView(
                                children: [
                                  if (provider.riwayatSurveyorModelData != null)
                                    for (int i = 0;
                                        i <
                                            provider.riwayatSurveyorModelData
                                                .data.length;
                                        i++)
                                      Container(
                                        child: RiwayatSurveyorCard(
                                          id: provider.riwayatSurveyorModelData
                                              .data[i].id,
                                          kode_bayar: provider
                                              .riwayatSurveyorModelData
                                              .data[i]
                                              .noFaktur,
                                          status_bayar: provider
                                              .riwayatSurveyorModelData
                                              .data[i]
                                              .statusPembelian,
                                          nama: provider
                                              .riwayatSurveyorModelData
                                              .data[i]
                                              .namaCustomer,
                                          nominal: 'Rp. ' +
                                              provider.riwayatSurveyorModelData
                                                  .data[i].harga,
                                          produk: provider
                                              .riwayatSurveyorModelData
                                              .data[i]
                                              .namaProduk,
                                          jatuhtempo: provider
                                              .riwayatSurveyorModelData
                                              .data[i]
                                              .tanggalJatuhTempo,
                                          tanggalpenagihan: provider
                                              .riwayatSurveyorModelData
                                              .data[i]
                                              .tanggalSurvey,
                                        ),
                                      ),
                                  SizedBox(
                                    height: 6,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 0,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                        : Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  'Belum ada data surveyor',
                                  style: AppTextStyle.boldTextStyle
                                      .copyWith(fontSize: 13),
                                ),
                              ],
                            ),
                          )
                  ],
                ),
              ),
            ),
    );
  }
}

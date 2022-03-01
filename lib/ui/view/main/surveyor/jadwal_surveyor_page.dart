import 'dart:io';
import 'dart:math';

import 'package:bintang_ezella_mobile_app/ui/router/router.dart';
import 'package:bintang_ezella_mobile_app/ui/widget/shimmer_page.dart';
import 'package:flutter/material.dart';
import 'package:bintang_ezella_mobile_app/core/providers/listener_provider.dart';
import 'package:bintang_ezella_mobile_app/core/providers/surveyor_jadwal_provider.dart';
import 'package:flutter_responsive_screen/flutter_responsive_screen.dart';

import 'package:bintang_ezella_mobile_app/ui/theme/theme.dart';
import 'package:intl/intl.dart';
import '../../card/jadwal_surveyor_card.dart';

class JadwalSurveyorPage extends StatefulWidget {
  final String search;
  JadwalSurveyorPage(this.search);
  @override
  State<JadwalSurveyorPage> createState() => _JadwalSurveyorPageState();
}

class _JadwalSurveyorPageState extends State<JadwalSurveyorPage> {
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
      model: SurveyorJadwalProvider(context, widget.search),
      builder: (SurveyorJadwalProvider provider) => provider.loading == true
          ? ShimmerPage(
              header: '2',
              content: '2',
            )
          : Scaffold(
              body: SafeArea(
                child: Column(
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
                            width: double.infinity,
                            child: Text(
                              "Jadwal Surveyor",
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
                                          context, 0, inputSearch);
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
                        ],
                      ),
                    ),
                    provider.jadwalSurveyorModelData.length > 0
                        ? Expanded(
                            child: RefreshIndicator(
                              onRefresh: () {
                                return AppRouter.navToMainSurveyor(
                                    context, 0, inputSearch);
                              },
                              child: ListView.builder(
                                  itemCount:
                                      provider.jadwalSurveyorModelData.length,
                                  itemBuilder: (context, i) {
                                    return Container(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(height: 20),
                                          Container(
                                            padding: EdgeInsets.fromLTRB(
                                                18, 0, 18, 0),
                                            child: Text(
                                              provider
                                                  .jadwalSurveyorModelData[i]
                                                  .tanggalSurvey,
                                              style: AppTextStyle
                                                  .regularTextStyle
                                                  .copyWith(
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.normal,
                                                      color:
                                                          AppColors.grayColor),
                                            ),
                                          ),
                                          // SizedBox(height: 10),
                                          Container(
                                            child: JadwalSurveyorCard(
                                              id: provider
                                                  .jadwalSurveyorModelData[i]
                                                  .id,
                                              daerah: provider
                                                          .jadwalSurveyorModelData[
                                                              i]
                                                          .kota !=
                                                      null
                                                  ? provider
                                                      .jadwalSurveyorModelData[
                                                          i]
                                                      .kota
                                                  : '-',
                                              // provider.jadwalSurveyorModelData[i].kota,
                                              statusPembelian: provider
                                                  .jadwalSurveyorModelData[i]
                                                  .statusPembelian,
                                              nama: provider
                                                  .jadwalSurveyorModelData[i]
                                                  .namaCustomer,
                                              nominal: provider
                                                  .jadwalSurveyorModelData[i]
                                                  .dp,
                                              cicilan: provider
                                                  .jadwalSurveyorModelData[i]
                                                  .namaProduk,
                                              jatuhtempo: provider
                                                  .jadwalSurveyorModelData[i]
                                                  .tanggalJatuhTempo,
                                              tanggalSurveyRaw: provider
                                                  .jadwalSurveyorModelData[i]
                                                  .tanggalSurveyRaw,
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  }),
                            ),
                          )
                        : Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  'Tidak ada jadwal hari ini',
                                  style: AppTextStyle.boldTextStyle
                                      .copyWith(fontSize: 13),
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

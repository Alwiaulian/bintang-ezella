import 'package:bintang_ezella_mobile_app/core/providers/listener_provider.dart';
import 'package:bintang_ezella_mobile_app/core/providers/supervisor_jadwal_provider.dart';
import 'package:bintang_ezella_mobile_app/ui/router/router.dart';
import 'package:bintang_ezella_mobile_app/ui/theme/theme.dart';
import 'package:bintang_ezella_mobile_app/ui/widget/shimmer_page.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../card/jadwal_penjualan_card.dart';

class JadwalPenjualan extends StatefulWidget {
  final String search;
  JadwalPenjualan(this.search);
  @override
  State<JadwalPenjualan> createState() => _JadwalPenjualanState();
}

class _JadwalPenjualanState extends State<JadwalPenjualan> {
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
    return ListenerProvider<SupervisorJadwalProvider>(
      model: SupervisorJadwalProvider(context, widget.search),
      builder: (SupervisorJadwalProvider provider) => provider.loading == true
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
                            "Jadwal Penjualan",
                            style: AppTextStyle.boldTextStyle
                                .copyWith(fontSize: 18),
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        // Container(
                        //   child: Text(
                        //     provider.loginModel.data.namaLengkap,
                        //     style: AppTextStyle.regularTextStyle
                        //         .copyWith(fontSize: 20),
                        //   ),
                        // ),
                        // SizedBox(
                        //   height: 12,
                        // ),
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
                                          color: AppColors.mainColor, width: 1),
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
                                    return AppRouter.navToMainSupervisor(
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
                      ],
                    ),
                  ),
                  provider.jadwalPenjualanModelData.length > 0
                      ? Expanded(
                          child: RefreshIndicator(
                            onRefresh: () {
                              return AppRouter.navToMainSupervisor(
                                  context, 1, inputSearch);
                            },
                            child: ListView.builder(
                                itemCount:
                                    provider.jadwalPenjualanModelData.length,
                                itemBuilder: (context, i) {
                                  return Container(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(height: 20),
                                        Container(
                                          padding:
                                              EdgeInsets.fromLTRB(18, 0, 18, 0),
                                          child: Text(
                                            provider.jadwalPenjualanModelData[i]
                                                .tanggal,
                                            style: AppTextStyle.regularTextStyle
                                                .copyWith(
                                                    fontSize: 12,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                    color: AppColors.grayColor),
                                          ),
                                        ),
                                        SizedBox(height: 10),
                                        Container(
                                          padding:
                                              EdgeInsets.fromLTRB(18, 0, 18, 0),
                                          child: Column(
                                            children: [
                                              for (int j = 0;
                                                  j <
                                                      provider
                                                          .jadwalPenjualanModelData[
                                                              i]
                                                          .jadwal
                                                          .length;
                                                  j++)
                                                JadwalPenjualanCard(
                                                  provider
                                                      .jadwalPenjualanModelData[
                                                          i]
                                                      .jadwal[j]
                                                      .namaDaerah,
                                                  provider
                                                      .jadwalPenjualanModelData[
                                                          i]
                                                      .jadwal[j]
                                                      .tanggalRaw,
                                                  provider
                                                      .jadwalPenjualanModelData[
                                                          i]
                                                      .jadwal[j]
                                                      .jumlahSales,
                                                  provider
                                                      .jadwalPenjualanModelData[
                                                          i]
                                                      .jadwal[j]
                                                      .waktuMulai,
                                                  provider
                                                      .jadwalPenjualanModelData[
                                                          i]
                                                      .jadwal[j]
                                                      .waktuSelesai,
                                                ),
                                            ],
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
            )),
    );
  }
}

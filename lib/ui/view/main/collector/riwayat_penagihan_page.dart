import 'package:bintang_ezella_mobile_app/core/providers/listener_provider.dart';
import 'package:bintang_ezella_mobile_app/core/providers/collector_riwayat_penagihan_provider.dart';
import 'package:bintang_ezella_mobile_app/ui/router/router.dart';
import 'package:bintang_ezella_mobile_app/ui/widget/shimmer_page.dart';
import '../../card/homepage_penagihan_card.dart';
import 'package:bintang_ezella_mobile_app/ui/theme/theme.dart';
import 'package:flutter/material.dart';

class RiwayatPenagihanPage extends StatefulWidget {
  final String search;
  RiwayatPenagihanPage(this.search);
  @override
  State<RiwayatPenagihanPage> createState() => _RiwayatPenagihanPageState();
}

class _RiwayatPenagihanPageState extends State<RiwayatPenagihanPage> {
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
    return ListenerProvider(
      model: CollectorRiwayatProvider(context, widget.search),
      builder: (CollectorRiwayatProvider provider) => provider.loading == true
          ? ShimmerPage(
              header: '2',
              content: '2',
            )
          : Scaffold(
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
                            width: double.infinity,
                            child: Text(
                              "Riwayat Penagihan",
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
                                      return AppRouter.navToMainCollector(
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
                                            'Total dibayar',
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
                                            (provider.riwayatPenagihanModelData !=
                                                    null)
                                                ? provider
                                                    .riwayatPenagihanModelData
                                                    .totalBayar
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
                                  width: 15,
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
                                            'Total belum dibayar',
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
                                            (provider.riwayatPenagihanModelData !=
                                                    null)
                                                ? provider
                                                    .riwayatPenagihanModelData
                                                    .totalBelumBayar
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
                    provider.riwayatPenagihanModelData.data.length > 0
                        ? Expanded(
                            child: RefreshIndicator(
                              onRefresh: () {
                                return AppRouter.navToMainCollector(
                                    context, 1, '');
                              },
                              child: ListView(
                                children: [
                                  if (provider.riwayatPenagihanModelData !=
                                      null)
                                    for (int i = 0;
                                        i <
                                            provider.riwayatPenagihanModelData
                                                .data.length;
                                        i++)
                                      Container(
                                        child: HomePagePenagihanCard(
                                          id: provider.riwayatPenagihanModelData
                                              .data[i].id,
                                          kode_bayar: provider
                                              .riwayatPenagihanModelData
                                              .data[i]
                                              .noFaktur,
                                          jatuhtempo: 'Jatuh tempo ' +
                                              provider.riwayatPenagihanModelData
                                                  .data[i].tanggalJatuhTempo,
                                          status_bayar: provider
                                              .riwayatPenagihanModelData
                                              .data[i]
                                              .statusBayar,
                                          nama: provider
                                              .riwayatPenagihanModelData
                                              .data[i]
                                              .namaCustomer,
                                          nominal: provider
                                              .riwayatPenagihanModelData
                                              .data[i]
                                              .jumlahBayar,
                                          produk: provider
                                              .riwayatPenagihanModelData
                                              .data[i]
                                              .namaProduk,
                                          tanggalpenagihan: provider
                                              .riwayatPenagihanModelData
                                              .data[i]
                                              .tanggalPenagihan,
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
                                  'Belum ada data penagihan',
                                  style: AppTextStyle.boldTextStyle
                                      .copyWith(fontSize: 13),
                                ),
                              ],
                            ),
                          ),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}

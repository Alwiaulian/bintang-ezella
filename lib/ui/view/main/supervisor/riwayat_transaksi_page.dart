import 'package:bintang_ezella_mobile_app/core/providers/listener_provider.dart';
import 'package:bintang_ezella_mobile_app/core/providers/supervisor_riwayat_provider.dart';
import 'package:bintang_ezella_mobile_app/ui/router/router.dart';
import 'package:bintang_ezella_mobile_app/ui/widget/shimmer_page.dart';
import 'package:flutter_responsive_screen/flutter_responsive_screen.dart';
import 'package:bintang_ezella_mobile_app/ui/view/card/riwayat_transaksi_card.dart';
import 'package:flutter/material.dart';
import 'package:bintang_ezella_mobile_app/ui/theme/theme.dart';

class TransaksiPage extends StatefulWidget {
  final String search;
  TransaksiPage(this.search);
  @override
  State<TransaksiPage> createState() => _TransaksiPageState();
}

class _TransaksiPageState extends State<TransaksiPage> {
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
      model: SupervisorTransaksiProvider(context, widget.search),
      builder: (SupervisorTransaksiProvider provider) => provider.loading ==
              true
          ? ShimmerPage(
              header: '1',
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
                              "Riwayat Transaksi",
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
                                      return AppRouter.navToMainSupervisor(
                                          context, 2, inputSearch);
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
                    provider.riwayatTransaksiModelData.length > 0
                        ? Expanded(
                            child: RefreshIndicator(
                              onRefresh: () {
                                return AppRouter.navToMainSupervisor(
                                    context, 2, inputSearch);
                              },
                              child: ListView.builder(
                                itemCount:
                                    provider.riwayatTransaksiModelData.length,
                                itemBuilder: (context, i) {
                                  return Container(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          padding: EdgeInsets.fromLTRB(
                                              18, 15, 18, 0),
                                          child: Row(
                                            children: [
                                              Expanded(
                                                child: Text(
                                                  provider
                                                      .riwayatTransaksiModelData[
                                                          i]
                                                      .tanggal_pembelian,
                                                  style: AppTextStyle
                                                      .regularTextStyle
                                                      .copyWith(
                                                          fontSize: 12,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: AppColors
                                                              .grayColor),
                                                ),
                                              ),
                                              Container(
                                                child: Container(
                                                  padding: EdgeInsets.all(10),
                                                  child: Text(
                                                    provider
                                                        .riwayatTransaksiModelData[
                                                            i]
                                                        .total_penjualan,
                                                    style: AppTextStyle
                                                        .regularTextStyle
                                                        .copyWith(
                                                            fontSize: 12,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color: AppColors
                                                                .mainColor),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(height: 4),
                                        Container(
                                          padding:
                                              EdgeInsets.fromLTRB(18, 0, 18, 0),
                                          child: Column(
                                            children: [
                                              for (int j = 0;
                                                  j <
                                                      provider
                                                          .riwayatTransaksiModelData[
                                                              i]
                                                          .data_transaksi
                                                          .length;
                                                  j++)
                                                RiwayatTransaksiCard(
                                                  provider
                                                      .riwayatTransaksiModelData[
                                                          i]
                                                      .data_transaksi[j]
                                                      .id
                                                      .toString(),
                                                  provider
                                                      .riwayatTransaksiModelData[
                                                          i]
                                                      .data_transaksi[j]
                                                      .namaCustomer,
                                                  provider
                                                      .riwayatTransaksiModelData[
                                                          i]
                                                      .data_transaksi[j]
                                                      .namaRegional,
                                                  provider
                                                      .riwayatTransaksiModelData[
                                                          i]
                                                      .data_transaksi[j]
                                                      .tanggalPembelian,
                                                  provider
                                                      .riwayatTransaksiModelData[
                                                          i]
                                                      .data_transaksi[j]
                                                      .namaProduk,
                                                  provider
                                                      .riwayatTransaksiModelData[
                                                          i]
                                                      .data_transaksi[j]
                                                      .totalPenjualan,
                                                  provider
                                                      .riwayatTransaksiModelData[
                                                          i]
                                                      .data_transaksi[j]
                                                      .namaSales,
                                                  // '',
                                                ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          height: 6,
                                        )
                                      ],
                                    ),
                                  );
                                },
                              ),
                            ),
                          )
                        : Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  'Belum ada data transaksi',
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

import '../../card/homepage_penagihan_card.dart';
import 'package:bintang_ezella_mobile_app/ui/theme/theme.dart';
import 'package:flutter/material.dart';

class CollectorHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    width: double.infinity,
                    child: Text(
                      "Penagihan",
                      style: AppTextStyle.boldTextStyle.copyWith(fontSize: 18),
                    ),
                  ),
                  SizedBox(
                    height: 13,
                  ),
                  // Container(
                  //   child: Row(
                  //     children: [
                  //       Expanded(
                  //         child: TextFormField(
                  //           decoration: InputDecoration(
                  //             hintText: 'Cari nama',
                  //             filled: true,
                  //             fillColor: AppColors.inputFillColor,
                  //             hintStyle: AppTextStyle.regularTextStyle.copyWith(
                  //                 color: AppColors.grayColor, fontSize: 14),
                  //             prefixIcon: Icon(Icons.search),
                  //             contentPadding: EdgeInsets.symmetric(
                  //                 horizontal: 10, vertical: 15),
                  //             focusedBorder: OutlineInputBorder(
                  //               borderSide: BorderSide(
                  //                   color: AppColors.mainColor, width: 1),
                  //             ),
                  //             enabledBorder: OutlineInputBorder(
                  //               borderSide: BorderSide(
                  //                   color: AppColors.inputBorderColor,
                  //                   width: 1),
                  //             ),
                  //           ),
                  //           validator: (String value) {
                  //             if (value == null || value.isEmpty) {
                  //               return 'Please enter some text';
                  //             }
                  //             return null;
                  //           },
                  //         ),
                  //       ),
                  //       Container(
                  //         padding: EdgeInsets.only(left: 14),
                  //         child: Icon(
                  //           Icons.list_rounded,
                  //           color: AppColors.grayColor,
                  //           size: 30,
                  //         ),
                  //       ),
                  //     ],
                  //   ),
                  // ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.yellow.shade50,
                              border: Border.all(color: AppColors.yellowColor),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            padding: EdgeInsets.symmetric(
                                horizontal: 6, vertical: 8),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Container(
                                  child: Text(
                                    'Total Belum Bayar',
                                    style: AppTextStyle.regularTextStyle
                                        .copyWith(
                                            fontSize: 11,
                                            fontWeight: FontWeight.normal,
                                            color: AppColors.yellowColor),
                                  ),
                                ),
                                Container(
                                  child: Text(
                                    'Rp 3.340.000',
                                    style: AppTextStyle.boldTextStyle.copyWith(
                                        fontSize: 14,
                                        fontWeight: FontWeight.normal,
                                        color: AppColors.yellowColor),
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
                              border: Border.all(color: AppColors.redColor),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            padding: EdgeInsets.symmetric(
                                horizontal: 6, vertical: 8),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Container(
                                  child: Text(
                                    'Total Terlambat',
                                    style: AppTextStyle.regularTextStyle
                                        .copyWith(
                                            fontSize: 11,
                                            fontWeight: FontWeight.normal,
                                            color: AppColors.redColor),
                                  ),
                                ),
                                Container(
                                  child: Text(
                                    'Rp 240.000',
                                    style: AppTextStyle.boldTextStyle.copyWith(
                                        fontSize: 14,
                                        fontWeight: FontWeight.normal,
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
            Expanded(
              child: ListView(
                children: [
                  SizedBox(
                    height: 16,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 0,
                    ),
                    child: HomePagePenagihanCard(
                      kode_bayar: 'FK0706012  ',
                      status_bayar: 'Terlambat',
                      nama: 'Ibu Zaenab',
                      nominal: 'Rp. 175.000',
                      produk: 'Ezella Striwork 32 Ml',
                      jatuhtempo: 'Jatuh tempo  16 Sep 2021',
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 0,
                    ),
                    child: HomePagePenagihanCard(
                      kode_bayar: 'FK0706012  ',
                      status_bayar: 'Belum Bayar',
                      nama: 'Dadang Sunandang',
                      nominal: 'Rp. 175.000',
                      produk: 'Kompor Gas 2 Tungku Ezella',
                      jatuhtempo: 'Jatuh tempo  16 Sep 2021',
                    ),
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 0,
                    ),
                    child: HomePagePenagihanCard(
                      kode_bayar: 'FK0706012  ',
                      status_bayar: 'Bayar',
                      nama: 'Ibu Sumarni Wati',
                      nominal: 'Rp. 175.000',
                      produk: 'Ezella Striwork 32 Ml',
                      jatuhtempo: 'Jatuh tempo  16 Sep 2021',
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 0,
                    ),
                    child: HomePagePenagihanCard(
                      kode_bayar: 'FK0706012  ',
                      status_bayar: 'Terlambat',
                      nama: 'Ibu Zaenab',
                      nominal: 'Rp. 175.000',
                      produk: 'Ezella Striwork 32 Ml',
                      jatuhtempo: 'Jatuh tempo  16 Sep 2021',
                    ),
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
    );
  }
}

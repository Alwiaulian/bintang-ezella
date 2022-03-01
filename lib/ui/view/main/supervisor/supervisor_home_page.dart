import 'package:bintang_ezella_mobile_app/core/providers/listener_provider.dart';
import 'package:bintang_ezella_mobile_app/core/providers/supervisor_home_provider.dart';
import 'package:bintang_ezella_mobile_app/ui/router/router.dart';
import 'package:bintang_ezella_mobile_app/ui/theme/theme.dart';
import 'package:bintang_ezella_mobile_app/ui/view/card/daftar_product_card.dart';
import 'package:bintang_ezella_mobile_app/ui/widget/shimmer_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class SupervisorHomePage extends StatelessWidget {
  // final TextEditingController _searchQuery = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ListenerProvider<SupervisorHomeProvider>(
      model: SupervisorHomeProvider(context),
      builder: (SupervisorHomeProvider provider) => provider.loading == true
          ? ShimmerPage(
              header: "1",
              content: "1",
            )
          : Scaffold(
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
                      padding: EdgeInsets.symmetric(horizontal: 18),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 30,
                          ),
                          Container(
                            width: double.infinity,
                            child: Text(
                              "Daftar Produk",
                              style: AppTextStyle.boldTextStyle
                                  .copyWith(fontSize: 18),
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
                          //             hintText: 'Cari Nama',
                          //             filled: true,
                          //             fillColor: AppColors.inputFillColor,
                          //             hintStyle: AppTextStyle.regularTextStyle
                          //                 .copyWith(
                          //                     color: AppColors.grayColor,
                          //                     fontSize: 14),
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
                          //           controller: _searchQuery,
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
                          //           Icons.grid_view,
                          //           color: AppColors.grayColor,
                          //         ),
                          //       ),
                          //     ],
                          //   ),
                          // ),
                          SizedBox(
                            height: 15,
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: RefreshIndicator(
                        onRefresh: () {
                          return AppRouter.navToMainSupervisor(context, 0, '');
                        },
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(13, 13, 13, 0),
                          child: StaggeredGridView.countBuilder(
                            crossAxisCount: 3,
                            itemCount: provider.daftarProdukModelData.length,
                            itemBuilder: (context, i) => DaftarProductCard(
                              provider.daftarProdukModelData[i].id,
                              provider.daftarProdukModelData[i].namaProduk,
                              provider.daftarProdukModelData[i].hargaJualTunai,
                              provider.daftarProdukModelData[i].gambarProduk,
                            ),
                            staggeredTileBuilder: (i) => StaggeredTile.fit(1),
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

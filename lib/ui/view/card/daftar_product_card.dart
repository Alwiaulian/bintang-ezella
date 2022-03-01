import 'package:bintang_ezella_mobile_app/ui/theme/theme.dart';
import 'package:bintang_ezella_mobile_app/ui/view/main/supervisor/tambah_transaksi_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_responsive_screen/flutter_responsive_screen.dart';

class DaftarProductCard extends StatelessWidget {
  final int id;
  final String namaProduk;
  final String hargaProduk;
  final String gambarProduk;

  DaftarProductCard(
      this.id, this.namaProduk, this.hargaProduk, this.gambarProduk);

  @override
  Widget build(BuildContext context) {
    final Function wp = Screen(MediaQuery.of(context).size).wp;
    final Function hp = Screen(MediaQuery.of(context).size).hp;

    return Container(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TambahTransaksiPage(id),
                  ),
                );
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Image.network(gambarProduk,
                            width: double.infinity,
                            height: 110,
                            fit: BoxFit.cover),
                      ),
                      Positioned(
                        left: 0,
                        bottom: 0,
                        child: Container(
                          decoration: BoxDecoration(
                            color: AppColors.greenColor,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          padding: EdgeInsets.fromLTRB(5, 2, 5, 2),
                          child: Text(
                            'Tunai',
                            style: AppTextStyle.boldTextStyle.copyWith(
                                fontSize: 10, color: AppColors.whiteColor),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Container(
                    child: Text(
                      hargaProduk,
                      style: AppTextStyle.boldTextStyle.copyWith(fontSize: 14),
                    ),
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  Container(
                    height: 28,
                    child: Text(
                      namaProduk,
                      style:
                          AppTextStyle.regularTextStyle.copyWith(fontSize: 13),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                ],
              ),
            ),
          ),
          Container(
            height: 25,
            width: double.infinity,
            child: OutlineButton(
              child: Text(
                'Beli',
                style: AppTextStyle.boldTextStyle
                    .copyWith(fontSize: 13, color: AppColors.mainColor),
              ),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(26))),
              borderSide: BorderSide(
                color: AppColors.mainColor,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TambahTransaksiPage(id),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}

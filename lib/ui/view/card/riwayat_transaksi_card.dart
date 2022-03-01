import 'package:bintang_ezella_mobile_app/ui/theme/theme.dart';
import 'package:bintang_ezella_mobile_app/ui/view/main/supervisor/riwayat_transaksi_detail_page.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class RiwayatTransaksiCard extends StatelessWidget {
  final String id;
  final String nama;
  final String namaRegional;
  final String waktu;
  final String produk;
  final String nominal;
  final String namaSales;

  RiwayatTransaksiCard(
    this.id,
    this.nama,
    this.namaRegional,
    this.waktu,
    this.produk,
    this.nominal,
    this.namaSales,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: AppColors.whiteColor,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        margin: EdgeInsets.symmetric(vertical: 5),
        child: InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => RiwayatTransaksiDetailPage(id),
              ),
            );
          },
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 8,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 12),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            nama,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: AppTextStyle.regularTextStyle.copyWith(
                                fontSize: 12,
                                fontWeight: FontWeight.normal,
                                color: AppColors.grayColor),
                          ),
                          Text(
                            namaRegional,
                            style: AppTextStyle.regularTextStyle.copyWith(
                                fontSize: 12,
                                fontWeight: FontWeight.normal,
                                color: AppColors.grayColor),
                          ),
                        ],
                      ),
                    ),
                    Text(
                      waktu,
                      style: AppTextStyle.regularTextStyle.copyWith(
                          fontSize: 12,
                          fontWeight: FontWeight.normal,
                          color: AppColors.grayColor),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 4,
              ),
              Divider(),
              SizedBox(
                height: 8,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(produk,
                        style: AppTextStyle.regularTextStyle.copyWith(
                          fontSize: 12,
                          fontWeight: FontWeight.normal,
                        )),
                    Text('sales',
                        style: AppTextStyle.regularTextStyle.copyWith(
                            fontSize: 12,
                            fontWeight: FontWeight.normal,
                            color: AppColors.grayColor)),
                  ],
                ),
              ),
              SizedBox(height: 4),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      nominal,
                      style: AppTextStyle.boldTextStyle.copyWith(
                        fontSize: 12,
                      ),
                    ),
                    Text(namaSales,
                        style: AppTextStyle.regularTextStyle
                            .copyWith(fontSize: 12)),
                  ],
                ),
              ),
              SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}

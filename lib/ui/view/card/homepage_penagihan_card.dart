import 'package:bintang_ezella_mobile_app/ui/theme/theme.dart';

import 'package:bintang_ezella_mobile_app/ui/view/main/collector/riwayat_penagihan_detail_page.dart';
import 'package:flutter/material.dart';

class HomePagePenagihanCard extends StatelessWidget {
  final int id;
  final String kode_bayar;
  final String status_bayar;
  final String nama;
  final String nominal;
  final String produk;

  final String jatuhtempo;

  final String tanggalpenagihan;
  final bool un_date;

  HomePagePenagihanCard({
    this.id,
    this.kode_bayar = '',
    this.status_bayar = '',
    this.nama = '',
    this.nominal = '',
    this.produk = '',
    this.jatuhtempo = '',
    this.tanggalpenagihan = '',
    this.un_date = true,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 14, vertical: 5),
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
                builder: (context) => RiwayatPenagihanDetailPage(id),
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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text(
                          kode_bayar,
                          style: AppTextStyle.regularTextStyle.copyWith(
                              fontSize: 12,
                              fontWeight: FontWeight.normal,
                              color: AppColors.grayColor),
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 3, right: 3),
                          child: Icon(
                            Icons.circle,
                            size: 3,
                            color: AppColors.grayColor,
                          ),
                        ),
                        Text(
                          jatuhtempo,
                          style: AppTextStyle.regularTextStyle.copyWith(
                              fontSize: 12,
                              fontWeight: FontWeight.normal,
                              color: AppColors.grayColor),
                        ),
                      ],
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(5, 3, 5, 3),
                      decoration: BoxDecoration(
                        color:
                            (status_bayar == 'Bayar' || status_bayar == 'Tunai')
                                ? AppColors.greenColor
                                : (status_bayar == 'Belum Bayar' ||
                                        status_bayar == 'Cicilan')
                                    ? AppColors.yellowColor
                                    : (status_bayar == 'Terlambat' ||
                                            status_bayar == 'Batal' ||
                                            status_bayar == 'Belum bayar')
                                        ? AppColors.redColor
                                        : AppColors.grayColor,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Text(
                        status_bayar,
                        style: AppTextStyle.boldTextStyle.copyWith(
                            fontSize: 10, color: AppColors.whiteColor),
                      ),
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
                  children: [
                    Expanded(
                      child: Text(nama,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: AppTextStyle.boldTextStyle.copyWith(
                            fontSize: 14,
                            fontWeight: FontWeight.normal,
                          )),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Container(
                      child: Text(nominal,
                          style: AppTextStyle.boldTextStyle.copyWith(
                            fontSize: 14,
                            fontWeight: FontWeight.normal,
                          )),
                    ),
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
                      produk,
                      style: AppTextStyle.regularTextStyle.copyWith(
                          fontSize: 12,
                          fontWeight: FontWeight.normal,
                          color: AppColors.grayColor),
                    ),
                    Text(tanggalpenagihan,
                        style: AppTextStyle.regularTextStyle.copyWith(
                          fontSize: 11,
                          color: AppColors.grayColor,
                        )),
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

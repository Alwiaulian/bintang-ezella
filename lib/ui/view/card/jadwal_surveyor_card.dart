import 'package:bintang_ezella_mobile_app/ui/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../main/surveyor/detail_jadwal_surveyor_page.dart';

class JadwalSurveyorCard extends StatelessWidget {
  final int id;
  final String daerah;
  final String statusPembelian;
  final String nama;
  final String nominal;
  final String cicilan;
  final String jatuhtempo;
  final String tanggalSurveyRaw;

  JadwalSurveyorCard({
    this.id,
    this.daerah = '',
    this.statusPembelian = '',
    this.nama = '',
    this.nominal = '',
    this.cicilan = '',
    this.jatuhtempo = '',
    this.tanggalSurveyRaw,
  });

  // String get id => null;

  int calculateDifference(DateTime date) {
    DateTime now = DateTime.now();
    return DateTime(date.year, date.month, date.day)
        .difference(DateTime(now.year, now.month, now.day))
        .inDays;
  }

  @override
  Widget build(BuildContext context) {
    // DateTime datetimeTanggal = DateTime.parse(tanggalSurveyRaw);
    DateTime datetimeTanggal = DateTime.parse(tanggalSurveyRaw);
    return (calculateDifference(datetimeTanggal) >= 0)
        ? Container(
            padding: EdgeInsets.symmetric(horizontal: 14, vertical: 5),
            child: Card(
              shape: RoundedRectangleBorder(
                side: BorderSide(
                  color: AppColors.mainColor,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          daerah,
                          style: AppTextStyle.regularTextStyle.copyWith(
                              fontSize: 12,
                              fontWeight: FontWeight.normal,
                              color: AppColors.grayColor),
                        ),
                        (statusPembelian == '')
                            ? Container(
                                height: 28,
                                child: TextButton(
                                  child: Text(
                                    'Lihat Detail',
                                    style: AppTextStyle.regularTextStyle
                                        .copyWith(
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold,
                                            color: AppColors.mainColor),
                                  ),
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            DetailJadwalSurveyorPage(id),
                                      ),
                                    );
                                  },
                                ),
                              )
                            : Container(
                                padding: EdgeInsets.fromLTRB(5, 3, 5, 3),
                                decoration: BoxDecoration(
                                  color: (statusPembelian == 'Tunai')
                                      ? AppColors.greenColor
                                      : (statusPembelian == 'Cicilan')
                                          ? AppColors.yellowColor
                                          : (statusPembelian == 'Batal')
                                              ? AppColors.redColor
                                              : AppColors.grayColor,
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Text(
                                  statusPembelian,
                                  style: AppTextStyle.boldTextStyle.copyWith(
                                      fontSize: 10,
                                      color: AppColors.whiteColor),
                                ),
                              )
                      ],
                    ),
                  ),
                  Divider(
                    height: 0,
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(nama,
                            style: AppTextStyle.boldTextStyle.copyWith(
                              fontSize: 14,
                            )),
                        Text('Dp Rp. ' + nominal,
                            style: AppTextStyle.boldTextStyle.copyWith(
                              fontSize: 14,
                            )),
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
                          cicilan,
                          style: AppTextStyle.regularTextStyle.copyWith(
                              fontSize: 12, color: AppColors.grayColor),
                        ),
                        Text('Jatuh tempo : ' + jatuhtempo,
                            style: AppTextStyle.regularTextStyle.copyWith(
                                fontSize: 11, color: AppColors.grayColor)),
                      ],
                    ),
                  ),
                  SizedBox(height: 16),
                ],
              ),
            ),
          )
        : Container(
            padding: EdgeInsets.symmetric(horizontal: 14, vertical: 5),
            child: Card(
              color: AppColors.lightGrayColor,
              shape: RoundedRectangleBorder(
                // side: BorderSide(
                //   color: AppColors.grayColor,
                // ),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          daerah,
                          style: AppTextStyle.regularTextStyle.copyWith(
                              fontSize: 12,
                              fontWeight: FontWeight.normal,
                              color: AppColors.grayColor),
                        ),
                        (statusPembelian == '')
                            ? Container(
                                height: 28,
                                child: TextButton(
                                  child: Text(
                                    'Lihat Detail',
                                    style: AppTextStyle.regularTextStyle
                                        .copyWith(
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold,
                                            color: AppColors.mainColor),
                                  ),
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            DetailJadwalSurveyorPage(id),
                                      ),
                                    );
                                  },
                                ),
                              )
                            : Container(
                                padding: EdgeInsets.fromLTRB(5, 3, 5, 3),
                                decoration: BoxDecoration(
                                  color: (statusPembelian == 'Tunai')
                                      ? AppColors.greenColor
                                      : (statusPembelian == 'Cicilan')
                                          ? AppColors.yellowColor
                                          : (statusPembelian == 'Batal')
                                              ? AppColors.redColor
                                              : AppColors.grayColor,
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Text(
                                  statusPembelian,
                                  style: AppTextStyle.boldTextStyle.copyWith(
                                      fontSize: 10,
                                      color: AppColors.whiteColor),
                                ),
                              )
                      ],
                    ),
                  ),
                  Divider(
                    height: 0,
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(nama,
                            style: AppTextStyle.boldTextStyle.copyWith(
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                            )),
                        Text(
                          'Dp Rp. ' + nominal,
                          style: AppTextStyle.boldTextStyle.copyWith(
                            fontSize: 14,
                            fontWeight: FontWeight.normal,
                            color: (statusPembelian == 'Batal')
                                ? AppColors.redColor
                                : AppColors.blackColor,
                          ),
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
                          cicilan,
                          style: AppTextStyle.regularTextStyle.copyWith(
                              fontSize: 13, color: AppColors.grayColor),
                        ),
                        Text('Jatuh tempo : ' + jatuhtempo,
                            style: AppTextStyle.regularTextStyle.copyWith(
                                fontSize: 11, color: AppColors.grayColor)),
                      ],
                    ),
                  ),
                  SizedBox(height: 16),
                ],
              ),
            ),
          );
  }
}

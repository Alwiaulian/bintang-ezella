import 'package:bintang_ezella_mobile_app/core/util/log.dart';
import 'package:bintang_ezella_mobile_app/ui/theme/theme.dart';
import 'package:flutter/material.dart';

class JadwalPenjualanCard extends StatelessWidget {
  final String daerah;
  final String tanggal;
  final int jumlah_sales;
  final String jam_mulai;
  final String jam_selesai;

  JadwalPenjualanCard(
    this.daerah,
    this.tanggal,
    this.jumlah_sales,
    this.jam_mulai,
    this.jam_selesai,
  );

  int calculateDifference(DateTime date) {
    DateTime now = DateTime.now();
    return DateTime(date.year, date.month, date.day)
        .difference(DateTime(now.year, now.month, now.day))
        .inDays;
  }

  @override
  Widget build(BuildContext context) {
    DateTime datetimeTanggal = DateTime.parse(tanggal);

    return (calculateDifference(datetimeTanggal) >= 0)
        ? Container(
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.blueColor),
              color: AppColors.lightBlueColor,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: AppColors.grayColor.withOpacity(0.5),
                  blurRadius: 4,
                  offset: Offset(0, 0),
                ),
              ],
            ),
            padding: EdgeInsets.all(20),
            margin: EdgeInsets.symmetric(vertical: 5),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(daerah,
                          style: AppTextStyle.boldTextStyle
                              .copyWith(fontSize: 14)),
                      SizedBox(height: 3),
                      Text(jumlah_sales.toString() + ' orang sales',
                          style: AppTextStyle.regularTextStyle
                              .copyWith(fontSize: 13)),
                    ],
                  ),
                ),
                SizedBox(width: 10),
                Container(
                  padding: EdgeInsets.fromLTRB(10, 7, 10, 7),
                  child: Text(
                    jam_mulai + ' - ' + jam_selesai,
                    style: AppTextStyle.boldTextStyle.copyWith(
                      color: AppColors.whiteColor,
                      fontSize: 16,
                    ),
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.mainColor,
                    borderRadius: BorderRadius.circular(8),
                  ),
                )
              ],
            ),
          )
        : Container(
            decoration: BoxDecoration(
              color: AppColors.lightGrayColor,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: AppColors.grayColor.withOpacity(0.5),
                  blurRadius: 4,
                  offset: Offset(0, 0),
                ),
              ],
            ),
            padding: EdgeInsets.all(20),
            margin: EdgeInsets.symmetric(vertical: 5),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(daerah,
                          style: AppTextStyle.boldTextStyle
                              .copyWith(fontSize: 14)),
                      SizedBox(height: 3),
                      Text(jumlah_sales.toString() + ' orang sales',
                          style: AppTextStyle.regularTextStyle
                              .copyWith(fontSize: 13)),
                    ],
                  ),
                ),
                SizedBox(width: 10),
                Container(
                  padding: EdgeInsets.fromLTRB(10, 7, 10, 7),
                  child: Text(
                    jam_mulai + ' - ' + jam_selesai,
                    style: AppTextStyle.boldTextStyle.copyWith(
                      color: AppColors.whiteColor,
                      fontSize: 16,
                    ),
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.grayColor,
                    borderRadius: BorderRadius.circular(8),
                  ),
                )
              ],
            ),
          );
  }
}

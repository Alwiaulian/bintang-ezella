import 'package:bintang_ezella_mobile_app/ui/theme/theme.dart';
import 'package:flutter/material.dart';
import '../main/collector/detail_jadwal_penagihan_page.dart';

class JadwalPenagihanCard extends StatelessWidget {
  final int id;
  final String namaCustomer;
  final String tanggalPenagihanRaw;
  final String cicilanKe;
  final String harusBayar;
  final String tanggalJatuhTempo;
  final String namaRegional;

  JadwalPenagihanCard(
    this.id,
    this.namaCustomer,
    this.tanggalPenagihanRaw,
    this.cicilanKe,
    this.harusBayar,
    this.tanggalJatuhTempo,
    this.namaRegional,
  );

  int calculateDifference(DateTime date) {
    DateTime now = DateTime.now();
    return DateTime(date.year, date.month, date.day)
        .difference(DateTime(now.year, now.month, now.day))
        .inDays;
  }

  @override
  Widget build(BuildContext context) {
    DateTime datetimeTanggal = DateTime.parse(tanggalPenagihanRaw);

    return (calculateDifference(datetimeTanggal) >= 0)
        ? Container(
            child: Card(
              shape: RoundedRectangleBorder(
                side: BorderSide(
                  color: AppColors.mainColor,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              margin: EdgeInsets.symmetric(vertical: 5),
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 0,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          namaRegional,
                          style: AppTextStyle.regularTextStyle.copyWith(
                              fontSize: 12,
                              fontWeight: FontWeight.normal,
                              color: AppColors.grayColor),
                        ),
                        Container(
                          height: 40,
                          child: TextButton(
                            child: Text(
                              'Lihat Detail',
                              style: AppTextStyle.regularTextStyle.copyWith(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.mainColor),
                            ),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      DetailJadwalPenjualanPage(id),
                                ),
                              );
                            },
                          ),
                        ),
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
                        Expanded(
                          child: Text(namaCustomer,
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
                          child: Text(harusBayar,
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
                          'Cicilan Ke-' + cicilanKe,
                          style: AppTextStyle.regularTextStyle.copyWith(
                              fontSize: 12, color: AppColors.grayColor),
                        ),
                        Text('Jatuh Tempo : ' + tanggalJatuhTempo,
                            style: AppTextStyle.regularTextStyle.copyWith(
                                fontSize: 11, color: AppColors.grayColor)),
                      ],
                    ),
                  ),
                  SizedBox(height: 19),
                ],
              ),
            ),
          )
        : Container(
            child: Card(
              color: AppColors.lightGrayColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
                side: BorderSide(color: Colors.grey.withOpacity(0)),
              ),
              margin: EdgeInsets.symmetric(vertical: 5),
              child: Column(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          namaRegional,
                          style: AppTextStyle.regularTextStyle.copyWith(
                              fontSize: 12,
                              fontWeight: FontWeight.normal,
                              color: AppColors.grayColor),
                        ),
                        Container(
                          height: 40,
                          child: TextButton(
                            child: Text(
                              'Lihat Detail',
                              style: AppTextStyle.regularTextStyle.copyWith(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.grayColor),
                            ),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      DetailJadwalPenjualanPage(id),
                                ),
                              );
                            },
                          ),
                        ),
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
                        Expanded(
                          child: Text(namaCustomer,
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
                          child: Text(harusBayar,
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
                          'Cicilan Ke-' + cicilanKe,
                          style: AppTextStyle.regularTextStyle.copyWith(
                              fontSize: 12, color: AppColors.grayColor),
                        ),
                        Text('Jatuh Tempo : ' + tanggalJatuhTempo,
                            style: AppTextStyle.regularTextStyle.copyWith(
                                fontSize: 11, color: AppColors.grayColor)),
                      ],
                    ),
                  ),
                  SizedBox(height: 19),
                ],
              ),
            ),
          );
  }
}

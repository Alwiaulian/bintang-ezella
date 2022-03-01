import 'dart:convert';
import 'dart:io';

import 'package:bintang_ezella_mobile_app/core/providers/listener_provider.dart';
import 'package:bintang_ezella_mobile_app/core/providers/supervisor_tambah_pelanggan_provider.dart';
import 'package:bintang_ezella_mobile_app/core/util/log.dart';
import 'package:bintang_ezella_mobile_app/ui/router/router.dart';
import 'package:bintang_ezella_mobile_app/ui/theme/theme.dart';
import 'package:bintang_ezella_mobile_app/ui/widget/take_picture_screen.dart';
import 'package:bintang_ezella_mobile_app/ui/widget/shimmer_page.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:intl/intl.dart';

class TambahPelangganPage extends StatefulWidget {
  final int produkId;
  const TambahPelangganPage({this.produkId});

  @override
  _TambahPelangganPageState createState() => _TambahPelangganPageState();
}

class _TambahPelangganPageState extends State<TambahPelangganPage> {
  String _valTanggalLahir = 'Pilih Tanggal Lahir';
  String _valJenisKelamin;
  int _valRegional;
  int _valWilayah;
  String _valProvince;
  String _valCity;
  String _valDistrict;
  String _valStatus;
  List<dynamic> listCity;
  List<dynamic> listDistrict;
  File fotoEKtp;
  File fotoCustomer;

  FocusNode n1 = FocusNode();
  FocusNode n2 = FocusNode();
  FocusNode n3 = FocusNode();
  FocusNode n4 = FocusNode();

  allUnFocus() {
    n1.unfocus();
    n2.unfocus();
    n3.unfocus();
    n4.unfocus();
  }

  var dateFormatterHuman = new DateFormat('dd-MM-yyyy');
  var dateFormatterSystem = new DateFormat('yyyy-MM-dd');

  @override
  Widget build(BuildContext context) {
    return ListenerProvider<SupervisorTambahPelangganProvider>(
      model: SupervisorTambahPelangganProvider(context, widget.produkId),
      builder: (SupervisorTambahPelangganProvider provider) => provider
                  .loading ==
              true
          ? ShimmerPage(header: "1")
          : Scaffold(
              resizeToAvoidBottomInset: false,
              body: SafeArea(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: AppColors.whiteColor,
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 15,
                          ),
                          Container(
                            child: Row(
                              children: [
                                Container(
                                  height: 40,
                                  width: 40,
                                  child: IconButton(
                                    icon: Icon(Icons.close),
                                    iconSize: 24,
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                  ),
                                ),
                                SizedBox(
                                  width: 12,
                                ),
                                Text(
                                  "Tambah Pelanggan",
                                  style: AppTextStyle.boldTextStyle
                                      .copyWith(fontSize: 18),
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
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          color: AppColors.whiteColor,
                        ),
                        child: SingleChildScrollView(
                          child: Padding(
                            padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
                            child: Column(
                              children: <Widget>[
                                Container(
                                  padding: EdgeInsets.all(20),
                                  width: double.infinity,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        child: TextFormField(
                                          decoration: InputDecoration(
                                            labelText: 'Nama Lengkap *',
                                            labelStyle: AppTextStyle.regularTextStyle
                                                .copyWith(fontSize: 14),
                                            hintText: 'cth: Budi Sudarto',
                                            floatingLabelBehavior:
                                                FloatingLabelBehavior.always,
                                          ),
                                          focusNode: n1,
                                          onChanged: (text) {
                                            provider.nama_lengkap = text;
                                          },
                                          onFieldSubmitted: (v) {
                                            n1.unfocus();
                                          },
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(top: 8),
                                        child: DropdownButtonFormField(
                                          decoration: InputDecoration(
                                            labelText: 'Jenis Kelamin *',
                                            labelStyle: AppTextStyle.regularTextStyle
                                                .copyWith(fontSize: 14),
                                          ),
                                          isExpanded: true,
                                          hint: Text("Pilih Jenis Kelamin"),
                                          value: _valJenisKelamin,
                                          items: provider
                                              .tambahPelangganModelData.jenisKelamin
                                              .map((item) {
                                            return DropdownMenuItem(
                                              child: Text(item),
                                              value: item,
                                            );
                                          }).toList(),
                                          onChanged: (value) {
                                            allUnFocus();
                                            provider.jenis_kelamin = value;
                                            _valJenisKelamin = value;
                                            setState(() {});
                                          },
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(top: 8),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              margin: EdgeInsets.only(top: 10),
                                              child: Text(
                                                'Tanggal Lahir',
                                                style: AppTextStyle.regularTextStyle
                                                    .copyWith(fontSize: 11),
                                              ),
                                            ),
                                            InkWell(
                                              child: Container(
                                                width: double.infinity,
                                                padding: EdgeInsets.only(
                                                    top: 6, bottom: 10),
                                                decoration: BoxDecoration(
                                                  border: Border(
                                                    bottom: BorderSide(
                                                      color: AppColors.grayColor,
                                                      width: 1,
                                                    ),
                                                  ),
                                                ),
                                                child: Text(
                                                  _valTanggalLahir,
                                                  style: AppTextStyle.regularTextStyle
                                                      .copyWith(
                                                          color: AppColors
                                                              .bodyTextGreyColor,
                                                          fontSize: 16),
                                                ),
                                              ),
                                              onTap: () {
                                                allUnFocus();
                                                DatePicker.showDatePicker(context,
                                                    showTitleActions: true,
                                                    currentTime: null,
                                                    minTime: DateTime.parse("1960-01-01"),
                                                    maxTime: DateTime.parse("2010-12-30"),
                                                    onConfirm: (date) {
                                                  setState(() {
                                                    provider.tanggal_lahir =
                                                        dateFormatterSystem
                                                            .parse(date
                                                                .toString()
                                                                .split(" ")[0]
                                                                .toString())
                                                            .toString();
                                                    _valTanggalLahir =
                                                        dateFormatterSystem
                                                            .parse(date.toString())
                                                            .toString().substring(0, 10);
                                                  });
                                                });
                                              },
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(top: 8),
                                        child: TextFormField(
                                          decoration: InputDecoration(
                                            labelText: 'No. HP *',
                                            labelStyle: AppTextStyle.regularTextStyle
                                                .copyWith(fontSize: 14),
                                            hintText: '62',
                                            floatingLabelBehavior:
                                                FloatingLabelBehavior.always,
                                          ),
                                          keyboardType: TextInputType.number,
                                          initialValue: "62",
                                          focusNode: n2,
                                          onChanged: (text) {
                                            provider.no_handphone = "+" + text;
                                          },
                                          onFieldSubmitted: (v) {
                                            n2.unfocus();
                                          },
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(top: 8),
                                        child: TextFormField(
                                          decoration: InputDecoration(
                                            labelText: 'Alamat Email',
                                            labelStyle: AppTextStyle.regularTextStyle
                                                .copyWith(fontSize: 14),
                                            hintText: 'cth: akun@email.com',
                                            floatingLabelBehavior:
                                                FloatingLabelBehavior.always,
                                          ),
                                          keyboardType: TextInputType.emailAddress,
                                          focusNode: n3,
                                          onChanged: (text) {
                                            provider.alamat_email = text;
                                          },
                                          onFieldSubmitted: (v) {
                                            n3.unfocus();
                                          },
                                        ),
                                      ),
                                      // Container(
                                      //   margin: EdgeInsets.only(top: 8),
                                      //   child: DropdownButtonFormField(
                                      //     decoration: InputDecoration(
                                      //       labelText: 'Regional *',
                                      //       labelStyle: AppTextStyle.regularTextStyle
                                      //           .copyWith(fontSize: 14),
                                      //     ),
                                      //     isExpanded: true,
                                      //     hint: Text("Pilih Regional"),
                                      //     value: provider.tambahPelangganModelData
                                      //             .regional.id,
                                      //     items: [
                                      //       DropdownMenuItem(
                                      //         child: Text(provider
                                      //             .tambahPelangganModelData
                                      //             .regional
                                      //             .namaRegional),
                                      //         value: provider.tambahPelangganModelData
                                      //             .regional.id,
                                      //       )
                                      //     ],
                                      //     onChanged: (value) {
                                      //       allUnFocus();
                                      //       provider.regional_id = value.toString();
                                      //       _valRegional = value;
                                      //       setState(() {});
                                      //     },
                                      //   ),
                                      // ),
                                      Container(
                                        margin: EdgeInsets.only(top: 8),
                                        child: TextFormField(
                                          decoration: InputDecoration(
                                            labelText: 'Regional *',
                                            labelStyle: AppTextStyle.regularTextStyle
                                                .copyWith(fontSize: 14),
                                            hintText: '',
                                            floatingLabelBehavior:
                                                FloatingLabelBehavior.always,
                                          ),
                                          enabled: false,
                                          keyboardType: TextInputType.number,
                                          initialValue: provider
                                                  .tambahPelangganModelData
                                                  .regional
                                                  .namaRegional,
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(top: 8),
                                        child: DropdownButtonFormField(
                                          decoration: InputDecoration(
                                            labelText: 'Wilayah *',
                                            labelStyle: AppTextStyle.regularTextStyle
                                                .copyWith(fontSize: 14),
                                          ),
                                          isExpanded: true,
                                          hint: Text("Pilih Wilayah"),
                                          value: _valWilayah,
                                          items: provider.tambahPelangganModelData
                                              .regional.wilayah
                                              .map((item) {
                                            return DropdownMenuItem(
                                              child: Text(item.namaProvinsi +
                                                  ', ' +
                                                  item.namaKota +
                                                  ', ' +
                                                  item.namaKelurahan),
                                              value: item.id,
                                            );
                                          }).toList(),
                                          onChanged: (value) {
                                            allUnFocus();
                                            provider.provinsi_id = value.toString();
                                            provider.regional_id = provider.tambahPelangganModelData
                                                  .regional.id.toString();
                                            _valWilayah = value;
                                            setState(() {});
                                          },
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(top: 8),
                                        child: TextFormField(
                                          decoration: InputDecoration(
                                            labelText: 'Alamat Lengkap *',
                                            labelStyle: AppTextStyle.regularTextStyle
                                                .copyWith(fontSize: 14),
                                            hintText:
                                                'cth: Jl Suka suka No 23 Rt 01 Rw 02',
                                            floatingLabelBehavior:
                                                FloatingLabelBehavior.always,
                                          ),
                                          focusNode: n4,
                                          onChanged: (text) {
                                            provider.alamat_lengkap = text;
                                          },
                                          onFieldSubmitted: (v) {
                                            n4.unfocus();
                                          },
                                        ),
                                      ),
                                      // Container(
                                      //   margin: EdgeInsets.only(top: 8),
                                      //   child: DropdownButtonFormField(
                                      //     decoration: InputDecoration(
                                      //       labelText: 'Provinsi',
                                      //       labelStyle: AppTextStyle.regularTextStyle
                                      //           .copyWith(fontSize: 14),
                                      //     ),
                                      //     isExpanded: true,
                                      //     hint: Text("Pilih Provinsi"),
                                      //     value: _valProvince,
                                      //     items: provider.masterProvinceModel.data
                                      //         .map((item) {
                                      //       return DropdownMenuItem(
                                      //         child: Text(item),
                                      //         value: item,
                                      //       );
                                      //     }).toList(),
                                      //     onChanged: (value) async {
                                      //       allUnFocus();
                                      //       await provider.getMasterCityData(value);
                                      //       provider.provinsi = value;
                                      //       _valProvince = value;
                                      //       listCity = provider.masterCityModel.data;
                                      //       setState(() {});
                                      //     },
                                      //   ),
                                      // ),
                                      // Container(
                                      //   margin: EdgeInsets.only(top: 8),
                                      //   child: DropdownButtonFormField(
                                      //     decoration: InputDecoration(
                                      //       labelText: 'Kabupaten / Kota',
                                      //       labelStyle: AppTextStyle.regularTextStyle
                                      //           .copyWith(fontSize: 14),
                                      //     ),
                                      //     isExpanded: true,
                                      //     hint: Text("Pilih Kabupaten / Kota"),
                                      //     value: _valCity,
                                      //     items: listCity == null
                                      //         ? null
                                      //         : listCity.map((item) {
                                      //             return DropdownMenuItem(
                                      //               child: Text(item),
                                      //               value: item,
                                      //             );
                                      //           }).toList(),
                                      //     onChanged: (value) async {
                                      //       allUnFocus();
                                      //       await provider
                                      //           .getMasterDistrictData(value);
                                      //       provider.kota = value;
                                      //       _valCity = value;
                                      //       listDistrict =
                                      //           provider.masterDistrictModel.data;
                                      //       setState(() {});
                                      //     },
                                      //   ),
                                      // ),
                                      // Container(
                                      //   margin: EdgeInsets.only(top: 8),
                                      //   child: DropdownButtonFormField(
                                      //     decoration: InputDecoration(
                                      //       labelText: 'Kecamatan',
                                      //       labelStyle: AppTextStyle.regularTextStyle
                                      //           .copyWith(fontSize: 14),
                                      //     ),
                                      //     isExpanded: true,
                                      //     hint: Text("Pilih Kecamatan"),
                                      //     value: _valDistrict,
                                      //     items: listDistrict == null
                                      //         ? null
                                      //         : listDistrict.map((item) {
                                      //             return DropdownMenuItem(
                                      //               child: Text(item),
                                      //               value: item,
                                      //             );
                                      //           }).toList(),
                                      //     onChanged: (value) {
                                      //       allUnFocus();
                                      //       provider.kelurahan = value;
                                      //       _valDistrict = value;
                                      //       setState(() {});
                                      //     },
                                      //   ),
                                      // ),
                                      // Container(
                                      //   child: ImageUploadCard(
                                      //     img: provider.neighbor_permit_file_name,
                                      //     text: 'Foto Customer',
                                      //     onTap: () {
                                      //       FlutterImagePicker.imagePickerModalSheet(
                                      //         context: context,
                                      //         fromCamera: () async {
                                      //           File t = await FlutterImagePicker
                                      //               .getImageCamera(context);
                                      //           provider.neighbor_permit_file_name =
                                      //               t;
                                      //           setState(() {});
                                      //         },
                                      //         fromGallery: () async {
                                      //           File t = await FlutterImagePicker
                                      //               .getImageGallery(context);
                                      //           provider.neighbor_permit_file_name =
                                      //               t;
                                      //           setState(() {});
                                      //         },
                                      //       );
                                      //     },
                                      //   ),
                                      // ),
                                      Container(
                                        child: Row(
                                          children: [
                                            Expanded(
                                              flex: 5,
                                              child: Container(
                                                padding: EdgeInsets.only(left: 5, top: 10, right: 5,),
                                                child: Column(
                                                  children: [
                                                    Container(
                                                      width: double.infinity,
                                                      child: RaisedButton(
                                                        child: Text('Foto Customer'),
                                                        shape: RoundedRectangleBorder(
                                                          borderRadius: BorderRadius.circular(6),
                                                        ),
                                                        color: AppColors.blueColor,
                                                        textColor: AppColors.whiteColor,
                                                        onPressed: () async {
                                                          fotoCustomer = await AppRouter.navToTakePictureScreen(context);
                                                          if (fotoCustomer != null) {
                                                            provider.foto_customer = fotoCustomer;
                                                          }
                                                          setState(() {});
                                                        },
                                                      ),
                                                    ),
                                                    Container(
                                                      width: MediaQuery.of(context).size.width,
                                                      height: MediaQuery.of(context).size.width * 0.5,
                                                      color: Colors.grey[200],
                                                      child: (fotoCustomer != null) ? Image.file(fotoCustomer) : SizedBox(),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              flex: 5,
                                              child: Container(
                                                padding: EdgeInsets.only(left: 5, top: 10, right: 5,),
                                                child: Column(
                                                  children: [
                                                    Container(
                                                      width: double.infinity,
                                                      child: RaisedButton(
                                                        child: Text('Foto e-KTP'),
                                                        shape: RoundedRectangleBorder(
                                                          borderRadius: BorderRadius.circular(6),
                                                        ),
                                                        color: AppColors.blueColor,
                                                        textColor: AppColors.whiteColor,
                                                        onPressed: () async {
                                                          fotoEKtp = await AppRouter.navToTakePictureScreen(context);
                                                          if (fotoEKtp != null) {
                                                            provider.foto_e_ktp = fotoEKtp;
                                                          }
                                                          setState(() {});
                                                        },
                                                      ),
                                                    ),
                                                    Container(
                                                      width: MediaQuery.of(context).size.width,
                                                      height: MediaQuery.of(context).size.width * 0.5,
                                                      color: Colors.grey[200],
                                                      child: (fotoEKtp != null) ? Image.file(fotoEKtp) : SizedBox(),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(top: 20),
                                        width: double.infinity,
                                        child: RaisedButton(
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(12),
                                          ),
                                          onPressed: () {
                                            allUnFocus();
                                            provider.upload();
                                          },
                                          color: AppColors.blueColor,
                                          textColor: AppColors.whiteColor,
                                          padding: const EdgeInsets.fromLTRB(
                                              25.0, 17.0, 25.0, 17.0),
                                          child: Text("Simpan",
                                              style: TextStyle(fontSize: 18)),
                                        ),
                                      ),
                                      // Container(
                                      //   margin: EdgeInsets.only(top: 8),
                                      //   width: double.infinity,
                                      //   height: 40,
                                      //   child: TextButton(
                                      //     onPressed: () {},
                                      //     child: Text("Ulangi",
                                      //         style: TextStyle(fontSize: 18)),
                                      //   ),
                                      // ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
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

import 'package:bintang_ezella_mobile_app/core/providers/listener_provider.dart';
import 'package:bintang_ezella_mobile_app/core/providers/supervisor_tambah_transaksi_provider.dart';
import 'package:bintang_ezella_mobile_app/ui/theme/theme.dart';
import 'package:bintang_ezella_mobile_app/ui/view/main/supervisor/tambah_pelanggan_page.dart';
import 'package:bintang_ezella_mobile_app/ui/widget/shimmer_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:intl/intl.dart';
import 'package:searchable_dropdown/searchable_dropdown.dart';

class TambahTransaksiPage extends StatefulWidget {
  final int produkId;
  const TambahTransaksiPage(this.produkId);

  @override
  _TambahTransaksiPageState createState() => _TambahTransaksiPageState();
}

class _TambahTransaksiPageState extends State<TambahTransaksiPage> {
  int _valCustomer;
  String _valCustomerAlamat;
  String _valStatusPenjualan;
  String _valLamaAngsuran;
  String _valTanggalSurvey = 'Pilih Tanggal Survey';
  int _valSales;
  int _valDemoBroker;
  bool _isVisibleTipe = true;
  bool _isVisibleUangMuka = true;
  bool _isVisibleCicilanPerBulan = true;
  bool _isVisibleTanggalSurvey = false;
  bool _isEnableUangMuka = false;
  int valHargaJual;
  int valUangMuka;
  double valCicilanPerBulan;
  TextEditingController customerAlamatController = new TextEditingController();
  TextEditingController customerNohpController = new TextEditingController();
  TextEditingController hargaProdukController = new TextEditingController();
  TextEditingController uangMukaController = new TextEditingController();
  TextEditingController cicilanPerBulanController = new TextEditingController();
  TextEditingController tanggalSurveyController = new TextEditingController();

  FocusNode n1 = FocusNode();
  FocusNode n2 = FocusNode();

  allUnFocus() {
    n1.unfocus();
    n2.unfocus();
  }

  @override
  void initState() {
    super.initState();
  }

  var dateFormatterHuman = new DateFormat('dd-MM-yyyy');
  var dateFormatterSystem = new DateFormat('yyyy-MM-dd');

  @override
  Widget build(BuildContext context) {
    return ListenerProvider<SupervisorTambahTransaksiProvider>(
      model: SupervisorTambahTransaksiProvider(
          context, widget.produkId.toString()),
      builder: (SupervisorTambahTransaksiProvider provider) => provider
                  .loading ==
              true
          ? ShimmerPage(
              header: "1",
            )
          : new Scaffold(
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
                                    icon: Icon(Icons.arrow_back),
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
                                  "Transaksi",
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
                      child: SingleChildScrollView(
                        child: Padding(
                          padding: EdgeInsets.only(
                              bottom: MediaQuery.of(context).viewInsets.bottom),
                          child: Column(
                            children: <Widget>[
                              Container(
                                padding: EdgeInsets.all(20),
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: AppColors.whiteColor,
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      child: Text(
                                        'Pesanan',
                                        style: AppTextStyle.boldTextStyle
                                            .copyWith(fontSize: 13),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 12,
                                    ),
                                    Container(
                                      child: Row(
                                        children: [
                                          Container(
                                            child: Image.network(
                                              provider.tambahTransaksiModelData
                                                  .produk.gambarProduk,
                                              width: 80,
                                              height: 80,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Expanded(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Container(
                                                  child: Text(
                                                    provider
                                                        .tambahTransaksiModelData
                                                        .produk
                                                        .namaProduk,
                                                    style: AppTextStyle
                                                        .regularTextStyle
                                                        .copyWith(fontSize: 13),
                                                  ),
                                                ),
                                                Container(
                                                  child: Text(
                                                    NumberFormat.currency(
                                                            locale: 'id',
                                                            symbol: 'Rp. ',
                                                            decimalDigits: 0)
                                                        .format(provider
                                                            .tambahTransaksiModelData
                                                            .produk
                                                            .hargaJualTunai)
                                                        .toString(),
                                                    style: AppTextStyle
                                                        .boldTextStyle
                                                        .copyWith(fontSize: 14),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Divider(
                                height: 2,
                                color: AppColors.whiteColor,
                              ),
                              Container(
                                padding: EdgeInsets.all(20),
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: AppColors.whiteColor,
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'Pelanggan',
                                            style: AppTextStyle.boldTextStyle
                                                .copyWith(fontSize: 13),
                                          ),
                                          Container(
                                            height: 17,
                                            child: TextButton(
                                              style: TextButton.styleFrom(
                                                textStyle: AppTextStyle
                                                    .boldTextStyle
                                                    .copyWith(fontSize: 13),
                                                padding: EdgeInsets.symmetric(
                                                    vertical: 0, horizontal: 8),
                                              ),
                                              onPressed: () {
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        TambahPelangganPage(
                                                            produkId: widget
                                                                .produkId),
                                                  ),
                                                );
                                              },
                                              child: Text('+ Tambah Pelanggan'),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            margin: EdgeInsets.only(top: 8),
                                            child: SearchableDropdown.single(
                                              isExpanded: true,
                                              displayClearIcon: false,
                                              label: Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 0,
                                                    top: 0,
                                                    right: 0,
                                                    bottom: 5),
                                                child: Text("Nama *",
                                                    style: AppTextStyle
                                                        .regularTextStyle
                                                        .copyWith(
                                                            fontSize: 12)),
                                              ),
                                              hint: Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 0,
                                                    top: 0,
                                                    right: 0,
                                                    bottom: 15),
                                                child: Text("Pilih Nama"),
                                              ),
                                              searchHint: "Pilih Nama",
                                              value: _valCustomer,
                                              selectedValueWidgetFn: (item) {
                                                return Align(
                                                  alignment: Alignment.topLeft,
                                                  child: Padding(
                                                    padding: EdgeInsets.only(
                                                        bottom: 15),
                                                    child: item.child,
                                                  ),
                                                );
                                              },
                                              searchFn:
                                                  (String keyword, items) {
                                                List<int> ret = List<int>();
                                                if (keyword != null &&
                                                    items != null &&
                                                    keyword.isNotEmpty) {
                                                  int i = 0;
                                                  items.forEach((item) {
                                                    var strLastLabel = item
                                                        .child
                                                        .toString()
                                                        .substring(6);
                                                    var strLabel =
                                                        strLastLabel.substring(
                                                            0,
                                                            strLastLabel
                                                                    .length -
                                                                2);
                                                    if (keyword.isNotEmpty &&
                                                        (strLabel
                                                            .toLowerCase()
                                                            .contains(keyword
                                                                .toLowerCase()))) {
                                                      ret.add(i);
                                                    }
                                                    i++;
                                                  });
                                                }
                                                if (keyword.isEmpty) {
                                                  ret = Iterable<int>.generate(
                                                          items.length)
                                                      .toList();
                                                }
                                                return (ret);
                                              },
                                              items: provider
                                                  .tambahTransaksiModelData
                                                  .customer
                                                  .map((item) {
                                                return DropdownMenuItem(
                                                  child: Text(item.label),
                                                  value: item.value,
                                                );
                                              }).toList(),
                                              onChanged: (value) {
                                                setState(() {
                                                  allUnFocus();
                                                  provider.customer_id =
                                                      value.toString();
                                                  _valCustomer = value;
                                                  if (value != null) {
                                                    customerNohpController.text = provider
                                                        .tambahTransaksiModelData
                                                        .customer[provider
                                                            .tambahTransaksiModelData
                                                            .customer
                                                            .indexWhere(
                                                                (element) =>
                                                                    element
                                                                        .value ==
                                                                    value)]
                                                        .noHandphone;
                                                    customerAlamatController.text = provider
                                                        .tambahTransaksiModelData
                                                        .customer[provider
                                                            .tambahTransaksiModelData
                                                            .customer
                                                            .indexWhere(
                                                                (element) =>
                                                                    element
                                                                        .value ==
                                                                    value)]
                                                        .alamatLengkap;

                                                    provider.produk_id = provider
                                                        .tambahTransaksiModelData
                                                        .produk
                                                        .id
                                                        .toString();
                                                    provider.nama_produk = provider
                                                        .tambahTransaksiModelData
                                                        .produk
                                                        .namaProduk;
                                                    provider.nama_merk = provider
                                                        .tambahTransaksiModelData
                                                        .produk
                                                        .merk
                                                        .namaMerk;
                                                    provider.nama_kategori_produk =
                                                        provider
                                                            .tambahTransaksiModelData
                                                            .produk
                                                            .kategoriProduk
                                                            .namaKategoriProduk;
                                                  }
                                                });
                                              },
                                            ),
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(top: 8),
                                            child: TextFormField(
                                              decoration: InputDecoration(
                                                enabled: false,
                                                labelText: 'No. HP *',
                                                labelStyle: AppTextStyle
                                                    .regularTextStyle
                                                    .copyWith(fontSize: 14),
                                                hintText: '+62',
                                                floatingLabelBehavior:
                                                    FloatingLabelBehavior
                                                        .always,
                                              ),
                                              controller:
                                                  customerNohpController,
                                            ),
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(top: 8),
                                            child: TextFormField(
                                              decoration: InputDecoration(
                                                enabled: false,
                                                labelText: 'Alamat',
                                                hintText:
                                                    'cth: Jl Suka suka No 23 Rt 01 Rw 02',
                                                labelStyle: AppTextStyle
                                                    .regularTextStyle
                                                    .copyWith(fontSize: 14),
                                                floatingLabelBehavior:
                                                    FloatingLabelBehavior
                                                        .always,
                                              ),
                                              controller:
                                                  customerAlamatController,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: 30,
                                    ),
                                    Container(
                                      child: Text(
                                        'Pembayaran',
                                        style: AppTextStyle.boldTextStyle
                                            .copyWith(fontSize: 13),
                                      ),
                                    ),
                                    Container(
                                      child: Column(
                                        children: [
                                          Container(
                                            margin: EdgeInsets.only(top: 8),
                                            child: DropdownButtonFormField(
                                              decoration: InputDecoration(
                                                labelText:
                                                    'Status Pembayaran *',
                                                labelStyle: AppTextStyle
                                                    .regularTextStyle
                                                    .copyWith(fontSize: 14),
                                              ),
                                              isExpanded: true,
                                              hint: Text(
                                                  "Pilih Status Pembayaran"),
                                              value: _valStatusPenjualan,
                                              items: provider
                                                  .tambahTransaksiModelData
                                                  .statusPenjualan
                                                  .map((item) {
                                                return DropdownMenuItem(
                                                  child: Text(item),
                                                  value: item,
                                                );
                                              }).toList(),
                                              onChanged: (value) {
                                                allUnFocus();

                                                provider.status_penjualan =
                                                    value.toString();
                                                provider.tanggal_jatuh_tempo =
                                                    '';
                                                _valStatusPenjualan = value;

                                                _valLamaAngsuran = null;
                                                hargaProdukController.text = '';
                                                uangMukaController.text = '';
                                                cicilanPerBulanController.text =
                                                    '';

                                                if (value == "Cicilan") {
                                                  _isVisibleTipe = true;
                                                  _isVisibleUangMuka = true;
                                                  _isVisibleCicilanPerBulan =
                                                      true;
                                                  _isVisibleTanggalSurvey =
                                                      false;
                                                  _isEnableUangMuka = false;
                                                } else if (value == "Tunai") {
                                                  _isVisibleTipe = false;
                                                  _isVisibleUangMuka = false;
                                                  _isVisibleCicilanPerBulan =
                                                      false;
                                                  _isVisibleTanggalSurvey =
                                                      false;
                                                  _isEnableUangMuka = false;

                                                  if (provider
                                                          .tambahTransaksiModelData
                                                          .produk
                                                          .statusProduk !=
                                                      "Harga Normal") {
                                                    hargaProdukController
                                                        .text = NumberFormat
                                                            .currency(
                                                                locale: 'id',
                                                                symbol: '',
                                                                decimalDigits:
                                                                    0)
                                                        .format(provider
                                                            .tambahTransaksiModelData
                                                            .produk
                                                            .diskonHargaJualTunai)
                                                        .toString();
                                                    provider.total_amount_penjualan =
                                                        provider
                                                            .tambahTransaksiModelData
                                                            .produk
                                                            .diskonHargaJualTunai
                                                            .toString();
                                                  } else {
                                                    hargaProdukController
                                                        .text = NumberFormat
                                                            .currency(
                                                                locale: 'id',
                                                                symbol: '',
                                                                decimalDigits:
                                                                    0)
                                                        .format(provider
                                                            .tambahTransaksiModelData
                                                            .produk
                                                            .hargaJualTunai)
                                                        .toString();
                                                    provider.total_amount_penjualan =
                                                        provider
                                                            .tambahTransaksiModelData
                                                            .produk
                                                            .hargaJualTunai
                                                            .toString();
                                                  }

                                                  provider.lama_angsuran = '';
                                                  provider.uang_muka = '0';
                                                  provider.angsuran_per_bulan =
                                                      '0';
                                                } else if (value == "Titipan") {
                                                  _isVisibleTipe = false;
                                                  _isVisibleUangMuka = true;
                                                  _isVisibleCicilanPerBulan =
                                                      false;
                                                  _isVisibleTanggalSurvey =
                                                      true;
                                                  _isEnableUangMuka = true;

                                                  if (provider
                                                          .tambahTransaksiModelData
                                                          .produk
                                                          .statusProduk !=
                                                      "Harga Normal") {
                                                    hargaProdukController
                                                        .text = NumberFormat
                                                            .currency(
                                                                locale: 'id',
                                                                symbol: '',
                                                                decimalDigits:
                                                                    0)
                                                        .format(provider
                                                            .tambahTransaksiModelData
                                                            .produk
                                                            .diskonHargaJualTunai)
                                                        .toString();
                                                    provider.total_amount_penjualan =
                                                        provider
                                                            .tambahTransaksiModelData
                                                            .produk
                                                            .diskonHargaJualTunai
                                                            .toString();
                                                  } else {
                                                    hargaProdukController
                                                        .text = NumberFormat
                                                            .currency(
                                                                locale: 'id',
                                                                symbol: '',
                                                                decimalDigits:
                                                                    0)
                                                        .format(provider
                                                            .tambahTransaksiModelData
                                                            .produk
                                                            .hargaJualTunai)
                                                        .toString();
                                                    provider.total_amount_penjualan =
                                                        provider
                                                            .tambahTransaksiModelData
                                                            .produk
                                                            .hargaJualTunai
                                                            .toString();
                                                  }

                                                  provider.lama_angsuran = '';
                                                  provider.uang_muka = '0';
                                                  provider.angsuran_per_bulan =
                                                      '0';
                                                }
                                                setState(() {});
                                              },
                                            ),
                                          ),
                                          Visibility(
                                            visible: _isVisibleTipe,
                                            child: Container(
                                              margin: EdgeInsets.only(top: 8),
                                              child: DropdownButtonFormField(
                                                decoration: InputDecoration(
                                                  labelText: 'Tipe Cicilan *',
                                                  labelStyle: AppTextStyle
                                                      .regularTextStyle
                                                      .copyWith(fontSize: 14),
                                                ),
                                                isExpanded: true,
                                                hint:
                                                    Text("Pilih Tipe Cicilan"),
                                                value: _valLamaAngsuran,
                                                items: provider
                                                    .tambahTransaksiModelData
                                                    .lamaAngsuran
                                                    .map((item) {
                                                  return DropdownMenuItem(
                                                    child: Text("Cicilan " +
                                                        item +
                                                        "X"),
                                                    value: item,
                                                  );
                                                }).toList(),
                                                onChanged: (value) {
                                                  allUnFocus();
                                                  _valLamaAngsuran = value;
                                                  if (_valLamaAngsuran == '3') {
                                                    if (provider
                                                            .tambahTransaksiModelData
                                                            .produk
                                                            .statusProduk !=
                                                        "Harga Normal") {
                                                      valHargaJual = provider
                                                          .tambahTransaksiModelData
                                                          .produk
                                                          .diskonHargaJualCicilan3X;
                                                      valUangMuka = provider
                                                          .tambahTransaksiModelData
                                                          .produk
                                                          .diskonDpCicilan3X;
                                                    } else {
                                                      valHargaJual = provider
                                                          .tambahTransaksiModelData
                                                          .produk
                                                          .hargaJualCicilan3X;
                                                      valUangMuka = provider
                                                          .tambahTransaksiModelData
                                                          .produk
                                                          .dpCicilan3X;
                                                    }
                                                  } else if (value == '5') {
                                                    if (provider
                                                            .tambahTransaksiModelData
                                                            .produk
                                                            .statusProduk !=
                                                        "Harga Normal") {
                                                      valHargaJual = provider
                                                          .tambahTransaksiModelData
                                                          .produk
                                                          .diskonHargaJualCicilan5X;
                                                      valUangMuka = provider
                                                          .tambahTransaksiModelData
                                                          .produk
                                                          .diskonDpCicilan5X;
                                                    } else {
                                                      valHargaJual = provider
                                                          .tambahTransaksiModelData
                                                          .produk
                                                          .hargaJualCicilan5X;
                                                      valUangMuka = provider
                                                          .tambahTransaksiModelData
                                                          .produk
                                                          .dpCicilan5X;
                                                    }
                                                  } else if (value == '7') {
                                                    if (provider
                                                            .tambahTransaksiModelData
                                                            .produk
                                                            .statusProduk !=
                                                        "Harga Normal") {
                                                      valHargaJual = provider
                                                          .tambahTransaksiModelData
                                                          .produk
                                                          .diskonHargaJualCicilan7X;
                                                      valUangMuka = provider
                                                          .tambahTransaksiModelData
                                                          .produk
                                                          .diskonDpCicilan7X;
                                                    } else {
                                                      valHargaJual = provider
                                                          .tambahTransaksiModelData
                                                          .produk
                                                          .hargaJualCicilan7X;
                                                      valUangMuka = provider
                                                          .tambahTransaksiModelData
                                                          .produk
                                                          .dpCicilan7X;
                                                    }
                                                  } else if (value == '8') {
                                                    if (provider
                                                            .tambahTransaksiModelData
                                                            .produk
                                                            .statusProduk !=
                                                        "Harga Normal") {
                                                      valHargaJual = provider
                                                          .tambahTransaksiModelData
                                                          .produk
                                                          .diskonHargaJualCicilan8X;
                                                      valUangMuka = provider
                                                          .tambahTransaksiModelData
                                                          .produk
                                                          .diskonDpCicilan8X;
                                                    } else {
                                                      valHargaJual = provider
                                                          .tambahTransaksiModelData
                                                          .produk
                                                          .hargaJualCicilan8X;
                                                      valUangMuka = provider
                                                          .tambahTransaksiModelData
                                                          .produk
                                                          .dpCicilan8X;
                                                    }
                                                  } else if (value == '9') {
                                                    if (provider
                                                            .tambahTransaksiModelData
                                                            .produk
                                                            .statusProduk !=
                                                        "Harga Normal") {
                                                      valHargaJual = provider
                                                          .tambahTransaksiModelData
                                                          .produk
                                                          .diskonHargaJualCicilan9X;
                                                      valUangMuka = provider
                                                          .tambahTransaksiModelData
                                                          .produk
                                                          .diskonDpCicilan9X;
                                                    } else {
                                                      valHargaJual = provider
                                                          .tambahTransaksiModelData
                                                          .produk
                                                          .hargaJualCicilan9X;
                                                      valUangMuka = provider
                                                          .tambahTransaksiModelData
                                                          .produk
                                                          .dpCicilan9X;
                                                    }
                                                  } else if (value == '10') {
                                                    if (provider
                                                            .tambahTransaksiModelData
                                                            .produk
                                                            .statusProduk !=
                                                        "Harga Normal") {
                                                      valHargaJual = provider
                                                          .tambahTransaksiModelData
                                                          .produk
                                                          .diskonHargaJualCicilan10X;
                                                      valUangMuka = provider
                                                          .tambahTransaksiModelData
                                                          .produk
                                                          .diskonDpCicilan10X;
                                                    } else {
                                                      valHargaJual = provider
                                                          .tambahTransaksiModelData
                                                          .produk
                                                          .hargaJualCicilan10X;
                                                      valUangMuka = provider
                                                          .tambahTransaksiModelData
                                                          .produk
                                                          .dpCicilan10X;
                                                    }
                                                  }
                                                  var valueInt =
                                                      int.parse(value);
                                                  assert(valueInt is int);
                                                  valCicilanPerBulan =
                                                      (valHargaJual -
                                                              valUangMuka) /
                                                          valueInt;

                                                  provider.lama_angsuran =
                                                      value.toString();
                                                  provider.uang_muka =
                                                      valUangMuka.toString();
                                                  provider.angsuran_per_bulan =
                                                      valCicilanPerBulan
                                                          .toInt()
                                                          .toString();
                                                  provider.total_amount_penjualan =
                                                      valHargaJual.toString();

                                                  hargaProdukController.text =
                                                      NumberFormat.currency(
                                                              locale: 'id',
                                                              symbol: '',
                                                              decimalDigits: 0)
                                                          .format(valHargaJual)
                                                          .toString();
                                                  uangMukaController.text =
                                                      NumberFormat.currency(
                                                              locale: 'id',
                                                              symbol: '',
                                                              decimalDigits: 0)
                                                          .format(valUangMuka)
                                                          .toString();
                                                  cicilanPerBulanController
                                                          .text =
                                                      NumberFormat.currency(
                                                              locale: 'id',
                                                              symbol: '',
                                                              decimalDigits: 0)
                                                          .format(
                                                              valCicilanPerBulan
                                                                  .toInt())
                                                          .toString();

                                                  setState(() {});
                                                },
                                              ),
                                            ),
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(top: 8),
                                            child: TextFormField(
                                              decoration: InputDecoration(
                                                enabled: false,
                                                prefix: Text("Rp. "),
                                                labelText: 'Harga *',
                                                hintText: '',
                                                floatingLabelBehavior:
                                                    FloatingLabelBehavior
                                                        .always,
                                              ),
                                              controller: hargaProdukController,
                                            ),
                                          ),
                                          Visibility(
                                            visible: _isVisibleUangMuka,
                                            child: Container(
                                              margin: EdgeInsets.only(top: 8),
                                              child: TextFormField(
                                                decoration: InputDecoration(
                                                  enabled: _isEnableUangMuka,
                                                  prefix: Text("Rp. "),
                                                  labelText: 'Uang Muka / DP *',
                                                  hintText: '',
                                                  floatingLabelBehavior:
                                                      FloatingLabelBehavior
                                                          .always,
                                                ),
                                                keyboardType:
                                                    TextInputType.number,
                                                focusNode: n1,
                                                controller: uangMukaController,
                                                onChanged: (v) {
                                                  provider.uang_muka = v
                                                      .toString()
                                                      .replaceAll('.', '');
                                                  if (v.length > 0) {
                                                    var string =
                                                        NumberFormat.currency(
                                                                locale: 'id',
                                                                symbol: '',
                                                                decimalDigits:
                                                                    0)
                                                            .format(int.parse(v
                                                                .toString()
                                                                .replaceAll(
                                                                    '.', '')))
                                                            .toString();
                                                    uangMukaController.value =
                                                        TextEditingValue(
                                                      text: string,
                                                      selection: TextSelection
                                                          .collapsed(
                                                              offset: string
                                                                  .length),
                                                    );
                                                  }
                                                },
                                                onFieldSubmitted: (v) {
                                                  n1.unfocus();
                                                },
                                              ),
                                            ),
                                          ),
                                          Visibility(
                                            visible: _isVisibleCicilanPerBulan,
                                            child: Container(
                                              margin: EdgeInsets.only(top: 8),
                                              child: TextFormField(
                                                decoration: InputDecoration(
                                                  enabled: false,
                                                  prefix: Text("Rp. "),
                                                  labelText:
                                                      'Cicilan per Bulan *',
                                                  hintText: '',
                                                  floatingLabelBehavior:
                                                      FloatingLabelBehavior
                                                          .always,
                                                ),
                                                controller:
                                                    cicilanPerBulanController,
                                              ),
                                            ),
                                          ),
                                          Visibility(
                                            visible: _isVisibleTanggalSurvey,
                                            child: Container(
                                              margin: EdgeInsets.only(top: 8),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Container(
                                                    margin: EdgeInsets.only(
                                                        top: 10),
                                                    child: Text(
                                                      'Tanggal Survey *',
                                                      style: AppTextStyle
                                                          .regularTextStyle
                                                          .copyWith(
                                                              fontSize: 11),
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
                                                            color: AppColors
                                                                .grayColor,
                                                            width: 1,
                                                          ),
                                                        ),
                                                      ),
                                                      child: Text(
                                                        _valTanggalSurvey,
                                                        style: AppTextStyle
                                                            .regularTextStyle
                                                            .copyWith(
                                                                color: AppColors
                                                                    .grayColor,
                                                                fontSize: 16),
                                                      ),
                                                    ),
                                                    onTap: () {
                                                      DatePicker.showDatePicker(
                                                          context,
                                                          showTitleActions:
                                                              true,
                                                          currentTime: null,
                                                          minTime: new DateTime
                                                              .now(),
                                                          onConfirm: (date) {
                                                        setState(() {
                                                          // var sDtime = dateFormatterHuman.format(date);
                                                          provider.tanggal_jatuh_tempo =
                                                              dateFormatterSystem
                                                                  .parse(date
                                                                      .toString()
                                                                      .split(
                                                                          " ")[0]
                                                                      .toString())
                                                                  .toString();
                                                          _valTanggalSurvey =
                                                              dateFormatterSystem
                                                                  .parse(date
                                                                      .toString()
                                                                      .split(" ")[
                                                                          0]
                                                                      .toString())
                                                                  .toString()
                                                                  .substring(
                                                                      0, 10);
                                                        });
                                                      });
                                                      // _selectDatePicker(context, (''));
                                                    },
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(top: 8),
                                            child: TextFormField(
                                              decoration: InputDecoration(
                                                labelText: 'Keterangan *',
                                                hintText: '',
                                                floatingLabelBehavior:
                                                    FloatingLabelBehavior
                                                        .always,
                                              ),
                                              onChanged: (text) {
                                                provider.keterangan = text;
                                              },
                                              focusNode: n2,
                                              onFieldSubmitted: (v) {
                                                n2.unfocus();
                                              },
                                            ),
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(top: 8),
                                            child: DropdownButtonFormField(
                                              decoration: InputDecoration(
                                                labelText: 'Sales *',
                                              ),
                                              isExpanded: true,
                                              hint: Text("Pilih Sales"),
                                              value: _valSales,
                                              items: _valCustomer == null
                                                  ? null
                                                  : provider
                                                      .tambahTransaksiModelData
                                                      .customer[provider
                                                          .tambahTransaksiModelData
                                                          .customer
                                                          .indexWhere(
                                                              (element) =>
                                                                  element
                                                                      .value ==
                                                                  _valCustomer)]
                                                      .sales
                                                      .map((item) {
                                                      return DropdownMenuItem(
                                                        child: Text(item.label),
                                                        value: item.value,
                                                      );
                                                    }).toList(),
                                              onChanged: (value) {
                                                allUnFocus();

                                                setState(() {
                                                  provider.sales_id =
                                                      value.toString();
                                                  _valSales = value;
                                                });
                                              },
                                            ),
                                          ),
                                          Visibility(
                                            visible: provider
                                                        .tambahTransaksiModelData
                                                        .demoBroker
                                                        .length >
                                                    0
                                                ? true
                                                : false,
                                            child: Container(
                                              margin: EdgeInsets.only(top: 8),
                                              child: DropdownButtonFormField(
                                                decoration: InputDecoration(
                                                  labelText: 'Demo Broker',
                                                ),
                                                isExpanded: true,
                                                hint: Text("Pilih Demo Broker"),
                                                value: _valDemoBroker,
                                                items: provider
                                                    .tambahTransaksiModelData
                                                    .demoBroker
                                                    .map((item) {
                                                  return DropdownMenuItem(
                                                    child: Text(item.label),
                                                    value: item.value,
                                                  );
                                                }).toList(),
                                                onChanged: (value) {
                                                  allUnFocus();

                                                  setState(() {
                                                    provider.demo_broker_id =
                                                        value.toString();
                                                    _valDemoBroker = value;
                                                  });
                                                },
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 30,
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(top: 8),
                                            width: double.infinity,
                                            child: RaisedButton(
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(12),
                                              ),
                                              onPressed: () {
                                                allUnFocus();
                                                provider.upload();
                                              },
                                              color: AppColors.blueColor,
                                              textColor: AppColors.whiteColor,
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      25.0, 17.0, 25.0, 17.0),
                                              child: Text(
                                                  "Simpan Transaksi"
                                                      .toUpperCase(),
                                                  style:
                                                      TextStyle(fontSize: 18)),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
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

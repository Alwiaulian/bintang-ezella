import 'dart:io';
import 'dart:typed_data';
import 'package:bintang_ezella_mobile_app/core/providers/listener_provider.dart';
import 'package:bintang_ezella_mobile_app/core/providers/supervisor_print_transaksi_provider.dart';
import 'package:bintang_ezella_mobile_app/core/util/flutter_toast.dart';
import 'package:bintang_ezella_mobile_app/ui/router/router.dart';
import 'package:bintang_ezella_mobile_app/ui/theme/theme.dart';
import 'package:bintang_ezella_mobile_app/ui/widget/shimmer_page.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:blue_thermal_printer/blue_thermal_printer.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';

class PrintTransaksiPage extends StatefulWidget {
  final String id;
  const PrintTransaksiPage(this.id);
  @override
  _PrintTransaksiPageState createState() => _PrintTransaksiPageState();
}

class _PrintTransaksiPageState extends State<PrintTransaksiPage> {
  BlueThermalPrinter bluetooth = BlueThermalPrinter.instance;
  List<BluetoothDevice> _devices = [];
  BluetoothDevice _device;
  bool _connected = false;
  String pathImage;

  var dateFormatterSystem = new DateFormat('yyyy-MM-dd');

  @override
  void initState() {
    super.initState();
    initPlatformState();
    initSavetoPath();
  }

  initSavetoPath() async {
    //read and write
    //image max 300px X 300px
    final filename = 'logo-struk.png';
    var bytes = await rootBundle.load("assets/images/logo-struk.png");
    String dir = (await getApplicationDocumentsDirectory()).path;
    writeToFile(bytes, '$dir/$filename');
    setState(() {
      pathImage = '$dir/$filename';
    });
  }

  Future<void> initPlatformState() async {
    bool isConnected = await bluetooth.isConnected;
    List<BluetoothDevice> devices = [];
    try {
      devices = await bluetooth.getBondedDevices();
    } on PlatformException {
      // TODO - Error
    }

    bluetooth.onStateChanged().listen((state) {
      switch (state) {
        case BlueThermalPrinter.CONNECTED:
          setState(() {
            _connected = true;
          });
          break;
        case BlueThermalPrinter.DISCONNECTED:
          setState(() {
            _connected = false;
          });
          break;
        default:
          print(state);
          break;
      }
    });

    if (!mounted) return;
    setState(() {
      _devices = devices;
    });

    if (isConnected) {
      setState(() {
        _connected = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListenerProvider(
      model: SupervisorPrintTransaksiProvider(context, widget.id),
      builder: (SupervisorPrintTransaksiProvider provider) => provider
                  .loading ==
              true
          ? ShimmerPage()
          : Scaffold(
              body: SafeArea(
                child: Container(
                  padding: EdgeInsets.all(15),
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            'Device Printer:',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            width: 30,
                          ),
                          Expanded(
                            child: DropdownButton(
                              items: _getDeviceItems(),
                              onChanged: (value) =>
                                  setState(() => _device = value),
                              value: _device,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          ElevatedButton(
                            style:
                                ElevatedButton.styleFrom(primary: Colors.brown),
                            onPressed: () {
                              initPlatformState();
                            },
                            child: Text(
                              'Refresh',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                primary:
                                    _connected ? Colors.red : Colors.green),
                            onPressed: _connected ? _disconnect : _connect,
                            child: Text(
                              _connected ? 'Disconnect' : 'Connect',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 10.0, right: 10.0, top: 100),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              primary: AppColors.mainColor,
                              padding: EdgeInsets.fromLTRB(20, 15, 20, 15)),
                          onPressed: () async {
                            await provider.checkCounterPrint(widget.id);
                            if (provider.checkCounterPrintModelData.counter >
                                2) {
                              FlutterToast.showErrorToast(
                                  context: context, message: 'Max print 2!');
                            } else {
                              //SIZE
                              // 0- normal size text
                              // 1- only bold text
                              // 2- bold with medium text
                              // 3- bold with large text
                              //ALIGN
                              // 0- ESC_ALIGN_LEFT
                              // 1- ESC_ALIGN_CENTER
                              // 2- ESC_ALIGN_RIGHT
                              bluetooth.isConnected.then((isConnected) {
                                if (isConnected) {
                                  var tanggal = dateFormatterSystem.parse(
                                      provider.detailTransaksiModelData
                                          .dataTransaksi.createdAt
                                          .substring(0, 10));
                                  bluetooth.printNewLine();
                                  bluetooth.printImage(pathImage);
                                  bluetooth.printNewLine();
                                  bluetooth.printNewLine();
                                  bluetooth.printCustom(
                                      "PT. BINTANG EZELLA SEJAHTERA", 1, 0);
                                  bluetooth.printCustom(
                                      "Head Office: Jl, Ry. Irian Jaya, Tanimbar 1 Ruko No. 161 RT. 005/007 Perumnas 3 Kel. Aren Jaya, Bekasi Timur 17111",
                                      1,
                                      0);
                                  bluetooth.printNewLine();
                                  bluetooth.printCustom(
                                      "Telp. 021-8269 3363", 1, 0);
                                  bluetooth.printNewLine();
                                  bluetooth.printNewLine();
                                  bluetooth.printCustom(
                                      "No. Kwitansi : " +
                                          provider.detailTransaksiModelData
                                              .pembayaran.noFaktur,
                                      1,
                                      0);
                                  bluetooth.printCustom(
                                      "Tanggal : " +
                                          tanggal.toString().substring(0, 10),
                                      1,
                                      0);
                                  bluetooth.printNewLine();
                                  bluetooth.printCustom(
                                      "Nama : " +
                                          provider.detailTransaksiModelData
                                              .pelanggan.namaLengkap,
                                      1,
                                      0);
                                  bluetooth.printCustom(
                                      "Alamat : " +
                                          provider.detailTransaksiModelData
                                              .pelanggan.alamat,
                                      1,
                                      0);
                                  bluetooth.printNewLine();
                                  bluetooth.printNewLine();
                                  bluetooth.printCustom(
                                      "Nama Barang : " +
                                          provider.detailTransaksiModelData
                                              .pesanan.namaProduk,
                                      1,
                                      0);
                                  bluetooth.printNewLine();
                                  bluetooth.printCustom(
                                      "Harga : " +
                                          NumberFormat.currency(
                                                  locale: 'id',
                                                  symbol: 'Rp ',
                                                  decimalDigits: 0)
                                              .format(provider
                                                  .detailTransaksiModelData
                                                  .pembayaran
                                                  .totalAmountPenjualan)
                                              .toString(),
                                      1,
                                      0);
                                  bluetooth.printNewLine();
                                  bluetooth.printNewLine();
                                  if (provider.detailTransaksiModelData
                                          .pembayaran.statusPenjualan ==
                                      "Cicilan") {
                                    bluetooth.printCustom(
                                        "Status Penjualan : " +
                                            provider.detailTransaksiModelData
                                                .pembayaran.tipeCicilan,
                                        1,
                                        0);
                                    bluetooth.printCustom(
                                        "Uang Muka : " +
                                            NumberFormat.currency(
                                                    locale: 'id',
                                                    symbol: 'Rp ',
                                                    decimalDigits: 0)
                                                .format(provider
                                                    .detailTransaksiModelData
                                                    .pembayaran
                                                    .uangMuka)
                                                .toString(),
                                        1,
                                        0);
                                    bluetooth.printCustom(
                                        "Cicilan Per Bulan : " +
                                            NumberFormat.currency(
                                                    locale: 'id',
                                                    symbol: 'Rp ',
                                                    decimalDigits: 0)
                                                .format(provider
                                                    .detailTransaksiModelData
                                                    .pembayaran
                                                    .cicilanPerBulan)
                                                .toString(),
                                        1,
                                        0);
                                    bluetooth.printCustom(
                                        "Tgl Jatuh Tempo : " +
                                            provider
                                                .detailTransaksiModelData
                                                .pembayaran
                                                .tanggalJatuhTempoPertama,
                                        1,
                                        0);
                                  } else {
                                    bluetooth.printCustom(
                                        "Status Penjualan : " +
                                            provider.detailTransaksiModelData
                                                .pembayaran.statusPenjualan,
                                        1,
                                        0);
                                    bluetooth.printCustom(
                                        "Uang Muka : " +
                                            NumberFormat.currency(
                                                    locale: 'id',
                                                    symbol: 'Rp ',
                                                    decimalDigits: 0)
                                                .format(provider
                                                    .detailTransaksiModelData
                                                    .pembayaran
                                                    .uangMuka)
                                                .toString(),
                                        1,
                                        0);
                                  }
                                  bluetooth.printNewLine();
                                  bluetooth.printNewLine();
                                  bluetooth.printCustom(
                                      "Supervisor : " +
                                          provider.detailTransaksiModelData
                                              .dataTransaksi.namaSupervisor,
                                      1,
                                      0);
                                  bluetooth.printNewLine();
                                  bluetooth.printCustom(
                                      "Marketing : " +
                                          provider.detailTransaksiModelData
                                              .dataTransaksi.namaSales,
                                      1,
                                      0);
                                  bluetooth.printNewLine();
                                  bluetooth.printCustom(
                                      "Demo Broker :" +
                                          provider.detailTransaksiModelData
                                              .dataTransaksi.namaDemoBroker,
                                      1,
                                      0);
                                  bluetooth.printNewLine();
                                  bluetooth.printCustom("Surveyor : -", 1, 0);
                                  bluetooth.printNewLine();
                                  bluetooth.printNewLine();
                                  bluetooth.printNewLine();
                                  bluetooth.printNewLine();
                                  bluetooth.paperCut();
                                } else {
                                  show('No device selected.');
                                }
                              });
                            }
                          },
                          child: Text('Print Struk Transaksi',
                              style: AppTextStyle.regularTextStyle.copyWith(
                                  color: AppColors.whiteColor, fontSize: 24)),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 10, right: 10, top: 20),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              primary: AppColors.whiteColor,
                              padding: EdgeInsets.fromLTRB(20, 15, 20, 15)),
                          onPressed: () {
                            AppRouter.navToMainSupervisor(context, 2, '');
                          },
                          child: Text(
                            'Selesai',
                            style: AppTextStyle.regularTextStyle.copyWith(
                                color: AppColors.mainColor, fontSize: 24),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
    );
  }

  List<DropdownMenuItem<BluetoothDevice>> _getDeviceItems() {
    List<DropdownMenuItem<BluetoothDevice>> items = [];
    if (_devices.isEmpty) {
      items.add(DropdownMenuItem(
        child: Text('NONE'),
      ));
    } else {
      _devices.forEach((device) {
        items.add(DropdownMenuItem(
          child: Text(device.name),
          value: device,
        ));
      });
    }
    return items;
  }

  void _connect() {
    if (_device == null) {
      show('No device selected.');
    } else {
      bluetooth.isConnected.then((isConnected) {
        if (!isConnected) {
          bluetooth.connect(_device).catchError((error) {
            setState(() => _connected = false);
          });
          setState(() => _connected = true);
        }
      });
    }
  }

  void _disconnect() {
    bluetooth.disconnect();
    setState(() => _connected = false);
  }

  //write to app path
  Future<void> writeToFile(ByteData data, String path) {
    final buffer = data.buffer;
    return new File(path).writeAsBytes(
        buffer.asUint8List(data.offsetInBytes, data.lengthInBytes));
  }

  Future show(
    String message, {
    Duration duration: const Duration(seconds: 3),
  }) async {
    await new Future.delayed(new Duration(milliseconds: 100));
    ScaffoldMessenger.of(context).showSnackBar(
      new SnackBar(
        content: new Text(
          message,
          style: new TextStyle(
            color: Colors.white,
          ),
        ),
        duration: duration,
      ),
    );
  }
}

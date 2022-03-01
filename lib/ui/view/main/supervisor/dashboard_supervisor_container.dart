import 'package:bintang_ezella_mobile_app/ui/theme/theme.dart';
import 'package:flutter/material.dart';
import 'supervisor_home_page.dart';
import 'riwayat_transaksi_page.dart';
import 'jadwal_penjualan_page.dart';
import 'supervisor_profile_page.dart';

class DashboardSupervisorContainer extends StatefulWidget {
  final int _selectedPage;
  final String search;
  DashboardSupervisorContainer(this._selectedPage, this.search);

  @override
  State<StatefulWidget> createState() {
    return DashboardSupervisorContainerState(_selectedPage);
  }
}

class DashboardSupervisorContainerState
    extends State<DashboardSupervisorContainer> {
  int _selectedPage;
  DashboardSupervisorContainerState(this._selectedPage);

  final _pageOptions = [
    (search) => SupervisorHomePage(),
    (search) => JadwalPenjualan(search),
    (search) => TransaksiPage(search),
    (search) => SupervisorProfilePage(),
  ];

  final String imageUrl = '';
  bool isActive = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bintang Ezella',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Scaffold(
        // appBar: AppBar(
        //     // title: Text('Transaksi'),
        //     ),
        body: _pageOptions[_selectedPage](widget.search),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: _selectedPage,
          onTap: (int index) {
            setState(() {
              _selectedPage = index;
            });
          },
          items: [
            BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.only(top: 4),
                child: _selectedPage == 0
                    ? new Image.asset(
                        'assets/images/icon_home_active.png',
                        width: 20,
                        height: 20,
                      )
                    : new Image.asset(
                        'assets/images/icon_home.png',
                        width: 20,
                        height: 20,
                      ),
              ),
              title: Padding(
                padding: const EdgeInsets.only(top: 0, bottom: 4),
                child: Text(
                  'Beranda',
                  style: AppTextStyle.boldTextStyle.copyWith(
                      color: _selectedPage == 0
                          ? AppColors.mainColor
                          : AppColors.grayColor,
                      fontSize: 12),
                ),
              ),
            ),
            BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.only(top: 4),
                child: _selectedPage == 1
                    ? new Image.asset(
                        'assets/images/icon_calendar_active.png',
                        width: 20,
                        height: 20,
                      )
                    : new Image.asset(
                        'assets/images/icon_calendar.png',
                        width: 20,
                        height: 20,
                      ),
              ),
              title: Padding(
                padding: const EdgeInsets.only(top: 0, bottom: 4),
                child: Text(
                  'Jadwal',
                  style: AppTextStyle.boldTextStyle.copyWith(
                      color: _selectedPage == 1
                          ? AppColors.mainColor
                          : AppColors.grayColor,
                      fontSize: 12),
                ),
              ),
            ),
            BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.only(top: 4),
                child: _selectedPage == 2
                    ? new Image.asset(
                        'assets/images/icon_clipboard_active.png',
                        width: 20,
                        height: 20,
                      )
                    : new Image.asset(
                        'assets/images/icon_clipboard.png',
                        width: 20,
                        height: 20,
                      ),
              ),
              title: Padding(
                padding: const EdgeInsets.only(top: 0, bottom: 4),
                child: Text(
                  'Transaksi',
                  style: AppTextStyle.boldTextStyle.copyWith(
                      color: _selectedPage == 2
                          ? AppColors.mainColor
                          : AppColors.grayColor,
                      fontSize: 12),
                ),
              ),
            ),
            BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.only(top: 4),
                child: _selectedPage == 3
                    ? new Image.asset(
                        'assets/images/icon_user_active.png',
                        width: 20,
                        height: 20,
                      )
                    : new Image.asset(
                        'assets/images/icon_user.png',
                        width: 20,
                        height: 20,
                      ),
              ),
              title: Padding(
                padding: const EdgeInsets.only(top: 0, bottom: 4),
                child: Text(
                  'Profil',
                  style: AppTextStyle.boldTextStyle.copyWith(
                      color: _selectedPage == 3
                          ? AppColors.mainColor
                          : AppColors.grayColor,
                      fontSize: 12),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:ui_login/core/components/assets.dart';
import 'package:ui_login/core/data/warna_color.dart';
import 'package:ui_login/core/data/warna_data.dart';
import 'package:ui_login/core/screen/home_screen.dart';
import 'package:ui_login/core/screen/inbox_screen.dart';
import 'package:ui_login/core/screen/scan_screen.dart';
import 'package:ui_login/core/screen/setting_screen.dart';
import 'package:ui_login/core/screen/ticket_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int kondisiSaatInit = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: tampilan[kondisiSaatInit],
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: WarnaData.grey,
        selectedItemColor: WarnaData.mainColor,
        currentIndex: kondisiSaatInit,
        onTap: (index) {
          setState(() {
            kondisiSaatInit = index;
          });
        },
        items: [
          BottomNavigationBarItem(icon: Image.asset(Assets.homegrey), activeIcon: Image.asset(Assets.home), label: 'Home', ),
          BottomNavigationBarItem(icon: Image.asset(Assets.ticket), activeIcon: Image.asset(Assets.ticketUngu), label: 'Ticket'),
          BottomNavigationBarItem(
  icon: Container(
    padding: EdgeInsets.all(25),
    decoration: BoxDecoration(
      shape: BoxShape.circle,
      color: Colors.transparent
    ),
    child: Icon(Icons.qr_code_scanner), // Gunakan child untuk memasukkan gambar
  ),
  activeIcon: Container(
    padding: EdgeInsets.all(25),
    decoration: BoxDecoration(
      shape: BoxShape.circle,
      color: WarnaData.mainColor
    ),
    child:Icon(Icons.qr_code_scanner, color: Colors.white,), // Icon aktif
  ),
  label: 'Ticket',
),
          BottomNavigationBarItem(icon: Image.asset(Assets. inbox ),activeIcon: Image.asset(Assets.inboxUngu), label: 'Inbox', ),
          BottomNavigationBarItem(icon: Image.asset(Assets.setting), activeIcon: Image.asset( Assets.settingUngu), label: 'Setting' ),
        ]
      ),
    );
  }
  List tampilan = [
    HomeScreen(),
    TicketScreen(),
    ScanScreen(),
     InboxScreen(),
    SettingScreen(),
    
  ];
}
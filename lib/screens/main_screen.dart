import 'package:alertario_project/main.dart';
import 'package:alertario_project/screens/history_screen.dart';
import 'package:alertario_project/screens/home_screen.dart';
import 'package:alertario_project/screens/report_screen.dart';
import 'package:alertario_project/widgets/alert_card.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    HomeScreen(),
    AlertsScreen(),
    SheltersScreen(),
    ReportScreen(),
    HistoryScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Icon(Icons.shield, color: Colors.white),
            SizedBox(width: 8),
            Text('Safetide', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
          ],
        ),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [AlertaRioColors.azulEscuro, AlertaRioColors.azulMedio],
            ),
          ),
        ),
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(Icons.settings, color: Colors.white),
            onPressed: () {
              _showSettingsDialog(context);
            },
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: AlertaRioColors.backgroundGradient,
        ),
        child: _screens[_currentIndex],
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: AlertaRioColors.cinzaUrbano.withOpacity(0.1),
              blurRadius: 10,
              offset: Offset(0, -5),
            ),
          ],
        ),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          selectedItemColor: AlertaRioColors.azulEscuro,
          unselectedItemColor: AlertaRioColors.cinzaUrbano.withOpacity(0.6),
          backgroundColor: Colors.transparent,
          elevation: 0,
          selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Início',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.warning),
              label: 'Alertas',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.location_on),
              label: 'Abrigos',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.camera_alt),
              label: 'Relatar',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.history),
              label: 'Histórico',
            ),
          ],
        ),
      ),
    );
  }

  void _showSettingsDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Configurações'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: Icon(Icons.notifications),
              title: Text('Notificações'),
              trailing: Switch(value: true, onChanged: (v) {}),
            ),
            ListTile(
              leading: Icon(Icons.location_on),
              title: Text('Localização'),
              trailing: Switch(value: true, onChanged: (v) {}),
            ),
            ListTile(
              leading: Icon(Icons.phone),
              title: Text('Contatos de Emergência'),
              onTap: () {},
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Fechar'),
          ),
        ],
      ),
    );
  }
}
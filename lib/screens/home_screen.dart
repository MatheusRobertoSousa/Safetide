import 'package:alertario_project/main.dart';
import 'package:alertario_project/widgets/alert_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _sosActive = false;

  void _handleSOS() async {
    setState(() {
      _sosActive = true;
    });

    // Vibração
    HapticFeedback.vibrate();

    // Simular envio
    await Future.delayed(Duration(seconds: 2));

    setState(() {
      _sosActive = false;
    });

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Row(
          children: [
            Icon(Icons.check_circle, color: Colors.green),
            SizedBox(width: 8),
            Text('SOS Enviado!'),
          ],
        ),
        content: Text(
          'Sua localização foi compartilhada com:\n'
          '• Defesa Civil do Rio\n'
          '• Corpo de Bombeiros\n'
          '• Contatos de emergência\n\n'
          'Aguarde o socorro!',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('OK'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: AlertaRioColors.backgroundGradient,
      ),
      child: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Center(
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 24),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.9),
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: AlertaRioColors.azulEscuro.withOpacity(0.2),
                      blurRadius: 10,
                      offset: Offset(0, 5),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Text(
                      'Safetide',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: AlertaRioColors.azulMarinhoProfundo,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      'Sistema de Alerta contra Enchentes',
                      style: TextStyle(
                        color: AlertaRioColors.cinzaUrbano.withOpacity(0.8),
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 32),

            // Botão SOS
            Center(
              child: GestureDetector(
                onTap: _sosActive ? null : _handleSOS,
                child: Container(
                  width: 140,
                  height: 140,
                  decoration: BoxDecoration(
                    gradient: _sosActive 
                      ? RadialGradient(
                          colors: [AlertaRioColors.vermelhoAlerta.withOpacity(0.8), AlertaRioColors.vermelhoAlerta],
                        )
                      : RadialGradient(
                          colors: [AlertaRioColors.vermelhoAlerta, AlertaRioColors.vermelhoAlerta.withOpacity(0.8)],
                        ),
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: AlertaRioColors.vermelhoAlerta.withOpacity(0.4),
                        blurRadius: 20,
                        spreadRadius: 5,
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      if (_sosActive)
                        CircularProgressIndicator(
                          color: Colors.white,
                          strokeWidth: 3,
                        )
                      else
                        Icon(
                          Icons.phone,
                          color: Colors.white,
                          size: 40,
                        ),
                      SizedBox(height: 8),
                      Text(
                        _sosActive ? 'Enviando...' : 'SOS',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 32),

            // Status Atual
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.95),
                borderRadius: BorderRadius.circular(12),
                border: Border(
                  left: BorderSide(color: Colors.green, width: 5),
                ),
                boxShadow: [
                  BoxShadow(
                    color: AlertaRioColors.azulEscuro.withOpacity(0.1),
                    blurRadius: 8,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              child: Row(
                children: [
                  Container(
                    width: 16,
                    height: 16,
                    decoration: BoxDecoration(
                      color: Colors.green,
                      shape: BoxShape.circle,
                    ),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Status Atual: Normal',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: AlertaRioColors.azulMarinhoProfundo,
                            fontSize: 16,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          'Nenhum alerta crítico na sua região',
                          style: TextStyle(
                            color: AlertaRioColors.cinzaUrbano,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 24),

            // Alertas Recentes
            Text(
              'Alertas Recentes',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                shadows: [
                  Shadow(
                    color: AlertaRioColors.azulMarinhoProfundo.withOpacity(0.5),
                    offset: Offset(1, 1),
                    blurRadius: 2,
                  ),
                ],
              ),
            ),
            SizedBox(height: 12),
            AlertCard(
              title: 'Chuva Moderada',
              message: 'Previsão de chuva moderada para as próximas 2 horas na Zona Sul',
              level: 'amarelo',
              time: '14:30',
              region: 'Zona Sul',
            ),
            SizedBox(height: 8),
            AlertCard(
              title: 'Risco de Alagamento',
              message: 'Possibilidade de alagamento na Av. Brasil e adjacências',
              level: 'laranja',
              time: '13:15',
              region: 'Zona Norte',
            ),
            SizedBox(height: 24),

            // Ações Rápidas
            Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [AlertaRioColors.azulMedio, AlertaRioColors.azulEscuro],
                      ),
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: AlertaRioColors.azulEscuro.withOpacity(0.3),
                          blurRadius: 8,
                          offset: Offset(0, 4),
                        ),
                      ],
                    ),
                    child: ElevatedButton.icon(
                      onPressed: () {
                        // Navegar para relatos
                      },
                      icon: Icon(Icons.camera_alt, color: Colors.white),
                      label: Text('Fazer Relato', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        shadowColor: Colors.transparent,
                        padding: EdgeInsets.symmetric(vertical: 16),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 12),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Colors.green[400]!, Colors.green[600]!],
                      ),
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.green.withOpacity(0.3),
                          blurRadius: 8,
                          offset: Offset(0, 4),
                        ),
                      ],
                    ),
                    child: ElevatedButton.icon(
                      onPressed: () {
                        // Navegar para abrigos
                      },
                      icon: Icon(Icons.shield, color: Colors.white),
                      label: Text('Abrigos', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        shadowColor: Colors.transparent,
                        padding: EdgeInsets.symmetric(vertical: 16),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
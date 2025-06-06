// Tela de Histórico Completa
import 'dart:ui';

import 'package:alertario_project/widgets/alert_card.dart';
import 'package:flutter/material.dart';
import '../main.dart';

class HistoryScreen extends StatefulWidget {
  @override
  _HistoryScreenState createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  String _selectedTab = 'Meus Relatos';
  final List<String> _tabs = ['Meus Relatos', 'Alertas Recebidos'];

  final List<Map<String, dynamic>> _myReports = [
    {
      'id': '#12345',
      'title': 'Alagamento na Rua Principal',
      'category': 'Alagamento',
      'severity': 'Alto',
      'date': '15/05/2024',
      'status': 'Em Análise',
      'statusColor': Colors.orange,
    },
    {
      'id': '#12344',
      'title': 'Árvore Caída na Calçada',
      'category': 'Árvore Caída',
      'severity': 'Médio',
      'date': '14/05/2024',
      'status': 'Resolvido',
      'statusColor': Colors.green,
    },
    {
      'id': '#12343',
      'title': 'Buraco Grande na Via',
      'category': 'Buraco na Via',
      'severity': 'Alto',
      'date': '13/05/2024',
      'status': 'Pendente',
      'statusColor': Colors.red,
    },
  ];

  final List<Map<String, dynamic>> _receivedAlerts = [
    {
      'title': 'Chuva Forte Prevista',
      'message': 'Previsão de chuva intensa para as próximas 3 horas',
      'level': 'laranja',
      'date': '15/05/2024',
      'time': '14:30',
      'region': 'Sua Região',
    },
    {
      'title': 'Risco de Alagamento',
      'message': 'Possível alagamento em vias principais',
      'level': 'amarelo',
      'date': '14/05/2024',
      'time': '10:15',
      'region': 'Centro',
    },
    {
      'title': 'Situação Normalizada',
      'message': 'Níveis de água voltaram ao normal',
      'level': 'verde',
      'date': '13/05/2024',
      'time': '16:45',
      'region': 'Zona Sul',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: AlertaRioColors.backgroundGradient,
      ),
      child: Column(
        children: [
          // Header com Tabs
          Container(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Histórico',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 16),
                Row(
                  children: _tabs.map((tab) {
                    final isSelected = tab == _selectedTab;
                    return Expanded(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            _selectedTab = tab;
                          });
                        },
                        child: Container(
                          margin: EdgeInsets.only(right: tab == _tabs.first ? 8 : 0),
                          padding: EdgeInsets.symmetric(vertical: 12),
                          decoration: BoxDecoration(
                            color: isSelected ? Colors.white.withOpacity(0.2) : Colors.transparent,
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                              color: Colors.white.withOpacity(0.3),
                              width: 1,
                            ),
                          ),
                          child: Text(
                            tab,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: isSelected ? Colors.white : Colors.white70,
                              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                            ),
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ],
            ),
          ),
          // Conteúdo
          Expanded(
            child: _selectedTab == 'Meus Relatos' 
                ? _buildMyReports() 
                : _buildReceivedAlerts(),
          ),
        ],
      ),
    );
  }

  Widget _buildMyReports() {
    return ListView.builder(
      padding: EdgeInsets.symmetric(horizontal: 16),
      itemCount: _myReports.length,
      itemBuilder: (context, index) {
        final report = _myReports[index];
        return Container(
          margin: EdgeInsets.only(bottom: 12),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.95),
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: AlertaRioColors.azulEscuro.withOpacity(0.1),
                blurRadius: 8,
                offset: Offset(0, 4),
              ),
            ],
          ),
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      report['id'],
                      style: TextStyle(
                        fontSize: 14,
                        color: AlertaRioColors.cinzaUrbano.withOpacity(0.7),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: report['statusColor'],
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        report['status'],
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 8),
                Text(
                  report['title'],
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: AlertaRioColors.azulMarinhoProfundo,
                  ),
                ),
                SizedBox(height: 8),
                Row(
                  children: [
                    Icon(Icons.category, size: 16, color: AlertaRioColors.azulMedio),
                    SizedBox(width: 4),
                    Text(report['category']),
                    SizedBox(width: 16),
                    Icon(Icons.warning, size: 16, color: _getSeverityColor(report['severity'])),
                    SizedBox(width: 4),
                    Text(report['severity']),
                    SizedBox(width: 16),
                    Icon(Icons.calendar_today, size: 16, color: AlertaRioColors.azulMedio),
                    SizedBox(width: 4),
                    Text(report['date']),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildReceivedAlerts() {
    return ListView.builder(
      padding: EdgeInsets.symmetric(horizontal: 16),
      itemCount: _receivedAlerts.length,
      itemBuilder: (context, index) {
        final alert = _receivedAlerts[index];
        return Padding(
          padding: EdgeInsets.only(bottom: 12),
          child: AlertCard(
            title: alert['title'],
            message: alert['message'],
            level: alert['level'],
            time: alert['time'],
            region: alert['region'],
          ),
        );
      },
    );
  }

  Color _getSeverityColor(String severity) {
    switch (severity) {
      case 'Baixo':
        return Colors.green;
      case 'Médio':
        return AlertaRioColors.amareloAlerta;
      case 'Alto':
        return Colors.orange;
      case 'Crítico':
        return AlertaRioColors.vermelhoAlerta;
      default:
        return Colors.grey;
    }
  }
}
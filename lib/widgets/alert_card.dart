// alert_card.dart
import 'package:alertario_project/main.dart';
import 'package:flutter/material.dart';

class AlertCard extends StatelessWidget {
  final String title;
  final String message;
  final String level;
  final String time;
  final String region;

  const AlertCard({
    Key? key,
    required this.title,
    required this.message,
    required this.level,
    required this.time,
    required this.region,
  }) : super(key: key);

  Color _getLevelColor() {
    switch (level) {
      case 'verde':
        return Colors.green;
      case 'amarelo':
        return AlertaRioColors.amareloAlerta;
      case 'laranja':
        return Colors.orange;
      case 'vermelho':
        return AlertaRioColors.vermelhoAlerta;
      default:
        return AlertaRioColors.cinzaUrbano;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(vertical: 4),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.95),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AlertaRioColors.azulCeu.withOpacity(0.3)),
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
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 16,
              height: 16,
              margin: EdgeInsets.only(top: 4),
              decoration: BoxDecoration(
                color: _getLevelColor(),
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: _getLevelColor().withOpacity(0.3),
                    blurRadius: 4,
                    spreadRadius: 1,
                  ),
                ],
              ),
            ),
            SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        title,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: AlertaRioColors.azulMarinhoProfundo,
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        time,
                        style: TextStyle(
                          fontSize: 12,
                          color: AlertaRioColors.cinzaUrbano.withOpacity(0.7),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 6),
                  Text(
                    message,
                    style: TextStyle(
                      color: AlertaRioColors.cinzaUrbano,
                      fontSize: 14,
                      height: 1.4,
                    ),
                  ),
                  SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                        decoration: BoxDecoration(
                          color: AlertaRioColors.brancoNeutro,
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: AlertaRioColors.azulCeu.withOpacity(0.5)),
                        ),
                        child: Text(
                          region,
                          style: TextStyle(
                            fontSize: 12,
                            color: AlertaRioColors.azulEscuro,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                        decoration: BoxDecoration(
                          color: _getLevelColor(),
                          borderRadius: BorderRadius.circular(16),
                          boxShadow: [
                            BoxShadow(
                              color: _getLevelColor().withOpacity(0.3),
                              blurRadius: 4,
                              offset: Offset(0, 2),
                            ),
                          ],
                        ),
                        child: Text(
                          level.toUpperCase(),
                          style: TextStyle(
                            fontSize: 10,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 0.5,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Tela de Alertas Completa
class AlertsScreen extends StatefulWidget {
  @override
  _AlertsScreenState createState() => _AlertsScreenState();
}

class _AlertsScreenState extends State<AlertsScreen> {
  String _selectedFilter = 'Todos';
  final List<String> _filters = ['Todos', 'Crítico', 'Alto', 'Médio', 'Baixo'];

  final List<Map<String, dynamic>> _alerts = [
    {
      'title': 'Enchente Crítica',
      'message': 'Nível da água subindo rapidamente na Barra da Tijuca',
      'level': 'vermelho',
      'time': '10:30',
      'region': 'Barra da Tijuca',
      'severity': 'Crítico',
    },
    {
      'title': 'Chuva Intensa',
      'message': 'Precipitação acima de 50mm/h prevista para as próximas horas',
      'level': 'laranja',
      'time': '09:45',
      'region': 'Centro',
      'severity': 'Alto',
    },
    {
      'title': 'Alagamento Moderado',
      'message': 'Pontos de alagamento em vias principais',
      'level': 'amarelo',
      'time': '08:15',
      'region': 'Copacabana',
      'severity': 'Médio',
    },
    {
      'title': 'Previsão de Chuva',
      'message': 'Possibilidade de chuva fraca nas próximas 2 horas',
      'level': 'verde',
      'time': '07:30',
      'region': 'Ipanema',
      'severity': 'Baixo',
    },
  ];

  List<Map<String, dynamic>> get _filteredAlerts {
    if (_selectedFilter == 'Todos') return _alerts;
    return _alerts.where((alert) => alert['severity'] == _selectedFilter).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: AlertaRioColors.backgroundGradient,
      ),
      child: Column(
        children: [
          // Filtros
          Container(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Alertas Ativos',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 16),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: _filters.map((filter) {
                      final isSelected = filter == _selectedFilter;
                      return Padding(
                        padding: EdgeInsets.only(right: 8),
                        child: FilterChip(
                          label: Text(filter),
                          selected: isSelected,
                          onSelected: (selected) {
                            setState(() {
                              _selectedFilter = filter;
                            });
                          },
                          backgroundColor: Colors.white.withOpacity(0.2),
                          selectedColor: AlertaRioColors.azulEscuro,
                          labelStyle: TextStyle(
                            color: isSelected ? Colors.white : Colors.white70,
                            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
          ),
          // Lista de Alertas
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.symmetric(horizontal: 16),
              itemCount: _filteredAlerts.length,
              itemBuilder: (context, index) {
                final alert = _filteredAlerts[index];
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
            ),
          ),
        ],
      ),
    );
  }
}

// Tela de Abrigos Completa
class SheltersScreen extends StatelessWidget {
  final List<Map<String, dynamic>> _shelters = [
    {
      'name': 'Escola Municipal São Sebastião',
      'address': 'Rua das Flores, 123 - Tijuca',
      'capacity': 200,
      'occupied': 45,
      'distance': '1.2 km',
      'available': true,
      'services': ['Alimentação', 'Primeiros Socorros', 'Banho'],
    },
    {
      'name': 'Centro Esportivo Carioca',
      'address': 'Av. Brasil, 456 - Maracanã',
      'capacity': 500,
      'occupied': 380,
      'distance': '2.8 km',
      'available': true,
      'services': ['Alimentação', 'Dormitório', 'Área Infantil'],
    },
    {
      'name': 'Ginásio Municipal',
      'address': 'Rua do Porto, 789 - Centro',
      'capacity': 150,
      'occupied': 150,
      'distance': '3.5 km',
      'available': false,
      'services': ['Alimentação', 'Primeiros Socorros'],
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
          // Header
          Container(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Abrigos Próximos',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'Encontre abrigos seguros na sua região',
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
          // Lista de Abrigos
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.symmetric(horizontal: 16),
              itemCount: _shelters.length,
              itemBuilder: (context, index) {
                final shelter = _shelters[index];
                return _buildShelterCard(shelter);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildShelterCard(Map<String, dynamic> shelter) {
    final isAvailable = shelter['available'];
    final occupancyRate = shelter['occupied'] / shelter['capacity'];
    
    return Container(
      margin: EdgeInsets.only(bottom: 16),
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
                Expanded(
                  child: Text(
                    shelter['name'],
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: AlertaRioColors.azulMarinhoProfundo,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: isAvailable ? Colors.green : Colors.red,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    isAvailable ? 'Disponível' : 'Lotado',
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
              shelter['address'],
              style: TextStyle(
                color: AlertaRioColors.cinzaUrbano,
                fontSize: 14,
              ),
            ),
            SizedBox(height: 12),
            Row(
              children: [
                Icon(Icons.people, size: 16, color: AlertaRioColors.azulMedio),
                SizedBox(width: 4),
                Text(
                  '${shelter['occupied']}/${shelter['capacity']} pessoas',
                  style: TextStyle(
                    color: AlertaRioColors.cinzaUrbano,
                    fontSize: 14,
                  ),
                ),
                SizedBox(width: 16),
                Icon(Icons.location_on, size: 16, color: AlertaRioColors.azulMedio),
                SizedBox(width: 4),
                Text(
                  shelter['distance'],
                  style: TextStyle(
                    color: AlertaRioColors.cinzaUrbano,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
            SizedBox(height: 12),
            // Barra de ocupação
            Container(
              height: 8,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(4),
              ),
              child: FractionallySizedBox(
                widthFactor: occupancyRate,
                child: Container(
                  decoration: BoxDecoration(
                    color: occupancyRate > 0.8 ? Colors.red : 
                           occupancyRate > 0.6 ? Colors.orange : Colors.green,
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
              ),
            ),
            SizedBox(height: 12),
            // Serviços
            Wrap(
              spacing: 8,
              runSpacing: 4,
              children: shelter['services'].map<Widget>((service) {
                return Container(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: AlertaRioColors.azulCeu.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    service,
                    style: TextStyle(
                      fontSize: 12,
                      color: AlertaRioColors.azulEscuro,
                    ),
                  ),
                );
              }).toList(),
            ),
            SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: isAvailable ? () {} : null,
                    icon: Icon(Icons.directions),
                    label: Text('Como Chegar'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AlertaRioColors.azulMedio,
                      foregroundColor: Colors.white,
                    ),
                  ),
                ),
                SizedBox(width: 12),
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () {},
                    icon: Icon(Icons.phone),
                    label: Text('Contato'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      foregroundColor: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
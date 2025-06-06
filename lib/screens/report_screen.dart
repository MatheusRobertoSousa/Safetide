// Tela de Relatos Completa
import 'package:alertario_project/main.dart';
import 'package:flutter/material.dart';

class ReportScreen extends StatefulWidget {
  @override
  _ReportScreenState createState() => _ReportScreenState();
}

class _ReportScreenState extends State<ReportScreen> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  String _selectedCategory = 'Alagamento';
  String _selectedSeverity = 'Médio';
  bool _isUploading = false;

  final List<String> _categories = [
    'Alagamento',
    'Deslizamento',
    'Árvore Caída',
    'Buraco na Via',
    'Falta de Energia',
    'Outros'
  ];

  final List<String> _severities = ['Baixo', 'Médio', 'Alto', 'Crítico'];

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
            Text(
              'Fazer Relato',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Relate problemas na sua região para ajudar outros cidadãos',
              style: TextStyle(
                color: Colors.white70,
                fontSize: 16,
              ),
            ),
            SizedBox(height: 24),

            // Formulário
            Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.95),
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: AlertaRioColors.azulEscuro.withOpacity(0.1),
                    blurRadius: 10,
                    offset: Offset(0, 5),
                  ),
                ],
              ),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Categoria
                    Text(
                      'Categoria do Problema',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: AlertaRioColors.azulMarinhoProfundo,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(height: 8),
                    DropdownButtonFormField<String>(
                      value: _selectedCategory,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                      ),
                      items: _categories.map((category) {
                        return DropdownMenuItem(
                          value: category,
                          child: Text(category),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          _selectedCategory = value!;
                        });
                      },
                    ),
                    SizedBox(height: 16),

                    // Severidade
                    Text(
                      'Nível de Severidade',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: AlertaRioColors.azulMarinhoProfundo,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(height: 8),
                    Row(
                      children: _severities.map((severity) {
                        final isSelected = severity == _selectedSeverity;
                        return Expanded(
                          child: Padding(
                            padding: EdgeInsets.only(right: 8),
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  _selectedSeverity = severity;
                                });
                              },
                              child: Container(
                                padding: EdgeInsets.symmetric(vertical: 12),
                                decoration: BoxDecoration(
                                  color: isSelected ? _getSeverityColor(severity) : Colors.grey[200],
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(
                                    color: isSelected ? _getSeverityColor(severity) : Colors.grey[300]!,
                                    width: 2,
                                  ),
                                ),
                                child: Text(
                                  severity,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: isSelected ? Colors.white : Colors.grey[600],
                                    fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                    SizedBox(height: 16),

                    // Título
                    Text(
                      'Título do Relato',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: AlertaRioColors.azulMarinhoProfundo,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(height: 8),
                    TextFormField(
                      controller: _titleController,
                      decoration: InputDecoration(
                        hintText: 'Ex: Alagamento na Rua das Flores',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Por favor, insira um título';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 16),

                    // Descrição
                    Text(
                      'Descrição Detalhada',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: AlertaRioColors.azulMarinhoProfundo,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(height: 8),
                    TextFormField(
                      controller: _descriptionController,
                      maxLines: 4,
                      decoration: InputDecoration(
                        hintText: 'Descreva o problema em detalhes...',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Por favor, insira uma descrição';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 16),

                    // Fotos
                    Text(
                      'Adicionar Fotos (Opcional)',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: AlertaRioColors.azulMarinhoProfundo,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(height: 8),
                    Container(
                      width: double.infinity,
                      height: 120,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey[300]!, width: 2, style: BorderStyle.solid),
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.grey[50],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.camera_alt, size: 40, color: Colors.grey[400]),
                          SizedBox(height: 8),
                          Text(
                            'Toque para adicionar fotos',
                            style: TextStyle(color: Colors.grey[600]),
                          ),
                          Text(
                            'Máximo 3 fotos',
                            style: TextStyle(color: Colors.grey[500], fontSize: 12),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 24),

                    // Botão de Envio
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: _isUploading ? null : _submitReport,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AlertaRioColors.azulEscuro,
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: _isUploading
                            ? Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    width: 20,
                                    height: 20,
                                    child: CircularProgressIndicator(
                                      strokeWidth: 2,
                                      color: Colors.white,
                                    ),
                                  ),
                                  SizedBox(width: 12),
                                  Text('Enviando...'),
                                ],
                              )
                            : Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.send),
                                  SizedBox(width: 8),
                                  Text(
                                    'Enviar Relato',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
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

  void _submitReport() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isUploading = true;
      });

      // Simular envio
      await Future.delayed(Duration(seconds: 2));

      setState(() {
        _isUploading = false;
      });

      // Mostrar confirmação
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Row(
            children: [
              Icon(Icons.check_circle, color: Colors.green),
              SizedBox(width: 8),
              Text('Relato Enviado!'),
            ],
          ),
          content: Text(
            'Seu relato foi enviado com sucesso!\n\n'
            'Protocolo: #${DateTime.now().millisecondsSinceEpoch.toString().substring(7)}\n\n'
            'Obrigado por contribuir com a segurança da nossa cidade.',
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                _clearForm();
              },
              child: Text('OK'),
            ),
          ],
        ),
      );
    }
  }

  void _clearForm() {
    _titleController.clear();
    _descriptionController.clear();
    setState(() {
      _selectedCategory = 'Alagamento';
      _selectedSeverity = 'Médio';
    });
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }
}
import 'package:flutter/material.dart';
import 'package:eo_pix/cobranca.dart';  // Importa o arquivo cobranca.dart

class AdicionarCobrancaPage extends StatefulWidget {
  @override
  _AdicionarCobrancaPageState createState() => _AdicionarCobrancaPageState();
}

class _AdicionarCobrancaPageState extends State<AdicionarCobrancaPage> {
  final _formKey = GlobalKey<FormState>();
  final _nomeController = TextEditingController();
  final _dataController = TextEditingController();
  final _descricaoController = TextEditingController();
  final _valorController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Criar Cobrança'),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                controller: _nomeController,
                decoration: InputDecoration(
                  labelText: 'Nome',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira o nome';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: _dataController,
                decoration: InputDecoration(
                  labelText: 'Data',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira a data';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: _descricaoController,
                decoration: InputDecoration(
                  labelText: 'Descrição',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira uma descrição';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: _valorController,
                decoration: InputDecoration(
                  labelText: 'Valor',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira o valor';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              ElevatedButton.icon(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    final novaCobranca = Cobranca(
                      nome: _nomeController.text,
                      data: _dataController.text,
                      descricao: _descricaoController.text,
                      valor: _valorController.text,
                    );
                    Navigator.pop(context, novaCobranca);
                  }
                },
                icon: Icon(Icons.add),
                label: Text('ADICIONAR'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
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

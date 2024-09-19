import 'package:flutter/material.dart';


import 'package:eo_pix/AdicionarCobranca.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List cobrancas = [
    Cobranca(nome: 'ricardo', data: '24/08/24', descricao: 'devendo', valor: 'R\$ 100,00', avatar: true),
    Cobranca(nome: 'ricardo', data: '16/08/24', descricao: 'devendo', valor: 'R\$ 50,00', avatar: false),
    Cobranca(nome: 'ricardo', data: '28/08/24', descricao: 'devendo', valor: 'R\$ 75,00', avatar: false),
  ];

  void adicionarCobranca( cobranca) {
    setState(() {
      cobrancas.add(cobranca);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Minhas cobranças'),
        actions: [
          IconButton(
            icon: Icon(Icons.filter_list),
            onPressed: () {},
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: cobrancas.length,
        itemBuilder: (context, index) {
          final cobranca = cobrancas[index];
          return Card(
            color: Colors.green,
            child: ListTile(
              leading: cobranca.avatar
                  ? CircleAvatar(
                      backgroundImage: AssetImage('assets/avatar.png'),
                    )
                  : Icon(Icons.person),
              title: Text(cobranca.nome),
              subtitle: Text('${cobranca.descricao}\n${cobranca.valor}'),
              trailing: Text(cobranca.data),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final novaCobranca = await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AdicionarCobrancaPage()),
          );
          if (novaCobranca != null) {
            adicionarCobranca(novaCobranca);
          }
        },
        child: Icon(Icons.add),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
          
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: ''),
        ],
        backgroundColor: Colors.green,
        selectedItemColor: Colors.black,
      ),
    );
  }
}
class Cobranca {
  final String nome;
  final String data;
  final String descricao;
  final String valor;
  final bool avatar;

  Cobranca({
    required this.nome,
    required this.data,
    required this.descricao,
    required this.valor,
    this.avatar = false,
  });
}

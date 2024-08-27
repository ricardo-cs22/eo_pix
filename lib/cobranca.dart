
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

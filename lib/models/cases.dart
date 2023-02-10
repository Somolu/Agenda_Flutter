class Cases {
  final String id;
  final String titulo;
  final String tipo;
  final String venc;
  final String descricao;
  final String updated;

  Cases({
    required this.id,
    required this.titulo,
    required this.tipo,
    required this.venc,
    required this.descricao,
    required this.updated,
  });

  factory Cases.fromJson(Map<String, dynamic> json) {
    return Cases(
      id: (json['id'] as int).toString(),
      titulo: json['titulo'] as String,
      tipo: json['tipo'] as String,
      venc: json['venc'] as String,
      descricao: json['descricao'] as String,
      updated: '', //???????????????
    );
  }

  @override
  String toString() {
    return 'Trans{id: $id, titulo: $titulo, venc: $venc}';
  }
}

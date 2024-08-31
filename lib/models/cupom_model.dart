class CupomModel {
  int cupCodigo;
  String cupNumero;
  int proCodigo;
  bool cupSorteado;
  bool cupVendido;
  int parCodigo;

  CupomModel({
    required this.cupCodigo,
    required this.cupNumero,
    required this.proCodigo,
    required this.cupSorteado,
    required this.cupVendido,
    required this.parCodigo,
  });

  factory CupomModel.fromJson(Map<String, dynamic> json) {
    print(json['parCodigo']);
    return CupomModel(
      cupCodigo: json['cupCodigo'] ?? 0,
      cupNumero: json['cupNumero'] ?? '',
      proCodigo: json['proCodigo'] ?? 0,
      cupSorteado: json['cupSorteado'] ?? false,
      cupVendido: json['cupVendido'] ?? false,
      parCodigo: json['parCodigo'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'cupCodigo': cupCodigo,
      'cupNumero': cupNumero,
      'proCodigo': proCodigo,
      'cupSorteado': cupSorteado,
      'cupVendido': cupVendido,
      'parCodigo': parCodigo,
    };
  }
}

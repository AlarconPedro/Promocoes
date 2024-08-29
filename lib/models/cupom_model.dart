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
    return CupomModel(
      cupCodigo: json['cupCodigo'],
      cupNumero: json['cupNumero'],
      proCodigo: json['proCodigo'],
      cupSorteado: json['cupSorteado'],
      cupVendido: json['cupVendido'],
      parCodigo: json['parCodigo'],
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

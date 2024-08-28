class ParticipanteModel {
  int parCodigo;
  String parNome;
  String parCpf;
  String parFone;
  String parEndereco;
  String parCidade;
  String parUf;
  String parDataNasc;
  String parEmail;
  int proCodigo;

  ParticipanteModel({
    required this.parCodigo,
    required this.parNome,
    required this.parCpf,
    required this.parFone,
    required this.parEndereco,
    required this.parCidade,
    required this.parUf,
    required this.parDataNasc,
    required this.parEmail,
    required this.proCodigo,
  });

  factory ParticipanteModel.fromJson(Map<String, dynamic> json) {
    return ParticipanteModel(
      parCodigo: json['parCodigo'],
      parNome: json['parNome'],
      parCpf: json['parCpf'],
      parFone: json['parFone'],
      parEndereco: json['parEndereco'],
      parCidade: json['parCidade'],
      parUf: json['parUf'],
      parDataNasc: json['parDatanasc'],
      parEmail: json['parEmail'],
      proCodigo: json['proCodigo'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'parCodigo': parCodigo,
      'parNome': parNome,
      'parCpf': parCpf,
      'parFone': parFone,
      'parEndereco': parEndereco,
      'parCidade': parCidade,
      'parUf': parUf,
      'parDataNasc': parDataNasc,
      'parEmail': parEmail,
      'proCodigo': proCodigo,
    };
  }
}

class SorteiosModel {
  int sorCodigo;
  String sorData;
  String preNome;
  int preCodigo;
  String parNome;
  String cupNumero;
  String proVideo;

  SorteiosModel({
    required this.sorCodigo,
    required this.sorData,
    required this.preNome,
    required this.preCodigo,
    required this.parNome,
    required this.cupNumero,
    required this.proVideo,
  });

  factory SorteiosModel.fromJson(Map<String, dynamic> json) {
    return SorteiosModel(
      sorCodigo: json['sorCodigo'] ?? 0,
      sorData: json['sorData'] ?? 'Há Ocorrer',
      preNome: json['preNome'] ?? '',
      preCodigo: json['preCodigo'] ?? 0,
      parNome: json['parNome'] ?? '',
      cupNumero: json['cupNumero'] ?? '',
      proVideo: json['proVideo'] ?? '',
    );
  }
}

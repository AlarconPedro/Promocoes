import 'package:promocoes/api/http.dart';
import 'package:promocoes/classes/classes.dart';

class ApiPromocao {
  final http = Http();

  final String _urlDadosParticipantes =
      '${Globais.urlBase}/promocao/participante/dados/';
  final String _urlGetParticipantes =
      '${Globais.urlBase}/promocao/participantes';

  Future<dynamic> getParticipantes() async {
    return await http.get(_urlGetParticipantes);
  }

  Future<dynamic> getDadosParticipante(String cpf) async {
    return await http.get('$_urlDadosParticipantes$cpf');
  }
}

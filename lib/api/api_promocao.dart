import 'package:promocoes/api/http.dart';
import 'package:promocoes/classes/classes.dart';

class ApiPromocao {
  final request = Http();

  final String _urlDadosParticipantes =
      '${Globais.urlBase}/Promocao/participante/dados/';
  final String _urlGetParticipantes =
      '${Globais.urlBase}/promocao/participantes';

  Future<dynamic> getParticipantes() async {
    return await request.getJson(_urlGetParticipantes);
  }

  Future<dynamic> getDadosParticipante(String cpf) async {
    var refatorado = cpf.replaceAll('.', '').replaceAll('-', '');
    var response = await request.getJson('$_urlDadosParticipantes$refatorado');
    return response;
  }
}

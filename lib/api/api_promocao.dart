import 'package:promocoes/api/http.dart';
import 'package:promocoes/classes/classes.dart';
import 'package:promocoes/models/cupom_model.dart';
import 'package:promocoes/models/participante_model.dart';

class ApiPromocao {
  final request = Http();

  //GET
  final String _urlDadosParticipantes =
      '${Globais.urlBase}/Promocao/participante/dados/';

  final String _urlGetParticipantes =
      '${Globais.urlBase}/promocao/participantes';

  final String _urlGetParticipanteCupons =
      '${Globais.urlBase}/promocao/cupons/';

  //POST
  final String _urlAddParticipantes =
      '${Globais.urlBase}/Promocao/participante';
  final String _urlAddCupons = '${Globais.urlBase}/Promocao/cupons';

  //GET
  Future<dynamic> getParticipantes() async {
    return await request.getJson(_urlGetParticipantes);
  }

  Future<dynamic> getDadosParticipante(String cpf) async {
    var refatorado = cpf.replaceAll('.', '').replaceAll('-', '');
    return await request.getJson('$_urlDadosParticipantes$refatorado');
  }

  Future<dynamic> getParticipanteCupons(int codigoParticipante) async {
    return await request
        .getJson('$_urlGetParticipanteCupons$codigoParticipante');
  }

  //POST
  Future<dynamic> addParticipante(ParticipanteModel participante) async {
    var retorno =
        await request.postJson(_urlAddParticipantes, participante.toJson());
    return retorno;
  }

  Future<dynamic> addCupons(CupomModel cupom) async {
    var retorno = await request.postJson(_urlAddCupons, cupom.toJson());
    return retorno;
  }
}

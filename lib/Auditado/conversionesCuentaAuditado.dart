import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';


class DatosCuentaAuditado {

  
   final String personaCompleta;


     



  DatosCuentaAuditado({
    this.personaCompleta,


}) ;

  factory DatosCuentaAuditado.fromJson(Map<String, dynamic> json){
    return new DatosCuentaAuditado(
      personaCompleta: json['personaCompleta'].toString(),

    );
  }
}



Future<DatosCuentaAuditado> obtenerDatosCuentaAuditado(String correo) async {
  final http.Response response = await http.post(
    'https://ios.vxsandbox.tech/audipaq/verDatoPersona.php',
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'correo': correo,
     
    }
    ),
  );
  if (response.statusCode == 200) {
    // If the server did return a 201 CREATED response,
    // then parse the JSON.
    //throw Exception('Si cargo');
    var respuestaJson = json.decode(response.body);

    return DatosCuentaAuditado.fromJson(respuestaJson[0]);
  } else {
    // If the server did not return a 201 CREATED response,
    // then throw an exception.
    throw Exception('No cargo' + response.statusCode.toString());
  }




}

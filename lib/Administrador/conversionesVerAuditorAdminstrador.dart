import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';



//Datos del listado de usarios
//Datos de la pantalla de Login
class DatosVerAuditorAdministrador {

  
   final String auditor;
  final String nombre_empresa;
  final String fecha_registro;
   final String rfc;
    final String curp;

     



  DatosVerAuditorAdministrador({
    this.auditor,
    this.nombre_empresa,
    this.fecha_registro,
    this.rfc,
    this.curp,


}) ;

  factory DatosVerAuditorAdministrador.fromJson(Map<String, dynamic> json){
    return new DatosVerAuditorAdministrador(
      auditor: json['auditor'].toString(),
      nombre_empresa: json['nombre_empresa'].toString(),
      fecha_registro: json['fecha_registro'],
      rfc: json['rfc'],
      curp: json['curp'],

     
    );
  }
}






Future<DatosVerAuditorAdministrador> obtenerDatosVerAuditorAdministrador(int idAuditor) async {
 
print("id AUidor es: " + idAuditor.toString());
 
final http.Response response = await http.post(
    'https://ios.vxsandbox.tech/audipaq/listadoAdministradorVerAuditor.php',
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'idAuditor': idAuditor.toString(),
     
    }),
  );
  if (response.statusCode == 200) {
    // If the server did return a 201 CREATED response,
    // then parse the JSON.
    //throw Exception('Si cargo');
    var respuestaJson = json.decode(response.body);
if(respuestaJson!=null){
    return DatosVerAuditorAdministrador.fromJson(respuestaJson[0]);
    }
  } else {
    // If the server did not return a 201 CREATED response,
    // then throw an exception.
    throw Exception('No cargo' + response.statusCode.toString());
  }
  
  
  }


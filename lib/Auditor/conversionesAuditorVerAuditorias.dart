import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';



//Datos del listado de usarios
//Datos de la pantalla de Login
class DatosAuditorVerAuditorias {

  
   final String id_acta;
  final String fecha_inicio;
  final String fecha_final;
  final String nombre_area;
    final String nombre_departamento;
    final String nombre_persona;
    final String tipo_status;
     



  DatosAuditorVerAuditorias({
    this.id_acta,
    this.fecha_inicio,
    this.fecha_final,
    this.nombre_area,
    this.nombre_departamento,
    this.nombre_persona,
    this.tipo_status,

}) ;

  factory DatosAuditorVerAuditorias.fromJson(Map<String, dynamic> json){
    return new DatosAuditorVerAuditorias(
      id_acta: json['id_acta'].toString(),
      fecha_inicio: json['fecha_inicio'].toString(),
      fecha_final: json['fecha_final'].toString(),
      nombre_area: json['nombre_area'].toString(),
      nombre_departamento: json['nombre_departamento'].toString(),
      nombre_persona: json['nombre_persona'].toString(),
     tipo_status: json['tipo_status'].toString(),
    );
  }
}





class ListadoDatosAuditorVerAuditorias {
  final List<DatosAuditorVerAuditorias> datos;
  final int contador;

  

  ListadoDatosAuditorVerAuditorias({
    this.datos,
    this.contador,
  });



factory ListadoDatosAuditorVerAuditorias.fromJson(List<dynamic> parsedJson) {

    List<DatosAuditorVerAuditorias> datos = new List<DatosAuditorVerAuditorias>();
   
    datos = parsedJson.map((i)=>DatosAuditorVerAuditorias.fromJson(i)).toList();
    int contador=datos.length;
    return new ListadoDatosAuditorVerAuditorias(
       datos: datos,
       contador: contador,
    );
 
  }

}




Future<ListadoDatosAuditorVerAuditorias> obtenerDatosVerAuditoriasAuditor(String acta,String correo) async {
 


//print("id AUidor es: " + acta);
 
final http.Response response = await http.post(
    'https://ios.vxsandbox.tech/audipaq/listadoAuditorVerAuditorias.php',
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'acta': acta,
      'correo': correo,
    }),
  );
  print(acta);
  if (response.statusCode == 200) {
    // If the server did return a 201 CREATED response,
    // then parse the JSON.
    //throw Exception('Si cargo');
    var respuestaJson = json.decode(response.body);
if(respuestaJson!=null){
    return ListadoDatosAuditorVerAuditorias.fromJson(respuestaJson);
    }
  } else {
    // If the server did not return a 201 CREATED response,
    // then throw an exception.
    throw Exception('No cargo' + response.statusCode.toString());
  }
  
  
  }


import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';



//Datos del listado de usarios
//Datos de la pantalla de Login
class DatosObservacionesAuditor {

  
   final String id_observaciones;
  final String auditor;
  final String tipo_status;
  final String tipo_prioridad;
    final String fecha_inicio;
    final String comentarios;
     



  DatosObservacionesAuditor({
    this.id_observaciones,
    this.auditor,
    this.tipo_status,
    this.tipo_prioridad,
    this.fecha_inicio,
    this.comentarios,

}) ;

  factory DatosObservacionesAuditor.fromJson(Map<String, dynamic> json){
    return new DatosObservacionesAuditor(
      id_observaciones: json['id_observaciones'].toString(),
      auditor: json['auditor'].toString(),
      tipo_status: json['tipo_status'].toString(),
      tipo_prioridad: json['tipo_prioridad'].toString(),
      fecha_inicio: json['fecha_inicio'].toString(),
      comentarios:json['comentarios'].toString(),
    
    );
  }
}





class ListadoDatosObservacionesAuditor {
  final List<DatosObservacionesAuditor> datos;
  final int contador;

  

  ListadoDatosObservacionesAuditor({
    this.datos,
    this.contador,
  });



factory ListadoDatosObservacionesAuditor.fromJson(List<dynamic> parsedJson) {

    List<DatosObservacionesAuditor> datos = new List<DatosObservacionesAuditor>();
   
    datos = parsedJson.map((i)=>DatosObservacionesAuditor.fromJson(i)).toList();
    int contador=datos.length;
    return new ListadoDatosObservacionesAuditor(
       datos: datos,
       contador: contador,
    );
 
  }

}




Future<ListadoDatosObservacionesAuditor> obtenerDatosObservacionesAuditor(int idActa) async {
 
    final http.Response response = await http.post(
    'https://ios.vxsandbox.tech/audipaq/listadoAuditorObservaciones.php',
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, int>{
      'idActa': idActa,
     
    }
    ),
  );
print(idActa);

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.1
   final ese = json.decode(response.body);
  

      return  ListadoDatosObservacionesAuditor.fromJson(ese);
    
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load ');
  }
}


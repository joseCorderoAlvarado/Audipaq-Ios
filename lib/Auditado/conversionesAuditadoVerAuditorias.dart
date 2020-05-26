import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';



//Datos del listado de usarios
//Datos de la pantalla de Login
class DatosAuditoriasAuditado {

  
   final String nombre_area;
  final String id_acta;
  final String auditor;
  final String updates;
    final String fecha_inicio ;
    final String fecha_final ;
  final String fk_id_status;
     



  DatosAuditoriasAuditado({
    this.nombre_area,
    this.id_acta,
    this.auditor,
    this.updates,
    this.fecha_inicio,
    this.fecha_final,
    this.fk_id_status,
}) ;

  factory DatosAuditoriasAuditado.fromJson(Map<String, dynamic> json){
    return new DatosAuditoriasAuditado(
      nombre_area: json['nombre_area'].toString(),
      id_acta: json['id_acta'].toString(),
      auditor: json['auditor'].toString(),
      updates: json['updates'].toString(),
      fecha_inicio: json['fecha_inicio'].toString(),
      fecha_final: json['fecha_final'].toString(),
      fk_id_status:  json['fk_id_status'].toString(),
    );
  }
}





class ListadoDatosAuditoriasAuditado {
  final List<DatosAuditoriasAuditado> datos;
  final int contador;

  

  ListadoDatosAuditoriasAuditado({
    this.datos,
    this.contador,
  });



factory ListadoDatosAuditoriasAuditado.fromJson(List<dynamic> parsedJson) {

    List<DatosAuditoriasAuditado> datos = new List<DatosAuditoriasAuditado>();
   
    datos = parsedJson.map((i)=>DatosAuditoriasAuditado.fromJson(i)).toList();
    int contador=datos.length;
    return new ListadoDatosAuditoriasAuditado(
       datos: datos,
       contador: contador,
    );
 
  }

}




Future<ListadoDatosAuditoriasAuditado> obtenerDatosAuditadoAuditorias(String correo) async {
 
 


final http.Response response = await http.post(
    'https://ios.vxsandbox.tech/audipaq/listadoAuditadoVerAuditorias.php',
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'correo': correo,     
    }
    ),
  );
print(correo);






  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.1
   final ese = json.decode(response.body);
  

      return  ListadoDatosAuditoriasAuditado.fromJson(ese);
    
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load ');
  }
}


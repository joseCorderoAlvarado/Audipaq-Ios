import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';



//Datos del listado de usarios
//Datos de la pantalla de Login
class DatosHomeAuditado {

  
   final String nombre_area;
  final String id_acta;
  final String auditor;
  final String updates;
    final String fecha_inicio ;
     



  DatosHomeAuditado({
    this.nombre_area,
    this.id_acta,
    this.auditor,
    this.updates,
    this.fecha_inicio
}) ;

  factory DatosHomeAuditado.fromJson(Map<String, dynamic> json){
    return new DatosHomeAuditado(
      nombre_area: json['nombre_area'].toString(),
      id_acta: json['id_acta'].toString(),
      auditor: json['auditor'].toString(),
      updates: json['updates'].toString(),
      fecha_inicio: json['fecha_inicio'].toString(),
    
    );
  }
}





class ListadoDatosHomeAuditado {
  final List<DatosHomeAuditado> datos;
  final int contador;

  

  ListadoDatosHomeAuditado({
    this.datos,
    this.contador,
  });



factory ListadoDatosHomeAuditado.fromJson(List<dynamic> parsedJson) {

    List<DatosHomeAuditado> datos = new List<DatosHomeAuditado>();
   
    datos = parsedJson.map((i)=>DatosHomeAuditado.fromJson(i)).toList();
    int contador=datos.length;
    return new ListadoDatosHomeAuditado(
       datos: datos,
       contador: contador,
    );
 
  }

}




Future<ListadoDatosHomeAuditado> obtenerDatosHomeAuditado(String correo) async {
 
 


final http.Response response = await http.post(
    'https://ios.vxsandbox.tech/audipaq/listadoHomeAuditado.php',
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
  

      return  ListadoDatosHomeAuditado.fromJson(ese);
    
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load ');
  }
}


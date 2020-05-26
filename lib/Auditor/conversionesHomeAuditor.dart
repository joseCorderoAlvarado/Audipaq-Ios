import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';



//Datos del listado de usarios
//Datos de la pantalla de Login
class DatosHomeAuditorias {

  
   final String fecha_inicio;
  final String fecha_final;
  final String nombre_area;
  final String id_acta;
    final String tipo_status;
     



  DatosHomeAuditorias({
    this.fecha_inicio,
    this.fecha_final,
    this.nombre_area,
    this.id_acta,
    this.tipo_status,

}) ;

  factory DatosHomeAuditorias.fromJson(Map<String, dynamic> json){
    return new DatosHomeAuditorias(
      fecha_inicio: json['fecha_inicio'].toString(),
      fecha_final: json['fecha_final'].toString(),
      nombre_area: json['nombre_area'].toString(),
      id_acta: json['id_acta'].toString(),
      tipo_status: json['tipo_status'].toString(),
    
    );
  }
}





class ListadoDatosHomeAuditorias {
  final List<DatosHomeAuditorias> datos;
  final int contador;

  

  ListadoDatosHomeAuditorias({
    this.datos,
    this.contador,
  });



factory ListadoDatosHomeAuditorias.fromJson(List<dynamic> parsedJson) {

    List<DatosHomeAuditorias> datos = new List<DatosHomeAuditorias>();
   
    datos = parsedJson.map((i)=>DatosHomeAuditorias.fromJson(i)).toList();
    int contador=datos.length;
    return new ListadoDatosHomeAuditorias(
       datos: datos,
       contador: contador,
    );
 
  }

}




Future<ListadoDatosHomeAuditorias> obtenerDatosHomeAdministador(String correo) async {
 
 


final http.Response response = await http.post(
    'https://ios.vxsandbox.tech/audipaq/listadoHomeAuditor.php',
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
  

      return  ListadoDatosHomeAuditorias.fromJson(ese);
    
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load ');
  }
}


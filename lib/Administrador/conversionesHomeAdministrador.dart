import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';



//Datos del listado de usarios
//Datos de la pantalla de Login
class DatosAdministradorHome {

  
   final String auditor;
  final String nombre_empresa;
  final String id_persona;

     



  DatosAdministradorHome({
    this.auditor,
    this.nombre_empresa,
    this.id_persona,


}) ;

  factory DatosAdministradorHome.fromJson(Map<String, dynamic> json){
    return new DatosAdministradorHome(
      auditor: json['auditor'].toString(),
      nombre_empresa: json['nombre_empresa'].toString(),
      id_persona: json['id_persona'],
     
    );
  }
}





class ListadoDatosAdministradorHome {
  final List<DatosAdministradorHome> datos;
  final int contador;

  

  ListadoDatosAdministradorHome({
    this.datos,
    this.contador,
  });



factory ListadoDatosAdministradorHome.fromJson(List<dynamic> parsedJson) {

    List<DatosAdministradorHome> datos = new List<DatosAdministradorHome>();
   
    datos = parsedJson.map((i)=>DatosAdministradorHome.fromJson(i)).toList();
    int contador=datos.length;
    return new ListadoDatosAdministradorHome(
       datos: datos,
       contador: contador,
    );
 
  }

}




Future<ListadoDatosAdministradorHome> obtenerDatosAdministradorHome() async {
 
  final response =
      await http.get('https://ios.vxsandbox.tech/audipaq/listadoAdministradorHome.php');


  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.1
   final ese = json.decode(response.body);
  

      return  ListadoDatosAdministradorHome.fromJson(ese);
    
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load ');
  }
}


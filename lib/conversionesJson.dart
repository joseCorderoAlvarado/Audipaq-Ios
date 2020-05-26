//Datos de la pantalla de Login
class DatosLogin {

  
   final String idpersona;
  final String nombre;
  final String apellidopaterno;
  final String apellidomaterno;
    final String correo;
      final String tipo;



  DatosLogin({
    this.idpersona,
    this.nombre,
    this.apellidopaterno,
    this.apellidomaterno,
    this.correo,
    this.tipo,
}) ;

  factory DatosLogin.fromJson(Map<String, dynamic> json){
    return new DatosLogin(
      idpersona: json['idpersona'].toString(),
      nombre: json['nombre'],
      apellidopaterno: json['apellidopaterno'],
      apellidomaterno: json['apellidomaterno'],
      correo: json['correo'],
      tipo: json['tipo'].toString(),
    );
  }
}


//Datos del listado de usarios
//Datos de la pantalla de Login
class Usuarios {

  
   final String idpersona;
  final String nombre;
  final String apellidopaterno;
  final String apellidomaterno;
    final String correo;
      final String tipo;



  Usuarios({
    this.idpersona,
    this.nombre,
    this.apellidopaterno,
    this.apellidomaterno,
    this.correo,
    this.tipo,
}) ;

  factory Usuarios.fromJson(Map<String, dynamic> json){
    return new Usuarios(
      idpersona: json['idpersona'].toString(),
      nombre: json['nombre'],
      apellidopaterno: json['apellidopaterno'],
      apellidomaterno: json['apellidomaterno'],
      correo: json['correo'],
      tipo: json['tipo'].toString(),
    );
  }
}





class ListadoUsuarios {
  final List<Usuarios> usuarios;
  final int contador;

  

 
  

  ListadoUsuarios({
    this.usuarios,
    this.contador,
  });



factory ListadoUsuarios.fromJson(List<dynamic> parsedJson) {

    List<Usuarios> usuarios = new List<Usuarios>();
   
    usuarios = parsedJson.map((i)=>Usuarios.fromJson(i)).toList();
    int contador=usuarios.length;
    return new ListadoUsuarios(
       usuarios: usuarios,
       contador: contador,
    );
 
  }

}




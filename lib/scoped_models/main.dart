import 'package:scoped_model/scoped_model.dart';

class MainModel extends Model {
  String _name = "Prueba Global";
  int _contador = 0;
  int _auxiliar=0;
  int _idActa=0;
  String _correo="";
  String _auxiliarDB="";
  String _mensajeError="";

void updateCorreo(String correo) {
    _correo = correo;
  }

  void updateMensajeError(String mensajeError) {
    _mensajeError = mensajeError;
  }

  String get mensajeError{
return _mensajeError;
  }

  void updateAuxiliarDB(String auxiliarDB){
    _auxiliarDB=auxiliarDB;
  }

  String get auxiliarDB{
    return _auxiliarDB;
  }


String get correo{
  return _correo;
}


  String get name {
    return _name;
  }

 int get auxiliar {
    return _auxiliar;
  }


int get idActa {
    return _idActa;
  }

  
  void updateIdActa(int idActa) {
    _idActa = idActa;
  }

  void updateAuxiliar(int auxiliar) {
    _auxiliar = auxiliar;
  }



  int get contador {
    return _contador;
  }


  void updateName(String name) {
    _name = name;
  }


void updateContador(int contador){
_contador=contador;
}
void aumentarContador(){
  _contador++;
}
}
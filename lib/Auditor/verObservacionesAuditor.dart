import 'package:scoped_model/scoped_model.dart';
import '../scoped_models/main.dart';
import 'package:flutter/material.dart';
import 'homeAuditor.dart';
import 'inicioAuditor.dart';
import 'conversionesObservacionesAuditor.dart';
import 'package:flushbar/flushbar.dart';

//import 'verAuditorAdministrador.dart';

// Clase de Observaciones Auditor
class ObservacionesAuditor extends StatefulWidget {
  ObservacionesAuditor({Key key}) : super(key: key);

  @override
  _ObservacionesAuditor createState() {
    return _ObservacionesAuditor();
  }
}

//Clase Elementos ListadoDatosObservacionesAuditor
class _ObservacionesAuditor extends State<ObservacionesAuditor> {
  //Variables de preferencia aqui.
  Future<ListadoDatosObservacionesAuditor> listadoMaestro;

  @override
  void initState() {
    super.initState();
    MainModel model = ScopedModel.of(context);
  // now I can do with the model whatever I need to do:
  int auditor = model.idActa;

  listadoMaestro = obtenerDatosObservacionesAuditor(auditor);
  }

  Widget build(BuildContext context) {
    //Colores del ese
    const ColorTarjetas = const Color(0xFF00ACC1);
    const ColorStatus = const Color(0xFF97FF94);
    const ColorBoton = const Color(0xFF546E7A);
    const ColorFondo = const Color(0xFFEEEEEE);




void showInfoFlushbarModificacion(BuildContext context) {
    Flushbar(
    flushbarPosition: FlushbarPosition.BOTTOM,
    message: "Has hecho una Modificacion",
    icon: Icon(
      Icons.info_outline,
      size: 28.0,
      color: Colors.red,
    ),
    backgroundColor: ColorBoton,
    duration: Duration(seconds: 5),
    leftBarIndicatorColor: ColorBoton,

  )..show(context);
}

//La de mofigcar
void _notificacionDos(BuildContext context2){

 showDialog(
    context: context,
    builder: (BuildContext context) {
      return 
    
      Dialog(
        shape: RoundedRectangleBorder(
            borderRadius:
                BorderRadius.circular(20.0)), //this right here
        child:
         Container(
          height: 200,
          child: 
          Padding(
            padding: const EdgeInsets.all(12.0),
            child:
             Column(
            mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
             
            
                Text("Modifique la observacion")
                ,

                TextFormField(
                  
                  decoration: InputDecoration(
                    contentPadding: new EdgeInsets.symmetric(vertical: 0.1, horizontal: 10.0),
                    border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30.0),
                              
                              ),
                             
                      hintText: 'Observacion'),
                ),
                Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
               RaisedButton(
                 
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text(
                      "Cancelar",
                      style: TextStyle(color: Colors.black),
                    ),
                    color: ColorFondo,
                  ),


                    RaisedButton(
                    onPressed: ()                    
                    {

                      

showInfoFlushbarModificacion(context2);

                     Navigator.of(context).pop();
                    },
                    child: Text(
                      "Aceptar",
                      style: TextStyle(color: Colors.white),
                    ),
                    color: ColorBoton,
                  ),
                  ],)
                
              ],
            ),
          ),
        ),
      );
    }
 );
  }


    
    return ScopedModelDescendant<MainModel>(
        builder: (BuildContext context, Widget child, MainModel model) {
      return FutureBuilder<ListadoDatosObservacionesAuditor>(
        future: listadoMaestro,
        builder: (context, projectSnap) {
          if (projectSnap.hasData) {
            return ListView.builder(
              itemCount: projectSnap.data.contador,
              itemBuilder: (context, index) {
                DatosObservacionesAuditor project =
                    projectSnap.data.datos[index];
                return Column(
                  children: <Widget>[
                    Container(
                      width: MediaQuery.of(context).size.width,
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        color: ColorTarjetas,
                        elevation: 10,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            //ListTile
                            ListTile(
                              //  leading: Icon(Icons.album, size: 70),
                              title: Center(
                                  child: Text(
                                      'Observacion ' + project.id_observaciones,
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 38))),
                            ),

                            Row(children: [
                              Flexible(
                                child: FractionallySizedBox(
                                  widthFactor: 1,
                                  child: Container(
                                      //color: Colors.white,
                                      child: Text("Auditor: " + project.auditor,
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20))),
                                ),
                              ),
                              Flexible(
                                child: FractionallySizedBox(
                                  widthFactor: 1,
                                  child: Container(
                                      //color: Colors.red,
                                      child: Text(
                                          "Status: " + project.tipo_status,
                                          style: TextStyle(
                                              color: ColorStatus,
                                              fontSize: 20))),
                                ),
                              ),
                            ]),
                            Row(children: [
                              Flexible(
                                child: FractionallySizedBox(
                                  widthFactor: 1,
                                  child: Container(
                                      //color: Colors.white,

                                      child: Text(
                                          "Coauditor: " + project.auditor,
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20))),
                                ),
                              ),
                              Flexible(
                                child: FractionallySizedBox(
                                  widthFactor: 1,
                                  child: Container(
                                      //color: Colors.red,
                                      child: Text(
                                          "Prioridad: " +
                                              project.tipo_prioridad,
                                          style: TextStyle(
                                              color: ColorStatus,
                                              fontSize: 20))),
                                ),
                              ),
                            ] //Child

                                ), //Row 2
                            Row(children: [
                              Flexible(
                                child: FractionallySizedBox(
                                  widthFactor: 1,
                                  child: Container(
                                      //color: Colors.white,

                                      child: Text(
                                          "Fecha: " + project.fecha_inicio,
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20))),
                                ),
                              ),
                            ] //Child
                                ),
                            Text(""),
                            Row(children: [
                              Flexible(
                                child: FractionallySizedBox(
                                  widthFactor: 1,
                                  child: Container(
                                      //color: Colors.white,

                                      child: Text(project.comentarios,
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20))),
                                ),
                              ),
                            ] //Child
                                ),
                            Row(children: [
                              Flexible(
                                  child: FractionallySizedBox(
                                widthFactor: 1,
                                child: Container(
                                    //color: Colors.white,

                                    child: 
                                    
                                    
                                    Padding(
                                    padding: EdgeInsets.all(20),
                                      child: 
                                    Material(
                                  //Material
                                  elevation: 1.0,
                                  borderRadius: BorderRadius.circular(30.0),
                                  color: ColorBoton,
                                  child: MaterialButton(
                                      minWidth:
                                          MediaQuery.of(context).size.width,
                                      //  padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),

                                      onPressed: () {
                                     _notificacionDos(context);
                                      },
                                      child: Text("Modificar",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 25))),
                                ),
                                )
                                )
                                ,
                              ))
                            ] //Child
                                ),
                          ],
                        ),
                      ),
                    ),
                  ],
                );
              },
            );
          } else if (projectSnap.hasError) {
            Text("Algo salio mal + ${projectSnap.error}");
          }
          // By default, show a loading spinner.
          return Container(
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    child: CircularProgressIndicator(),
                    height: 200.0,
                    width: 200.0,
                  ),
                  SizedBox(
                    child: CircularProgressIndicator(),
                    height: 50.0,
                    width: 50.0,
                  ),
                  SizedBox(
                    child: CircularProgressIndicator(),
                    height: 10.0,
                    width: 10.0,
                  )
                ],
              ),
            ),
          );
        },
      );
    }); //Fin de la Globales
  }
}

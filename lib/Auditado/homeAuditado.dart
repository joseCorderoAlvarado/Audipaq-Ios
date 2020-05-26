import 'package:scoped_model/scoped_model.dart';
import '../scoped_models/main.dart';
import 'package:flutter/material.dart';
import 'conversionesHomeAuditado.dart';
import 'inicioAuditado.dart';
import 'verAuditoria.dart';


// Clase del Home Auditor
class HomeAuditado extends StatefulWidget {
  HomeAuditado({Key key}) : super(key: key);

  @override
  _HomeAuditado createState() {
    return _HomeAuditado();
  }
}

//Clase Elementos del Home Auditor
class _HomeAuditado extends State<HomeAuditado> {
  //Variables de preferencia aqui.
  Future<ListadoDatosHomeAuditado> listadoMaestro;
  @override
  void initState() {
    super.initState();
    MainModel model = ScopedModel.of(context);
  // now I can do with the model whatever I need to do:
  String correo = model.correo;
  listadoMaestro = obtenerDatosHomeAuditado(correo);
  }

  Widget build(BuildContext context) {
    //Colores del ese
    const ColorTarjetas = const Color(0xFF00ACC1);
    const ColorStatus = const Color(0xFF97FF94);
    const ColorBoton = const Color(0xFF546E7A);



    return ScopedModelDescendant<MainModel>(
        builder: (BuildContext context, Widget child, MainModel model) {
      return FutureBuilder<ListadoDatosHomeAuditado>(
        future: listadoMaestro,
        builder: (context, projectSnap) {
          if (projectSnap.hasData) {
            return ListView.builder(
              itemCount: projectSnap.data.contador,
              itemBuilder: (context, index) {
                DatosHomeAuditado project = projectSnap.data.datos[index];
                return Column(
                  children: <Widget>[
                    Container(
                    
                      width: MediaQuery.of(context).size.width,
                      child: 
                      
                      //el inkwell
                      new InkWell(
                         onTap: () {
          
                         
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => verAuditoria()));
                          },
                          child:

                      Card(
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
                                      'Auditoria ' + project.nombre_area,
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 35))),
                              subtitle: Text('Acta: ' + project.id_acta,
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20)),
                            ),

                            Row(children: [
                              Expanded(child: 
                              Text( 'Auditor: ' + project.auditor,
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 25))
                                          ,)
                            ]),

                            Padding(
                            padding: const EdgeInsets.fromLTRB(1,20,1,1),
                            child:
                            
                            Row(children: [
                              Flexible(
                                child: FractionallySizedBox(
                                  widthFactor: 1,
                                  child: Container(
                                      //color: Colors.white,

                                      child: Center(
                                          child: Text(project.updates + " Actualizacion(es) nuevas",
                                              style: TextStyle(
                                                  color: ColorStatus,
                                                  fontSize: 20)))),
                                ),
                              ),
                              Flexible(
                                child: FractionallySizedBox(
                                  widthFactor: 1,
                                  child: Container(
                                      //color: Colors.red,
                                      child: 
                                      Text(" Fecha de inicio: " + project.fecha_inicio,
                                              style: TextStyle(
                                                  color: ColorStatus,
                                                  fontSize: 20))
                                      
                                      ),
                                ),
                              ),
                            ] //Child
)
                                ), //Row 2,
                          
                          ],
                        ),
                      ),
                    ),
                    )
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
//Fin Home Auditor

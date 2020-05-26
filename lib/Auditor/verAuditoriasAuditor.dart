import 'package:scoped_model/scoped_model.dart';
import '../scoped_models/main.dart';
import 'package:flutter/material.dart';
import 'homeAuditor.dart';
import 'inicioAuditor.dart';
import 'conversionesAuditorVerAuditorias.dart';

//ssss VerAuditorias
class AuditoriasVerAuditorias extends StatefulWidget {
  AuditoriasVerAuditorias({Key key}) : super(key: key);

  @override
  _AuditoriasVerAuditorias createState() {
    return _AuditoriasVerAuditorias();
  }
}

//Clase Elementos ListadoDatosObservacionesAuditor
class _AuditoriasVerAuditorias extends State<AuditoriasVerAuditorias> {
  //Variables de preferencia aqui.
  Future<ListadoDatosAuditorVerAuditorias> listadoMaestro;

  @override
  void initState() {
    super.initState();
    MainModel model = ScopedModel.of(context);
  // now I can do with the model whatever I need to do:
  String acta = model.auxiliarDB;
  String correo=model.correo;

  listadoMaestro = obtenerDatosVerAuditoriasAuditor(acta,correo);
  }

  Widget build(BuildContext context) {
//colores
const ColorIconos = const Color(0xFF000000);

    return ScopedModelDescendant<MainModel>(
        builder: (BuildContext context, Widget child, MainModel model) {
      return FutureBuilder<ListadoDatosAuditorVerAuditorias>(
        future: listadoMaestro,
        builder: (context, projectSnap) {
          
          if (projectSnap.hasData) {

            return ListView.builder(
                itemCount: projectSnap.data.contador,
                itemBuilder: (context, index) {
                  DatosAuditorVerAuditorias project =
                      projectSnap.data.datos[index];
                  return Table(
                
                border: TableBorder.all(),
                children: [
             
                  TableRow( children: [
                  
                    Column(children:[
                          
                        Text(project.id_acta,style: TextStyle(
                      color: ColorIconos
                      ))
                    ]
                    
                    ),
                    Column(children:[
                  
                      Text(project.fecha_inicio,style: TextStyle(
                      color: ColorIconos
                      ))
                    ]),
                    Column(children:[
                    
                      Text(project.fecha_final,style: TextStyle(
                      color: ColorIconos
                      ))
                    ]),
                    Column(children:[
                
                      Text(project.nombre_area,style: TextStyle(
                      color: ColorIconos
                      ))
                    ]),
                    Column(children:[
                
                     Text(project.nombre_departamento,style: TextStyle(
                      color: ColorIconos
                      ))
                    ]),
                    Column(children:[
                
                      Text(project.nombre_persona,style: TextStyle(
                      color: ColorIconos
                      ))
                    ]),
                    Column(children:[
                
                     Text(project.tipo_status,style: TextStyle(
                      color: ColorIconos
                      ))
                    ]
                    )
                    

                  ]
                  ),
                  
                ]
              );
          }
            )
                  ;
          //if end



          }
          else if (projectSnap.hasError) {
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
//

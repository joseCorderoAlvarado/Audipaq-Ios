import 'package:scoped_model/scoped_model.dart';
import '../scoped_models/main.dart';
import 'package:flutter/material.dart';
import 'conversionesAuditadoVerAuditorias.dart';
import 'inicioAuditado.dart';
import 'verAuditoria.dart';

// Clase del Home Auditor
class AuditoriasAuditado extends StatefulWidget {
  AuditoriasAuditado({Key key}) : super(key: key);

  @override
  _AuditoriasAuditado createState() {
    return _AuditoriasAuditado();
  }
}

//Clase Elementos del Home Auditor
class _AuditoriasAuditado extends State<AuditoriasAuditado> {
  //Variables de preferencia aqui.
  Future<ListadoDatosAuditoriasAuditado> listadoMaestro;
  String titulo2 = "";
  String titulo1 = "";

  @override
  void initState() {
    super.initState();
    MainModel model = ScopedModel.of(context);
    model.updateContador(0);
    // now I can do with the model whatever I need to do:
    String correo = model.correo;
    listadoMaestro = obtenerDatosAuditadoAuditorias(correo);
  }

  Widget build(BuildContext context) {
    //Colores del ese

    const ColorStatus = const Color(0xFF97FF94);
    const ColorBoton = const Color(0xFF546E7A);

    return ScopedModelDescendant<MainModel>(
        builder: (BuildContext context, Widget child, MainModel model) {
      return FutureBuilder<ListadoDatosAuditoriasAuditado>(
        future: listadoMaestro,
        builder: (context, projectSnap) {
          if (projectSnap.hasData) {
            return ListView.builder(
              itemCount: projectSnap.data.contador,
              itemBuilder: (context, index) {
                DatosAuditoriasAuditado project = projectSnap.data.datos[index];

                String fechaTodas;

                Color ColorTarjetas;
                bool flag;

                if (project.fk_id_status == '1') {
                  ColorTarjetas = const Color(0xFF00ACC1); //Color de activa
                  fechaTodas = "Fecha de inicio: " + project.fecha_inicio;

                  if (model.contador == 0) {
                    titulo2 = "Auditorias en curso";
                    model.updateContador(1);
                  } else {
                    //model.updateContador(1);
                    titulo2 = "";
                    print(titulo2 + model.contador.toString());
                  }
                } else {
                  ColorTarjetas = const Color(0xFF7E99AB); //Color de finalizada
                  fechaTodas = "Fecha de terminacion: " + project.fecha_final;
                  if (model.contador == 1) {
                    titulo2 = "Auditorias Finalizadas";
                    model.updateContador(0);
                  } else {
                    //model.updateContador(1);
                    titulo2 = "";
                    print(titulo2 + model.contador.toString());
                  }

                  ;
                }

                return Column(
                  children: <Widget>[
                    Text(titulo2),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      child: new InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => verAuditoria()));
                        },
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
                                        'Auditoria ' + project.nombre_area,
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 35))),
                                subtitle: Text('Acta: ' + project.id_acta,
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20)),
                              ),

                              Row(children: [
                                Expanded(
                                  child: Text('Auditor: ' + project.auditor,
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 25)),
                                )
                              ]),

                              Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(1, 20, 1, 1),
                                  child: Row(children: [
                                    Flexible(
                                      child: FractionallySizedBox(
                                        widthFactor: 1,
                                        child: Container(
                                            //color: Colors.white,

                                            child: Center(
                                                child: Text(
                                                    project.updates +
                                                        " Actualizacion(es) nuevas",
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
                                            child: Text(fechaTodas,
                                                style: TextStyle(
                                                    color: ColorStatus,
                                                    fontSize: 20))),
                                      ),
                                    ),
                                  ] //Child
                                      )), //Row 2,
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

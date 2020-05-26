import 'package:scoped_model/scoped_model.dart';
import '../scoped_models/main.dart';
import 'package:flutter/material.dart';
import 'conversionesHomeAdministrador.dart';
import 'inicioAdministrador.dart';

// Clase del Home Auditor
class HomeAdministrador extends StatefulWidget {
  HomeAdministrador({Key key}) : super(key: key);

  @override
  _HomeAdministrador createState() {
    return _HomeAdministrador();
  }
}

//Clase Elementos del Home Auditor
class _HomeAdministrador extends State<HomeAdministrador> {
  //Variables de preferencia aqui.

//Colores

  Future<ListadoDatosAdministradorHome> listadoMaestro;
  @override
  void initState() {
    super.initState();
    listadoMaestro = obtenerDatosAdministradorHome();
  }

  @override
  Widget build(BuildContext context) {
    const ColorTarjetas = const Color(0xFFFFFFFF);
    return ScopedModelDescendant<MainModel>(
        builder: (BuildContext context, Widget child, MainModel model) {
      return FutureBuilder<ListadoDatosAdministradorHome>(
        future: listadoMaestro,
        builder: (context, projectSnap) {
          if (projectSnap.hasData) {
            return ListView.builder(
              itemCount: projectSnap.data.contador,
              itemBuilder: (context, index) {
                DatosAdministradorHome project = projectSnap.data.datos[index];
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
                      
                        child: new InkWell(
                          onTap: () {
                            model.updateAuxiliar(2);
                            model.updateIdActa(
                                              int.parse(project.id_persona));
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => InicioAdministrador()));
                          },
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Row(// Inicio del Row
                                  children: [
                                Flexible(
                                  child: FractionallySizedBox(
                                    widthFactor: 1,

                                    //color: Colors.red,
                                    child: Image.asset(
                                      "assets/iconoUsuario.png",
                                      fit: BoxFit.fitWidth,
                                    ),
                                  ),
                                ),
                                Flexible(
                                  child: FractionallySizedBox(
                                    widthFactor: .5,

                                    //color: Colors.red,
                                    child: Text(""),
                                  ),
                                ),
                                Flexible(
                                  child: FractionallySizedBox(
                                    widthFactor: 2,
                                    child: Container(
                                      child: ListTile(
                                        //  leading: Icon(Icons.album, size: 70),
                                        title: Text(project.auditor,
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 15)),
                                        subtitle: Text(
                                            "Empresa: " +
                                                project.nombre_empresa,
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 15)),
                                      ),

                                      //color: Colors.white,
                                    ),
                                  ),
                                ),
                              ] //Child

                                  ),

                              //ListTile
                            ],
                          ),
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
//Fin Home Auditor

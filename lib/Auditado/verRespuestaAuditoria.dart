import 'package:prueba/Auditado/verDetalleAuditoria.dart';
import 'package:scoped_model/scoped_model.dart';
import '../scoped_models/main.dart';
import 'package:flutter/material.dart';
import 'homeAuditado.dart';
import 'cuentaAuditado.dart';
import 'verAuditoriasAuditado.dart';

//import 'verAuditorAdministrador.dart';

//Clases del Auditado
class verRespuestaAuditoria extends StatefulWidget {
  verRespuestaAuditoria({Key key}) : super(key: key);

  @override
  _verRespuestaAuditoria createState() => _verRespuestaAuditoria();
}

//Otra clase
class _verRespuestaAuditoria extends State<verRespuestaAuditoria> {
  int _indexActual = 0;
  int _indexBottom = 0;
  List<Widget> pageList = List<Widget>();

  @override
  Widget build(BuildContext context) {
//   del ese
    const ColorMensajes = const Color(0XFF52848A);
    const ColorPrioridadBaja = const Color(0XFF00BF59);
    const ColorPrioridadRoja = const Color(0XFFFF1D2C);
    const ColorTitulo = const Color(0xFF546E7A);
    const ColorFondo = const Color(0xFFEEEEEE);
    const ColorIconos = const Color(0xFFFFFFFF);
    const ColorIconosTexto = const Color(0xFFCFCFCF);
    const ColorIconosSeleccionado = const Color(0xFF00ACC1);
    const ColorBoton = const Color(0xFF546E7A);
    const ColorTarjetas = const Color(0xFF00ACC1);
    const ColorArchivoSeleccionado = const Color(0XFF00ACC1);

    return ScopedModelDescendant<MainModel>(
        builder: (BuildContext context, Widget child, MainModel model) {
      _indexActual = model.auxiliar;

      if (_indexActual > 2) {
        _indexBottom = 0;
      } else {
        _indexBottom = _indexActual;
      }

      TextEditingController buscarController = new TextEditingController();

      return MaterialApp(
          home: Scaffold(
        backgroundColor: ColorFondo,
        appBar: AppBar(
          backgroundColor: ColorTitulo,
          title: Padding(
              padding: const EdgeInsets.fromLTRB(1, 1, 1, 1),
              child: Image.asset(
                "assets/audipaq.png",
                height: AppBar().preferredSize.height,
                fit: BoxFit.scaleDown,
              )),
          actions: <Widget>[
            // action button
            IconButton(
              icon: Icon(Icons.school),
              onPressed: () {},
            ),
          ],
        ),
        body: Padding(
            padding: const EdgeInsets.all(1.0),
            child: Column(
              children: <Widget>[
 InkWell(
onTap: () {
          
                         
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => verDetalleAuditoria()));
                          },

  child:       

                
                         Text('<- RE: Incidencia con los cables',
                    style: TextStyle(color: ColorBoton, fontSize: 30,),textAlign: TextAlign.center,
                    )
 ),
                Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Row(
                      children: <Widget>[
                        Flexible(
                              child:
                                  //  width: MediaQuery.of(context).size.width - Material().,
                                  Padding(
                            padding: EdgeInsets.fromLTRB(1, 1, 1, 1),
                            child: TextFormField(
                              controller: buscarController,
                              obscureText: false,
                              //style: style,
                              decoration: InputDecoration(
                                  prefixIcon: Icon(Icons.insert_link),
                                  contentPadding: EdgeInsets.fromLTRB(
                                      20.0, 15.0, 20.0, 15.0),
                                  hintText: "Escribir Respuesta",
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(24.0),
                                  )
                                  ),
                            ),
                          ))
                      ],
                    )
                    ),
                Expanded(child:
                  Padding(
                    padding: EdgeInsets.fromLTRB(15,0,15,0), 
                  child: ListView(
                    children: <Widget>[
                      Container(
                        width: MediaQuery.of(context).size.width,
                       
                        child:
                         Card(
                            
                            shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                            
                            elevation: 10,
                            child:
                            Padding(padding: EdgeInsets.fromLTRB(15,5,15,5),
                            child:
                             Column(children: <Widget>[
                               Row(
                                 

 children: [
   Flexible(
                                
                                child: FractionallySizedBox(
                                  widthFactor: .5,
                                  child: Container(
                                     alignment: Alignment.topLeft,
                                      //color: Colors.white,

                                      child: 
                                       Image.asset(
                              "assets/iconoUsuario.png",
                    height: 30,
              fit: BoxFit.scaleDown,
                  ),
                                      
                                      
                                      ),
                                ),
                              ),
                              Flexible(
                                
                                child: FractionallySizedBox(
                                  widthFactor: 1.5,
                                  child: Container(
                                     alignment: Alignment.topLeft,
                                      //color: Colors.white,

                                      child: Center(
                                          child: Text("Pablo Marmol",
                                              style: TextStyle(
                                                  color: ColorMensajes,
                                                  fontSize: 20)))),
                                ),
                              ),
        			  
							  
                            ] //Child
),

                                   Divider(color: Colors.black),

                              Row(//
                                  children: [
                                Flexible(
                                    child: FractionallySizedBox(
                                  widthFactor: 1,
                                  child: Container(
                                    //color: Colors.white,

                                    child: Center(
                                        child: Text(
                                          'Adjunto archivo del listado de lo que se compro para el cableado',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 15))),
                                  ),
                                )),
                                
                              ]),
                  Center(
                                      child: Text("Evidencia 3.pdf",
                                          style: TextStyle(
                                              color: ColorArchivoSeleccionado,
                                              fontSize: 15))),

                            ]
                            )
                            ),
                            ),
                      ), 
                      Text(''),//Conainer 1
                      Container(
                        width: MediaQuery.of(context).size.width,
                       
                        child:
                         Card(
                            
                            shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                            
                            elevation: 10,
                            child:
                            Padding(padding: EdgeInsets.fromLTRB(15,5,15,5),
                            child:
                             Column(children: <Widget>[
                               Row(
                                 

 children: [
   Flexible(
                                
                                child: FractionallySizedBox(
                                  widthFactor: .5,
                                  child: Container(
                                     alignment: Alignment.topLeft,
                                      //color: Colors.white,

                                      child: 
                                       Image.asset(
                              "assets/iconoUsuario.png",
                    height: 30,
              fit: BoxFit.scaleDown,
                  ),
                                      
                                      
                                      ),
                                ),
                              ),
                              Flexible(
                                
                                child: FractionallySizedBox(
                                  widthFactor: 1.5,
                                  child: Container(
                                     alignment: Alignment.topLeft,
                                      //color: Colors.white,

                                      child: Center(
                                          child: Text("Ing Samuel Mojarro",
                                              style: TextStyle(
                                                  color: ColorMensajes,
                                                  fontSize: 20)))),
                                ),
                              ),
        			  
							  
                            ] //Child
),

                                   Divider(color: Colors.black),

                              Row(//
                                  children: [
                                Flexible(
                                    child: FractionallySizedBox(
                                  widthFactor: 1,
                                  child: Container(
                                    //color: Colors.white,

                                    child: Center(
                                        child: Text(
                                          'Gracias, se pondra a revision',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 15))),
                                  ),
                                )),
                              ]),
                 

                            ]
                            )
                            ),
                            ),
                      ), //Conainer 1

                    ],
                  ),
                )
              )],
            )),
        bottomNavigationBar: BottomNavigationBar(
            backgroundColor: ColorTitulo,
            unselectedItemColor: ColorTitulo,
            selectedItemColor: ColorTitulo,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                title: Text('',
                    style: TextStyle(
                      color: ColorIconosTexto,
                    )),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.business),
                title: Text('',
                    style: TextStyle(
                      color: ColorIconosTexto,
                    )),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.verified_user),
                title: Text('',
                    style: TextStyle(
                      color: ColorIconosTexto,
                    )),
              ),
            ],
            currentIndex: _indexBottom,
            onTap: (int index) {
              setState(() {
                model.updateAuxiliar(index);
              });
            }),
      ));
    });
  }
}

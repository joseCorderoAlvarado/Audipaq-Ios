import 'package:prueba/Auditado/verAuditoria.dart';
import 'package:scoped_model/scoped_model.dart';
import '../scoped_models/main.dart';
import 'package:flutter/material.dart';
import 'homeAuditado.dart';
import 'cuentaAuditado.dart';
import 'verRespuestaAuditoria.dart';

//import 'verAuditorAdministrador.dart';

//Clases del Auditado
class verDetalleAuditoria extends StatefulWidget {
  verDetalleAuditoria({Key key}) : super(key: key);

  @override
  _verDetalleAuditoria createState() => _verDetalleAuditoria();
}

//Otra clase
class _verDetalleAuditoria extends State<verDetalleAuditoria> {
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
            padding: const EdgeInsets.fromLTRB(10, 10, 10, 1),
            child: Column(
              children: <Widget>[


                 InkWell(
onTap: () {
          
                         
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => verAuditoria()));
                          },

  child:       
      
  Row(
 
 children: [
                              Flexible(
                                
                                child: FractionallySizedBox(
                                  widthFactor: 1,
                                  child: Container(
                            
                                      //color: Colors.white,

                                
                                    child:   Text( '<- Incidencia con los cables',
                    style: TextStyle(color: ColorBoton, fontSize: 30,),textAlign: TextAlign.center,
                    ),
                                           
                                                  )
                                                  )
                                                  ),
                                
                            ]
                              ),
    
                

                 ),
                 
                Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Row(
                      children: <Widget>[
                        Text('Detalles',
                            style: TextStyle(color: ColorBoton, fontSize: 20)),
                      ],
                    )),
                Expanded(
                  child: ListView(
                    children: <Widget>[
                      Container(
                        width: MediaQuery.of(context).size.width,
                        child: Card(
                            //color: Colors.transparent,
                            elevation: 10,
                            child: Column(children: <Widget>[
                              Row(//
                                  children: [
                                Flexible(
                                    child: FractionallySizedBox(
                                  widthFactor: 1,
                                  child: Container(
                                    //color: Colors.white,

                                    child: Center(
                                        child: Text(
                                            'Se ha observado que hay un fallo en el cableado estructurado de su empresa lo cual produce un malfunioamiento de la velocidad de toda su red. Muchos cable fueron mal ponchados y producen mucha interferencia',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 15))),
                                  ),
                                )),
                              ]),
                              Divider(color: Colors.black),
//Un ese 1
                            ])),
                      ), //Conainer,

                      Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Row(
                            children: <Widget>[
                              Text('Archivos Adjuntos',
                                  style: TextStyle(
                                      color: ColorBoton, fontSize: 20)),
                            ],
                          )),

//Otra tarjeta
                      Card(
                          //color: Colors.transparent,
                          elevation: 10,
                          child: Column(children: <Widget>[
                            Row(//
                                children: [
                              Flexible(
                                  child: FractionallySizedBox(
                                widthFactor: 1,
                                child: Container(
                                  //color: Colors.white,

                                  child: Center(
                                      child: Text("Evidencia 3.pdf",
                                          style: TextStyle(
                                              color: ColorArchivoSeleccionado,
                                              fontSize: 15))),
                                ),
                              )),
                            ]),
                            Divider(color: Colors.black),
//El texto
//Tabla
                            Table(
                              border: TableBorder.all(),
                              children: [
                                TableRow(children: [
                                  Column(children: [
                                    Icon(Icons.picture_as_pdf, size: 48),
                                    Text('Evidencia 1')
                                  ]),
                                  Column(children: [
                                    Icon(Icons.picture_in_picture, size: 48),
                                    Text('Evidencia 2')
                                  ]),
                                  Column(children: [
                                    Icon(Icons.picture_in_picture_alt,
                                        size: 48),
                                    Text('Evidencia 3')
                                  ]),
                                ]),

                                TableRow(children: [
                                  Column(children: [
                                    Icon(Icons.picture_in_picture_alt,
                                        size: 48),
                                    Text('Evidencia 4'),
                                  ]),
                                   Column(children: [
                                  Icon(Icons.picture_in_picture, size: 48),
                                  Text('Evidencia 5'),
                                  ]),
                                    Column(children: [
  
                                  Icon(Icons.picture_as_pdf, size: 48),
                                  Text('Evidencia 6')
                                  ]),
                                ]),
                              ],
                            ),
                            Text(''),
                            
                          ])
                          ),
                          Text(''),
                          Material(
                            elevation: 1.0,
                            borderRadius: BorderRadius.circular(12.0),
                            color: ColorArchivoSeleccionado,
                            child: MaterialButton(
                                //  minWidth: MediaQuery.of(context).size.width,
                                padding: EdgeInsets.fromLTRB(2, 2, 2, 2),
                                onPressed: ()  {
                                Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => verRespuestaAuditoria()));

                                  // return Text("EL ese del aquel");//_botonLogin(emailController.text,passwordController.text);
                                },
                                child: Text("Ver Respuestas",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20))),
                          ),
                    ],
                  ),
                )
              ],
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

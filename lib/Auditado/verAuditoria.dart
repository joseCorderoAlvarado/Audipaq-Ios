import 'package:scoped_model/scoped_model.dart';
import '../scoped_models/main.dart';
import 'package:flutter/material.dart';
import 'homeAuditado.dart';
import 'cuentaAuditado.dart';
import 'verAuditoriasAuditado.dart';

import 'verDetalleAuditoria.dart';
import 'inicioAuditado.dart';

//import 'verAuditorAdministrador.dart';

//Clases del Auditado
class verAuditoria extends StatefulWidget {
  verAuditoria({Key key}) : super(key: key);

  @override
  _verAuditoria createState() => _verAuditoria();
}

//Otra clase
class _verAuditoria extends State<verAuditoria> {
  int _indexActual = 0;
  int _indexBottom = 0;
  List<Widget> pageList = List<Widget>();


  @override
  Widget build(BuildContext context) {
//   del ese
const ColorMensajes=const Color(0XFF52848A);
const ColorPrioridadBaja=const Color(0XFF00BF59);
const ColorPrioridadRoja = const Color(0XFFFF1D2C);
    const ColorTitulo = const Color(0xFF546E7A);
    const ColorFondo = const Color(0xFFEEEEEE);
    const ColorIconos = const Color(0xFFFFFFFF);
    const ColorIconosTexto = const Color(0xFFCFCFCF);
    const ColorIconosSeleccionado = const Color(0xFF00ACC1);
    const ColorBoton = const Color(0xFF546E7A);
     const ColorTarjetas = const Color(0xFF00ACC1);

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





        body: 
           Padding(
        padding: const EdgeInsets.fromLTRB(10, 10, 10, 1),
                child: Column(
              children: <Widget>[
                    InkWell(
onTap: () {
          
                         
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => InicioAuditado()));
                          },

  child:                  
                   Text('<- Auditoria Red'  , style: TextStyle(color: ColorBoton, fontSize: 30)),
),
                   Padding(
                      padding: const EdgeInsets.all(5.0),
                     child: Row(children: <Widget>[
                     Text('Eventos'  , style: TextStyle(color: ColorBoton, fontSize: 20)),
                     ],)
                   ),
        
                   Expanded(child: 
                    ListView(children: <Widget>[

//Aqui el ink well por mientas
new InkWell(
                         onTap: () {
          
                         
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => verDetalleAuditoria()));
                          },
                          child:

                      Container(
	  width: MediaQuery.of(context).size.width,

    
    child: 
            Card(
      //color: Colors.transparent,
      elevation: 10,
      
      child:


        Column( children: <Widget>[

          
         Row(//
              children: [
                    Flexible(
                                child: FractionallySizedBox(
                                  widthFactor: .7,
                                  child: Container(
                                      //color: Colors.white,

                                      child: Center(
                                          child:     Text(' 27/02/2020  10:00 PM',style: TextStyle(color: Colors.black,fontSize: 15))
                                         
                                ),
                              ),
                                )
                    ),
                         Flexible(
                                child: FractionallySizedBox(
                                  alignment: Alignment.bottomLeft,
                                  widthFactor: 1.3,
                                  child:
                                  Container(child:
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start, 
                                        children: <Widget>[
                                        Text("INCIDENCIA CON LOS CABLES",style: TextStyle(color: Colors.black,fontSize: 15)),
                                        Text("Ing Samuel Mojarro",style: TextStyle(color: Colors.black,fontSize: 13)),
                                        Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: <Widget>[
                                          

                                        
                                        Text("Prioridad: Baja",style: TextStyle(color: ColorPrioridadBaja,fontSize: 10), textAlign: TextAlign.end,),
                                        Text("2 Respuestas",style: TextStyle(color: ColorMensajes,fontSize: 10), textAlign: TextAlign.end,)
                                    ],)
                                      //color: Colors.red,
                                   ],)
                                      ),
                                ),
                              ),                         

  ]
         ),
         Divider(
              color: Colors.black
            ),
//Un ese 1

Row(//
              children: [
                    Flexible(
                                child: FractionallySizedBox(
                                  widthFactor: .7,
                                  child: Container(
                                      //color: Colors.white,

                                      child: Center(
                                          child:     Text(' 11/10/2020  2:00 PM',style: TextStyle(color: Colors.black,fontSize: 15))
                                         
                                ),
                              ),
                                )
                    ),
                         Flexible(
                                child: FractionallySizedBox(
                                  alignment: Alignment.bottomLeft,
                                  widthFactor: 1.3,
                                  child:
                                  Container(child:
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start, 
                                        children: <Widget>[
                                        Text("INCIDENCIA CON LOS CHIPS",style: TextStyle(color: Colors.black,fontSize: 15)),
                                        Text("Ing Ramon Diaz",style: TextStyle(color: Colors.black,fontSize: 13)),
                                        Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: <Widget>[
                                          

                                        
                                        Text("Prioridad: Baja",style: TextStyle(color: ColorPrioridadBaja,fontSize: 10), textAlign: TextAlign.end,),
                                        Text("5 Respuestas",style: TextStyle(color: ColorMensajes,fontSize: 10), textAlign: TextAlign.end,)
                                    ],)
                                      //color: Colors.red,
                                   ],)
                                      ),
                                ),
                              ),                         

  ]
         ),
         Divider(
              color: Colors.black
            ),
//Un ese 2


Row(//
              children: [
                    Flexible(
                                child: FractionallySizedBox(
                                  widthFactor: .7,
                                  child: Container(
                                      //color: Colors.white,

                                      child: Center(
                                          child:     Text(' 01/03/2020  2:00 PM',style: TextStyle(color: Colors.black,fontSize: 15))
                                         
                                ),
                              ),
                                )
                    ),
                         Flexible(
                                child: FractionallySizedBox(
                                  alignment: Alignment.bottomLeft,
                                  widthFactor: 1.3,
                                  child:
                                  Container(child:
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start, 
                                        children: <Widget>[
                                        Text("INCIDENCIA DEL LAB",style: TextStyle(color: Colors.black,fontSize: 15)),
                                        Text("Ing Juancho",style: TextStyle(color: Colors.black,fontSize: 13)),
                                        Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: <Widget>[
                                          

                                        
                                        Text("Prioridad: Baja",style: TextStyle(color: ColorPrioridadBaja,fontSize: 10), textAlign: TextAlign.end,),
                                        Text("",style: TextStyle(color: ColorMensajes,fontSize: 10), textAlign: TextAlign.end,)
                                    ],)
                                      //color: Colors.red,
                                   ],)
                                      ),
                                ),
                              ),                         

  ]
         ),
         Divider(
              color: Colors.black
            ),
//Un ese 3




Row(//
              children: [
                    Flexible(
                                child: FractionallySizedBox(
                                  widthFactor: .7,
                                  child: Container(
                                      //color: Colors.white,

                                      child: Center(
                                          child:     Text(' 01/03/2020  2:00 PM',style: TextStyle(color: Colors.black,fontSize: 15))
                                         
                                ),
                              ),
                                )
                    ),
                         Flexible(
                                child: FractionallySizedBox(
                                  alignment: Alignment.bottomLeft,
                                  widthFactor: 1.3,
                                  child:
                                  Container(child:
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start, 
                                        children: <Widget>[
                                        Text("INCIDENCIA DEL ESE",style: TextStyle(color: Colors.black,fontSize: 15)),
                                        Text("Ing Jorge",style: TextStyle(color: Colors.black,fontSize: 13)),
                                        Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: <Widget>[
                                          

                                        
                                        Text("Prioridad: Alta",style: TextStyle(color: ColorPrioridadRoja,fontSize: 10), textAlign: TextAlign.end,),
                                        Text("9 Respuestas",style: TextStyle(color: ColorMensajes,fontSize: 10), textAlign: TextAlign.end,)
                                    ],)
                                      //color: Colors.red,
                                   ],)
                                      ),
                                ),
                              ),                         

  ]
         ),
         Divider(
              color: Colors.black
            ),
//Un ese 4










           
        ]
        )
      
    )
  
    ),//Conainer,
                      )

                   ],)
               ,)
              ],

            )


            ),
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


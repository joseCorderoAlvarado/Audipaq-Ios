import 'package:scoped_model/scoped_model.dart';
import '../scoped_models/main.dart';
import 'package:flutter/material.dart';
import 'homeAdministrador.dart';
import 'cuentaAdministrador.dart';
import 'verAuditorAdministrador.dart';

class InicioAdministrador extends StatefulWidget {
  InicioAdministrador({Key key}) : super(key: key);

  @override
  _InicioAdministrador createState() => _InicioAdministrador();
}

class _InicioAdministrador extends State<InicioAdministrador> {
  int _indexActual = 0;
  int _indexBottom = 0;
  List<Widget> pageList = List<Widget>();

  @override
  Widget build(BuildContext context) {
//Colores del ese
   const ColorTitulo = const Color(0xFF546E7A);
    const ColorFondo = const Color(0xFFEEEEEE);
    const ColorIconos = const Color(0xFFFFFFFF);
    const ColorIconosTexto = const Color(0xFFCFCFCF);
    const ColorIconosSeleccionado = const Color(0xFF00ACC1);
    const ColorBoton = const Color(0xFF546E7A);
 

    return ScopedModelDescendant<MainModel>(
        builder: (BuildContext context, Widget child, MainModel model) {
      _indexActual = model.auxiliar;

      if (_indexActual > 1) {
        _indexBottom = 0;
      } else {
        _indexBottom = _indexActual;
      }

//print("sss" + _indexActual.toString());
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


        //El body
        body: IndexedStack(
          index: _indexActual,
          children: <Widget>[
            Container(
                //El 1
               child: Column(children: <Widget>[
                  Text("Lista  de Auditores",
                  style: TextStyle(color: ColorBoton, fontSize: 20)),
                  Expanded(child: 
                     HomeAdministrador(),
                     )
                ],)
              
                ),

          Container(
                //El 2

                child: CuentaAdministrador()
                ),
            Container (
              //El 3
              child:
              Column(children: <Widget>[
                  Text("Ver Auditor",
                  style: TextStyle(color: ColorBoton, fontSize: 20)),
                  Expanded(child: 
                     VerAuditorAdministrador(),
                     )
                ],
                )
            ),

            
          ],
        ),

        //     child: ChoiceCard(login: _login),

        bottomNavigationBar: BottomNavigationBar(
            backgroundColor: ColorTitulo,
            unselectedItemColor: ColorIconos,
            selectedItemColor: ColorIconosSeleccionado,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                title: Text('Inicio'),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.verified_user),
                title: Text('Cuenta'),
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

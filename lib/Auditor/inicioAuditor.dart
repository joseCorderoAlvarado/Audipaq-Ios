import 'package:scoped_model/scoped_model.dart';
import '../scoped_models/main.dart';
import 'package:flutter/material.dart';
import 'homeAuditor.dart';
import 'cuentaAuditor.dart';
import 'verAuditoriasAuditor.dart';
import 'verObservacionesAuditor.dart';
import 'package:flushbar/flushbar.dart';
//import 'verAuditorAdministrador.dart';

//Clases del Auditor
class InicioAuditor extends StatefulWidget {
  InicioAuditor({Key key}) : super(key: key);

  @override
  _InicioAuditor createState() => _InicioAuditor();
}

//Otra clase
class _InicioAuditor extends State<InicioAuditor> {
  int _indexActual = 0;
  int _indexBottom = 0;
  List<Widget> pageList = List<Widget>();


  @override
  Widget build(BuildContext context) {
//   del ese
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

void showInfoFlushbar(BuildContext context) {
    Flushbar(
    flushbarPosition: FlushbarPosition.BOTTOM,
    message: "Has hecho una observacion nueva",
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




      void _botonBuscar(
          String acta, BuildContext context, Widget child, MainModel model) {
        model.updateAuxiliar(1);
        model.updateAuxiliarDB(acta);

        // print("acta es" + model.auxiliarDB);
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => InicioAuditor()));
      }
    



void _notificacionUno(BuildContext context2){

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
             
            
                Text("Inserte una observacion nueva")
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
                      showInfoFlushbar(context2);
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
        body: IndexedStack(
          index: _indexActual,
          children: <Widget>[
            Container(
                //El 1

                child: Column(
              children: <Widget>[
                Text("Auditorias en Curso",
                    style: TextStyle(color: ColorBoton, fontSize: 20)),
                Expanded(
                  child: HomeAuditor(),
                )
              ],
            )),

            Container(
              //Contenedor 2

              child: Column(children: <Widget>[
                Padding(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Material(
                            elevation: 1.0,
                            borderRadius: BorderRadius.circular(12.0),
                            color: ColorBoton,
                            child: MaterialButton(
                                //  minWidth: MediaQuery.of(context).size.width,
                                padding: EdgeInsets.fromLTRB(2, 2, 2, 2),
                                onPressed: () async {
                                  _botonBuscar(buscarController.text, context,
                                      child, model);

                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              InicioAuditor()));
                                  // return Text("EL ese del aquel");//_botonLogin(emailController.text,passwordController.text);
                                },
                                child: Text("Buscar",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20))),
                          ),
                          Flexible(
                              child:
                                  //  width: MediaQuery.of(context).size.width - Material().,
                                  Padding(
                            padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                            child: TextFormField(
                              controller: buscarController,
                              obscureText: false,
                              //style: style,
                              decoration: InputDecoration(
                                  prefixIcon: Icon(Icons.search),
                                  contentPadding: EdgeInsets.fromLTRB(
                                      20.0, 15.0, 20.0, 15.0),
                                  hintText: "Buscar",
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12.0),
                                  )),
                            ),
                          ))
                        ] //Child
                        )),
                Text("Lista  de actas de auditorias",
                    style: TextStyle(color: Colors.black, fontSize: 20)),
                Container(
                  color: ColorBoton,
                  child: Table(
                    border: TableBorder.all(),
                    children: [
                      TableRow(children: [
                        Column(children: [
                          Text('Acta', style: TextStyle(color: ColorIconos))
                        ]),
                        Column(children: [
                          Text('FechaI', style: TextStyle(color: ColorIconos))
                        ]),
                        Column(children: [
                          Text('FechaF', style: TextStyle(color: ColorIconos))
                        ]),
                        Column(children: [
                          Text('Area', style: TextStyle(color: ColorIconos))
                        ]),
                        Column(children: [
                          Text('Dept', style: TextStyle(color: ColorIconos))
                        ]),
                        Column(children: [
                          Text('Aud', style: TextStyle(color: ColorIconos))
                        ]),
                        Column(children: [
                          Text('Status', style: TextStyle(color: ColorIconos))
                        ]),
                      ]),
                    ],
                  ),
                ),
                Expanded(child: AuditoriasVerAuditorias())
              ]),
            ),

            Container(
              //Contendeor 3
              child: CuentaAuditor(),
            ),

            Container(
                child:
                    //Contendeor 4
                    Column(children: <Widget>[
              Material(
                //Material
                elevation: 1.0,
                borderRadius: BorderRadius.circular(15.0),
                color: ColorTarjetas,
                child: MaterialButton(
                    minWidth: MediaQuery.of(context).size.width,
                    //  padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),

                    onPressed: () {
                  _notificacionUno(context);
                    },
                    child: Text("Crear Observacion",
                        style: TextStyle(color: Colors.white, fontSize: 25))),
              ),
              Expanded(child: ObservacionesAuditor())
            ])) //Contendeor 4
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
                title: Text('Inicio',
                    style: TextStyle(
                      color: ColorIconosTexto,
                    )),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.business),
                title: Text('Auditorias',
                    style: TextStyle(
                      color: ColorIconosTexto,
                    )),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.verified_user),
                title: Text('Cuenta',
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

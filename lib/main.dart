//import 'dart:js';
import 'package:scoped_model/scoped_model.dart';
import 'scoped_models/main.dart';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'conversionesJson.dart';

import 'Administrador/inicioAdministrador.dart';
import 'Auditor/inicioAuditor.dart';
import 'Auditado/inicioAuditado.dart';


// El void main principal
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final MainModel _model = MainModel();

    return ScopedModel<MainModel>(
        model: _model,
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: InicioInicial(),
        ));
  }
}

// Clase de inicio del inicial
class InicioInicial extends StatefulWidget {
  @override
  _InicioInicial createState() => _InicioInicial();
}

class _InicioInicialSettings {
  const _InicioInicialSettings({this.correo, this.password});

  final String correo;
  final String password;
}

const List<_InicioInicialSettings> choices = const <_InicioInicialSettings>[
  const _InicioInicialSettings(password: '', correo: ''),
  const _InicioInicialSettings(
      password: 'Por vavor verifica su password',
      correo: 'Por favor verifica tu email'),
];

class _InicioInicial extends State<InicioInicial> {
  int _login = 1; // Verificacion de login.

  void _Estadologin(int choice) {
    // Causes the app to rebuild with the new _selectedChoice.
    setState(() {
      _login = choice;
    });
  }

  @override
  Widget build(BuildContext context) {
//Colores del ese
    const ColorTitulo = const Color(0xFF546E7A);
    const ColorFondo = const Color(0xFFEEEEEE);
    const ColorIconos = const Color(0xFF546E7A);
   
    const ColorIconosTexto = const Color(0xFF546E7A);

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
        padding: const EdgeInsets.all(16.0),
        child: ChoiceCard(login: _login),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: ColorTitulo,
        unselectedItemColor: ColorTitulo,
        selectedItemColor: ColorTitulo,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            title: Text('Business'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            title: Text('School'),
          ),
        ],
      ),
    ));
  }
}

class ChoiceCard extends StatelessWidget {
  const ChoiceCard({Key key, this.login}) : super(key: key);

  final int login;

  void _botonLogin(String correo, String password, BuildContext context,
      Widget child, MainModel model) {
    print("El correo ingresado es:" + correo);
    print("El password ingresado es:" + password);

    Future<DatosLogin> listaLogin;

    listaLogin = mandarLogin(correo, password);

    listaLogin.then((data) {
      String nombre = data.nombre;
      String tipo = data.tipo;
      String correo = data.correo;


print(nombre);
      if (nombre != '0') {
        print("sss,si entro boton");
        model.updateCorreo(correo);
        model.updateMensajeError("");

        if (tipo == '3') {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => InicioAdministrador()
              )
              );
        }

        else if (tipo == '2') {
            
        Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => InicioAuditado()));
        }
        
         else if (tipo == '1') {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => InicioAuditor()));
        }

        
      }
      else{
          model.updateMensajeError("Por favor verifica tus creedenciales");
           Navigator.push(context,
              MaterialPageRoute(builder: (context) => InicioInicial()));
        }
    }, onError: (e) {
      print(e);
    });
  }

  @override
  Widget build(BuildContext context) {
//Colores del ese

    const ColorBoton = const Color(0xFF546E7A);
    const ColorOlivdePassword = const Color(0xFF646161);
    const ColorFondo = const Color(0xFFEEEEEE);
    const ColorCerrarSesion = const Color(0xFFB74B4B);

    return ScopedModelDescendant<MainModel>(
        builder: (BuildContext context, Widget child, MainModel model) {
      TextEditingController emailController = new TextEditingController();
      TextEditingController passwordController = new TextEditingController();
      TextStyle textStyle = Theme.of(context).textTheme.headline4;
      return ListView(children: <Widget>[
        Card(
            color: Colors.white,
            child: Center(
                child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                  SizedBox(
                    height: 175.0,
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                      child: Image.asset(
                        "assets/iconoLogin.png",
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  SizedBox(
                      height: 75.0,
                      child: TextField(
                        controller: emailController,
                        obscureText: false,
                        //style: style,
                        decoration: InputDecoration(
                            prefixIcon: Icon(Icons.mail),
                            contentPadding:
                                EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                            hintText: "Email",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(32.0))),
                      )),
                  SizedBox(
                      height: 75.0,
                      child: TextField(
                        controller: passwordController,
                        obscureText: true,
                        //       style: style,
                        decoration: InputDecoration(
                            prefixIcon: Icon(Icons.lock),
                            contentPadding:
                                EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                            hintText: "Password",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(32.0))),
                      )),
                  Material(
                      elevation: 5.0,
                      borderRadius: BorderRadius.circular(30.0),
                      color: ColorBoton,
                      child: MaterialButton(
                        minWidth: MediaQuery.of(context).size.width,
                        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                        onPressed: () async {
                          _botonLogin(emailController.text,
                              passwordController.text, context, child, model);
                        },
                        child: Text("Iniciar Sesion",
                            style:
                                TextStyle(color: Colors.white, fontSize: 20)),
                      )
                      ),
new InkWell(  onTap: () {
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
             
            
                Text("Introduce un correo electronico para enviarte una contraseña")
                ,

                TextFormField(
                  
                  decoration: InputDecoration(
                    contentPadding: new EdgeInsets.symmetric(vertical: 0.1, horizontal: 10.0),
                    border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30.0),
                              
                              ),
                             
                      hintText: 'Correo Electronico'),
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
    });
 },
                        child:
                  Center(
                      child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    
                      child: Text("Olvide mi password",
                          style: TextStyle(
                              color: ColorOlivdePassword, fontSize: 20)),
                    ),
                  )
                  ),
                  Text(model.mensajeError,style: TextStyle(color:ColorCerrarSesion,fontSize: 20))
                ]
                )
                )
                ),
      ]);
    }); //Fin de la Globales
  }
}

Future<ListadoUsuarios> obtenerUsuarios() async {
  final response =
      await http.get('https://ios.vxsandbox.tech/audipaq/listadoUsuarios.php');

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.1
    final ese = json.decode(response.body);

    return ListadoUsuarios.fromJson(ese);
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load ');
  }
}

Future<DatosLogin> mandarLogin(String correo, String password) async {
  final http.Response response = await http.post(
    'https://ios.vxsandbox.tech/audipaq/login.php',
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'correo': correo,
      'password': password,
    }),
  );
  if (response.statusCode == 200) {
    // If the server did return a 201 CREATED response,
    // then parse the JSON.
    //throw Exception('Si cargo');
    var respuestaJson = json.decode(response.body);

    return DatosLogin.fromJson(respuestaJson[0]);
  } else {
    // If the server did not return a 201 CREATED response,
    // then throw an exception.
    throw Exception('No cargo' + response.statusCode.toString());
  }
}

//Antes del void main podemos poner clases de esos
Future<AlbumList> fetchAlbum() async {
  final response =
      await http.get('https://ios.vxsandbox.tech/audipaq/login.php');

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    final ese = json.decode(response.body);

    return AlbumList.fromJson(ese);
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}

class Album {
  final String userId;
  final String id;
  final String title;

  Album({this.userId, this.id, this.title});

  factory Album.fromJson(Map<String, dynamic> json) {
    return new Album(
      userId: json['idpersona'].toString(),
      id: json['nombre'],
      title: json['correo'],
    );
  }
}

class AlbumList {
  final List<Album> photos;
  final int contador;

  AlbumList({
    this.photos,
    this.contador,
  });

  factory AlbumList.fromJson(List<dynamic> parsedJson) {
    List<Album> photos = new List<Album>();

    photos = parsedJson.map((i) => Album.fromJson(i)).toList();
    int contador = photos.length;
    return new AlbumList(
      photos: photos,
      contador: contador,
    );
  }
}

class ListaUsuario extends StatefulWidget {
  ListaUsuario({Key key}) : super(key: key);

  @override
  _ListaUsuarioState createState() {
    return _ListaUsuarioState();
  }
}

class _ListaUsuarioState extends State<ListaUsuario> {
  Future<AlbumList> futureAlbum;

  @override
  void initState() {
    super.initState();
    futureAlbum = fetchAlbum();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fetch Data Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Fetch Data Example'),
        ),
        body: Center(
          child: FutureBuilder<AlbumList>(
            future: futureAlbum,
            builder: (context, projectSnap) {
              if (projectSnap.hasData) {
                return ListView.builder(
                  itemCount: projectSnap.data.contador,
                  itemBuilder: (context, index) {
                    Album project = projectSnap.data.photos[index];
                    return Column(
                      children: <Widget>[
                        Container(
                          width: 200,
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            color: Colors.pink,
                            elevation: 10,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                const ListTile(
                                  leading: Icon(Icons.album, size: 70),
                                  title: Text('Heart Shaker',
                                      style: TextStyle(color: Colors.white)),
                                  subtitle: Text('TWICE',
                                      style: TextStyle(color: Colors.white)),
                                ),
                                ButtonTheme.bar(
                                  child: ButtonBar(
                                    children: <Widget>[
                                      FlatButton(
                                        child: Text(project.title,
                                            style:
                                                TextStyle(color: Colors.white)),
                                        onPressed: () {},
                                      ),
                                      FlatButton(
                                        child: Text(project.userId,
                                            style:
                                                TextStyle(color: Colors.white)),
                                        onPressed: () {},
                                      ),
                                    ],
                                  ),
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
                Text("${projectSnap.error}");
              }
              // By default, show a loading spinner.
              return CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }
}

//el ese


import 'package:scoped_model/scoped_model.dart';
import '../scoped_models/main.dart';
import 'package:flutter/material.dart';
import 'conversionesVerAuditorAdminstrador.dart';
import 'inicioAdministrador.dart';



// Clase del Home Auditor
class VerAuditorAdministrador extends StatefulWidget {
  VerAuditorAdministrador({Key key}) : super(key: key);

  @override
  _VerAuditorAdministrador createState() {
    return _VerAuditorAdministrador();
  }
}





//Clase Elementos del Home Auditor
class _VerAuditorAdministrador extends State<VerAuditorAdministrador> {
  //Variables de preferencia aqui.

Future<DatosVerAuditorAdministrador> listadoMaestro;

  @override
  void initState() {
    super.initState();
    MainModel model = ScopedModel.of(context);
  // now I can do with the model whatever I need to do:
  int auditor = model.idActa;

  listadoMaestro = obtenerDatosVerAuditorAdministrador(auditor);
  }

@override
  Widget build(BuildContext context) {
 

return ScopedModelDescendant<MainModel>(
        builder: (BuildContext context, Widget child, MainModel model) {

		


    return  FutureBuilder<DatosVerAuditorAdministrador>(
            future: listadoMaestro,
            builder: (context, projectSnap) {
              if (projectSnap.hasData) {

                return ListView.builder(
        itemCount: 1,
        itemBuilder: (context, index) {
          DatosVerAuditorAdministrador project = projectSnap.data;
          return Column(

            children: <Widget>[
             SizedBox(
                height: 155.0,
                child: Image.asset(
                  "assets/iconoUsuario.png",
                  fit: BoxFit.contain,
                ),



              ),
              Center(child: 
              Text(project.auditor,style: TextStyle(color: Colors.black,fontSize: 20))
              ),
    Padding(
      padding: EdgeInsets.all(16.0),
child: Align(
alignment: Alignment.topLeft,
child: Text('Detalles',style: TextStyle(color: Colors.black,fontSize: 25)),
    ),
) , 






    Container(
	  width: MediaQuery.of(context).size.width,
    
    child:  Padding( //Padding
      padding:EdgeInsets.fromLTRB(20,0,20,0),
      child: 
       Card(
      //color: Colors.transparent,
      elevation: 10,
      
      child:
        Column( children: <Widget>[
         Row(//
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
    Text('Empresa',style: TextStyle(color: Colors.black,fontSize: 20)),
    Expanded( child:
     Text(project.nombre_empresa,style: TextStyle(color: Colors.black,fontSize: 20)),
     ) 
  ]
         ),
         Divider(
              color: Colors.black
            ),

         Row(//
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
    Text('Fecha de registro',style: TextStyle(color: Colors.black,fontSize: 20)),
    Expanded(child:
     Text(project.fecha_registro,style: TextStyle(color: Colors.black,fontSize: 20))
      ,),
  ]
         ),
Divider(
              color: Colors.black
            ),
         Row(//
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
    Text('RFC',style: TextStyle(color: Colors.black,fontSize: 20)),
     Text(project.rfc,style: TextStyle(color: Colors.black,fontSize: 20)),
  ]
         ),
          Divider(
              color: Colors.black
            ),
            Row(//
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
    Text('CURP',style: TextStyle(color: Colors.black,fontSize: 20)),
     Text(project.curp,style: TextStyle(color: Colors.black,fontSize: 20)),
  ]
         ),
          Divider(
              color: Colors.black
            ),
  
        ]
        )
      
    )
    )
    ),//Conainer,
    
   
	                                  
]//Child

  ); //Row 2,



   
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
	});//Fin de la Globales  
}

}
//Fin Home Auditor


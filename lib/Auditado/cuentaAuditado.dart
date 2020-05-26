import 'package:prueba/main.dart';
import 'package:scoped_model/scoped_model.dart';
import '../scoped_models/main.dart';
import 'package:flutter/material.dart';
import 'inicioAuditado.dart';
import 'conversionesCuentaAuditado.dart';



// Clase del Home Auditor
class CuentaAuditor extends StatefulWidget {




  CuentaAuditor({Key key}) : super(key: key);

  @override
  _CuentaAuditor createState() {
    return _CuentaAuditor();
  }
}





//Clase Elementos del Home Auditor
class _CuentaAuditor extends State<CuentaAuditor> {
  //Variables de preferencia aqui.

Future<DatosCuentaAuditado> listadoMaestro;
  @override
  void initState() {
    super.initState();
    MainModel model = ScopedModel.of(context);
  // now I can do with the model whatever I need to do:
  String correo = model.correo;
  listadoMaestro = obtenerDatosCuentaAuditado(correo);
  }


@override
  Widget build(BuildContext context) {
 //Los colores
 const ColorTextoIzquierda = const Color(0xFF777676);
  const ColorTextoDerecha = const Color(0xFF00ACC1);
   const ColorCerrarSesion = const Color(0xFFB74B4B);

return ScopedModelDescendant<MainModel>(
        builder: (BuildContext context, Widget child, MainModel model) {
		
		


    return  FutureBuilder<DatosCuentaAuditado>(
            future: listadoMaestro,
            builder: (context, projectSnap) {
              if (projectSnap.hasData) {

                return ListView.builder(
        itemCount: 1,
        itemBuilder: (context, index) {
          DatosCuentaAuditado project = projectSnap.data;
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
              Text(project.personaCompleta,style: TextStyle(color: Colors.black,fontSize: 20))
              ),
    Padding(
      padding: EdgeInsets.all(16.0),
child: Align(
alignment: Alignment.topLeft,
child: Text('General',style: TextStyle(color: Colors.black,fontSize: 25)),
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
    Text('Notificaciones',style: TextStyle(color:ColorTextoIzquierda,fontSize: 20)),
     Text('Si',style: TextStyle(color: ColorTextoDerecha,fontSize: 20)),
     
  ]
         ),
         Divider(
              color: Colors.black
            ),

         Row(//
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
    Text('Tema',style: TextStyle(color: ColorTextoIzquierda,fontSize: 20)),
     Text('Predeterminado',style: TextStyle(color: ColorTextoDerecha,fontSize: 20)),
  ]
         ),
Divider(
              color: Colors.black
            ),
         Row(//
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
    Text('Idioma',style: TextStyle(color: ColorTextoIzquierda,fontSize: 20)),
     Text('Es',style: TextStyle(color: ColorTextoDerecha,fontSize: 20)),
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
    
Padding(
      padding: EdgeInsets.all(16.0),
child: Align(
alignment: Alignment.topLeft,
child: Text('Sesión',style: TextStyle(color: Colors.black,fontSize: 25)),
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
    Text('Cambiar Nombre',style: TextStyle(color: ColorTextoIzquierda,fontSize: 20)),
  
  ]
         ),
Divider(
              color: Colors.black
            ),
new InkWell(
                          onTap: () {
                        model.updateAuxiliar(0);
                        model.updateCorreo('');
                        model.updateIdActa(0);
                        model.updateName('');
                         model.updateAuxiliarDB('');
                         model.updateContador(0);

                         
                                       
                          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => InicioInicial()
              )
              );

                          },
                          child:


         Row(
           
           //
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
  
     Text('Cerrar Sesion',style: TextStyle(color: ColorCerrarSesion,fontSize: 20)),
                
  ]
         ),
          ),
          Divider(
              color: Colors.black
            ),
  
        ]
        )
      
    )
    )
    ),   
    
   
	                                  
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


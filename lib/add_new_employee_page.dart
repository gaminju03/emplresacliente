import 'rest_api.dart';
import 'package:flutter/material.dart';

class AddNewEmployeePage extends StatefulWidget{
 AddNewEmployeePage({Key key}):super(key:key);
 _AddNewEmployeePageState createState() => _AddNewEmployeePageState();
}

class _AddNewEmployeePageState extends State<AddNewEmployeePage>{
  final _nombreController = TextEditingController();
  final _primerApellidoController = TextEditingController();
  final _segundoApellidoController = TextEditingController();
  final _curpController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Nuevo Empleado'),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            children: <Widget>[
              TextField(
                controller: _nombreController,
                decoration: InputDecoration(hintText: 'Nombre empleado'),
              ),
              TextField(
                controller: _primerApellidoController,
                decoration: InputDecoration(hintText: 'Primer Apellido'),
                keyboardType: TextInputType.text,
              ),
              TextField(
                controller: _segundoApellidoController,
                decoration: InputDecoration(hintText: 'Segundo Apellido'),
                keyboardType: TextInputType.text,
              ),
              TextField(
                controller: _curpController,
                decoration: InputDecoration(hintText: 'curp'),
                keyboardType: TextInputType.text,
              ),
              RaisedButton(
                child: Text(
                  'SAVE',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                color: Colors.purple,
                onPressed: (){
                  final body = {
                    "Nombre":_nombreController.text,
                    "PrimerApellido":_primerApellidoController,
                    "SegundoApellido":_segundoApellidoController,
                    "curp":_curpController,
                  };
                  ApiService.addEmployee(body).then((success){
                      if(success){
                        showDialog(
                         builder: (context)=>AlertDialog(
                           title: Text('Employee has been added'),
                           actions: <Widget>[
                             FlatButton(
                               onPressed:(){
                                 Navigator.pop(context);
                                 _nombreController.text='';
                                 _primerApellidoController.text='';
                                 _segundoApellidoController.text='';
                                 _curpController.text='';
                               },
                               child: Text('Ok'),
                                )
                           ],
                           ),
                           context: context,
                        );
                        return;
                      }else{
                        showDialog(
                          builder: (context) => AlertDialog(
                            title: Text('Error Adding Employee!!!'),
                            actions: <Widget>[
                              FlatButton(
                                onPressed: (){
                                  Navigator.pop(context);
                                },
                                child: Text('OK'),
                                )
                            ],
                          ),
                          context: context,
                        );
                        return;
                      }
                  });
                },
                )
            ],
          ) 
        ,),
      ),
    );
  }

}
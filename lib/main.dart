import 'package:flutter/material.dart';
import 'rest_api.dart';
import 'add_new_employee_page.dart';

void main() => runApp(EmployeePage());

class EmployeePage extends StatefulWidget{
  @override
  _EmployeePageState createState()=> _EmployeePageState();
}

class _EmployeePageState extends State<EmployeePage>{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter REST API'),
      ),
      body:FutureBuilder(
        future: ApiService.getEmployees(),
        builder: (context, snapshot){
          final employees = snapshot.data;
          if(snapshot.connectionState == ConnectionState.done){
            return ListView.separated(
              separatorBuilder: (context, index){
                return Divider(
                  height: 2,
                  color: Colors.black,
                );
              },
              itemBuilder: (context, index){
                return ListTile(
                  title: Text(employees[index]['Nombre']??''),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:<Widget>[
                      Text(employees[index]['PrimerApellido'] ?? ''),
                      Text(employees[index]['SegundoApellido'] ?? ''),
                    ],
                  ),
                );
              },
              itemCount: employees.length);
          }
            return Center(child: CircularProgressIndicator(),
            );
        }),
        floatingActionButton: FloatingActionButton(
          onPressed: (){
            Navigator.push(
              context,
               MaterialPageRoute(
                 builder: (context)=>AddNewEmployeePage(),
                 ),
                 );
          },
          tooltip: 'Increment',
          child: Icon(Icons.add),
        ),
    );
  }
}
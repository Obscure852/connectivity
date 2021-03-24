import 'package:app/Constants/Constants.dart';
import 'package:app/data/InternetCubit.dart';
import 'package:app/data/InternetState.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text("Home"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(height: 200,),
        BlocBuilder<InternetCubit,InternetState>(builder: (context,state){
          if(state is InternetConnected && state.connectionType == ConnectionType.wifi){
            return Text("Internet is connected with WIFI");
          } else if(state is InternetConnected && state.connectionType == ConnectionType.mobile){
            return Text("Connection establish with Mobile.");
          }
          return Text("Nothing is happening.");

        }),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children:[
             MaterialButton(
              onPressed: (){},
              child: Text("Increase"),
            ),
              MaterialButton(
                onPressed: (){},
                child:  Text("Decrease"),
              ),
            ]
          ),
        ],
      ),
    );
  }
}

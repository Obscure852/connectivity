import 'package:app/Constants/Constants.dart';
import 'package:app/data/InternetCubit.dart';
import 'package:app/data/InternetState.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();


}

class _MyAppState extends State<MyApp> {
  Connectivity connectivity;
  bool internetConnection = false;
  Color iconColor = Colors.grey;
  IconData icon = Icons.wifi;

  @override
  void initState() {
    super.initState();
  }


  @override
  void dispose() {
    super.dispose();

  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<InternetCubit>(
      create: (context) => InternetCubit(connectivity: Connectivity()),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'In search of BloC',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: BlocListener<InternetCubit,InternetState>(
          listener: (context, state){
            if(state is InternetConnected && state.connectionType == ConnectionType.wifi){
              setState(() {
                iconColor = Colors.red;
                print("we are red.");
              });
            }else if(state is InternetConnected && state.connectionType == ConnectionType.mobile){
              setState(() {
                icon = Icons.mobile_friendly;
                iconColor = Colors.red;
                print("we are red.");
              });
            }
          },
          child: Scaffold(
            appBar: AppBar(
              title: Text("Home"),
              centerTitle: true,
              actions: [
                BlocBuilder<InternetCubit,InternetState>(builder: (context,state){
                  if(state is InternetConnected && state.connectionType == ConnectionType.wifi){
                    return Icon(Icons.wifi,color: Colors.green,size: 25,);
                  }else if(state is InternetConnected && state.connectionType == ConnectionType.mobile){
                    return Icon(Icons.mobile_friendly_outlined,color: Colors.green,size: 25,);
                  }
                  return Icon(Icons.wifi_off,color: Colors.grey,size: 25,);
                })
              ],
            ),
            body: Column(
              children: [

              ],
            ),
          ),
        ),
      ),
    );
  }
}

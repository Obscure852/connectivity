import 'dart:async';
import 'package:app/Constants/Constants.dart';
import 'package:app/data/InternetState.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InternetCubit extends Cubit<InternetState>{
  Connectivity connectivity;
  StreamSubscription streamSubscription;
  InternetCubit({@required this.connectivity}): super(InternetLoading()){
    streamSubscription = connectivity.onConnectivityChanged.listen((connectivityResult) {
      if(connectivityResult == ConnectivityResult.wifi){
        emitInternetConnected(ConnectionType.wifi);
      }else if(connectivityResult == ConnectivityResult.mobile){
        emitInternetConnected(ConnectionType.mobile);
      }else if(connectivityResult == ConnectivityResult.none){
        emitInternetDisconnected();
      }
    });
  }


  void emitInternetConnected(ConnectionType connectionType){
    emit(InternetConnected(connectionType: connectionType));
  }

  void emitInternetDisconnected(){
    emit(InternetDisconnected());
  }

  @override
  Future<void> close() {
    streamSubscription.cancel();
    return super.close();
  }
}
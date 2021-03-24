import 'package:flutter/material.dart';
import 'package:app/Constants/Constants.dart';

@immutable
abstract class InternetState{}

class InternetLoading extends InternetState{}

class InternetConnected extends InternetState{
  final ConnectionType connectionType;
  InternetConnected({@required this.connectionType});
}

class InternetDisconnected extends InternetState{}
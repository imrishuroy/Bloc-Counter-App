import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:counter_app/constants/enums.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:test/test.dart';

part 'internet_state.dart';

class InternetCubit extends Cubit<InternetState> {
  final Connectivity connectivity;
  StreamSubscription connectivitySubscription;

  InternetCubit({@required this.connectivity}) : super(InternetLoading()) {
    monitorInternetCubit();
  }

  StreamSubscription<ConnectivityResult> monitorInternetCubit() {
    return connectivitySubscription =
        connectivity.onConnectivityChanged.listen((connectivityResult) {
      if (connectivityResult == ConnectivityResult.wifi) {
        emitInternetConnected(ConnectionType.Wifi);
      } else if (connectivityResult == ConnectivityResult.mobile) {
        emitInternetConnected(ConnectionType.Mobile);
      } else if (connectivityResult == ConnectivityResult.none) {
        emitInternetDisconnected();
      }
    });
  }

  void emitInternetConnected(ConnectionType _connectionType) =>
      emits(InternetConnected(connectionType: _connectionType));

  void emitInternetDisconnected() => emit(InternetDisconnected());

  @override
  Future<void> close() {
    connectivitySubscription.cancel();
    return super.close();
  }
}

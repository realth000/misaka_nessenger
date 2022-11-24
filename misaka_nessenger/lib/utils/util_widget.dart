import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:network_info_plus/network_info_plus.dart';
import 'package:r_get_ip/r_get_ip.dart';

/// Build a [Text] widget showing local IP address.
///
/// When getting IP, return a [CircularProgressIndicator].
/// If error occurs when getting IP, return an empty [Text] widget.

Widget buildLocalIPTextWidget() => FutureBuilder(
      future: NetworkInfo().getWifiIP(),
      builder: (context, ipSnapshot) {
        if (ipSnapshot.connectionState == ConnectionState.done) {
          if (ipSnapshot.hasError) {
            print('AAAA ERROR GETTING IP ${ipSnapshot.data}');
            return const Text('');
          }
          return Text('${ipSnapshot.data}');
        }
        return const CircularProgressIndicator();
      },
    );

Widget buildLocalIPTextWidget2() => FutureBuilder(
      future: _retrieveIPAddress(),
      builder: (context, ipSnapshot) {
        if (ipSnapshot.connectionState == ConnectionState.done) {
          if (ipSnapshot.hasError) {
            return const Text('');
          }
          print('AAAA IP DATA LIST ${ipSnapshot.data}');
          return const Text('AAAA');
        }
        return CircularProgressIndicator();
      },
    );

Widget buildLocalIPTextWidget3() => FutureBuilder(
      future: RGetIp.internalIP,
      builder: (context, ipSnapshot) {
        print('AAAA IP DATA LIST ${ipSnapshot.data}');
        if (ipSnapshot.connectionState == ConnectionState.done) {
          if (ipSnapshot.hasError) {
            return const Text('');
          }
          print('AAAA IP DATA LIST ${ipSnapshot.data}');
          return const Text('AAAA');
        }
        return CircularProgressIndicator();
      },
    );

/// https://stackoverflow.com/questions/52411168/how-to-get-device-ip-in-dart-flutter
Future<InternetAddress> _retrieveIPAddress() async {
  InternetAddress result;

  final code = Random().nextInt(255);
  final dgSocket = await RawDatagramSocket.bind(InternetAddress.anyIPv4, 0);
  dgSocket
    ..readEventsEnabled = true
    ..broadcastEnabled = true;
  final ret = dgSocket.timeout(
    const Duration(milliseconds: 100),
    onTimeout: (sink) {
      sink.close();
    },
  ).expand<InternetAddress>((event) {
    if (event == RawSocketEvent.read) {
      final dg = dgSocket.receive();
      if (dg != null && dg.data.length == 1 && dg.data[0] == code) {
        dgSocket.close();
        return [dg.address];
      }
    }
    return [];
  }).firstWhere((a) => a != null);

  dgSocket.send([code], InternetAddress('255.255.255.255'), dgSocket.port);
  return ret;
}

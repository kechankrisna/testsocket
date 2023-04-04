import 'package:flutter/material.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class ClientSocketPage extends StatefulWidget {
  const ClientSocketPage({super.key});

  @override
  State<ClientSocketPage> createState() => _ClientSocketPageState();
}

class _ClientSocketPageState extends State<ClientSocketPage> {
  late IO.Socket socket = IO.io(
      'http://localhost:3000',
      IO.OptionBuilder().setTransports(['websocket']) // for Flutter or Dart VM
          .setExtraHeaders({}) // optional
          .disableAutoConnect()
          .build());

  @override
  void initState() {
    socket.connect();
    socket.onConnect((_) {
      print('onConnect');
      socket.emit('msg', 'message from client');
    });
    socket.onConnectError((err) => print(err));
    socket.on('event', (data) => print(data));
    socket.onDisconnect((_) => print('disconnect'));
    socket.on('fromServer', (_) => print(_));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("socket.io"),
      ),
      body: Center(
        child: Column(
          children: [
            TextButton(onPressed: message, child: Text("message")),
          ],
        ),
      ),
    );
  }

  message() async {
    // Dart client
    if (!socket.connected) {
      socket = socket.connect();
    }

    socket.onConnect((_) {
      print('connect');
      socket.emit('msg', 'test');
    });

    socket.emit('msg', 'test');

    /// socket.on('event', (data) => print(data));
    /// socket.onDisconnect((_) => print('disconnect'));
    /// socket.on('fromServer', (_) => print(_));
  }
}

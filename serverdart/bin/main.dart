/// import 'dart:io' as io;

import 'package:socket_io/socket_io.dart' as io;

main() {
  var server = io.Server();
  server.on('connection', (event) {
    if (event == null) return;
    final io.Socket socket = event as io.Socket;
    print(socket.client);
    socket.on('msg', (data) {
      print("on msg $data");
      socket.emit('fromServer', "message from server");
    });
  });
  server.listen(3000);
}

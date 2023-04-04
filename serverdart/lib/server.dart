import 'dart:io' as io;

void main(List<String> args) async {
  final socket = await io.Socket.connect(io.InternetAddress.anyIPv4, 3000);

  socket.listen((event) {
    print("event");
  });
}

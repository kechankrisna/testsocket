import * as ioType from 'socket.io';
import * as httpType from 'node:http';

const http = require('node:http');
const { Server } = require("socket.io");

const httpServer: httpType.Server = http.createServer();
const io: ioType.Socket = new Server(httpServer, { /* options */ });

io.on("connection", (socket: ioType.Socket) => {
    // console.log(socket.client);
    socket.on('msg', (data: any) => {
        console.log(`on msg ${data}`);
        socket.emit('fromServer', "message from server");
    });
});

httpServer.listen(3000);
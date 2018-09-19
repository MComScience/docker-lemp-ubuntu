var app = require('express')();
var http = require('http').Server(app);
var io = require('socket.io')(http);

app.get('/', function (req, res) {
    res.json({
        welcome: 'nodejs api'
    });
});

io.on('connection', function (socket) {
    //ออกบัตรคิว
    socket.on('register', function (res) {
        socket.broadcast.emit('register', res);
    });

    //เรียกคิว
    socket.on('call', function (res) {
        socket.broadcast.emit('call', res);
    });

    //เรียกคิวซ้ำ
    socket.on('recall', function (res) {
        socket.broadcast.emit('recall', res);
    });

    //เักคิว
    socket.on('hold', function (res) {
        socket.broadcast.emit('hold', res);
    });

    //เสร็จสิ้น
    socket.on('end-calling', function (res) {
        socket.broadcast.emit('end-calling', res);
    });

    socket.on('call-hold', function (res) {
        socket.broadcast.emit('call-hold', res);
    });

    socket.on('end-hold', function (res) {
        socket.broadcast.emit('end-hold', res);
    });

    socket.on('show-display', function (res) {
        socket.broadcast.emit('show-display', res);
    });

    socket.on('update-display', function (res) {
        socket.broadcast.emit('update-display', res);
    });

    socket.on('disconnect', function () {
        io.emit('disconnected');
    });
});

http.listen(3000, function () {
    console.log('listening on *:3000');
});
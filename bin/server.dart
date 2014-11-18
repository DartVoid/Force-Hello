import 'dart:io';
import 'package:force/force_serverside.dart';

void main() {
  var portEnv = Platform.environment['PORT'];
  var port = portEnv == null ? 9090 : int.parse(portEnv);

  ForceServer fs = new ForceServer(clientFiles: "../web/",
      startPage: "index.html", port: port);

  fs.setupConsoleLog();

  fs.on("add", (receiver, sender) {
    sender.send("update",
        receiver.json["data"] == "" ? {"data":"Hello World!"} :
        {"data":"Hello ${receiver.json["data"]}!"});
  });

  fs.start();
}


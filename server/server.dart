import 'package:force/force_serverside.dart';

void main() {
  ForceServer fs = new ForceServer(clientFiles: "../client/build/web/",
      startPage: "index.html");

  fs.setupConsoleLog();

  fs.on("add", (receiver, sender) {
    sender.send("update",
        receiver.json["data"] == "" ? {"data":"Hello World!"} :
        {"data":"Hello ${receiver.json["data"]}!"});
  });

  fs.start();
}


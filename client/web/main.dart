import 'dart:html';
import 'package:force/force_browser.dart';

void main() {
  InputElement formInput    = querySelector("#form-input");
  ButtonElement formSubmit  = querySelector("#form-submit");
  InputElement formClear    = querySelector("#form-clear");
  DivElement respWrap       = querySelector("#response-wrapper");
  DivElement formResp       = querySelector("#response");

  ForceClient fc = new ForceClient();
  fc.connect();

  fc.on("update", (receiver, sender) {
    formResp.append(new ParagraphElement()..text = "${receiver.json["data"]}");
  });

  formSubmit.onClick.listen((e) {
    e.preventDefault();
    respWrap.classes = ["pure-u-1-1", "well"];
    fc.send("add", {"data": formInput.value});
  });

  formClear.onClick.listen((e) {
    respWrap.classes = ["pure-u-1-1"];
    formResp.children.clear();
  });
}


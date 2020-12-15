
import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  String text;
  String tipo;
  Function onPressed;
  bool showProgress = false;

  AppButton(this.text, this.tipo, this.onPressed, {this.showProgress});

  @override
  Widget build(BuildContext context) {
    switch (tipo) {
      case "RaisedButton":
        return Container(
          height: 46,
          child: RaisedButton(
            color: Colors.blue,
            child: showProgress
                ? Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
              ),
            )
                : Text(
              text,
              style: TextStyle(
                color: Colors.white,
                fontSize: 22,
              ),
            ),
            onPressed: onPressed,
          ),
        );
        break;
      case "Hiperlink":
        return Container(
          padding: EdgeInsets.only(right: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              new InkWell(
                child: new Text(
                  text,
                  style: TextStyle(color: Colors.blue, fontSize: 16),
                ),
                onTap: onPressed,
              ),
            ],
          ),
        );
        break;
    }
  }
}

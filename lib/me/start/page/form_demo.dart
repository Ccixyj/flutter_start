import 'package:flutter/material.dart';

class FormDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Form"),
      ),
      body: Theme(
        data: Theme.of(context).copyWith(
          primaryColor: Colors.black,
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextFieldDemo(),
              SizedBox(
                height: 16,
              ),
              RegisterDemo(),
            ],
          ),
        ),
      ),
    );
  }
}

class TextFieldDemo extends StatefulWidget {
  @override
  State createState() {
    return TextFileState();
  }
}

class TextFileState extends State<TextFieldDemo> {
  var controller = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  void initState() {
    super.initState();
    controller.addListener(() {
      debugPrint("text ${controller.text}");
    });
  }

  @override
  Widget build(BuildContext context) {
    final intputColor = Theme.of(context).accentColor;

    return TextField(
//      onChanged: (s) => debugPrint("onChanged $s"),
//      onSubmitted: (s) => debugPrint("onSubmitted $s"),
      controller: controller,
      decoration: InputDecoration(
        icon: Icon(
          Icons.person,
          color: intputColor,
        ),
        labelText: "enter user name",
        labelStyle: TextStyle(color: intputColor),
        border: OutlineInputBorder(),
        prefix: Text("hello -"),
//          suffixIcon: Icon(
//            Icons.person,
//            color: intputColor,
//          )
//        filled: true,
//        fillColor: Colors.amberAccent[100],
      ),
    );
  }
}

class RegisterDemo extends StatefulWidget {
  @override
  _RegisterDemoState createState() => _RegisterDemoState();
}

class _RegisterDemoState extends State<RegisterDemo> {
  final gk = GlobalKey<FormState>();

  String userName;

  String password;

  bool autoValidate = false;

  @override
  Widget build(BuildContext context) {
    return Form(
        key: gk,
        child: Column(
          children: <Widget>[
            TextFormField(
              decoration: InputDecoration(
                labelText: "user name",
                helperText: "",
              ),
              onSaved: (v) {
                debugPrint("onSaved user name: $v");
                this.userName = v;
              },
              validator: userNameValidator,
              autovalidate: autoValidate,
            ),
            TextFormField(
              decoration: InputDecoration(
                labelText: "password",
                helperText: "enter password",
              ),
              obscureText: true,
              onSaved: (v) {
                debugPrint("onSaved password: $v");
                this.password = v;
              },
              validator: passwordValidator,
              autovalidate: autoValidate,
            ),
            Container(
              width: double.infinity,
              child: RawMaterialButton(
                onPressed: () {
                  submitForm();
                },
                child: Text("Register"),
                fillColor: Theme.of(context).accentColor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
              ),
            )
          ],
        ));
  }

  void submitForm() {
    gk.currentState.save();
    if (gk.currentState.validate()) {
      Scaffold.of(context).showSnackBar(
        SnackBar(
          content: Text("register success"),
          action: SnackBarAction(
            label: "dismiss",
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
      );
    } else {
      setState(() {
        autoValidate = true;
      });
    }
//    debugPrint( "submitForm $userName : $password  --> valdate : ${gk.currentState.validate()}");
  }

  String userNameValidator(String value) {
    if (value.isEmpty) return "user name is empty";

    return null;
  }

  String passwordValidator(String value) {
    if (value.isEmpty) return "password is empty";
    return null;
  }
}

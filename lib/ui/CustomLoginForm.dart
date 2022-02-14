import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class CustomLoginForm extends StatefulWidget {
  const CustomLoginForm({Key? key}) : super(key: key);

  @override
  _CustomLoginFormState createState() => _CustomLoginFormState();
}

//Data class
class _LoginData {
  String name = "";
  String password = "";
}

class _CustomLoginFormState extends State<CustomLoginForm> {
  final _formKey = GlobalKey<FormState>();

//instantiating the object of type login
  _LoginData _data = new _LoginData();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Center(
              child: Container(
                  width: 200,
                  height: 150,
                  child: RiveAnimation.asset("assets/new_file.riv")),
            ),
            Padding(
              padding: const EdgeInsets.all(20.5),
              child: TextFormField(
                validator: (value) {
                  if (value!.isEmpty) {
                    return "please enter a name";
                  } else {
                    //save the name
                    _data.name = value;
                    print("Data: ${_data.name}");
                  }
                },
                decoration: InputDecoration(
                    labelText: "Name",
                    border: OutlineInputBorder(
                      gapPadding: 5.5,
                      borderRadius: BorderRadius.circular(15.5),
                    )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.5),
              child: TextFormField(
                validator: (value) {
                  if (value!.isEmpty) {
                    return "please enter your password";
                  } else {
                    //save the password
                    _data.password = value;
                    print("Password: ${_data.password}");
                  }
                },
                obscureText: true,
                decoration: InputDecoration(
                    labelText: "Password",
                    border: OutlineInputBorder(
                      gapPadding: 5.5,
                      borderRadius: BorderRadius.circular(15.5),
                    )),
              ),
            ),
            Expanded(
              child: Center(
                child: Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      RaisedButton(
                          color: Colors.teal,
                          onPressed: () {
                            //ensuring validation
                            if (_formKey.currentState!.validate()) {
                              setState(() {
                                _data.name = _data.name;
                              });

                              ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(
                                      content: Text(
                                "All good,feeling pumped?",
                                style: TextStyle(
                                    color: Colors.lightBlueAccent,
                                    fontSize: 19.5,fontWeight: FontWeight.bold),
                              )));
                            } else {
                              print("please enter a name");
                            }
                          },
                          child: Text(
                            "Submit",
                            style: TextStyle(
                                color: Colors.white,
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.bold,
                                fontSize: 19.5),
                          )),
                      RaisedButton(
                          color: Colors.red,
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              //clears both fields and welcome message
                              _formKey.currentState!.reset();

                              setState(() {
                                _data.name = "";
                              });
                            }
                          },
                          child: Text(
                            "Clear",
                            style: TextStyle(
                                color: Colors.white,
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.bold,
                                fontSize: 19.5),
                          )),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
                child: Container(
                    child: Center(
              //displays welcome message and users' names
              child: _data.name.isEmpty
                  ? Text("")
                  : Text(
                      "Welcome  ${_data.name}",
                      style: TextStyle(
                          fontSize: 25.5,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w500),
                    ),
            )))
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: FormPage());
  }
}

class FormPage extends StatefulWidget {
  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  final _formKey = GlobalKey<FormState>();

  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  final phoneController = TextEditingController();

  bool isHidden = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,

      appBar: AppBar(
        title: Text("User Form", style: TextStyle(color: Colors.white)),

        //     color: Colors.white,
        backgroundColor: Colors.blue.shade900,
      ),

      body: Center(
        child: SingleChildScrollView(
          child: Container(
            width: 350,

            padding: EdgeInsets.all(20),

            margin: EdgeInsets.all(20),

            decoration: BoxDecoration(
              color: Colors.black,

              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.white, width: 0.9),

              boxShadow: [
                BoxShadow(
                  color: Colors.blue.shade800.withValues(alpha: 5.5),
                  blurRadius: 50,
                  //                   spreadRadius: 5,
                ),
              ],
            ),

            child: Form(
              key: _formKey,

              child: Column(
                mainAxisSize: MainAxisSize.min,

                children: [
                  Text(
                    "Register",
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),

                  SizedBox(height: 30),

                  // EMAIL FIELD
                  TextFormField(
                    style: TextStyle(color: Colors.white),
                    controller: emailController,

                    keyboardType: TextInputType.emailAddress,

                    decoration: InputDecoration(
                      labelText: "Email",
                      labelStyle: TextStyle(color: Colors.white),

                      border: OutlineInputBorder(),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(13),

                        borderSide: BorderSide(color: Colors.white, width: 0.8),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),

                        borderSide: BorderSide(color: Colors.white, width: 0.8),
                      ),

                      prefixIcon: Icon(Icons.email),
                    ),

                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter email";
                      }

                      if (!value.contains("@")) {
                        return "Email must contain @";
                      }

                      final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+$');

                      if (!emailRegex.hasMatch(value)) {
                        return "Enter valid email";
                      }

                      return null;
                    },
                  ),

                  SizedBox(height: 20),

                  // PASSWORD FIELD
                  TextFormField(
                    style: TextStyle(color: Colors.white),

                    controller: passwordController,

                    obscureText: isHidden,

                    decoration: InputDecoration(
                      labelText: "Password",
                      labelStyle: TextStyle(color: Colors.white),
                      border: OutlineInputBorder(),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(13),

                        borderSide: BorderSide(color: Colors.white, width: 0.8),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),

                        borderSide: BorderSide(color: Colors.white, width: 0.8),
                      ),

                      prefixIcon: Icon(Icons.lock),

                      suffixIcon: IconButton(
                        icon: Icon(
                          isHidden ? Icons.visibility : Icons.visibility_off,
                        ),

                        onPressed: () {
                          setState(() {
                            isHidden = !isHidden;
                          });
                        },
                      ),
                    ),

                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Enter password";
                      }

                      final passwordRegex = RegExp(
                        r'^(?=.*[a-z])(?=.*[A-Z]).{8,}$',
                      );

                      if (!passwordRegex.hasMatch(value)) {
                        return "Must contain:\n"
                            "uppercase,\n"
                            "lowercase and\n"
                            "8 characters";
                      }

                      return null;
                    },
                  ),

                  SizedBox(height: 20),

                  // PHONE FIELD
                  TextFormField(
                    style: TextStyle(color: Colors.white),
                    controller: phoneController,

                    keyboardType: TextInputType.phone,

                    decoration: InputDecoration(
                      labelText: "Phone Number",
                      labelStyle: TextStyle(color: Colors.white),

                      border: OutlineInputBorder(),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(13),

                        borderSide: BorderSide(color: Colors.white, width: 0.8),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),

                        borderSide: BorderSide(color: Colors.white, width: 0.8),
                      ),

                      prefixIcon: Icon(Icons.phone),
                    ),

                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Enter phone number";
                      }

                      if (value.length != 10) {
                        return "Phone number must be 10 digits";
                      }

                      return null;
                    },
                  ),

                  SizedBox(height: 30),

                  SizedBox(
                    width: double.infinity,

                    child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          print("Email : ${emailController.text}");

                          print("Password : ${passwordController.text}");

                          print("Phone : ${phoneController.text}");
                        }
                      },

                      child: Text("Submit"),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

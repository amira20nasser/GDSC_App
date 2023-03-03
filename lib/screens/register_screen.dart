import 'package:flutter/material.dart';
import 'package:gdsc_app/screens/login_screen.dart';

import '../components/clipper.dart';
import 'animated.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<Register> {
  bool _passwordVisible = false;
  final formKey = GlobalKey<FormState>();
  var email = TextEditingController();
  var pass = TextEditingController();
  var phone = TextEditingController();
  var confirmPass = TextEditingController();
  var name = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            children: [
              ClipPath(
                clipper: MyClipper(),
                child: Container(
                  height: size.height / 3,
                  color: const Color.fromARGB(255, 20, 86, 241),
                  child: const Center(
                    child: Text(
                      'Login',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 8,
                  right: 8,
                  bottom: 8,
                ),
                child: TextFormField(
                  controller: name,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'please enter this';
                    }
                    return null;
                  },
                  obscureText: false,
                  cursorColor: const Color.fromARGB(255, 20, 86, 241),
                  keyboardType: TextInputType.name,
                  style: const TextStyle(
                    color: Color.fromARGB(255, 20, 86, 241),
                    fontSize: 18,
                  ),
                  decoration: InputDecoration(
                    filled: true,
                    labelStyle: const TextStyle(
                      //decorate labelText
                      color: Color.fromARGB(255, 20, 86, 241),
                    ),
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                      borderSide: BorderSide.none,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                          color: Color.fromARGB(255, 20, 86, 241)),
                    ),
                    prefixIcon: const Icon(
                      Icons.perm_identity_outlined,
                      color: Color.fromARGB(255, 20, 86, 241),
                    ),
                    labelText: 'Full Name',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: email,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'please enter this';
                    } else if (email.text.contains('@') == false ||
                        email.text.contains('.') == false) {
                      return 'please enter valid email';
                    }
                    return null;
                  },
                  keyboardType: TextInputType.emailAddress,
                  cursorColor: const Color.fromARGB(255, 20, 86, 241),
                  style: const TextStyle(
                    //fieldINPUT
                    color: Color.fromARGB(255, 20, 86, 241),
                    fontSize: 18,
                  ),
                  decoration: InputDecoration(
                    filled: true,
                    labelText: 'E-mail',
                    labelStyle: const TextStyle(
                      //labeltext
                      color: Color.fromARGB(255, 20, 86, 241),
                    ),
                    prefixIcon: const Icon(
                      Icons.email,
                      color: Color.fromARGB(255, 20, 86, 241),
                    ),
                    border: UnderlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Color.fromARGB(255, 20, 86, 241),
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: pass,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'please enter this';
                    }
                    return null;
                  },
                  cursorColor: const Color.fromARGB(255, 20, 86, 241),
                  obscureText: !_passwordVisible,
                  style: const TextStyle(
                    //inutfield
                    color: Color.fromARGB(255, 20, 86, 241),
                    fontSize: 18,
                  ),
                  decoration: InputDecoration(
                    filled: true,
                    labelText: 'Password',
                    labelStyle: const TextStyle(
                      color: Color.fromARGB(255, 20, 86, 241),
                    ),
                    prefixIcon: const Icon(
                      Icons.lock,
                      color: Color.fromARGB(255, 20, 86, 241),
                    ),
                    border: UnderlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Color.fromARGB(255, 20, 86, 241),
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _passwordVisible
                            ? Icons.visibility
                            : Icons.visibility_off,
                        color: Colors.grey,
                      ),
                      onPressed: () {
                        setState(() {
                          _passwordVisible = !_passwordVisible;
                        });
                      },
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: confirmPass,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'please enter this';
                    }
                    return null;
                  },
                  cursorColor: const Color.fromARGB(255, 20, 86, 241),
                  obscureText: !_passwordVisible,
                  style: const TextStyle(
                    //inutfield
                    color: Color.fromARGB(255, 20, 86, 241),
                    fontSize: 18,
                  ),
                  decoration: InputDecoration(
                    filled: true,
                    labelText: 'Comfirm password',
                    labelStyle: const TextStyle(
                      color: Color.fromARGB(255, 20, 86, 241),
                    ),
                    prefixIcon: const Icon(
                      Icons.lock,
                      color: Color.fromARGB(255, 20, 86, 241),
                    ),
                    border: UnderlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Color.fromARGB(255, 20, 86, 241),
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _passwordVisible
                            ? Icons.visibility
                            : Icons.visibility_off,
                        color: Colors.grey,
                      ),
                      onPressed: () {
                        setState(() {
                          _passwordVisible = !_passwordVisible;
                        });
                      },
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: phone,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'please enter this';
                    }
                    return null;
                  },
                  cursorColor: const Color.fromARGB(255, 20, 86, 241),
                  keyboardType: TextInputType.number,
                  style: const TextStyle(
                    //fieldINPUT
                    color: Color.fromARGB(255, 20, 86, 241),
                    fontSize: 18,
                  ),
                  decoration: InputDecoration(
                    filled: true,
                    labelText: 'Phone',
                    labelStyle: const TextStyle(
                      //labeltext
                      color: Color.fromARGB(255, 20, 86, 241),
                    ),
                    prefixIcon: const Icon(
                      Icons.phone,
                      color: Color.fromARGB(255, 20, 86, 241),
                    ),
                    border: UnderlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Color.fromARGB(255, 20, 86, 241),
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    fixedSize: const Size(300, 50),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    backgroundColor: const Color.fromARGB(255, 20, 86, 241),
                  ),
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (BuildContext context) {
                          return const Animation_Task();
                        }),
                      );
                    }
                  },
                  child: const Text(
                    "Register",
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    fixedSize: const Size(300, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                      side: const BorderSide(
                        color: Color.fromARGB(255, 20, 86, 241),
                      ),
                    ),
                    backgroundColor: Colors.white,
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (BuildContext context) {
                        return const Login();
                      }),
                    );
                  },
                  child: const Text(
                    "Login",
                    style: TextStyle(
                      color: Color.fromARGB(255, 20, 86, 241),
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

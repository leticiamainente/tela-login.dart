import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login e registro Conta Comigo',
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  HomePageState createState() {
    return HomePageState();
  }
}

class HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  bool isLogin = true;
  late Animation<double> loginSize;
  late AnimationController loginController;
  late AnimatedOpacity opacityAnimation;
  Duration animationDuration = Duration(milliseconds: 270);

  @override
  void initState() {
    super.initState();

    SystemChrome.setEnabledSystemUIOverlays([]);

    loginController =
        AnimationController(vsync: this, duration: animationDuration);

    opacityAnimation =
        AnimatedOpacity(opacity: 0.0, duration: animationDuration);
  }

  @override
  void dispose() {
    loginController.dispose();
    super.dispose();
  }

  Widget _buildLoginWidgets() {
    return Container(
        padding: EdgeInsets.only(bottom: 20, top: 16),
        width: MediaQuery.of(context).size.width,
        height: loginSize.value,
        decoration: BoxDecoration(
            color: Colors.lightBlueAccent,
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(170),
                bottomRight: Radius.circular(170))),
        child: Align(
          alignment: Alignment.bottomCenter,
          child: AnimatedOpacity(
            opacity: loginController.value,
            duration: animationDuration,
            child: GestureDetector(
              onTap: isLogin
                  ? null
                  : () {
                      loginController.reverse();

                      setState(() {
                        isLogin = !isLogin;
                      });
                    },
              child: Container(
                child: Text(
                  'Entre'.toUpperCase(),
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.blueGrey.shade100,
                  ),
                ),
              ),
            ),
          ),
        ));
  }

  Widget _buildLoginComponents() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Visibility(
          visible: isLogin,
          child: Padding(
            padding: const EdgeInsets.only(left: 42, right: 42),
            child: Column(
              children: <Widget>[
                TextField(
                  style: TextStyle(color: Colors.white, height: 0.5),
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.email),
                      hintText: 'Email',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(32)))),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16),
                  child: TextField(
                    style: TextStyle(color: Colors.white, height: 0.5),
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.vpn_key),
                        hintText: 'Senha',
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(32)))),
                  ),
                ),
                Container(
                  width: 200,
                  height: 40,
                  margin: EdgeInsets.only(top: 32),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(50))),
                  child: Center(
                    child: Text(
                      'Entre',
                      style: TextStyle(
                          color: Colors.lightBlueAccent,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildRegistercomponents() {
    return Padding(
      padding: EdgeInsets.only(left: 42, right: 42, top: 32, bottom: 32),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(bottom: 32),
            child: Text(
              'Registre-se'.toUpperCase(),
              style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.lightBlueAccent),
            ),
          ),
          TextField(
            style: TextStyle(color: Colors.black, height: 0.5),
            decoration: InputDecoration(
                prefixIcon: Icon(Icons.account_circle),
                hintText: 'Nome',
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(32)))),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 9, top: 9),
            child: TextField(
              style: TextStyle(color: Colors.black, height: 0.5),
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.email),
                  hintText: 'Email',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(32)))),
              keyboardType: TextInputType.emailAddress,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 9, top: 9),
            child: TextField(
              style: TextStyle(color: Colors.black, height: 0.5),
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.add_ic_call_rounded),
                  hintText: 'Telefone',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(32)))),
              keyboardType: TextInputType.phone,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 9, top: 9),
            child: TextField(
              style: TextStyle(color: Colors.black, height: 0.5),
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.calendar_today),
                  hintText: 'Data De Nascimento',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(32)))),
              keyboardType: TextInputType.datetime,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 9, top: 9),
            child: TextField(
              style: TextStyle(color: Colors.black, height: 0.5),
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.vpn_key_outlined),
                  hintText: 'CPF',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(32)))),
              keyboardType: TextInputType.number,
            ),
          ),
          TextField(
            style: TextStyle(color: Colors.black, height: 0.5),
            decoration: InputDecoration(
                prefixIcon: Icon(Icons.vpn_key),
                hintText: 'Senha',
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(32)))),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Container(
              width: 100,
              height: 40,
              margin: EdgeInsets.only(top: 10),
              decoration: BoxDecoration(
                  color: Colors.lightBlueAccent,
                  borderRadius: BorderRadius.all(Radius.circular(25))),
              child: Center(
                child: Text(
                  'Registre-se',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double _defaultLoginSize = MediaQuery.of(context).size.height / 1.6;

    loginSize = Tween<double>(begin: _defaultLoginSize, end: 200).animate(
        CurvedAnimation(parent: loginController, curve: Curves.linear));

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: <Widget>[
          Align(
            alignment: Alignment.bottomCenter,
            child: AnimatedOpacity(
              opacity: isLogin ? 0.0 : 1.0,
              duration: animationDuration,
              child: Container(child: _buildRegistercomponents()),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              color: isLogin && !loginController.isAnimating
                  ? Colors.white
                  : Colors.transparent,
              width: MediaQuery.of(context).size.width,
              height: _defaultLoginSize / 1.5,
              child: Visibility(
                visible: isLogin,
                child: GestureDetector(
                  onTap: () {
                    loginController.forward();
                    setState(() {
                      isLogin = !isLogin;
                    });
                  },
                  child: Center(
                    child: Text(
                      'registre-se'.toUpperCase(),
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Colors.lightBlueAccent,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          AnimatedBuilder(
            animation: loginController,
            builder: (context, child) {
              return _buildLoginWidgets();
            },
          ),
          Align(
              alignment: Alignment.topCenter,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 2,
                child: Center(child: _buildLoginComponents()),
              ))
        ],
      ),
    );
  }
}

// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:mailapp/model/backend.dart';
import 'package:mailapp/model/email.dart';
import 'package:mailapp/widgets/EmailWidget.dart';

import 'DetailScreen.dart';


class ListScreen extends StatelessWidget {
  const ListScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.lightGreen,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Home'),
        ),
        body: //const Listado(),
        Column(
          children: const <Widget>[
            Text(
              'Caroline Lucas. Septimo "A" ',
              style:TextStyle(
                  color: Colors.black,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w600,
                  fontSize: 14.0
              ),
            ),
            Expanded(
              child: Listado(),
            )
          ],
        ),
      ),
    );
  }
}

class Listado extends StatefulWidget{
  const Listado({super.key});
  @override
  Listado1 createState() => Listado1();

}

class Listado1 extends State<Listado> {
  var emails = Backend().getEmails();
  /*void doSomething(Email id) {
    // ignore: avoid_print
    Backend().markEmailAsRead;
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: /*Container(
        alignment: Alignment.bottomLeft,
        color: Colors.cyan,
        child:*/
      ListView(
          padding: const EdgeInsets.all(8),
          children: Backend().getEmails()
              .map((emails) => EmailWidget(emails:emails, onLongPress: doSomething ))
              .toList(),
      ),
    );
  }*/
  void MailLeido(int id) {
    Backend().markEmailAsRead(id);
    setState(() {
      emails = Backend().getEmails();
      },
    );
  }
  void borrarEmail(int id) {
    Backend().deleteEmail(id);
    setState(() {
      emails = Backend().getEmails();
      },
    );
  }

  void DetallesMail(Email email) {
    Navigator.push(
      context, MaterialPageRoute(builder: (context) {
        return DetailScreen(emails:email,);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        color: Colors.white,
        child: CustomScrollView(
          scrollDirection: Axis.vertical,
          shrinkWrap: false,
          slivers: <Widget>[
            SliverPadding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              sliver: SliverList(
                delegate: SliverChildBuilderDelegate(
                      (context, index) => EmailWidget(
                        email: emails[index],
                        onLongPress: MailLeido,
                        onSwipe: borrarEmail,
                        onTap: DetallesMail,
                      ),
                  childCount: emails.length,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
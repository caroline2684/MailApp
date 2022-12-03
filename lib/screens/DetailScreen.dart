import 'package:flutter/material.dart';
import 'package:mailapp/model/email.dart';

/*class DetailScreen extends StatelessWidget {
  final Email emails;
  const DetailScreen(
      {Key? key,
        required this.emails,
      })
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text(emails.subject),
        ),
          body: Column(
            children: const <Widget>[
              Expanded(
                child: EmailRead(email1: email,),
              ),
            ],
          ),
      ),
    );
  }
}

class EmailRead extends StatefulWidget{
  final Email email;
  const EmailRead({Key? key, required this.email,}) : super(key: key);
  @override
  State<EmailRead> createState() => _EmailRead();
}

class _EmailRead extends State<EmailRead>{
  late final Email email;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('From: ${email.from}',
                style: const TextStyle(
                  color: Color(0xff263238),
                  fontSize: 15.0,
                  fontWeight: FontWeight.w500,
                )),
            const SizedBox(height: 10.0),
            const SizedBox(height: 10.0),
            Text(email.subject,
                style: const TextStyle(
                  color: Color.fromARGB(255, 163, 163, 163),
                  fontSize: 15.0,
                  fontWeight: FontWeight.w400,
                )),
            const SizedBox(height: 5.0),
            Text(email.dateTime.toString().substring(0, 16),
                style: const TextStyle(
                  color: Color.fromARGB(255, 163, 163, 163),
                  fontSize: 14.0,
                  fontWeight: FontWeight.w400,
                )),
            const SizedBox(height: 10.0),
            const Divider(color: Color(0xff000000)),
            const SizedBox(height: 10.0),
            Text(email.body,
                style: const TextStyle(
                  fontSize: 15.0,
                )),
          ],
        ),
      ),
    );
  }
  
}*/
class DetailScreen extends StatelessWidget {
  final Email emails;

  const DetailScreen(
      {Key? key,
        required this.emails
      })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(emails.subject),
        ),
        body: Container(
          padding: const EdgeInsets.fromLTRB(10.0, 30.0,10.0, 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                margin: const EdgeInsets.only( bottom: 10),
                child:Text('From: ${emails.from}',
                  style: const TextStyle(
                    fontFamily: 'Poppins',
                    color: Colors.black87,
                    fontSize: 16.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              const Divider(
                  color: Colors.lightGreenAccent,
              ),
              Container(
                margin: const EdgeInsets.only(top: 10,bottom: 10),
                child:Text(
                  emails.subject,
                  style: const TextStyle(
                    fontFamily: 'Poppins',
                    color: Colors.black54,
                    fontSize: 14.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 10),
                child:Text(
                  emails.dateTime.toString(),
                  style: const TextStyle(
                    fontFamily: 'Poppins',
                    color: Colors.grey,
                    fontSize: 14.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              const Divider(
                color: Colors.lightGreenAccent,
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 10),
                child:Text(
                  emails.body,
                  style: const TextStyle(
                    fontFamily: 'Poppins',
                    color: Colors.black,
                    fontSize: 14.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ),
    );
  }
}
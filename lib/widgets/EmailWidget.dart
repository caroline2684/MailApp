import 'package:flutter/material.dart';
import 'package:mailapp/model/email.dart';




class EmailWidget extends StatelessWidget {

  final Email email;
  final Function onLongPress;
  final Function onSwipe;
  final Function onTap;

  const EmailWidget(
      {Key? key,
        required this.email,
        required this.onLongPress,
        required this.onSwipe,
        required this.onTap,
      })
      : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    /*return GestureDetector(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text(
              emails.dateTime.toString(),
              textAlign: TextAlign.left,
              style:const TextStyle(
                color: Colors.black87,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w600,
                fontSize: 14.0,
              ),
            ),
            Text(emails.from),
            Text(emails.subject),
          ],
        ),
      ),
    );*/

    final mailThumbnail = Container(
      margin: const EdgeInsets.symmetric(
          vertical: 1,
      ),
      alignment: FractionalOffset.centerLeft,
    );

    const baseTextStyle = TextStyle(
        fontFamily: 'Poppins'
    );
    final regularTextStyle = baseTextStyle.copyWith(
        color: const Color(0xff000000),
        fontSize: 14.0,
        fontWeight: FontWeight.w400
    );
    final subHeaderTextStyle = regularTextStyle.copyWith(
        color: const Color(0xff000000),
        fontSize: 14.0,
        fontWeight: FontWeight.w600
    );
    final headerTextStyle = baseTextStyle.copyWith(
        color: Colors.grey,
        fontSize: 14.0,
        fontWeight: FontWeight.w600
    );

    Widget emailValue({required String value}) {
      return Row(
          children: <Widget>[
            Container(width: 4.0),
            Text(email.subject, style: regularTextStyle),
          ]

      );
    }

    final booksCardContent = Container(
      margin: const EdgeInsets.fromLTRB(40.0, 16.0, 0, 0),
      constraints: const BoxConstraints.expand(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(height: 4.0),
          Text(email.dateTime.toString(), style: headerTextStyle),
          Container(height: 4.0),
          Text(email.from, style: subHeaderTextStyle),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 6.0),
            height: 0,
            width: 16.0,
          ),
          Row(
            children: <Widget>[
              Expanded(
                  child: emailValue(
                      value: email.subject,
                  ),
              ),
            ],
          ),
        ],
      ),
    );

    final mailCard = Container(
      height: 130.0,
      margin: const EdgeInsets.only(left: 0),
      decoration: BoxDecoration(
        color: const Color(0xFFFFFEFE),
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(5.0),
        boxShadow: const <BoxShadow>[
          BoxShadow(
            color: Colors.black12,
            blurRadius: 1.0,
            offset: Offset(0.0, 5.0),
          ),
        ],
      ),
      child: booksCardContent,
    );

    return GestureDetector(
      onLongPress: (){
        onLongPress(email.id);
      },
      onHorizontalDragEnd: (DragEndDetails details) {
        onSwipe(email.id);
      },
      onTap: (){
        onTap(email);
      },
      child: Container(
        height: 125,
        margin: const EdgeInsets.symmetric(
          vertical: 10.0,
          horizontal: 16.0,
        ),
        child: Stack(
          children: <Widget>[
            mailCard,
            mailThumbnail,
          ],
        ),
      ),
    );
    /*return Container(
        height: 100,
        margin: const EdgeInsets.symmetric(
          vertical: 10.0,
          horizontal: 16.0,
        ),
        child: Stack(
          children: <Widget>[
            booksCard,
            booksThumbnail,
          ],
        )
    );*/
  }
}
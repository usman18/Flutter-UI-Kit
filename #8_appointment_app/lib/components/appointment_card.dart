import 'package:flutter/material.dart';
import 'package:appointment_app/constants.dart';

class AppointmentCard extends StatelessWidget {

  final double padding;
  final bool isActive;
  final String name;
  final String dateTime;

  const AppointmentCard({Key key, this.padding, this.isActive = false, this.name, this.dateTime}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(16))),
        margin: EdgeInsets.symmetric(horizontal: padding),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: <Widget>[
              Stack(
                children: <Widget>[
                  CircleAvatar(
                    radius: 25,
                    backgroundColor: kBlueColor,
                    foregroundColor: Colors.white,
                    child: Text(name.substring(0, 2).toUpperCase(),
                    ),
                  ),

                  Positioned(
                    bottom: 0,
                    right: 2,
                    child: Container(
                      padding: EdgeInsets.all(2),
                      child: CircleAvatar(
                        radius: 6,
                        backgroundColor: isActive ? Colors.green[700] : Colors.transparent,
                      ),
                    ),
                  )
                ],
              ),

              SizedBox(width: 16,),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(name,
                      style: TextStyle(
                        fontSize: 16,
                        color: kIndigoDark,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 4,),
                    Text(dateTime,
                      style: TextStyle(
                        color: kIndigoLight,
                      ),
                    ),
                  ],
                ),
              ),

              Icon(Icons.more_vert,
                color: kIndigoDark,
              ),
            ],
          ),
        ),
      ),
    );
  }
}


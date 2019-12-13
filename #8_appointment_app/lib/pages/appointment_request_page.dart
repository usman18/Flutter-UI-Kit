import 'package:appointment_app/constants.dart';
import 'package:flutter/material.dart';

class AppointmentRequestPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        alignment: Alignment.topLeft,
        children: <Widget>[
          _buildBackground(context),
          Positioned(
            child: _buildContentUI(),
            top: MediaQuery.of(context).size.height * 0.27,
            left: 40,
          ),
        ],
      ),
    );
  }

  Widget _buildBackground(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(bottomRight: Radius.circular(112)),
            color: kBlueColor,
          ),
          height: MediaQuery.of(context).size.height * 0.35,
          child: Center(
            child: Text(
              "12 Jan 2020, \n8am - 10 am",
              style: TextStyle(
                color: Colors.white,
                fontSize: 35,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
        Expanded(
          child: ListView(
            physics: BouncingScrollPhysics(),
            children: <Widget>[
              Container(
                margin: EdgeInsets.symmetric(horizontal: 40, vertical: 24),
                color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      height: 24,
                    ),
                    Text(
                      "Louis",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 46,
                        color: kIndigoDark,
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      "Patterson",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 46,
                        color: kIndigoDark,
                      ),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Text(
                      "Comment",
                      style: TextStyle(
                        color: kIndigoLight,
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                      ),
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Text(
                      "Hello Dr. Peterson, I am going to bring my complete blood count analysis with me",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    _buildDocumentAttachmentWidget(),
                  ],
                ),
              ),
            ],
          ),
        )
      ],
    );
  }

  Widget _buildContentUI() {
    return Row(
      children: <Widget>[
        Hero(
          tag: 1,
          child: Container(
            padding: EdgeInsets.all(6),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(16))
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(16)),
              child: Image.network(
                "https://www.thefamouspeople.com/profiles/images/edward-snowden-5.jpg",
                height: 100,
                width: 100,
                fit: BoxFit.fill,
              ),
            ),
          ),
        ),
        SizedBox(
          width: 16,
        ),
        Container(
          padding: EdgeInsets.all(6),
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
          ),
          child: CircleAvatar(
            radius: 35,
            child: Icon(Icons.call),
            foregroundColor: Colors.white,
            backgroundColor: kBlueLight,
          ),
        ),
      ],
    );
  }



  Widget _buildDocumentAttachmentWidget() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 12),
      height: 70,
      color: Color(0xffE7F8FA),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            width: 3,
            color: kBlueLight,
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Transform.rotate(
              angle: 3.14 / 180 * 45,
              child: Icon(
                Icons.attach_file,
                color: kBlueLight,
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "Complete blood count",
                style: TextStyle(
                  fontSize: 18,
                  color: kIndigoDark,
                ),
              ),
              SizedBox(
                height: 6,
              ),
              Text(
                "05 Mar 2020",
                style: TextStyle(
                  fontSize: 16,
                  color: kIndigoLight,
                  fontWeight: FontWeight.w600,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:payments_app_ui/widgets/round_button.dart';
import 'package:payments_app_ui/widgets/round_corner_button.dart';
import 'package:payments_app_ui/widgets/round_corner_image.dart';

import '../constants.dart';
import '../recipients_provider.dart';

class PaymentsScreen extends StatefulWidget {
  @override
  _PaymentsScreenState createState() => _PaymentsScreenState();
}

class _PaymentsScreenState extends State<PaymentsScreen> {
  int amount = 10;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Send Money",
        ),
        elevation: 0,
        centerTitle: true,
      ),
      backgroundColor: kPrimaryColor,
      body: _buildBody(),
      bottomNavigationBar: _buildButtonsSection(),
    );
  }

  Widget _buildBody() {
    return Container(
      margin: EdgeInsets.only(top: 56),
      height: double.maxFinite,
      width: double.maxFinite,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(48),
          topLeft: Radius.circular(48),
        ),
        color: Colors.white,
      ),
      child: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 32,
              vertical: 32,
            ),
            child: Text(
              "How much would you like to send",
              textAlign: TextAlign.center,
              style: kTextStyle.copyWith(color: Colors.grey.shade700),
            ),
          ),
          Divider(),
          _buildAmountSection(),
          _buildRecepientsSection(),
        ],
      ),
    );
  }

  Widget _buildAmountSection() {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              RoundButton(
                onTap: () {
                  setState(() {
                    amount--;
                  });
                },
                icon: Icons.remove,
              ),
              Text(
                "\$ $amount",
                style: TextStyle(
                  color: kPrimaryColor,
                  fontSize: 42,
                ),
              ),
              RoundButton(
                onTap: () {
                  setState(() {
                    amount++;
                  });
                },
                icon: Icons.add,
              ),
            ],
          ),
          Slider(
            value: amount.toDouble(),
            onChanged: (newValue) {
              setState(() {
                amount = newValue.toInt();
              });
            },
            min: 10,
            max: 2000,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 18),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: kAmounts.map((amount) {
                return RoundCornerButton(
                  text: amount,
                  onTap: () {
                    setState(() {
                      this.amount = int.parse(amount);
                    });
                  },
                );
              }).toList(),
            ),
          ),
          Divider(),
        ],
      ),
    );
  }

  Widget _buildRecepientsSection() {
    return Container(
      color: kBackgroundWhiteColor,
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 16,
            ),
            child: Text("Choose a recepient",
              style: TextStyle(
                fontWeight: FontWeight.w600,
                color: Colors.grey.shade600
              ),
            ),
          ),
          CarouselSlider(
            enableInfiniteScroll: true,
            items: RecipientsProvider.recipients.map((recipient) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  RoundCornerImage(
                    imageUrl: recipient.imageUrl,
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Text(
                    recipient.name,
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              );
            }).toList(),
            initialPage: 0,
            height: 150,
            viewportFraction: 0.3,
            enlargeCenterPage: true,
            scrollDirection: Axis.horizontal,
          )
        ],
      ),
    );
  }

  Widget _buildButtonsSection() {
    return Container(
      color: kBackgroundWhiteColor,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: <Widget>[
            Expanded(
              child: RaisedButton(onPressed: () {},
                color: Colors.grey.shade300,
                textColor: Colors.grey.shade600,
                child: Text("Cancel",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(8,))),
              ),
            ),
            SizedBox(
              width: 16,
            ),
            Expanded(
              child: RaisedButton(onPressed: () {},
                color: kPrimaryColor,
                textColor: Colors.white,
                child: Text("Send",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(8,))),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

Widget buildPatientItem(
    String patientName, int patientAge, int bedNumber, int wardNumber) {
  return Container(
      height: 98,
      width: 236,
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: Colors.black,
          width: 0.5,
        ),
        color: Color(0xFFC7E9F4),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            patientName,
            style: TextStyle(
              fontFamily: 'Raleway',
              fontWeight: FontWeight.bold,
              fontSize: 17,
            ),
          ),
          Text(
            '$patientAge Years Old',
            style: TextStyle(
              fontFamily: 'Raleway',
              fontSize: 12,
              color: Color(0xFF0A8ED9),
            ),
          ),
          SizedBox(
            height: 20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset("icon/bed.png"),
                SizedBox(width: 5),
                Text(bedNumber.toString()),
                SizedBox(width: 10),
                Image.asset("icon/ward.png"),
                SizedBox(width: 5),
                Text(wardNumber.toString())
              ],
            ),
          ),
        ],
      ));
}

Widget buildStatusItem(String patientName) {
  return Container(
      height: 50,
      width: 236,
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            color: Colors.black,
            width: 0.5,
          ),
        ),
        color: Colors.transparent,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            patientName,
            style: TextStyle(
                fontFamily: 'Raleway',
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color(0XFF5D5656)),
          ),
          Icon(
            Icons.wheelchair_pickup,
            color: Colors.green,
          ),
        ],
      ));
}

Widget buildLocationItem(String patientName, int wardNumber, int bedNumber) {
  return Container(
      height: 50,
      width: 236,
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            color: Colors.black,
            width: 0.5,
          ),
        ),
        color: Colors.transparent,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            patientName,
            style: TextStyle(
                fontFamily: 'Raleway',
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color(0XFF5D5656)),
          ),
          Text(
            "Ward Number: $wardNumber, Bed Number: $bedNumber",
            style: TextStyle(
                fontFamily: 'Raleway',
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: Color(0XFF5D5656)),
          )
        ],
      ));
}

import 'package:flutter/material.dart';

enum Filter { AllPatients, Status, Location }

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  Filter selectedFilter = Filter.AllPatients;
  final patientName = "Siti Kassim";
  final patientAge = 75;
  final bedNumber = 123;
  final wardNumber = 456;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(378, 57),
        child: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(
                'icon/logo.png',
                height: 42,
                width: 42,
              ),
              Text(
                "OnPatient",
                style: TextStyle(
                  fontFamily: 'Sansita One',
                  fontSize: 26,
                  color: Color(0xFF91E2DB),
                ),
              ),
              Image.asset(
                'icon/noti_icon.png',
                height: 25,
                width: 25,
              ),
            ],
          ),
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                buildFilterItem(Filter.AllPatients),
                buildFilterItem(Filter.Status),
                buildFilterItem(Filter.Location),
              ],
            ),
          ),
          Expanded(
            child: Center(
              child: getContentForFilter(selectedFilter),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildFilterItem(Filter filter) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedFilter = filter;
        });
      },
      child: Container(
        decoration: BoxDecoration(
          color:
              selectedFilter == filter ? Color(0XFF0A8ED9) : Color(0XFFEFEFE),
          borderRadius: BorderRadius.circular(10),
        ),
        padding: EdgeInsets.symmetric(vertical: 16, horizontal: 20),
        child: Center(
          child: Text(
            filter.toString().split('.').last,
            style: TextStyle(
              color:
                  selectedFilter == filter ? Colors.white : Color(0XFF858585),
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  Widget getContentForFilter(Filter filter) {
    switch (filter) {
      case Filter.AllPatients:
        return ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index) {
            return buildPatientItem();
          },
        );
      case Filter.Status:
        return ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index) {
            return buildStatusItem();
          },
        );
      case Filter.Location:
        return ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index) {
            return buildLocationItem();
          },
        );
      default:
        return Container();
    }
  }

  Widget buildPatientItem() {
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
      ),
    );
  }

  Widget buildStatusItem() {
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
      ),
    );
  }

  Widget buildLocationItem() {
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
      ),
    );
  }
}

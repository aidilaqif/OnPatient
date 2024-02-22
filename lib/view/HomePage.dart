import 'package:flutter/material.dart';
import 'package:stroke_text/stroke_text.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String selectedFilter = 'All Patients'; // Default selected filter

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
              StrokeText(
                text: "OnPatient",
                textStyle: TextStyle(
                  fontFamily: 'Sansita One',
                  fontSize: 26,
                  color: Color(0xFF91E2DB),
                ),
                strokeColor: Color(0xFF475C5B),
                strokeWidth: 3,
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
                buildFilterItem('All Patients'),
                buildFilterItem('Status'),
                buildFilterItem('Location'),
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

  Widget buildFilterItem(String filter) {
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
            filter,
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

  Widget getContentForFilter(String filter) {
    switch (filter) {
      case 'All Patients':
        return ListView.builder(
          itemCount: 10, // Replace with the actual number of patients
          itemBuilder: (context, index) {
            return buildPatientItem();
          },
        );
      case 'Status':
        return Text('Content for Status');
      case 'Location':
        return Text('Content for Location');
      default:
        return Container();
    }
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
        children: [Text("Siti Kassim"), Text("75 Years Old")],
      ));
}

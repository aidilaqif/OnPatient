import 'package:flutter/material.dart';
import 'package:stroke_text/stroke_text.dart';
import 'package:onpatience/widget/BuildPatientItem.dart';
import 'package:onpatience/widget/FilterItem.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String selectedFilter = 'All Patients'; // Default selected filter
  String patientName = "Siti Kassim"; // Example patient name
  int patientAge = 75; // Example patient age
  int bedNumber = 123; // Example bed number
  int wardNumber = 456; // Example ward number

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
                buildFilterItem('All Patients', selectedFilter, (filter) {
                  setState(() {
                    selectedFilter = filter;
                  });
                }),
                buildFilterItem('Status', selectedFilter, (filter) {
                  setState(() {
                    selectedFilter = filter;
                  });
                }),
                buildFilterItem('Location', selectedFilter, (filter) {
                  setState(() {
                    selectedFilter = filter;
                  });
                }),
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

  Widget getContentForFilter(String filter) {
    switch (filter) {
      case 'All Patients':
        return ListView.builder(
          itemCount: 10, // Replace with the actual number of patients
          itemBuilder: (context, index) {
            return buildPatientItem(
                patientName, patientAge, bedNumber, wardNumber);
          },
        );
      case 'Status':
        return ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index) {
            return buildStatusItem(patientName);
          },
        );

      case 'Location':
        return ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index) {
            return buildLocationItem(patientName, bedNumber, wardNumber);
          },
        );
      default:
        return Container();
    }
  }
}

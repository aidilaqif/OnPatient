import 'package:flutter/material.dart';

Widget buildFilterItem(
    String filter, String selectedFilter, Function(String) onTap) {
  return GestureDetector(
    onTap: () {
      onTap(filter);
    },
    child: Container(
      decoration: BoxDecoration(
        color: selectedFilter == filter ? Color(0XFF0A8ED9) : Color(0XFFEFEFE),
        borderRadius: BorderRadius.circular(10),
      ),
      padding: EdgeInsets.symmetric(vertical: 16, horizontal: 20),
      child: Center(
        child: Text(
          filter,
          style: TextStyle(
            color: selectedFilter == filter ? Colors.white : Color(0XFF858585),
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    ),
  );
}

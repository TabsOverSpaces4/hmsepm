import 'package:flutter/material.dart';
import 'package:hmsepm/Widgets/CustomInput.dart';
import 'package:hmsepm/Widgets/constants.dart';

class SearchTab extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
      children: [
        SizedBox(
          height: 45.0,
        ),
        Padding(
          padding: const EdgeInsets.only(
            top: 45.0,
          ),
          child: CustomInpt(
            hintText: "Search here..",
            onSubmitted: (value) {
              if (value.isNotEmpty) {}
            },
          ),
        ),
        SizedBox(
          height: 25.0,
        ),
        Text(
          "Search Results",
          style: Constants.regularHeading,
        ),
    
    ]
    )
    );
  }
}
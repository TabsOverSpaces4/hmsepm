import 'package:flutter/material.dart';
import 'package:hmsepm/Widgets/CustomInput.dart';

class SearchTab extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
          child: Container(
        child: Column(
          children: [
            Stack(
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
              
      
      ]
      ),
          ],
        )
      ),
    );
  }
}
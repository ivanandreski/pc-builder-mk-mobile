import 'package:flutter/material.dart';
import 'package:pc_builder_mk_mobile/utils/colors.dart';

class TitleDividerWidget extends StatelessWidget {
  final String title;
  const TitleDividerWidget({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              flex: 3, // 20%
              child: Column(
                children: [
                  Container(
                    height: 35,
                    margin: EdgeInsets.only(top: 10),
                    child: Text(title,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: CustomColors.customDarkBlue)),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 7, // 20%
              child: Column(
                children: [
                  Container(
                    height: 35,
                    margin: EdgeInsets.only(top: 4),
                    child: Divider(
                        color: CustomColors.customDarkBlue, thickness: 2),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

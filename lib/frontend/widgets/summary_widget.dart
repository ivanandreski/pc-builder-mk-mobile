import 'package:flutter/material.dart';
import 'package:pc_builder_mk_mobile/utils/colors.dart';
import 'package:pc_builder_mk_mobile/frontend/widgets/title_divider_widget.dart';

class SummaryWidget extends StatelessWidget {
  final double price;
  final bool compatible;

  const SummaryWidget({Key? key, required this.price, required this.compatible})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          child: Column(children: [
        Row(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              child: TitleDividerWidget(title: "Summary"),
              height: 50,
            )
          ],
        ),
        Padding(
            padding: const EdgeInsets.only(
              left: 35,
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    Text('Price: $price MKD',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ))
                  ],
                ),
                Row(
                  children: [
                    Text('Compatible: ',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        )),
                    Icon(
                      compatible ? Icons.check : Icons.close,
                      color: Colors.lightGreen,
                    )
                  ],
                ),
              ],
            ))
      ])),
    );
  }
}

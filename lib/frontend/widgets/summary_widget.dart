import 'package:flutter/material.dart';
import 'package:pc_builder_mk_mobile/frontend/widgets/title_divider_widget.dart';

class SummaryWidget extends StatelessWidget {
  final double price;
  final bool compatible;

  const SummaryWidget({Key? key, required this.price, required this.compatible})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Row(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 50,
            child: const TitleDividerWidget(title: "Summary"),
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
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ))
                ],
              ),
              Row(
                children: [
                  const Text('Compatible: ',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      )),
                  Icon(
                    compatible ? Icons.check : Icons.close,
                    color: compatible ? Colors.lightGreen : Colors.red,
                  )
                ],
              ),
            ],
          ))
    ]);
  }
}

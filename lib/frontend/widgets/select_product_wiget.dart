import 'package:flutter/material.dart';
import 'package:pc_builder_mk_mobile/domain/models/product.dart';
import 'package:pc_builder_mk_mobile/utils/constants.dart';

class SelectProductWidget extends StatelessWidget {
  final Product product;
  final Function onPressed;

  const SelectProductWidget({super.key, required this.product, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
        child: ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: Colors.white,
        minimumSize: const Size(88, 36),
      ),
      onPressed: () {
        onPressed(product);
      },
      child: Column(
        children: [
          Container(
              height: 150,
              child: Image.network(
                product.imageUrl,
              )),
          Flexible(
            child: Padding(
              padding: const EdgeInsets.only(
                top: 15,
              ),
              child: Container(
                // padding: new EdgeInsets.only(right: 13.0),
                child: Text(
                  product.name,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 12.0,
                    fontFamily: 'Roboto',
                    color: Color(0xFF212121),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          Flexible(
            child: Padding(
              padding: const EdgeInsets.only(
                top: 15,
              ),
              child: Container(
                // padding: new EdgeInsets.only(right: 13.0),
                child: Text(
                  '${product.price.toString()} MKD',
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 12.0,
                    fontFamily: 'Roboto',
                    color: Color(0xFF212121),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    ));
  }
}

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:fruitshop/data/data.dart';
import 'package:fruitshop/utils/colors.dart';
import 'package:fruitshop/utils/utils.dart';
import 'package:fruitshop/widgets/nutrient_widget.dart';

class DetailsScreen extends StatefulWidget {
  final Product product;

  const DetailsScreen({
    super.key,
    required this.product,
  });

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  int itemCount = 1;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: size.height * 0.50,
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.all(20.0),
            color: widget.product.color,
            child: Transform.rotate(
              angle: 2.10 * pi,
              child: Image.asset(widget.product.image),
            ),
          ),
          Positioned(
            top: 60,
            left: 20,
            right: 20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () => Navigator.of(context).pop(),
                  child: iconWidget(FontAwesomeIcons.arrowLeft, false),
                ),
                InkWell(
                  onTap: () {},
                  child: iconWidget(FontAwesomeIcons.bagShopping, true),
                ),
              ],
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.only(
              top: size.height * 0.50,
            ),
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(20.0),
              child: SizedBox(
                height: size.height * 0.80,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.product.name,
                              style: const TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 30,
                              ),
                            ),
                            const SizedBox(height: 10),
                            priceWidget(widget.product.price),
                          ],
                        ),
                        Container(
                          width: 130,
                          padding: const EdgeInsets.all(5.0),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(30.0),
                            boxShadow: boxShadow,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              quantityIcon(
                                onTap: () {
                                  if (itemCount > 1) {
                                    setState(() => itemCount--);
                                  }
                                },
                                color: kSecondaryColor,
                                icon: FontAwesomeIcons.minus,
                              ),
                              Text(
                                itemCount.toString(),
                                style: const TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              quantityIcon(
                                onTap: () {
                                  setState(() => itemCount++);
                                },
                                color: kPrimaryColor,
                                icon: FontAwesomeIcons.plus,
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    GridView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 1.6,
                      ),
                      shrinkWrap: true,
                      primary: false,
                      itemCount: 4,
                      itemBuilder: (context, index) {
                        return NutrientWidget(
                          product: data[0].products![index],
                          index: index,
                        );
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            "Detalhes",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            "Todos nossos itens são preparados e finalizados pensando especialmente em nossos clientes, dando assim um produto de excelente qualidade para o mesmo!",
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget quantityIcon({
    required VoidCallback onTap,
    required Color color,
    required IconData icon,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: color,
        ),
        child: Icon(
          icon,
          color: color == kPrimaryColor ? Colors.white : kPrimaryColor,
          size: 20,
        ),
      ),
    );
  }
}

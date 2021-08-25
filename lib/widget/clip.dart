import 'package:flutter/material.dart';
import 'package:popol_club/models/chip_list.dart';
import 'package:popol_club/style/color.dart';
import 'package:provider/provider.dart';

class Clipping extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final product = Provider.of<ChipProvider>(context);
    return Ink(
      height: 30,
      width: 80,
      child: InkWell(
          child: Container(
            height: 30,
            alignment: Alignment.center,
            padding:
                EdgeInsets.symmetric(horizontal: 10, vertical: product.height),
            decoration: BoxDecoration(
              boxShadow: <BoxShadow>[
                BoxShadow(
                    offset: product.isPrimaryCard ? Offset(0, 0) : Offset(0, 2),
                    blurRadius: product.isPrimaryCard ? 0 : 5,
                    color: product.isPrimaryCard
                        ? Colors.white.withOpacity(0.3)
                        : Color(0xFFFFE3E3))
              ],
              borderRadius: BorderRadius.all(Radius.circular(15)),
              color: product.isPrimaryCard
                  ? Colors.white.withOpacity(0.3)
                  : AppColors.pink400,
            ),
            child: Text(
              product.text,
              style: TextStyle(
                  color: product.isPrimaryCard ? Colors.black : Colors.white,
                  fontWeight: product.isPrimaryCard
                      ? FontWeight.normal
                      : FontWeight.bold,
                  fontSize: 12),
            ),
          ),
          onTap: () {
            product.toggleFavoriteStatus();
          }),
    );
  }
}

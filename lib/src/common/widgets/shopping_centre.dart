import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../constants/color_constants.dart';

class ShoppingCentre extends StatelessWidget {
  const ShoppingCentre({
    super.key,
    required this.image,
    required this.name,
    required this.description,
    required this.street,
  });
  final String image;
  final String name;
  final String description;
  final String street;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        color: AppColors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Image.asset(
            "assets/images/$image.png",
            height: 150,
            fit: BoxFit.fill,
          ),
          const SizedBox(height: 11),
          Row(
            children: [
              Expanded(
                child: Text(
                  name,
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ),
              CupertinoButton(
                minSize: 0,
                padding: const EdgeInsets.only(top: 10, right: 15),
                child: const Icon(
                  CupertinoIcons.heart_fill,
                  color: Colors.red,
                  size: 30,
                ),
                onPressed: () {},
              ),
            ],
          ),
          Text(
            description,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              color: AppColors.grey,
              fontWeight: FontWeight.w400,
              fontSize: 16,
            ),
          ),
          Text(
            street,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              color: AppColors.grey,
              fontWeight: FontWeight.w400,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}

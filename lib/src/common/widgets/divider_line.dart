import 'package:flutter/cupertino.dart';

class DividerLine extends StatelessWidget {
  const DividerLine({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 1,
      color: const Color(0xFFE0E6ED),
      margin: const EdgeInsets.symmetric(horizontal: 16),
    );
  }
}

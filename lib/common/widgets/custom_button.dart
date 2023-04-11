import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final void Function()? onTap;
  const CustomButton({Key? key, required this.title, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 43,
        width: 226,
        padding: const EdgeInsets.symmetric(horizontal: 8),
        decoration: BoxDecoration(
            color: const Color(0xffEA686D),
            borderRadius: BorderRadius.circular(5),
            boxShadow: const [
              BoxShadow(
                  offset: Offset(0.0, 4.0),
                  blurRadius: 15,
                  color: Color(0xffEA686D))
            ]),
        alignment: Alignment.center,
        child: Row(
          children: [
            const Spacer(),
            Text(
              title,
              style: const TextStyle(
                  color: Colors.white,
                  // fontFamily: "Nunito",
                  fontSize: 18,
                  fontWeight: FontWeight.w600),
            ),
            const Spacer(),
            const Icon(
              CupertinoIcons.forward,
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class FilterIndexButton extends StatefulWidget {
  const FilterIndexButton({
    Key? key,
  }) : super(key: key);

  @override
  State<FilterIndexButton> createState() => _FilterTypeButtonState();
}

class _FilterTypeButtonState extends State<FilterIndexButton> {
  _showModalBottomSheetTypes(BuildContext context) {
    return showModalBottomSheet(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      context: context,
      builder: (context) {
        return const Column(
          mainAxisSize: MainAxisSize.min,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _showModalBottomSheetTypes(context),
      child: Container(
        width: 180,
        margin: const EdgeInsets.only(top: 20),
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(20),
        ),
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Min. id',
              style: TextStyle(color: Colors.white),
            ),
            Icon(
              Icons.arrow_drop_down,
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}

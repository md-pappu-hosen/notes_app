import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final VoidCallback? onTab; // <-- এখানে ঠিক করো
  final bool isBorderType;

  const CustomButton({
    super.key,
    required this.title,
    this.onTab,
    this.isBorderType = false,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTab,
      child: Container(
        width: double.infinity,
        height: 50,
        margin: const EdgeInsets.all(12),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: isBorderType ? Colors.white : Colors.blue,
            foregroundColor: isBorderType ? Colors.blue : Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
              side: isBorderType
                  ? const BorderSide(color: Colors.blue, width: 2)
                  : BorderSide.none,
            ),
          ),
          onPressed: onTab,
          child: Text(
            title,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}

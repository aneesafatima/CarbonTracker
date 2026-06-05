import 'package:flutter/material.dart';

void showInfoModal(BuildContext context, String title, String content) {
  showDialog(
    context: context,
    builder: (context) {
      return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: BorderSide(
            color: Color(0xFFD7D3BE),
          )
        ),
        backgroundColor: Color(0xFFF2F0E0),
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 12),
              Text(
                content,
                style: TextStyle(
                  fontSize: 14,
                ),
                textAlign: TextAlign.justify,
              ),
            ],
          ),
        ),
      );
    },
  );
}

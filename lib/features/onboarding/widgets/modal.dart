import 'package:flutter/material.dart';
import 'package:carbon_tracker/core/config/app_constants.dart';

void showInfoModal(BuildContext context, String title, String content) {
  showDialog(
    context: context,
    builder: (context) {
      return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: BorderSide(color: AppColors.modalBorderColor),
        ),
        backgroundColor: AppColors.modalBackgroundColor,
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                title,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 12),
              Text(
                content,
                style: TextStyle(fontSize: 14),
                textAlign: TextAlign.justify,
              ),
              SizedBox(height: 16),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text('Close'),
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}

import 'package:dial_chat/app/utils/color_util.dart';
import 'package:dial_chat/app/utils/responsive_size.dart';
import 'package:flutter/material.dart';

class StorageUsage extends StatelessWidget {
  final double myAppStorageUsage;
  final double otherAppsStorageUsage;

  const StorageUsage(
      {super.key,
      required this.myAppStorageUsage,
      required this.otherAppsStorageUsage});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        LinearProgress(
          myAppStorageUsage: myAppStorageUsage,
          otherAppsStorageUsage: otherAppsStorageUsage,
        ),
      ],
    );
  }
}

class LinearProgress extends StatelessWidget {
  final double myAppStorageUsage;
  final double otherAppsStorageUsage;

  const LinearProgress(
      {super.key,
      required this.myAppStorageUsage,
      required this.otherAppsStorageUsage});

  @override
  Widget build(BuildContext context) {
    double totalStorageUsage = myAppStorageUsage + otherAppsStorageUsage;
    double remainingStorage = 1.0 - totalStorageUsage;

    return Container(
      width: 100.w,
      height: 10,
      decoration: BoxDecoration(
        color: context.lightGrey, // Background color of progress bar
        borderRadius: BorderRadius.circular(5),
      ),
      child: Stack(
        children: [
          FractionallySizedBox(
            widthFactor: otherAppsStorageUsage,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(30),
                  bottomLeft: Radius.circular(30),
                ),
                color: context.green,
              ),
              // color: Colors.green, // Color for other apps' storage usage
            ),
          ),
          FractionallySizedBox(
            widthFactor: myAppStorageUsage,
            child: Container(
              decoration: BoxDecoration(
                color:
                    context.secondaryBlue, // Color for your app's storage usage
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(5),
                  bottomLeft: Radius.circular(5),
                ),
              ),
              constraints: BoxConstraints(
                  minWidth: 10.kw), // Minimum width to ensure visibility
            ),
          ),
          FractionallySizedBox(
            widthFactor: remainingStorage,
            child: Container(),
          ),
        ],
      ),
    );
  }
}

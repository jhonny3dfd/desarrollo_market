import 'package:flutter/material.dart';

class SuccessfulBaner extends StatelessWidget {
  final IconData icon;
  final String? text;
  final String? title;
  final String? subTitle;
  final double? iconTextSpace;
  final double? maxWidth;
  final double? maxHeight;

  const SuccessfulBaner({required this.icon, this.text, this.title, this.subTitle, this.maxWidth, this.maxHeight, this.iconTextSpace = 6, super.key});

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final textScheme = Theme.of(context).textTheme;

    return Container(
      constraints: BoxConstraints(
        maxWidth: maxWidth ?? double.infinity,
        maxHeight: maxHeight ?? double.infinity,
        minWidth: 100
      ),

      decoration: BoxDecoration(
        color: scheme.secondaryContainer,
        borderRadius: .circular(20)
      ),
      child: Padding(padding: EdgeInsets.symmetric(vertical: 6, horizontal: 14), child: Row(
        mainAxisSize: .min,
        mainAxisAlignment: .start,
        children: [
          Icon(icon, color: scheme.onSecondaryContainer),
          SizedBox(width: iconTextSpace),
          Flexible(child: Column(
            crossAxisAlignment: .start,
            children: [
              if (title != null) Text(title!, style: textScheme.titleLarge?.copyWith(color: scheme.onSecondaryContainer)),
              if (text != null) Text(text!, style: textScheme.bodyLarge?.copyWith(color: scheme.onSecondaryContainer), overflow: .ellipsis),
              if (subTitle != null) Text(subTitle!, style: textScheme.labelLarge?.copyWith(color: scheme.onSecondaryContainer)),
            ]
          ))
        ])
      ),
    );
  }
}
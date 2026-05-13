import 'package:flutter/material.dart';

class ErrorBaner extends StatelessWidget {
  final IconData icon;
  final String? text;
  final String? title;
  final String? subTitle;
  final double? iconTextSpace;
  final double? width;
  final double? height;

  const ErrorBaner({required this.icon, this.text, this.title, this.subTitle, this.width, this.height, this.iconTextSpace = 6, super.key});

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final textScheme = Theme.of(context).textTheme;

    return Container(
      width: width,
      height: height,

      decoration: BoxDecoration(
        color: scheme.errorContainer,
        borderRadius: .circular(20)
      ),
      child: Padding(padding: EdgeInsets.symmetric(vertical: 6, horizontal: 14), child: Row(
        mainAxisSize: .min,
        mainAxisAlignment: .start,
        children: [
          Icon(icon, color: scheme.onErrorContainer),
          SizedBox(width: iconTextSpace),
          Expanded(child: Column(
            crossAxisAlignment: .start,
            children: [
              if (title != null) Text(title!, style: textScheme.titleLarge?.copyWith(color: scheme.onErrorContainer)),
              if (text != null) Text(text!, style: textScheme.bodyLarge?.copyWith(color: scheme.onErrorContainer)),
              if (subTitle != null) Text(subTitle!, style: textScheme.labelLarge?.copyWith(color: scheme.onErrorContainer)),
            ]
          ))
        ]
      )),
    );
  }
}
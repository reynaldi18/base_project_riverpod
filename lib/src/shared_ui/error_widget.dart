import 'package:flutter/material.dart';

import 'style/theme.dart';

class ErrorText extends StatelessWidget {
  final String? error;
  final VoidCallback reload;
  const ErrorText({
    Key? key,
    this.error,
    required this.reload,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          error ?? "",
          style: TextStyle(
              color: Theme.of(context).textTheme.displayLarge?.color,
              fontWeight: FontWeight.bold),
        ),
        ElevatedButton(
          onPressed: reload,
          style:
              ElevatedButton.styleFrom(backgroundColor: ThemeConfig.greyColor),
          child: Row(
            children:  const [
              Text(
                "Reload",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              Icon(Icons.refresh)
            ],
          ),
        )
      ],
    );
  }
}

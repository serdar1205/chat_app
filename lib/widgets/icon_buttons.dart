import 'package:chat_app/theme.dart';
import 'package:flutter/material.dart';

class IconBackground extends StatelessWidget {
   IconBackground({Key? key, required this.icon, required this.onTap}) : super(key: key);

   final IconData icon;
   final VoidCallback onTap;


  @override
  Widget build(BuildContext context) {
    return Material(
      color: Theme.of(context).cardColor,
      borderRadius: BorderRadius.circular(6),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(6),
        splashColor: AppColors.secondary,
        child: Padding(
          padding: EdgeInsets.all(6),
          child: Icon(
            icon,
            size: 18,
          ),
        ),
      ),
    );
  }
}

class IconBorder extends StatelessWidget {
  IconBorder({Key? key, required this.icon, required this.onTap}) : super(key: key);

   final IconData icon;
   final VoidCallback onTap;


  @override
  Widget build(BuildContext context) {
    return Material(
      color: Theme.of(context).cardColor,
      borderRadius: BorderRadius.circular(6),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(6),
        splashColor: AppColors.secondary,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            border: Border.all(
              width: 2,
              color: Theme.of(context).cardColor
            )
          ),
          padding: EdgeInsets.all(4),
          child: Icon(
            icon,
            size: 16,
          ),
        ),
      ),
    );
  }
}

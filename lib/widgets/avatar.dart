import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class Avatar extends StatelessWidget {
  final double radius;
  final String url;

  Avatar({Key? key, required this.url, required this.radius}) : super(key: key);

  Avatar.small({Key? key, required this.url})
      : radius = 16,
        super(key: key);

  Avatar.medium({Key? key, required this.url})
      : radius = 22,
        super(key: key);

  Avatar.large({Key? key, required this.url})
      : radius = 44,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: radius,
      backgroundImage: CachedNetworkImageProvider(url),
      backgroundColor: Theme.of(context).cardColor,
    );
  }
}

import 'package:base_flutter/src/core/models/album_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class ItemAlbum extends StatelessWidget {
  const ItemAlbum(this.album);

  final AlbumModel? album;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.white,
      ),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: CachedNetworkImage(
              imageUrl: 'https://picsum.photos/seed/${album?.title}/200',
            ),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.black.withOpacity(0.3),
            ),
          ),
          Center(
            child: Padding(
              padding: EdgeInsets.all(12),
              child: Text(
                album?.title ?? '',
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                maxLines: 4,
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    )
        .animate(target: 1)
        .slideY(begin: 0.9, end: 0, duration: Duration(milliseconds: 300))
        .scaleXY(begin: 0.8, end: 1, duration: Duration(milliseconds: 300))
        .fadeIn(duration: Duration(milliseconds: 300));
  }
}

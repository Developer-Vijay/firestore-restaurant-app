import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:restaurant_major_project/screens/Dineout/dineoutlist.dart';

class GalleryView extends StatefulWidget {
  @override
  _GalleryViewState createState() => _GalleryViewState();
}

class _GalleryViewState extends State<GalleryView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        body: Container(
          child: CachedNetworkImage(
                fit: BoxFit.fill,
                imageUrl: barimages[1],
                imageBuilder: (context, imageProvider) => PhotoView(
                  backgroundDecoration: BoxDecoration(color: Colors.white),
                  imageProvider: imageProvider,
                ),
                placeholder: (context, url) => Row(
                  children: [
                    CircularProgressIndicator(
                      semanticsLabel: "Loading",
                    ),
                  ],
                ),
                errorWidget: (context, url, error) => Icon(Icons.error),
              )
        ),
      ),
    );
  }
}

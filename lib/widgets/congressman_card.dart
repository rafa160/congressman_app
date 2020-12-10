import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

class CongressmanCard extends StatelessWidget {

  final String image;
  final VoidCallback onTap;
  final String name;
  final String state;

  const CongressmanCard({Key key, this.image, this.onTap, this.name, this.state}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        child: Card(
          color: Colors.blue.withAlpha(400),
          elevation: 4,
          clipBehavior: Clip.antiAlias,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20)),
          child: Padding(
            padding: EdgeInsets.only(left: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                image != null ? checkUrlImage(image) : Icon(Icons.image),
                Padding(
                  padding: EdgeInsets.only(top: 5),
                  child: Text(
                    name,
                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700),
                  ),
                ),
                Row(
                  children: [
                    Text('estado - $state',  style: TextStyle(color: Colors.white, fontWeight: FontWeight.w300),)
                  ],
                )
              ],
            ),
          ),

        ),
      ),
    );
  }

  Widget checkUrlImage(String url) {
    try {
      return AspectRatio(
        aspectRatio: 1,
        child: FadeInImage.memoryNetwork(
          placeholder: kTransparentImage,
          image: url,
          fit: BoxFit.cover,
        ),
      );
    } catch (e) {
      return Image(
        image: NetworkImage(
            'https://cdn3.vectorstock.com/i/thumb-large/80/82/person-gray-photo-placeholder-man-vector-22808082.jpg'),
        height: 70,
        width: 50,
        fit: BoxFit.cover,
      );
    }
  }

}

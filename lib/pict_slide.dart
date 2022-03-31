import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

final List<String> images_list = [
  'assets/nepal.jpg',
  'assets/monutain.jpg',
  'assets/road.jpg',
  'assets/smb.jpg',
  'assets/tower.jpg',
  'assets/baudha.jpg',
  'assets/everest.jpg',
];

class picture_slider extends StatefulWidget {
  picture_slider({Key? key}) : super(key: key);

  @override
  State<picture_slider> createState() => _picture_sliderState();
}


class _picture_sliderState extends State<picture_slider> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: CarouselSlider(
        items: images_list
            .map((e) => ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Stack(
                    fit: StackFit.expand,
                    children: <Widget>[
                      Image.asset(
                        e,
                        width: 220,
                        height: 400,
                        fit: BoxFit.cover,
                      )
                    ],
                  ),
                ))
            .toList(),
        options: CarouselOptions(
          enlargeCenterPage: true,
          enableInfiniteScroll: false,
          autoPlay: true,
        ),
      ),
    );
  }
}

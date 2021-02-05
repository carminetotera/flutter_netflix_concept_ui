import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:netflix_ui/circular_clipper.dart';
import 'package:netflix_ui/content_scroll.dart';

import 'model/movie_model.dart';

class MovieScreen extends StatefulWidget {
  final Movie movie;

  MovieScreen({this.movie});

  @override
  _MovieScreenState createState() => _MovieScreenState();
}

class _MovieScreenState extends State<MovieScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: ListView(
          children: [
            Stack(
              children: [
                Container(
                  transform: Matrix4.translationValues(0.0, -50.0, 0.0),
                  child: Hero(
                    tag: widget.movie.imageUrl,
                    child: ClipShadowPath(
                      clipper: CircularClipper(),
                      shadow: Shadow(blurRadius: 20.0),
                      child: Image(
                        height: 400.0,
                        width: double.infinity,
                        fit: BoxFit.cover,
                        image: AssetImage(widget.movie.imageUrl),
                      ),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      padding: EdgeInsets.only(left: 30.0),
                      icon: Icon(Icons.arrow_back),
                      onPressed: () => Navigator.pop(context),
                      iconSize: 30.0,
                      color: Colors.white,
                    ),
                    Image(
                      image: AssetImage('assets/images/netflix_logo.png'),
                      height: 60.0,
                      width: 150.0,
                    ),
                    IconButton(
                      padding: EdgeInsets.only(right: 30.0),
                      icon: Icon(Icons.favorite_border_outlined),
                      onPressed: () => {},
                      iconSize: 30.0,
                      color: Colors.white,
                    ),
                  ],
                ),
                Positioned.fill(
                  bottom: 10.0,
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: RawMaterialButton(
                      padding: EdgeInsets.all(10.0),
                      elevation: 10.0,
                      onPressed: () => {},
                      shape: CircleBorder(),
                      fillColor: Colors.white,
                      child: Icon(
                        Icons.play_arrow,
                        size: 60.0,
                        color: Colors.red,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0.0,
                  left: 20.0,
                  child: IconButton(
                    onPressed: () => {},
                    icon: Icon(Icons.add),
                    iconSize: 40.0,
                    color: Colors.black,
                  ),
                ),
                Positioned(
                  bottom: 0.0,
                  right: 25.0,
                  child: IconButton(
                    onPressed: () => {},
                    icon: Icon(Icons.share),
                    iconSize: 35.0,
                    color: Colors.black,
                  ),
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 40.0,
                vertical: 20.0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    widget.movie.title.toUpperCase(),
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    widget.movie.categories,
                    style: TextStyle(
                      color: Colors.black54,
                      fontSize: 16.0,
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  _buildRating(),
                  SizedBox(
                    height: 15.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          Text(
                            'Year',
                            style: TextStyle(
                                color: Colors.black54, fontSize: 16.0),
                          ),
                          SizedBox(height: 2),
                          Text(
                            widget.movie.year.toString(),
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.w600,
                            ),
                          )
                        ],
                      ),
                      Column(
                        children: [
                          Text(
                            'Country',
                            style: TextStyle(
                                color: Colors.black54, fontSize: 16.0),
                          ),
                          SizedBox(height: 2),
                          Text(
                            widget.movie.country.toString(),
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.w600,
                            ),
                          )
                        ],
                      ),
                      Column(
                        children: [
                          Text(
                            'Mins',
                            style: TextStyle(
                                color: Colors.black54, fontSize: 16.0),
                          ),
                          SizedBox(height: 2),
                          Text(
                            widget.movie.length.toString(),
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.w600,
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 25.0,
                  ),
                  Container(
                    child: Text(
                      widget.movie.description.toString(),
                      style: TextStyle(
                        color: Colors.black54,
                      ),
                    ),
                  )
                ],
              ),
            ),
            ContentScroll(
              images: widget.movie.screenshots,
              title: 'Screenshots',
              imageHeight: 200,
              imageWidth: 250,
            )
          ],
        ),
      ),
    );
  }
}

Widget _buildRating() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      RatingBar(
        initialRating: 3,
        minRating: 1,
        direction: Axis.horizontal,
        allowHalfRating: true,
        itemCount: 5,
        itemSize: 20,
        itemPadding: EdgeInsets.symmetric(horizontal: 4),
        onRatingUpdate: (rating) {
          print(rating);
        },
        ratingWidget: RatingWidget(
          full: Icon(Icons.star, color: Colors.red),
          empty: Icon(Icons.star, color: Colors.black54),
          half: Icon(Icons.star_half_outlined, color: Colors.amber),
        ),
      ),
    ],
  );
}

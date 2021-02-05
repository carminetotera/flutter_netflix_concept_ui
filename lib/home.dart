import 'package:flutter/material.dart';
import 'package:netflix_ui/model/movie_model.dart';
import 'package:netflix_ui/movie_screen.dart';

import 'content_scroll.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0, viewportFraction: 0.85);
  }

  _movieSelector(int index) {
    return AnimatedBuilder(
      animation: _pageController,
      builder: (BuildContext context, Widget widget) {
        double value = 1;

        if (_pageController.position.haveDimensions) {
          value = _pageController.page - index;

          value = (1 - (value.abs() * 0.28) + 0.05).clamp(0.0, 1.0);
        }
        return Center(
          child: SizedBox(
            height: Curves.easeInOut.transform(value) * 270.0,
            width: Curves.easeInOut.transform(value) * 400.0,
            child: widget,
          ),
        );
      },
      child: GestureDetector(
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => MovieScreen(
              movie: movies[index],
            ),
          ),
        ),
        child: Stack(
          children: [
            Center(
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black54,
                      offset: Offset(0.0, 4.0),
                      blurRadius: 10.0,
                    )
                  ],
                ),
                child: Center(
                  child: Hero(
                    tag: movies[index].imageUrl,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: Image(
                        image: AssetImage(movies[index].imageUrl),
                        height: 220.0,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              left: 30,
              bottom: 40,
              child: Container(
                width: 250.0,
                child: Text(
                  movies[index].title.toUpperCase(),
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: Image(
          image: AssetImage('assets/images/netflix_logo.png'),
          width: 100,
        ),
        leading: IconButton(
          padding: EdgeInsets.only(left: 30.0),
          onPressed: () => print('Menu'),
          icon: Icon(Icons.menu),
          iconSize: 30.0,
          color: Colors.black,
        ),
        actions: [
          IconButton(
            padding: EdgeInsets.only(right: 30.0),
            icon: Icon(Icons.search),
            onPressed: () {},
            iconSize: 30.0,
            color: Colors.black,
          ),
        ],
      ),
      body: ListView(
        children: [
          Container(
            height: 280,
            width: double.infinity,
            child: PageView.builder(
              controller: _pageController,
              itemCount: movies.length,
              itemBuilder: (BuildContext context, int index) {
                return _movieSelector(index);
              },
            ),
          ),
          Container(
            height: 90.0,
            child: ListView.builder(
              padding: EdgeInsets.symmetric(
                horizontal: 30.0,
              ),
              scrollDirection: Axis.horizontal,
              itemCount: labels.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  margin: EdgeInsets.all(10.0),
                  width: 160.0,
                  child: Stack(
                    //if fit not specified then, it aligns to top left....
                    fit: StackFit.expand,
                    children: <Widget>[
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10.0),
                        child: Image.asset(
                          imageLabel[index],
                          fit: BoxFit.cover,
                        ),
                      ),
                      DecoratedBox(
                        child: Center(
                          child: Text(
                            labels[index].toUpperCase(),
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1.8,
                            ),
                          ),
                        ),
                        decoration: new BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            //color: Colors.lightGreen
                            gradient: new LinearGradient(
                                begin: FractionalOffset.topCenter,
                                end: FractionalOffset.bottomCenter,
                                colors: [
                                  const Color.fromARGB(200, 212, 82, 83),
                                  const Color.fromARGB(200, 212, 82, 83),
                                ])),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          ContentScroll(
            images: myList,
            title: 'My List',
            imageHeight: 250.0,
            imageWidth: 150.0,
          ),
          SizedBox(
            height: 10.0,
          ),
          ContentScroll(
            images: popular,
            title: 'Popular',
            imageHeight: 250.0,
            imageWidth: 150.0,
          ),
        ],
      ),
    );
  }
}

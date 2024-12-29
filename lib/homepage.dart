import 'package:flutter/material.dart';
import 'package:netflix/components/categories.dart';
import 'package:netflix/components/continueWatching.dart';
import 'package:netflix/components/floating_bottom_bar.dart';
import 'package:netflix/components/header.dart';
import 'package:netflix/components/search.dart';
import 'package:netflix/components/sectionCarousel.dart';
import 'package:netflix/components/sliding_shows.dart';
import 'package:netflix/constants.dart';


class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              padding: EdgeInsets.all(20),
              child: BodyContent(),
            ),
            Align(
                alignment: Alignment.bottomCenter,
                child: FloatingBottomBar()
            )
          ],
        ),
      ),
    );
  }
}


class BodyContent extends StatelessWidget {
  const BodyContent({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Header(),
          SizedBox(
            height: 20,
          ),
          Search(),
          SizedBox(
            height: 20,
          ),
          Categories(),
          SizedBox(
            height: 20,
          ),
          SectionCarousel(),
          SizedBox(
            height: 20,
          ),
          SlidingShows(
            headerText: "Trending Movies",
            movies: trendingMovies,
          ),
          SizedBox(
            height: 20,
          ),
          ContinueWatching(),
          SizedBox(
            height: 20,
          ),
          SlidingShows(
            headerText: "Recommended For You",
            movies: recommendedMovies,
          ),
          SizedBox(
            height: 100,
          ),
        ],
      ),
    );
  }
}


//Center(child: Text("HI"),);

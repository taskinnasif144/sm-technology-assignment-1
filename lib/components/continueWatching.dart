import 'package:flutter/material.dart';
import 'package:netflix/components/section_header.dart';
import 'package:netflix/constants.dart';

class ContinueWatching extends StatelessWidget {
  const ContinueWatching({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SectionHeader(headerText: "Continue Watching"),
       SizedBox(height: 24,),
       SizedBox(
         height: 152,
         child:  ListView.builder(
           scrollDirection: Axis.horizontal,
           shrinkWrap: true,
           itemCount: continueWatchingList.length,
           itemBuilder: (context, index) {
             return EpisodeWatching(
               image: continueWatchingList[index]["image"],
               progress:continueWatchingList[index]["progress"],
               title:continueWatchingList[index]["name"],
             );
           },
         ),
       )
      ],
    );
  }
}

class EpisodeWatching extends StatelessWidget {
  const EpisodeWatching(
      {super.key,
      required this.image,
      required this.progress,
      required this.title});

  final String image;
  final double progress;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 163,
      height: 151,
      margin: EdgeInsets.only(right: 11),
      child: Column(
        children: [
         SizedBox(
           height: 104,
           child:  ClipRRect(
             borderRadius: BorderRadius.only(
                 topLeft: Radius.circular(15), topRight: Radius.circular(15)),
             child: Image(
               image: AssetImage( image),
               fit: BoxFit.cover,
             ),
           ),
         ),
          Stack(
            children: [
              ProgressBar(
                color: Theme.of(context).colorScheme.tertiary,
              ),
              FractionallySizedBox(
                widthFactor: progress,
                child: ProgressBar(
                  color: Theme.of(context).colorScheme.primary,
                ),
              )
            ],
          ),
          Flexible(child: Text(title))
        ],
      ),
    );
  }
}

class ProgressBar extends StatelessWidget {
  const ProgressBar({super.key, required this.color});

  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 6,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(15),
          bottomRight: Radius.circular(15),
        ),
      ),
    );
  }
}

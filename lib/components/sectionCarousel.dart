import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:netflix/getx_controllers/carousel_index_controller.dart';
import 'package:netflix/constants.dart';
import 'package:get/get.dart';

class SectionCarousel extends StatelessWidget {
  const SectionCarousel({super.key});

  @override
  Widget build(BuildContext context) {

    final CarouselIndexController getIndexController = Get.put(CarouselIndexController());
    
    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            viewportFraction: 1,
            onPageChanged: (index, _) => getIndexController.setCurrentCarouselIndex(index)
          ),
          items: [
            CarouselBanner(
              image: LocalAssetImages.banner1,
            ),
            CarouselBanner(
              image: LocalAssetImages.banner2,
            ),
            CarouselBanner(
              image: LocalAssetImages.banner3,
            )
          ],
        ),
        Obx(
          () => Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for (int i = 0; i < 3; i++)  CarouselIndicator(selected: getIndexController.currentCarouselIndex.value == i,)
            ],
          ),
        )
      ],
    );
  }
}



class CarouselBanner extends StatelessWidget {
  const CarouselBanner({
    super.key,
    required this.image,
  });

  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Image(
            image: AssetImage(image),
            fit: BoxFit.cover,
          ),
        ));
  }
}


class CarouselIndicator extends StatelessWidget {
  const CarouselIndicator({
    super.key,
    required this.selected
  });

  final bool selected;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 10,
      width: 10,
      margin: EdgeInsets.only(right: 10),
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: selected? Colors.white :  Theme.of(context).colorScheme.secondary
      ),
    );
  }
}
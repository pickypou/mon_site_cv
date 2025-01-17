import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:mon_site_cv/domain/entity/parcours.dart';

import '../../../theme.dart';

class ParcoursListView extends StatefulWidget {
  final List<Parcours> parcours;

  const ParcoursListView({
    super.key,
    required this.parcours,
  });

  @override
  State<ParcoursListView> createState() => _ParcoursListViewState();
}

class _ParcoursListViewState extends State<ParcoursListView> {
  final CarouselSliderController _carouselController =
      CarouselSliderController();
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    bool isSmallScreen = size.width < 749;

    // ** Styles dynamiques **
    double paddingHorizontal = isSmallScreen ? 20 : 90;
    double carouselHeight = isSmallScreen ? 450 : 300;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: isSmallScreen ? 40 : 55),
      child: Stack(
        children: [
          // Main content
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Mon Parcours",
                style: titleStyleMedium(context),
              ),
              const SizedBox(
                height: 55,
              ),
              // Carousel slider
              Stack(
                alignment: Alignment.center,
                children: [
                  CarouselSlider(
                    items: widget.parcours.map((parcours) {
                      return Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: paddingHorizontal),
                        child: SizedBox(
                          height: 600,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              // Texte avec gestion du dépassement
                              Flexible(
                                child: Text(
                                  parcours.title,
                                  style: textStyleText(context).copyWith(
                                    fontSize: isSmallScreen
                                        ? 14
                                        : 16, // Ajuste la taille
                                    //fontStyle: FontStyle.italic,
                                  ),
                                  textAlign: TextAlign.center,
                                  //  maxLines: isSmallScreen ? 4 : null, // Limite les lignes
                                  //overflow: TextOverflow.ellipsis,    // Points de suspension
                                ),
                              ),

                              const SizedBox(height: 5),

                              // Nom de l'auteur
                              Text(
                                parcours.text,
                                style: textStyleText(context).copyWith(
                                  //fontStyle: FontStyle.italic,
                                  fontSize: isSmallScreen
                                      ? 14
                                      : 16, // Ajuste la taille
                                ),
                                textAlign: TextAlign.center,
                              ),
                              const SizedBox(height: 5),
                            ],
                          ),
                        ),
                      );
                    }).toList(),
                    options: CarouselOptions(
                      height: carouselHeight,
                      autoPlay: true,
                      autoPlayInterval: const Duration(seconds: 15),
                      enlargeCenterPage: true,
                      viewportFraction: 0.8,
                      aspectRatio: 16 / 9,
                      enableInfiniteScroll: true,
                      onPageChanged: (index, reason) {
                        setState(() {
                          _currentIndex = index;
                        });
                      },
                    ),
                    carouselController: _carouselController,
                  ),

                  // Left navigation button
                  Positioned(
                    left: 0,
                    child: IconButton(
                      icon: Icon(Icons.chevron_left,
                          color: theme.colorScheme.primary, size: 40),
                      onPressed: () {
                        _carouselController.previousPage(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.linear);
                      },
                    ),
                  ),

                  // Right navigation button
                  Positioned(
                    right: 0,
                    child: IconButton(
                      icon: Icon(Icons.chevron_right,
                          color: theme.colorScheme.primary, size: 40),
                      onPressed: () {
                        _carouselController.nextPage(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.linear);
                      },
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 20),

              // Indicators
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: widget.parcours.asMap().entries.map((entry) {
                  return Container(
                    width: 8.0,
                    height: 8.0,
                    margin: const EdgeInsets.symmetric(horizontal: 4.0),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: theme.colorScheme.primary
                          .withOpacity(_currentIndex == entry.key ? 0.9 : 0.4),
                    ),
                  );
                }).toList(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

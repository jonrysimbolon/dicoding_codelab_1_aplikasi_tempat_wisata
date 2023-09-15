import 'package:dicoding_wisatabandung/favorite_button.dart';
import 'package:dicoding_wisatabandung/model/touristm_place.dart';
import 'package:flutter/material.dart';

var informationTextStyle = const TextStyle(
    fontFamily: 'Oxygen'); // menyimpan font kedalam variable style

class DetailScreen extends StatelessWidget {
  final TourismPlace place;

  const DetailScreen({Key? key, required this.place}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth > 800) {
        return DetailWebPage(place: place);
      } else {
        return DetailMobilePage(place: place);
      }
    });
  }
}

class DetailWebPage extends StatelessWidget {
  final TourismPlace place;

  const DetailWebPage({super.key, required this.place});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Wisata bandung',
            style: TextStyle(
              fontFamily: 'Staatliches',
              fontSize: 32,
            ),
          ),
          SizedBox(
            height: 32,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(place.imageAsset),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Container(
                    height: 150,
                    padding: const EdgeInsets.only(bottom: 16),
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: place.imageUrls.map((url) {
                        return Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.network(url),
                          ),
                        );
                      }).toList(),
                    ),
                  )
                ]),
              ),
              const SizedBox(width: 32),
              Expanded(
                  child: Card(
                child: Container(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Container(
                        child: Text(
                          place.name,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 30.0,
                            fontFamily: 'Staatliches',
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              const Icon(Icons.calendar_today),
                              const SizedBox(
                                width: 8.0,
                              ),
                              Text(
                                place.openDays,
                                style: informationTextStyle,
                              )
                            ],
                          ),
                          const FavoriteButton(),
                        ],
                      ),
                      Row(
                        children: [
                          const Icon(Icons.access_time),
                          const SizedBox(
                            width: 8.0,
                          ),
                          Text(
                            place.openTime,
                            style: informationTextStyle,
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 8.0,
                      ),
                      Row(
                        children: [
                          const Icon(Icons.monetization_on),
                          const SizedBox(
                            width: 8.0,
                          ),
                          Text(
                            place.ticketPrice,
                            style: informationTextStyle,
                          )
                        ],
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(vertical: 16.0),
                        child: Text(
                          place.description,
                          textAlign: TextAlign.justify,
                          style: const TextStyle(
                              fontSize: 16.0, fontFamily: 'Oxygen'),
                        ),
                      )
                    ],
                  ),
                ),
              ))
            ],
          )
        ],
      ),
    );
  }
}

class DetailMobilePage extends StatelessWidget {
  final TourismPlace place;

  const DetailMobilePage({super.key, required this.place});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Stack(
              children: [
                Image.asset(place.imageAsset),
                SafeArea(
                    child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CircleAvatar(
                              backgroundColor: Colors.grey,
                              child: IconButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  icon: const Icon(Icons.arrow_back)),
                            ),
                            const FavoriteButton(),
                          ],
                        )))
              ],
            ),
            Container(
                margin: const EdgeInsets.only(top: 16.0),
                child: Text(
                  place.name,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontSize: 30.0, fontFamily: 'Staatliches'),
                )),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      const Icon(Icons.calendar_today),
                      const SizedBox(height: 8.0),
                      Text(
                        place.openDays,
                        style: informationTextStyle,
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      const Icon(Icons.access_time),
                      const SizedBox(height: 8.0),
                      Text(
                        place.openTime,
                        style: informationTextStyle,
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      const Icon(Icons.monetization_on),
                      const SizedBox(height: 8.0),
                      Text(
                        place.ticketPrice,
                        style: informationTextStyle,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                place.description,
                style: const TextStyle(fontSize: 16.0),
              ),
            ),
            SizedBox(
              height: 150,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: place.imageUrls.map((url) {
                  return Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(url),
                    ),
                  );
                }).toList(),
              ),
            )
          ],
        ),
      ),
    ));
  }
}

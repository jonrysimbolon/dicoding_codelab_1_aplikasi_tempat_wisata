import 'package:dicoding_wisatabandung/detail_screen.dart';
import 'package:dicoding_wisatabandung/model/touristm_place.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Wisata Bandung'),
        ),
        body: ListView.builder(
          itemBuilder: (context, index) {
            final TourismPlace place = tourismPlaceList[index];
            return InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return DetailScreen(
                      place: place,
                    );
                  },
                ));
              },
              child: Card(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 1,
                      child: Image.asset(place.imageAsset),
                    ),
                    Expanded(
                        flex: 2,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                place.name,
                                style: const TextStyle(fontSize: 16.0),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(place.location),
                            ],
                          ),
                        ))
                  ],
                ),
              ),
            );
          },
          itemCount: tourismPlaceList.length,
        ));
  }
}

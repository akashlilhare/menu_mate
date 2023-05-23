import 'package:flutter/material.dart';

import '../../../../constants/constant.dart';
import '../../../../model/menu_model.dart';

class HomeCarousel extends StatefulWidget {
  final List<Special> specialList;

  const HomeCarousel({Key? key, required this.specialList}) : super(key: key);

  @override
  State<HomeCarousel> createState() => _HomeCarouselState();
}

class _HomeCarouselState extends State<HomeCarousel> {
  @override
  Widget build(BuildContext context) {
    buildCard({required Special special}) {
      return Container(
        width: 300,
        decoration: Constants().getDecoration(context: context),
        child: Column(
          children: [
            Expanded(
              flex: 2,
              child: ClipRRect(
                child: Image.network(
                  "https://images.unsplash.com/photo-1565299624946-b28f40a0ae38?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=481&q=80",
                  fit: BoxFit.fitHeight,
                  width: 280,height: 100,

                ),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16), topRight: Radius.circular(16)),
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "shahi paneer",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w400),
                        ),
                        SizedBox(
                          height: 2,
                        ),
                        Text(
                          "₹250.00",
                          style: TextStyle(),
                        )
                      ],
                    ),
                    Spacer(),
                    ElevatedButton(
                      onPressed: () {},
                      child: Text("Add to plate"),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Theme.of(context).primaryColor,
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 8,
            ),
          ],
        ),
      );
    }

    return Container(
        height: 250,
        child: ListView(
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          children: [
            ...widget.specialList
                .map((food) => buildCard(special: food))
                .toList()
          ],
        ));
  }
}

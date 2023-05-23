import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:menu_say/constants/constant.dart';

import '../pages/main_page/home_page/home_page.dart';


class PopularItems extends StatelessWidget {
  const PopularItems({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<CategoryItem> categoryList = [
      CategoryItem(
          title: "Soups",
          imgSrc:
              "https://b.zmtcdn.com/data/pictures/chains/0/19291760/b39ab69a1b30d3f8eb2a322aba02912e.png?fit=around|300:273&crop=300:273;*,"),
      CategoryItem(
          title: "Beverages",
          imgSrc:
              "https://b.zmtcdn.com/data/pictures/chains/3/19437593/9f1b8369431440c4c7a20abc5ab46429.jpg?fit=around|771.75:416.25&crop=771.75:416.25;*,*"),
      CategoryItem(
          title: "Vegetables",
          imgSrc:
              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQE8ahORLgcuym-Bw2_2E6MZZHSe9cLuKanQfc5s8xFwM1HgdKHQplqbh0pRYT9OeV5c50&usqp=CAU"),
      CategoryItem(
          title: "Chinese",
          imgSrc: "https://imgk.timesnownews.com/story/paneer-tikka.gif"),
      CategoryItem(
          title: "South Indian",
          imgSrc:
              "https://images.unsplash.com/photo-1565958011703-44f9829ba187?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxleHBsb3JlLWZlZWR8N3x8fGVufDB8fHx8&auto=format&fit=crop&w=700&q=60"),
      CategoryItem(
          title: "Bugger Corner",
          imgSrc:
              "https://images.unsplash.com/photo-1484723091739-30a097e8f929?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxleHBsb3JlLWZlZWR8MTN8fHxlbnwwfHx8fA%3D%3D&auto=format&fit=crop&w=700&q=60"),
    ];
    return Container(
      height: 320,
      width: double.infinity,
      child: SizedBox(
        child: ListView(
            physics: BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            children: [
              SizedBox(
                width: 12,
              ),
              ...categoryList
                  .map((category) => Container(
                        width: 250,
                        margin: EdgeInsets.only(right: 12),
                        decoration: Constants()
                            .getDecoration(context: context)
                            .copyWith(
                              image: DecorationImage(
                                image: NetworkImage(category.imgSrc),
                                fit: BoxFit.fill,
                                colorFilter: ColorFilter.mode(
                                    Colors.black.withOpacity(.0),
                                    BlendMode.xor),
                              ),
                              gradient: LinearGradient(
                                  begin: Alignment.bottomCenter,
                                  end: Alignment.topRight,
                                  colors: [
                                    Colors.black.withOpacity(.8),
                                    Colors.black.withOpacity(.8),
                                  ]),
                            ),
                        child: Align(
                          alignment: Alignment.bottomCenter,
                          child: Container(
                              width: double.infinity,
                              padding: EdgeInsets.only(
                                  left: 12, right: 12, bottom: 12, top: 12),
                              child: Row(
                                children: [
                                  Text(
                                    category.title,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 16),
                                  ),
                                  Spacer(),
                                  Container(
                                    padding: EdgeInsets.all(6),
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.white
                                    ),
                                    child: Icon(Icons.arrow_forward,color: Colors.black,size: 20,),
                                  )
                                ],
                              )),
                        ),
                      ))
                  .toList()
            ]),
      ),
    );
  }
}

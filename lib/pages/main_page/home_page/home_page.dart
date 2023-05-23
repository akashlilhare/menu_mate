import 'package:flutter/material.dart';
import 'package:menu_say/constants/constant.dart';
import 'package:menu_say/pages/main_page/cart_page.dart';
import 'package:menu_say/pages/main_page/category_page.dart';
import 'package:menu_say/pages/main_page/home_page/widget/home_ccrousel.dart';
import 'package:menu_say/pages/scanner_page/qr_code_scanner.dart';
import 'package:menu_say/provider/menu_provider.dart';
import 'package:provider/provider.dart';

import '../../../widget/filter_tags.dart';
import '../../../widget/popular.dart';


class HomePage extends StatelessWidget {
  static const routeName = "home-page";

  const HomePage({Key? key}) : super(key: key);

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
    return Consumer<MenuProvider>(
      builder: (context, menuData, _) {
        return Scaffold(
          backgroundColor: Colors.grey.shade50,
          floatingActionButton: FloatingActionButton(
            backgroundColor: Theme.of(context).primaryColor,
            onPressed: () {},
            child: Icon(Icons.filter_alt_outlined),
          ),
          drawer: Drawer(
            child: Column(
              children: [
                Container(
                  height: 120,
                  width: double.infinity,
                  color: Theme.of(context).primaryColor,
                  padding: EdgeInsets.only(bottom: 18, left: 16),
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      "Raj Hotels",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                ),
                ListTile(
                  leading: Icon(Icons.home_outlined),
                  title: Text(
                    "Home",
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                ListTile(
                  leading: Icon(Icons.shopping_bag_outlined),
                  title: Text(
                    "My Cart",
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                ListTile(
                  leading: Icon(Icons.qr_code),
                  title: Text(
                    "Qr scanner",
                    style: TextStyle(fontSize: 16),
                  ),
                  onTap: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (builder) {
                      return QRCodeScannerPage();
                    }));
                  },
                ),
                Divider(),
                ListTile(
                  leading: Icon(Icons.share_outlined),
                  title: Text(
                    "Share with friends",
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                ListTile(
                  leading: Icon(Icons.star_border_outlined),
                  title: Text(
                    "Rate us",
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                Divider(),
                ListTile(
                  leading: Icon(Icons.question_answer_outlined),
                  title: Text(
                    "FAQs",
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                ListTile(
                  leading: Icon(Icons.email_outlined),
                  title: Text(
                    "Contact us",
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                ListTile(
                  leading: Icon(Icons.local_police_outlined),
                  title: Text(
                    "Privacy policy",
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ],
            ),
          ),
          appBar: AppBar(
            title: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Flexible(child: Text(menuData.menu.hotelDetails.hotelName)),
                // SizedBox(
                //   width: 8,
                // ),
                // Icon(Icons.expand_more)
              ],
            ),
            actions: [
              IconButton(onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (builder) {
                  return CartPage();
                }));
              }, icon: Icon(Icons.shopping_bag_outlined)),
              IconButton(onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (builder) {
                  return QRCodeScannerPage();
                }));
              }, icon: Icon(Icons.qr_code)),
            ],
          ),
          body: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 20,
                ),
                FilterTag(),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      Text(
                        "Today's Special",
                        style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
                      ),
                      SizedBox(
                        height: 12,
                      ),
HomeCarousel(specialList: menuData.menu.special),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Categories",
                        style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      GridView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: categoryList.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 8.0,
                            mainAxisSpacing: 8.0),
                        itemBuilder: (BuildContext context, int index) {
                          return Hero(
                              tag:categoryList[index].title,
                              child: InkWell(
                            onTap: (){
                              Navigator.of(context).push(MaterialPageRoute(builder: (builder){
                                return  CategoryPage(
                                    title: categoryList[index].title,
                                    imgSrc: categoryList[index].imgSrc,

                                );
                              }));
                            },
                            child: Container(
                              width: double.infinity,
                              decoration: Constants()
                                  .getDecoration(context: context)
                                  .copyWith(
                                      color: Colors.black,
                                      image: DecorationImage(
                                        image: NetworkImage(
                                          categoryList[index].imgSrc,
                                        ),
                                        fit: BoxFit.cover,
                                        colorFilter: ColorFilter.mode(
                                            Colors.black.withOpacity(.10),
                                            BlendMode.xor),
                                      )),
                              child: Padding(
                                padding: const EdgeInsets.only(bottom: 0.0),
                                child: Align(
                                    alignment: Alignment.bottomCenter,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.only(
                                          bottomRight: Radius.circular(
                                            12,
                                          ),
                                          bottomLeft: Radius.circular(
                                            12,
                                          )),
                                      child: Container(
                                          width: double.infinity,
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 8, vertical: 12),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.all(Radius.circular(0)),
                                            color: Colors.black.withOpacity(.6),
                                          ),
                                          child: Text(
                                            categoryList[index].title,
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w500),
                                          )),
                                    )),
                              ),
                            ),
                          ));
                        },
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Popular",
                        style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
                      ),
                      SizedBox(
                        height: 12,
                      ),
                    ],
                  ),
                ),
                PopularItems(),
                SizedBox(
                  height: 70,
                ),
              ],
            ),
          ),
        );
      }
    );
  }
}

class CategoryItem {
  final String imgSrc;
  final String title;

  CategoryItem({required this.title, required this.imgSrc});
}

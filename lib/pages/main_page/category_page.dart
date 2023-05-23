import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:menu_say/constants/constant.dart';

import '../../model/category_item.dart';
import '../../widget/product_card.dart';

class CategoryPage extends StatefulWidget {
  static const routeName = "report-page";
  final String title;
  final String imgSrc;

  const CategoryPage({super.key, required this.title, required this.imgSrc});

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage>
    with SingleTickerProviderStateMixin {
  late ScrollController _scrollController;
  bool lastStatus = true;
  CategoryItem? menuList;

  _scrollListener() {
    if (isShrink != lastStatus) {
      setState(() {
        lastStatus = isShrink;
      });
    }
  }

  bool get isShrink {
    return _scrollController.hasClients &&
        _scrollController.offset > (200 - kToolbarHeight);
  }

  loadData() async {
    var response = await http
        .get(Uri.parse("https://menuserver-production.up.railway.app/23/menu"));
    print(response.body);

    menuList = CategoryItem.fromJson(jsonDecode(response.body));
    setState(() {});
  }

  @override
  void initState() {
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);
    loadData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).textTheme.bodyText1!.color == Colors.white;
    var size = MediaQuery.of(context).size;

    List<Widget> sections = [];

    return Scaffold(

      body: NestedScrollView(
          controller: _scrollController,
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                automaticallyImplyLeading: false,
                backgroundColor: Theme.of(context).primaryColor,
                title: Text(
                  widget.title,
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                elevation: .5,
                centerTitle: false,
                expandedHeight: size.height * .350,
                collapsedHeight: 60,
                pinned: true,
                floating: false,
                forceElevated: innerBoxIsScrolled,
                flexibleSpace: FlexibleSpaceBar(
                    background: Hero(
                  tag: widget.title,
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.black,
                        image: DecorationImage(
                          image: NetworkImage(
                            widget.imgSrc,
                          ),
                          fit: BoxFit.cover,
                          colorFilter: ColorFilter.mode(
                            Colors.black.withOpacity(.10),
                            BlendMode.xor,
                          ),
                        )),
                  ),
                )),
              ),
            ];
          },
          body: menuList == null
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : SingleChildScrollView(
                  physics: isShrink ? BouncingScrollPhysics() : ScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 12,
                      ),
                      ...menuList!.data.hotelMenu.first.itemList
                          .map((item) => ShopProductCard(
                        price: item.price.toString(),
                        image:   "https://images.unsplash.com/photo-1484723091739-30a097e8f929?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxleHBsb3JlLWZlZWR8MTN8fHxlbnwwfHx8fA%3D%3D&auto=format&fit=crop&w=700&q=60",
                          name: item.itemName,
                        productId: 11,
                        stock: "10",
                      ))
                          .toList()
                    ],
                  ),
                )),
    );
  }
}

class MenuCard extends StatelessWidget {
  final ItemList item;

  const MenuCard({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(

        padding: EdgeInsets.symmetric(horizontal: 12,),
      margin: EdgeInsets.only(left: 12, right: 12, bottom: 10),
      decoration: Constants().getDecoration(context: context),
      child: Column(
        children: [
          SizedBox(height: 12,),

          Row(
            children: [
              ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                  child: Image.network(
                    "https://images.unsplash.com/photo-1484723091739-30a097e8f929?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxleHBsb3JlLWZlZWR8MTN8fHxlbnwwfHx8fA%3D%3D&auto=format&fit=crop&w=700&q=60",
                    fit: BoxFit.fill,
                    height: 100,

                  )),
              SizedBox(
                width: 8,
              ),
              Text(
                item.itemName,
                style: TextStyle(
                    fontSize: 16, fontWeight: FontWeight.w500),
              ),

            ],
          ),

          Row(
            children: [
              Text("Price: 200"),
              Spacer(),
              ElevatedButton(onPressed: (){}, child: Text("Add to plat"))
            ],
          )
        ],
      ),
    );
  }
}

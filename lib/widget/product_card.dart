import 'package:flutter/material.dart';
import 'package:menu_say/widget/quantity_selector.dart';

import '../../constants/constant.dart';

class ShopProductCard extends StatefulWidget {
  final String stock;
  final String image;
  final String name;
  final int productId;
  final String price;

  const ShopProductCard({
    Key? key,
    required this.stock,
    required this.name,
    required this.image,
    required this.productId,
    required this.price,
  }) : super(key: key);

  @override
  State<ShopProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ShopProductCard> {
  List<String> tagList = ["Veg", "Soups", "Starter"];
  int quantity = 0;

  // 0 -> not favorite product
  // 1 -> favorite product
  // -1 -> changing state of product(loading indicator)
  int isFavourite = 0;

  bool addToCartLoading = false;


  getFormattedPromotion({required String title}) {
    List<String> promotion = title.split(" ");
    return "${promotion[0]} ${promotion[1]}\n${promotion[2]} ${promotion[3]}";
  }

  @override
  Widget build(BuildContext context) {
    bool leftBound = quantity == 0;
    bool rightBound = quantity >= int.parse(widget.stock) || quantity >= 100;

    buildTag() {
      return
      Wrap(
        children:
        tagList

          .map((tag) => Container(
                padding: EdgeInsets.all(8),
                margin: EdgeInsets.only(right: 12),
                decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor.withOpacity(.1),
                    borderRadius: BorderRadius.all(Radius.circular(8))),
                child: Text(tag),
              ))
          .toList());
    }

    return
        Container(
          margin: EdgeInsets.only(left: 8, right: 8,bottom: 12),
          padding: EdgeInsets.symmetric(horizontal: 16),
          decoration: Constants().getDecoration(context: context),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 22,
              ),
              IntrinsicHeight(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 1,
                      child: Container(
                          padding: EdgeInsets.all(0),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(
                            Radius.circular(8),
                          )),
                          child: ClipRRect(
                            borderRadius: BorderRadius.all(Radius.circular(12)),
                            child: Container(
                              child: Image.network(widget.image),
                            ),
                          )),
                    ),
                    SizedBox(
                      width: 12,
                    ),
                    Expanded(
                      flex: 4,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  widget.name,
                                  style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 16),
                                ),
                              ),
                              SizedBox(
                                width: 12,
                              ),

                            ],
                          ),

                          SizedBox(
                            height: 12,
                          ),
                          buildTag(),
                          SizedBox(
                            height: 8,
                          ),
                          Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry.")
                        ],
                      ),
                    )
                  ],
                ),
              ),

              SizedBox(
                height: 12,
              ),

              Row(
                children: [
                  Text("AED ${widget.price}",
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w700)),
                  Spacer(),
                  InkWell(
                    onTap: () {
                      if (!leftBound) {
                        setState(() {
                          quantity--;
                        });
                      }
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: leftBound
                              ? Theme.of(context).primaryColor.withOpacity(.5)
                              : Theme.of(context).primaryColor,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(8),
                            bottomLeft: Radius.circular(8),
                          )),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 2.0, vertical: 4),
                        child: Icon(
                          Icons.remove_rounded,
                          color: Colors.white,
                          size: 20,
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () async {
                      int? val = await showDialog(
                          context: context,
                          builder: (context) {
                            return QuantitySelector(
                              minVal: 0,
                              maxVal: int.parse(widget.stock) > 100
                                  ? 100
                                  : int.parse(widget.stock),
                              selectedVal: quantity,
                            );
                          });
                      if (val != null) {
                        setState(() {
                          quantity = val;
                        });
                      }
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 8),
                      height: 50,
                      child: Center(
                          child: Text(
                        quantity.toString(),
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          color: Theme.of(context).primaryColor,
                        ),
                      )),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      if (!rightBound) {
                        setState(() {
                          quantity++;
                        });
                      }
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: rightBound
                              ? Theme.of(context).primaryColor.withOpacity(.5)
                              : Theme.of(context).primaryColor,
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(8),
                            bottomRight: Radius.circular(8),
                          )),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 2.0, vertical: 4),
                        child: Icon(
                          Icons.add,
                          color: Colors.white,
                          size: 20,
                        ),
                      ),
                    ),
                  ),
                  Spacer(),
                  ElevatedButton(
                    onPressed: () async {
                      if (quantity == 0) {
                        Constants().getToast(title: "Please select quantity");
                      } else {
                        setState(() {
                          addToCartLoading = true;
                        });

                        setState(() {
                          addToCartLoading = false;
                        });
                      }
                    },
                    child: addToCartLoading
                        ? Container(
                            margin: EdgeInsets.symmetric(
                                horizontal: 18, vertical: 2),
                            height: 25,
                            width: 25,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              color: Colors.white,
                            ),
                          )
                        : Text(
                            "Add to cart",
                            style: TextStyle(color: Colors.white),
                          ),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Theme.of(context).primaryColor),
                  ),
                ],
              ),
              SizedBox(
                height: 12,
              ),
            ],
          ),
        );
  }
}

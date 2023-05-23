

import 'package:flutter/material.dart';

import '../../widget/product_card.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        color: Theme.of(context).primaryColor.withOpacity(.05),
        padding: EdgeInsets.symmetric(horizontal: 12,vertical: 12),
        child: Row(
          children: [
            Expanded(child: Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Total: ",style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                  color: Colors.black87
                ),),
                Text("₹123",style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 18

                ),),
              ],
            )),
            Expanded(child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: Size(40,45)
              ),
              onPressed: (){},
              child: Text("Place Order"),
            )),
          ],
        ),
      ),

    appBar: AppBar(title: Text("Cart")),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ShopProductCard(
            price: "122",
            image:   "https://images.unsplash.com/photo-1484723091739-30a097e8f929?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxleHBsb3JlLWZlZWR8MTN8fHxlbnwwfHx8fA%3D%3D&auto=format&fit=crop&w=700&q=60",
            name: "Pizza",
            productId: 11,
            stock: "10",
          ),

            ShopProductCard(
              price: "122",
              image:   "https://images.unsplash.com/photo-1484723091739-30a097e8f929?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxleHBsb3JlLWZlZWR8MTN8fHxlbnwwfHx8fA%3D%3D&auto=format&fit=crop&w=700&q=60",
              name: "Pizza",
              productId: 11,
              stock: "10",
            ),

            ShopProductCard(
              price: "122",
              image:   "https://images.unsplash.com/photo-1484723091739-30a097e8f929?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxleHBsb3JlLWZlZWR8MTN8fHxlbnwwfHx8fA%3D%3D&auto=format&fit=crop&w=700&q=60",
              name: "Pizza",
              productId: 11,
              stock: "10",
            ),

            ShopProductCard(
              price: "122",
              image:   "https://images.unsplash.com/photo-1484723091739-30a097e8f929?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxleHBsb3JlLWZlZWR8MTN8fHxlbnwwfHx8fA%3D%3D&auto=format&fit=crop&w=700&q=60",
              name: "Pizza",
              productId: 11,
              stock: "10",
            ),

          ],
        ),
      ),
    );
  }
}

class CartCard extends StatelessWidget {
  const CartCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(

    );
  }
}

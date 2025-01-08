import 'package:bloc_learn/data/cart_Items.dart';
import 'package:bloc_learn/features/cart/cart_bloc.dart';
import 'package:bloc_learn/features/home/models/home_product_data_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



class CartTileWidget extends StatelessWidget {
  final ProductDataModel productDataModel;
  const CartTileWidget({super.key, required this.productDataModel, required this.cartBloc});
  final CartBloc cartBloc;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.black)
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 200,
            width: double.infinity,
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(productDataModel.imageUrl))
            ),
          ),
          const SizedBox(height: 20),
          Text(productDataModel.name, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          Text(productDataModel.description),
          Row(
            children: [
              Text("\$"+ productDataModel.price.toString(), style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              Row(
                children: [
                  IconButton(
                      onPressed: () {
                       // homeBloc.add(HomeProductWishlistButtonClickedEvent(clickedProducts: productDataModel));
                      },
                      icon: Icon(Icons.favorite_border)),
                  IconButton(
                      onPressed: () {
                        cartBloc.add(CartRemoveFromCartEvent(productDataModel: productDataModel));
                      },
                      icon: Icon(Icons.shopping_bag)),
                  ElevatedButton(onPressed: (){
                    //Navigator.push(context, MaterialPageRoute(builder: (_)=> ))
                  }, child: Text("But Now"))

                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}

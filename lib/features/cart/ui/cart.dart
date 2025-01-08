import 'package:bloc_learn/features/cart/cart_bloc.dart';
import 'package:bloc_learn/features/cart/ui/cart_tile_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../home/ui/product_tile_widget.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  final CartBloc cartBloc = CartBloc();

  @override
  void initState() {
    // TODO: implement initState
    cartBloc.add(CartInitialEvent());
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Cart Items"),),
        body: BlocConsumer<CartBloc, CartState>(
          bloc: cartBloc,
          listener: (context, state) {
            if (state is CartRemovedActionState){
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Item Removed")));

            }

          },
          listenWhen: (previous, current) => current is CartActionState,
          buildWhen: (previous, current) => current is !CartActionState,
          builder: (context, state) {
            switch(state.runtimeType){
              case CartSuccessState:
                final successState = state as CartSuccessState;
                return ListView.builder(
            itemCount: successState.cartItems.length,
            itemBuilder: (context, index) {
            return CartTileWidget(productDataModel: successState.cartItems[index], cartBloc: cartBloc);
            });
            }
            return Container();
          },
        )
    );
  }
}

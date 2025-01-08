part of 'home_bloc.dart';

@immutable
sealed class HomeEvent {}

class HomeInitiaEvent extends HomeEvent{}

class HomeProductWishlistButtonClickedEvent extends HomeEvent{
  final ProductDataModel clickedProducts;

  HomeProductWishlistButtonClickedEvent({required this.clickedProducts});

}

class HomeProductCartButtonClickedEvent extends HomeEvent{
  final ProductDataModel clickedProducts;

  HomeProductCartButtonClickedEvent({required this.clickedProducts});

}

class HomeProductWishlistButtonNavigateEvent extends HomeEvent{

}

class HomeProductCartButtonNavigateEvent extends HomeEvent{

}

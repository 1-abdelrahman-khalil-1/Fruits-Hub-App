import 'package:fruitsapp/Core/model/productmodel.dart';

abstract class SearchState {}

class SearchInitial extends SearchState {}

class SearchLoading extends SearchState {}

class SearchSuccess extends SearchState {
  final List<Productmodel> products;
  final String searchQuery;

  SearchSuccess(this.products, this.searchQuery);
}

class SearchError extends SearchState {
  final String message;

  SearchError({required this.message});
}
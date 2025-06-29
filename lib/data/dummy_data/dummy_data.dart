import 'package:equatable/equatable.dart';

import '../models/personalize/personalize_model.dart';

class DummyDashboardModel extends Equatable {
  final String image;
  final String name;

  const DummyDashboardModel({required this.name, required this.image});

  @override
  List<Object?> get props => [image, name];
}

class CategoryNameId extends Equatable {
  final int id;
  final String name;

  const CategoryNameId({required this.id, required this.name});

  @override
  List<Object?> get props => [id, name];
}

final List<CategoryNameId> categoryId = [
  const CategoryNameId(id: 1, name: 'Electronics'),
  const CategoryNameId(id: 2, name: 'Game'),
  const CategoryNameId(id: 3, name: 'Mobile'),
  const CategoryNameId(id: 4, name: 'Life Style'),
  const CategoryNameId(id: 5, name: 'Babies & Toys'),
  const CategoryNameId(id: 6, name: 'Bike'),
  const CategoryNameId(id: 7, name: "Men's Fasion"),
  const CategoryNameId(id: 8, name: 'Woman Fasion'),
  const CategoryNameId(id: 9, name: 'Talevision'),
  const CategoryNameId(id: 10, name: 'Accessories'),
  const CategoryNameId(id: 11, name: 'John Doe'),
];

class ProductStatusModel extends Equatable {
  final String title;
  final String id;

  const ProductStatusModel({required this.id, required this.title});

  @override
  List<Object?> get props => [id, title];
}

final List<ProductStatusModel> productStatusModel = [
  const ProductStatusModel(id: '1', title: 'Active'),
  const ProductStatusModel(id: '0', title: 'Inactive'),
];


final List<PersonalizeModel> personalizes = [
  const PersonalizeModel(name: 'Action', image: 'assets/images/p01.png',likes: 4324),
  const PersonalizeModel(name: 'Adventure', image: 'assets/images/p02.png',likes: 2592),
  const PersonalizeModel(name: 'Comedy', image: 'assets/images/p03.png',likes: 920),
  const PersonalizeModel(name: 'Drama', image: 'assets/images/p04.png',likes: 1423),
  const PersonalizeModel(name: 'Thee Good Dinosaur', image: 'assets/images/p05.png',likes: 1423),
  const PersonalizeModel(name: 'Thee Good Dinosaur', image: 'assets/images/p06.png',likes: 1423),
];

final List<PersonalizeModel> topCharts = [
  const PersonalizeModel(name: 'Legend', image: 'assets/images/chart01.png',rating: 8.4,year: 2016,duration: '1h 54m'),
  const PersonalizeModel(name: 'Thee Good Dinosaur', image: 'assets/images/chart02.png',rating: 8.4,year: 2016,duration: '1h 54m'),
  const PersonalizeModel(name: 'Soul', image: 'assets/images/chart03.png',rating: 8.4,year: 2016,duration: '1h 54m'),
  const PersonalizeModel(name: 'Brave', image: 'assets/images/chart04.png',rating: 8.4,year: 2016,duration: '1h 54m'),
];

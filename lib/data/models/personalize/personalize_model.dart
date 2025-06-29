import 'package:equatable/equatable.dart';

class PersonalizeModel extends Equatable {
  final String image;
  final String name;
  final int likes;
  final int year;
  final String duration;
  final double rating;

  const PersonalizeModel({this.image = '', this.name = '', this.likes = 0,this.year = 0,this.duration = '',this.rating = 0.0});

  PersonalizeModel copyWith({String? image, String? name, int? likes,int? year,String? duration,double ? rating}) {
    return PersonalizeModel(
      image: image ?? this.image,
      name: name ?? this.name,
      likes: likes ?? this.likes,
      year: year ?? this.year,
      duration: duration ?? this.duration,
      rating: rating ?? this.rating,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [image, name, likes,year,duration,rating];
  }
}

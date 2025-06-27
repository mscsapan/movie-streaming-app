import 'package:equatable/equatable.dart';

class PersonalizeModel extends Equatable {
  final String image;
  final String name;
  final int likes;

  const PersonalizeModel({this.image = '', this.name = '', this.likes = 0});

  PersonalizeModel copyWith({String? image, String? name, int? likes}) {
    return PersonalizeModel(
      image: image ?? this.image,
      name: name ?? this.name,
      likes: likes ?? this.likes,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [image, name, likes];
  }
}

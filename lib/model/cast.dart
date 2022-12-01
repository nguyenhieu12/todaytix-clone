import 'dart:convert';

class Cast {
  String name;
  String profileURL;
  String character;

  Cast({
    required this.name,
    required this.profileURL,
    required this.character,
  });

  factory Cast.fromMap(Map<String, dynamic> map) {
    return Cast(
      name: map['name'] ?? '',
      profileURL: map['profile_path'] ?? '',
      character: map['character'] ?? '',
    );
  }
}

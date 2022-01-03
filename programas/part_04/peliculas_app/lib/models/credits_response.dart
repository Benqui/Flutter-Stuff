// To parse this JSON data, do
//
//     final creditsResponse = creditsResponseFromMap(jsonString);

import 'dart:convert';

class CreditsResponse {
  CreditsResponse({
    required this.id,
    required this.cast,
    required this.crew,
  });

  int id;
  List<Cast> cast;
  List<Cast> crew;

  factory CreditsResponse.fromJson(String str) =>
      CreditsResponse.fromMap(json.decode(str));

  // String toJson() => json.encode(toMap());

  factory CreditsResponse.fromMap(Map<String, dynamic> json) => CreditsResponse(
        id: json["id"],
        cast: List<Cast>.from(json["cast"].map((x) => Cast.fromMap(x))),
        crew: List<Cast>.from(json["crew"].map((x) => Cast.fromMap(x))),
      );

  // Map<String, dynamic> toMap() => {
  //     "id": id,
  //     "cast": List<dynamic>.from(cast.map((x) => x.toMap())),
  //     "crew": List<dynamic>.from(crew.map((x) => x.toMap())),
  // };
}

class Cast {
  Cast({
    required this.adult,
    required this.gender,
    required this.id,
    required this.knownForDepartment,
    required this.name,
    required this.originalName,
    required this.popularity,
    required this.creditId,
    this.profilePath,
    this.castId,
    this.character,
    this.order,
    this.department,
    this.job,
  });

  bool adult;
  int gender;
  int id;
  String knownForDepartment;
  String name;
  String originalName;
  double popularity;
  String? profilePath;
  int? castId;
  String? character;
  String creditId;
  int? order;
  String? department;
  String? job;

  get fullProfilePath {
    if (profilePath != null) {
      return 'https://image.tmdb.org/t/p/w500$profilePath';
    }
    return 'https://i.stack.imgur.com/GNhxO.png';
  }

  factory Cast.fromJson(String str) => Cast.fromMap(json.decode(str));

  // String toJson() => json.encode(toMap());

  factory Cast.fromMap(Map<String, dynamic> json) => Cast(
        adult: json["adult"],
        gender: json["gender"],
        id: json["id"],
        knownForDepartment: json["known_for_department"].toString(),
        name: json["name"],
        originalName: json["original_name"],
        popularity: json["popularity"].toDouble(),
        profilePath: json["profile_path"] == null ? null : json["profile_path"],
        castId: json["cast_id"] == null ? null : json["cast_id"],
        character: json["character"] == null ? null : json["character"],
        creditId: json["credit_id"],
        order: json["order"] == null ? null : json["order"],
        department: json["department"] == null ? null : json["department"],
        job: json["job"] ?? null,
      );

//     Map<String, dynamic> toMap() => {
//         "adult": adult,
//         "gender": gender,
//         "id": id,
//         "known_for_department": departmentValues.reverse[knownForDepartment],
//         "name": name,
//         "original_name": originalName,
//         "popularity": popularity,
//         "profile_path": profilePath == null ? null : profilePath,
//         "cast_id": castId == null ? null : castId,
//         "character": character == null ? null : character,
//         "credit_id": creditId,
//         "order": order == null ? null : order,
//         "department": department == null ? null : departmentValues.reverse[department],
//         "job": job == null ? null : job,
//     };
// }

// enum Department { ACTING, COSTUME_MAKE_UP, PRODUCTION, WRITING, SOUND, ART, CAMERA, DIRECTING, CREW, VISUAL_EFFECTS }

// final departmentValues = EnumValues({
//     "Acting": Department.ACTING,
//     "Art": Department.ART,
//     "Camera": Department.CAMERA,
//     "Costume & Make-Up": Department.COSTUME_MAKE_UP,
//     "Crew": Department.CREW,
//     "Directing": Department.DIRECTING,
//     "Production": Department.PRODUCTION,
//     "Sound": Department.SOUND,
//     "Visual Effects": Department.VISUAL_EFFECTS,
//     "Writing": Department.WRITING
// });

// class EnumValues<T> {
//     Map<String, T> map;
//     Map<T, String> reverseMap;

//     EnumValues(this.map);

//     Map<T, String> get reverse {
//         if (reverseMap == null) {
//             reverseMap = map.map((k, v) => new MapEntry(v, k));
//         }
//         return reverseMap;
//     }
}

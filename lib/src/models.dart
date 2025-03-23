// To parse this JSON data, do
//
//     final charactersHp = charactersHpFromJson(jsonString);

import 'dart:convert';

List<CharactersHp> charactersHpFromJson(String str) => List<CharactersHp>.from(
    json.decode(str).map((x) => CharactersHp.fromJson(x)));

String charactersHpToJson(List<CharactersHp> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CharactersHp {
  String id;
  String name;
  List<String> alternateNames;
  Species species;
  Gender gender;
  House house;
  String? dateOfBirth;
  int? yearOfBirth;
  bool wizard;
  Ancestry ancestry;
  EyeColour eyeColour;
  HairColour hairColour;
  Wand wand;
  Patronus patronus;
  bool hogwartsStudent;
  bool hogwartsStaff;
  String actor;
  List<String> alternateActors;
  bool alive;
  String image;

  CharactersHp({
    required this.id,
    required this.name,
    required this.alternateNames,
    required this.species,
    required this.gender,
    required this.house,
    required this.dateOfBirth,
    required this.yearOfBirth,
    required this.wizard,
    required this.ancestry,
    required this.eyeColour,
    required this.hairColour,
    required this.wand,
    required this.patronus,
    required this.hogwartsStudent,
    required this.hogwartsStaff,
    required this.actor,
    required this.alternateActors,
    required this.alive,
    required this.image,
  });

  factory CharactersHp.fromJson(Map<String, dynamic> json) => CharactersHp(
        id: json["id"],
        name: json["name"],
        alternateNames: json["alternate_names"] == null
            ? [] // Si es nulo, asigna una lista vacía
            : List<String>.from(json["alternate_names"].map((x) => x)),
        species: speciesValues.map[json["species"]] ??
            Species.HUMAN, // Valor por defecto
        gender: genderValues.map[json["gender"]] ??
            Gender.MALE, // Valor por defecto
        house:
            houseValues.map[json["house"]] ?? House.EMPTY, // Valor por defecto
        dateOfBirth:
            json["dateOfBirth"] ?? "Unknown", // Si es nulo, asigna "Unknown"
        yearOfBirth: json["yearOfBirth"], // Ya es nullable, no necesita cambios
        wizard: json["wizard"],
        ancestry: ancestryValues.map[json["ancestry"]]!,
        eyeColour: eyeColourValues.map[json["eyeColour"]]!,
        hairColour: hairColourValues.map[json["hairColour"]]!,
        wand: Wand.fromJson(json["wand"]),
        patronus: patronusValues.map[json["patronus"]]!,
        hogwartsStudent: json["hogwartsStudent"],
        hogwartsStaff: json["hogwartsStaff"],
        actor: json["actor"],
        alternateActors: json["alternate_actors"] == null
            ? [] // Si es nulo, asigna una lista vacía
            : List<String>.from(json["alternate_actors"].map((x) => x)),
        alive: json["alive"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "alternate_names": List<dynamic>.from(alternateNames.map((x) => x)),
        "species": speciesValues.reverse[species],
        "gender": genderValues.reverse[gender],
        "house": houseValues.reverse[house],
        "dateOfBirth": dateOfBirth,
        "yearOfBirth": yearOfBirth,
        "wizard": wizard,
        "ancestry": ancestryValues.reverse[ancestry],
        "eyeColour": eyeColourValues.reverse[eyeColour],
        "hairColour": hairColourValues.reverse[hairColour],
        "wand": wand.toJson(),
        "patronus": patronusValues.reverse[patronus],
        "hogwartsStudent": hogwartsStudent,
        "hogwartsStaff": hogwartsStaff,
        "actor": actor,
        "alternate_actors": List<dynamic>.from(alternateActors.map((x) => x)),
        "alive": alive,
        "image": image,
      };
}

enum Ancestry {
  EMPTY,
  HALF_BLOOD,
  HALF_VEELA,
  MUGGLE,
  MUGGLEBORN,
  PURE_BLOOD,
  QUARTER_VEELA,
  SQUIB
}

final ancestryValues = EnumValues({
  "": Ancestry.EMPTY,
  "half-blood": Ancestry.HALF_BLOOD,
  "half-veela": Ancestry.HALF_VEELA,
  "muggle": Ancestry.MUGGLE,
  "muggleborn": Ancestry.MUGGLEBORN,
  "pure-blood": Ancestry.PURE_BLOOD,
  "quarter-veela": Ancestry.QUARTER_VEELA,
  "squib": Ancestry.SQUIB
});

enum EyeColour {
  AMBER,
  BLACK,
  BLUE,
  BROWN,
  DARK,
  EMPTY,
  GREEN,
  GREY,
  HAZEL,
  ORANGE,
  PALE_SILVERY,
  RED,
  WHITE,
  YELLOW,
  YELLOWISH
}

final eyeColourValues = EnumValues({
  "amber": EyeColour.AMBER,
  "black": EyeColour.BLACK,
  "blue": EyeColour.BLUE,
  "brown": EyeColour.BROWN,
  "dark": EyeColour.DARK,
  "": EyeColour.EMPTY,
  "green": EyeColour.GREEN,
  "grey": EyeColour.GREY,
  "hazel": EyeColour.HAZEL,
  "orange": EyeColour.ORANGE,
  "pale, silvery": EyeColour.PALE_SILVERY,
  "red": EyeColour.RED,
  "white": EyeColour.WHITE,
  "yellow": EyeColour.YELLOW,
  "yellowish": EyeColour.YELLOWISH
});

enum Gender { FEMALE, MALE }

final genderValues = EnumValues({"female": Gender.FEMALE, "male": Gender.MALE});

enum HairColour {
  BALD,
  BLACK,
  BLOND,
  BLONDE,
  BROWN,
  DARK,
  DULL,
  EMPTY,
  GINGER,
  GREY,
  RED,
  SANDY,
  SILVER,
  TAWNY,
  WHITE
}

final hairColourValues = EnumValues({
  "bald": HairColour.BALD,
  "black": HairColour.BLACK,
  "blond": HairColour.BLOND,
  "blonde": HairColour.BLONDE,
  "brown": HairColour.BROWN,
  "dark": HairColour.DARK,
  "dull": HairColour.DULL,
  "": HairColour.EMPTY,
  "ginger": HairColour.GINGER,
  "grey": HairColour.GREY,
  "red": HairColour.RED,
  "sandy": HairColour.SANDY,
  "silver": HairColour.SILVER,
  "tawny": HairColour.TAWNY,
  "white": HairColour.WHITE
});

enum House { EMPTY, GRYFFINDOR, HUFFLEPUFF, RAVENCLAW, SLYTHERIN }

final houseValues = EnumValues({
  "": House.EMPTY,
  "Gryffindor": House.GRYFFINDOR,
  "Hufflepuff": House.HUFFLEPUFF,
  "Ravenclaw": House.RAVENCLAW,
  "Slytherin": House.SLYTHERIN
});

enum Patronus {
  BOAR,
  DOE,
  EMPTY,
  GOAT,
  HARE,
  HORSE,
  JACK_RUSSELL_TERRIER,
  LYNX,
  NON_CORPOREAL,
  OTTER,
  PERSIAN_CAT,
  STAG,
  SWAN,
  TABBY_CAT,
  WEASEL,
  WOLF
}

final patronusValues = EnumValues({
  "boar": Patronus.BOAR,
  "doe": Patronus.DOE,
  "": Patronus.EMPTY,
  "goat": Patronus.GOAT,
  "hare": Patronus.HARE,
  "horse": Patronus.HORSE,
  "Jack Russell terrier": Patronus.JACK_RUSSELL_TERRIER,
  "lynx": Patronus.LYNX,
  "Non-Corporeal": Patronus.NON_CORPOREAL,
  "otter": Patronus.OTTER,
  "persian cat": Patronus.PERSIAN_CAT,
  "stag": Patronus.STAG,
  "swan": Patronus.SWAN,
  "tabby cat": Patronus.TABBY_CAT,
  "weasel": Patronus.WEASEL,
  "wolf": Patronus.WOLF
});

enum Species {
  ACROMANTULA,
  CAT,
  CENTAUR,
  DRAGON,
  GHOST,
  GIANT,
  GOBLIN,
  HALF_GIANT,
  HALF_HUMAN,
  HIPPOGRIFF,
  HOUSE_ELF,
  HUMAN,
  OWL,
  POLTERGEIST,
  THREE_HEADED_DOG,
  VAMPIRE,
  WEREWOLF
}

final speciesValues = EnumValues({
  "acromantula": Species.ACROMANTULA,
  "cat": Species.CAT,
  "centaur": Species.CENTAUR,
  "dragon": Species.DRAGON,
  "ghost": Species.GHOST,
  "giant": Species.GIANT,
  "goblin": Species.GOBLIN,
  "half-giant": Species.HALF_GIANT,
  "half-human": Species.HALF_HUMAN,
  "hippogriff": Species.HIPPOGRIFF,
  "house-elf": Species.HOUSE_ELF,
  "human": Species.HUMAN,
  "owl": Species.OWL,
  "poltergeist": Species.POLTERGEIST,
  "three-headed dog": Species.THREE_HEADED_DOG,
  "vampire": Species.VAMPIRE,
  "werewolf": Species.WEREWOLF
});

class Wand {
  Wood wood;
  Core core;
  double? length;

  Wand({
    required this.wood,
    required this.core,
    required this.length,
  });

  factory Wand.fromJson(Map<String, dynamic> json) => Wand(
        wood: woodValues.map[json["wood"]]!,
        core: coreValues.map[json["core"]]!,
        length: json["length"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "wood": woodValues.reverse[wood],
        "core": coreValues.reverse[core],
        "length": length,
      };
}

enum Core {
  DRAGON_HEARTSTRING,
  EMPTY,
  PHOENIX_FEATHER,
  UNICORN_HAIR,
  UNICORN_TAIL_HAIR
}

final coreValues = EnumValues({
  "dragon heartstring": Core.DRAGON_HEARTSTRING,
  "": Core.EMPTY,
  "phoenix feather": Core.PHOENIX_FEATHER,
  "unicorn hair": Core.UNICORN_HAIR,
  "unicorn tail-hair": Core.UNICORN_TAIL_HAIR
});

enum Wood {
  ASH,
  BIRCH,
  CEDAR,
  CHERRY,
  CHESTNUT,
  CYPRESS,
  ELM,
  EMPTY,
  FIR,
  HAWTHORN,
  HOLLY,
  HORNBEAM,
  LARCH,
  MAHOGANY,
  OAK,
  VINE,
  WALNUT,
  WILLOW,
  YEW
}

final woodValues = EnumValues({
  "ash": Wood.ASH,
  "birch": Wood.BIRCH,
  "cedar": Wood.CEDAR,
  "cherry": Wood.CHERRY,
  "chestnut": Wood.CHESTNUT,
  "cypress": Wood.CYPRESS,
  "elm": Wood.ELM,
  "": Wood.EMPTY,
  "fir": Wood.FIR,
  "hawthorn": Wood.HAWTHORN,
  "holly": Wood.HOLLY,
  "hornbeam": Wood.HORNBEAM,
  "larch": Wood.LARCH,
  "mahogany": Wood.MAHOGANY,
  "oak": Wood.OAK,
  "vine": Wood.VINE,
  "walnut": Wood.WALNUT,
  "willow": Wood.WILLOW,
  "yew": Wood.YEW
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}

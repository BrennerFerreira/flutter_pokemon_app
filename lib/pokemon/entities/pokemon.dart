class Pokemon {
  late int id;
  late String num;
  late String name;
  late String img;
  late List<String> type;
  late String height;
  late String weight;
  late String candy;
  int candyCount = 0;
  late String egg;
  late double spawnChance;
  late double avgSpawns;
  late String spawnTime;
  List<double> multipliers = [];
  late List<String> weaknesses;
  List<NextEvolution>? nextEvolution = [];
  List<PrevEvolution>? prevEvolution = [];

  Pokemon({
    required this.id,
    required this.num,
    required this.name,
    required this.img,
    required this.type,
    required this.height,
    required this.weight,
    required this.candy,
    this.candyCount = 0,
    required this.egg,
    required this.spawnChance,
    required this.avgSpawns,
    required this.spawnTime,
    this.multipliers = const [],
    required this.weaknesses,
    this.nextEvolution = const [],
    this.prevEvolution = const [],
  });

  Pokemon.fromJson(Map<String, dynamic> json) {
    id = json['id'] as int;
    num = json['num'] as String;
    name = json['name'] as String;
    img = json['img'] as String;
    type = (json['type'] as List).cast<String>();
    height = json['height'] as String;
    weight = json['weight'] as String;
    candy = json['candy'] as String;
    candyCount = (json['candy_count'] ?? 0) as int;
    egg = json['egg'] as String;
    spawnChance = json['spawn_chance'] * 1.0 as double;
    avgSpawns = json['avg_spawns'] * 1.0 as double;
    spawnTime = json['spawn_time'] as String;
    multipliers = ((json['multipliers'] ?? []) as List).cast<double>();
    weaknesses = (json['weaknesses'] as List).cast<String>();

    if (json['next_evolution'] != null) {
      nextEvolution = <NextEvolution>[];

      final nextEvolutionListJson = List<Map<String, dynamic>>.from(
          json['next_evolution'] as List<dynamic>);

      for (final evolution in nextEvolutionListJson) {
        nextEvolution?.add(NextEvolution.fromJson(evolution));
      }
    }

    if (json['prev_evolution'] != null) {
      prevEvolution = <PrevEvolution>[];
      final prevEvolutionListJson = List<Map<String, dynamic>>.from(
          json['prev_evolution'] as List<dynamic>);

      for (final evolution in prevEvolutionListJson) {
        prevEvolution?.add(PrevEvolution.fromJson(evolution));
      }
    }
  }

  static List<Pokemon> fromJsonList(Map<String, dynamic> json) {
    final pokemonList = <Pokemon>[];

    if (json['pokemon'] != null) {
      final pokemonListJson =
          List<Map<String, dynamic>>.from(json['pokemon'] as List<dynamic>);

      for (final pokemon in pokemonListJson) {
        pokemonList.add(Pokemon.fromJson(pokemon));
      }
    }

    return pokemonList;
  }
}

class NextEvolution {
  late String num;
  late String name;

  NextEvolution({required this.num, required this.name});

  NextEvolution.fromJson(Map<String, dynamic> json) {
    num = json['num'] as String;
    name = json['name'] as String;
  }
}

class PrevEvolution {
  late String num;
  late String name;

  PrevEvolution({required this.num, required this.name});

  PrevEvolution.fromJson(Map<String, dynamic> json) {
    num = json['num'] as String;
    name = json['name'] as String;
  }
}

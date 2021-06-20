import 'package:pokemon_app/pokemon/entities/pokemon.dart';

// ignore: avoid_classes_with_only_static_members
class PokemonMock {
  static final pokemonCompleteMock = Pokemon(
    id: 2,
    num: "002",
    name: "Ivysaur",
    img: "http://www.serebii.net/pokemongo/pokemon/002.png",
    type: ["Grass", "Poison"],
    height: "0.99 m",
    weight: "13.0 kg",
    candy: "Bulbasaur Candy",
    candyCount: 100,
    egg: "Not in Eggs",
    spawnChance: 0.042,
    avgSpawns: 4.2,
    spawnTime: "07:00",
    multipliers: [1.2, 1.6],
    weaknesses: ["Fire", "Ice", "Flying", "Psychic"],
    prevEvolution: [
      PrevEvolution(num: "001", name: "Bulbasaur"),
    ],
    nextEvolution: [
      NextEvolution(num: "003", name: "Venusaur"),
    ],
  );

  static final pokemonWithoutMultipliersMock = Pokemon(
    id: 3,
    num: "003",
    name: "Venusaur",
    img: "http://www.serebii.net/pokemongo/pokemon/003.png",
    type: ["Grass", "Poison"],
    height: "2.01 m",
    weight: "100.0 kg",
    candy: "Bulbasaur Candy",
    egg: "Not in Eggs",
    spawnChance: 0.017,
    avgSpawns: 1.7,
    spawnTime: "11:30",
    weaknesses: ["Fire", "Ice", "Flying", "Psychic"],
    prevEvolution: [
      PrevEvolution(num: "001", name: "Bulbasaur"),
      PrevEvolution(num: "002", name: "Ivysaur"),
    ],
  );

  static final pokemonWithoutPrevEvolutionMock = Pokemon(
    id: 1,
    num: "001",
    name: "Bulbasaur",
    img: "http://www.serebii.net/pokemongo/pokemon/001.png",
    type: ["Grass", "Poison"],
    height: "0.71 m",
    weight: "6.9 kg",
    candy: "Bulbasaur Candy",
    candyCount: 25,
    egg: "2 km",
    spawnChance: 0.69,
    avgSpawns: 69,
    spawnTime: "20:00",
    multipliers: [1.58],
    weaknesses: ["Fire", "Ice", "Flying", "Psychic"],
    nextEvolution: [
      NextEvolution(num: "002", name: "Ivysaur"),
      NextEvolution(num: "003", name: "Venusaur")
    ],
  );

  static final pokemonWithoutNextEvolutionMock = Pokemon(
    id: 9,
    num: "009",
    name: "Blastoise",
    img: "http://www.serebii.net/pokemongo/pokemon/009.png",
    type: ["Water"],
    height: "1.60 m",
    weight: "85.5 kg",
    candy: "Squirtle Candy",
    egg: "Not in Eggs",
    spawnChance: 0.0067,
    avgSpawns: 0.67,
    spawnTime: "00:06",
    weaknesses: ["Electric", "Grass"],
    prevEvolution: [
      PrevEvolution(num: "007", name: "Squirtle"),
      PrevEvolution(num: "008", name: "Wartortle"),
    ],
  );
}

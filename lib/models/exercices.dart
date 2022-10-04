class Exercices {
  final String id;
  final String imageExplanation;
  final String name;
  final int rounds;
  final int time;
  final int restTime;
  String? obs;

  Exercices(
      {required this.id,
      required this.imageExplanation,
      required this.name,
      required this.rounds,
      required this.time,
      required this.restTime});
}

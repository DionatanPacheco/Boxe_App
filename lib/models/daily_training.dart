import 'package:boxe_app/models/Exercices.dart';

class DailyTraining {
  final String id;
  final String name;
  late List<Exercices> listExercices;
  String? obs;
  DailyTraining({required this.id, required this.name});
}

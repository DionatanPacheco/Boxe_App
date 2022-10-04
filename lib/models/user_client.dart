import 'package:boxe_app/models/training_bolck.dart';
import 'package:boxe_app/models/user_abstract.dart';

class UserClient extends AbstractUser {
  String? uniqueCodeClient;
  late List<TrainingBlock> listTrainingBlock;

  UserClient(String s,
      {required String id,
      required String name,
      required String mail,
      required String cpf,
      required String birthDate})
      : super(s,
            id: id, name: name, mail: mail, cpf: cpf, birthDate: birthDate);
}

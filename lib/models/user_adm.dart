// ignore_for_file: avoid_types_as_parameter_names

import 'package:boxe_app/models/user_abstract.dart';
import 'package:boxe_app/models/user_trainner.dart';

class UserAdm extends AbstractUser {
  late final String? gymName;
  late final String? gymLogoImg;

  late List<int> listTrainerIds;
  late List<UserTrainer> listUserTrainers;

  UserAdm(String s,
      {required String id,
      required String name,
      required String mail,
      required String cpf,
      required String birthDate})
      : super(s,
            id: id, name: name, mail: mail, cpf: cpf, birthDate: birthDate);
}

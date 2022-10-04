import 'package:boxe_app/models/user_abstract.dart';
import 'package:boxe_app/models/user_client.dart';

class UserTrainer extends AbstractUser {
  // Lista de ids dos clientes (API)
  late bool isWhithGym;

  late List<int> listClientsIds;
  // Lista dos Clientes
  late List<UserClient> listClients;

  UserTrainer(String s,
      {required String id,
      required String name,
      required String mail,
      required String cpf,
      required String birthDate})
      : super(s,
            id: id, name: name, mail: mail, cpf: cpf, birthDate: birthDate);
}

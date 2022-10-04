abstract class AbstractUser {
  final String id;
  final String name;
  final String mail;
  final String cpf;
  final String birthDate;
  String? obs;
  AbstractUser(String s,
      {required this.id,
      required this.name,
      required this.mail,
      required this.cpf,
      required this.birthDate});
}

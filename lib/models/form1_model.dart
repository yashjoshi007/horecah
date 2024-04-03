class UserModel {
  String? name;
  String? email;
  String? phone;
  String? city;
  List<String>? languages;
  String? about;
  String? profileLink;

  UserModel({
    this.name = '',
    this.email = '',
    this.phone = '',
    this.city = '',
    this.languages ,
    this.about = '',
    this.profileLink = '',
  });
}

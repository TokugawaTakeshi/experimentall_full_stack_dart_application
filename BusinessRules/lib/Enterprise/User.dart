class User {

  String familyName;
  String givenName;


  User({ required String this.familyName, required String this.givenName });


  String get formattedFullName => "${this.familyName} ${this.givenName}";
}

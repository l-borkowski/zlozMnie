///
enum ClientType {
  ///
  jdg,

  ///
  company,

  ///
  person,
}

///
extension ClientTypeX on ClientType {
  ///
  String get toName {
    switch (this) {
      case ClientType.person:
        return 'Osoba Fizyczna';
      case ClientType.jdg:
        return 'Firma';
      case ClientType.company:
        return 'JDG';
    }
  }
}

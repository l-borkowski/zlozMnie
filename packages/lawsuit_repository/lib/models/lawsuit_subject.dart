/// {@template lawsuit_subject}
/// LawsuitSubject object
/// {@endtemplate}
class LawsuitSubject {
  /// {@macro lawsuit_subject}
  const LawsuitSubject({
    required this.id,
    required this.title,
    required this.body,
  });

  /// Maps json to map to LawsuitSubject object
  factory LawsuitSubject.fromJson(Map<String, dynamic> map) {
    return LawsuitSubject(
      id: map['id'] as int,
      title: map['title'] as String,
      body: map['title'] as String,
    );
  }

  /// Id of the option
  final int id;

  /// Title of the option
  final String title;

  /// Description of the option
  final String body;
}

part of 'form_cubit.dart';

class FormState {
  const FormState({
    required this.pageIndex,
    required this.reverse,
    required this.subjectId,
    required this.lawsuitSubjects,
  });

  factory FormState.initial() => const FormState(
        pageIndex: 0,
        reverse: false,
        subjectId: -1,
        lawsuitSubjects: [],
      );

  final int pageIndex;
  final bool reverse;
  final int subjectId;
  final List<LawsuitSubject> lawsuitSubjects;

  FormState copyWith({
    int? pageIndex,
    bool? reverse,
    int? subjectId,
    List<LawsuitSubject>? lawsuitSubjects,
  }) {
    return FormState(
      pageIndex: pageIndex ?? this.pageIndex,
      reverse: reverse ?? this.reverse,
      subjectId: subjectId ?? this.subjectId,
      lawsuitSubjects: lawsuitSubjects ?? this.lawsuitSubjects,
    );
  }
}

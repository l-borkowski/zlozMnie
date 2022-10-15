import 'package:flutter/material.dart';
import 'package:lawsuit_repository/models/lawsuit_subject.dart';

class LawsuitSubjectTile extends StatelessWidget {
  const LawsuitSubjectTile(
    this.lawsuitSubject, {
    super.key,
  });

  final LawsuitSubject lawsuitSubject;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(lawsuitSubject.title),
    );
  }
}

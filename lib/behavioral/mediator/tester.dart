import 'package:pattern/behavioral/mediator/team_member.dart';

final class Tester extends TeamMember {
  Tester({required super.name});

  @override
  String toString() => '$name(QA)';
}

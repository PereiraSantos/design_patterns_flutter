import 'package:pattern/behavioral/mediator/notification_hub.dart';
import 'package:pattern/behavioral/mediator/team_member.dart';

class TeamNotificationHub implements NotificationHub {
  TeamNotificationHub({List<TeamMember>? members}) {
    members?.forEach(register);
  }

  final _teamMembers = <TeamMember>[];

  @override
  List<TeamMember> getTeamMembers() => _teamMembers;

  @override
  void register(TeamMember member) {
    member.notificationHub = this;

    _teamMembers.add(member);
  }

  @override
  void send(TeamMember sender, String message) {
    final filterMembers = _teamMembers.where((m) => m != sender);

    for (final member in filterMembers) {
      member.receive(sender.toString(), message);
    }
  }

  @override
  void sendTo<T extends TeamMember>(TeamMember sender, String message) {
    final filterMembers = _teamMembers.where((m) => m != sender).whereType<T>();

    for (final member in filterMembers) {
      member.receive(sender.toString(), message);
    }
  }
}

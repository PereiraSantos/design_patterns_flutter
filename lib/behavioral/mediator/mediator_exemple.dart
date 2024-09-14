import 'dart:math';

import 'package:flutter/material.dart';
import 'package:pattern/behavioral/mediator/admin.dart';
import 'package:pattern/behavioral/mediator/developer.dart';
import 'package:pattern/behavioral/mediator/notification_hub.dart';
import 'package:pattern/behavioral/mediator/team_notification_hub.dart';
import 'package:pattern/behavioral/mediator/tester.dart';

class MediatorExemple extends StatefulWidget {
  const MediatorExemple({super.key});

  @override
  State<MediatorExemple> createState() => _MediatorExempleState();
}

class _MediatorExempleState extends State<MediatorExemple> {
  late final NotificationHub _notificationHub;
  final _admnin = Admin(name: 'God');

  @override
  void initState() {
    super.initState();

    final members = [
      _admnin,
      Developer(name: 'Sea Sharp'),
      Developer(name: 'Jan Assembler'),
      Developer(name: 'Dove Dart'),
      Tester(name: 'Cori debugger'),
      Tester(name: 'Tania Mocha'),
    ];

    _notificationHub = TeamNotificationHub(members: members);
  }

  void _sendToAll() => setState(() {
        _admnin.send('Hello');
      });

  void _senToQa() => setState(() {
        _admnin.sendTo<Tester>('BUG');
      });

  void sendToDeveloper() => setState(() {
        _admnin.sendTo<Developer>('Hello world');
      });

  void _addTeamMember() {
    final name = Random().nextInt(259).toString();
    final teamMember = Random().nextBool() ? Tester(name: name) : Developer(name: name);

    setState(() {
      _notificationHub.register(teamMember);
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

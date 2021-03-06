import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:valorant_tips/constants/app_colors.dart';
import 'package:valorant_tips/network/agent_client.dart';
import 'package:valorant_tips/widgets/agents_screen/Agent/agent_list.dart';

import '../models/agent.dart';

class AgentsScreen extends StatefulWidget {
  const AgentsScreen({Key? key}) : super(key: key);

  @override
  State<AgentsScreen> createState() => _AgentsScreenState();
}

class _AgentsScreenState extends State<AgentsScreen> {
  // Agent Client
  final AgentClient _agentClient = AgentClient();
  // Agents List
  late Future<Iterable<Agent>> agents;

  // Selected Filter Index
  int selectedFilterIndex = 0;
  // Agent Filter List
  var agentFilters = [
    'All',
    'Duelist',
    'Sentinel',
    'Initiator',
    'Controller',
  ];

  // Filtred Agents
  late Iterable<Agent> filtredAgentList;

  @override
  void initState() {
    // Agent list
    agents = _agentClient.getAgents();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                  color: Color.fromARGB(255, 209, 58, 71),
                  border: Border.all(color: Colors.white),
                  borderRadius: BorderRadius.circular(10.0)),
              child: Padding(
                padding:
                    EdgeInsets.only(top: 20, left: 50, right: 50, bottom: 10),
                child: const Text(
                  'VALORANT',
                  style: TextStyle(
                      color: Color.fromARGB(255, 255, 255, 255),
                      fontSize: 40,
                      fontFamily: 'Valorant'),
                  textAlign: TextAlign.start,
                ),
              ),
            ),

            // Agents
            Expanded(
              flex: 13,
              child: FutureBuilder<Iterable<Agent>>(
                future: agents,
                builder: (
                  BuildContext context,
                  AsyncSnapshot<Iterable<Agent>> snapshot,
                ) {
                  return AgentList(
                    snapshot: snapshot,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

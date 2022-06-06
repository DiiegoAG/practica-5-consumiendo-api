import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:valorant_tips/widgets/agents_screen/Ability/abiliity_list.dart';

import '../../../constants/app_colors.dart';
import '../../../models/agent.dart';
import 'agent_info.dart';

class AgentsDetail extends StatefulWidget {
  AgentsDetail({Key? key, required this.agent}) : super(key: key);

  Agent agent;

  @override
  State<AgentsDetail> createState() => _AgentsDetailState();
}

class _AgentsDetailState extends State<AgentsDetail> {
  @override
  Widget build(BuildContext context) {
    var agentColors = {
      'fade': fadeColors,
      'breach': breachColors,
      'raze': razeColors,
      'chamber': chamberColors,
      'kay/o': kayoColors,
      'skye': skyeColors,
      'cypher': cypherColors,
      'sova': sovaColors,
      'killjoy': killjoyColors,
      'viper': viperColors,
      'phoenix': phoenixColors,
      'astra': astraColors,
      'brimstone': brimstoneColors,
      'neon': neonColors,
      'yoru': yoruColors,
      'sage': sageColors,
      'reyna': reynaColors,
      'omen': omenColors,
      'jett': jettColors,
    };
    // Agent Abilities
    List<Abilities> agentAbilities = [];

    // Model to agent abilities list
    widget.agent.abilities?.forEach((element) {
      agentAbilities.add(element);
    });

    // Scaffold
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('VALORANT',
              style: TextStyle(
                  color: Color.fromARGB(255, 255, 255, 255),
                  fontSize: 30,
                  fontFamily: 'Valorant')),
          flexibleSpace: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors:
                        agentColors[widget.agent.displayName!.toLowerCase()] ??
                            [
                              CupertinoColors.destructiveRed,
                              CupertinoColors.black
                            ])),
          ),
          toolbarHeight: 45,
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AgentInfo(
                agent: widget.agent,
              ),
              AbiliityList(abilityList: agentAbilities),
            ],
          ),
        ),
      ),
    );
  }
}

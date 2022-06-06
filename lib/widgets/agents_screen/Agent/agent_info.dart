import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:valorant_tips/constants/app_colors.dart';

import '../../../models/agent.dart';

class AgentInfo extends StatelessWidget {
  AgentInfo({Key? key, required this.agent}) : super(key: key);
  Agent agent;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        agentImage(),
        agentBio(),
      ],
    );
  }

  Padding agentBio() {
    return Padding(
      padding: EdgeInsets.only(top: 15, left: 15, right: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            agent.description!,
            style: TextStyle(color: black, fontSize: 17),
            textAlign: TextAlign.justify,
          ),
        ],
      ),
    );
  }

  Stack agentImage() {
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
    return Stack(alignment: Alignment.bottomLeft, children: [
      Column(
        children: [
          Hero(
              tag: agent,
              child: CachedNetworkImage(imageUrl: agent.fullPortraitV2!))
        ],
      ),
      Positioned(
        left: 15,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GradientText(
              agent.displayName!,
              style: const TextStyle(fontSize: 50.0, fontFamily: 'Valorant'),
              colors: agentColors[agent.displayName!.toLowerCase()] ??
                  [CupertinoColors.destructiveRed, CupertinoColors.black],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 1),
                  child: Text(
                    agent.role!.displayName!,
                    style: TextStyle(
                        fontFamily: 'Valorant', color: black, fontSize: 25),
                  ),
                ),
              ],
            )
          ],
        ),
      )
    ]);
  }
}

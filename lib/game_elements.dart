//------------------------------------------------------------------------------
//-----------------------------THREAT COUNTER-----------------------------------

import 'package:flutter/material.dart';

//---------------------------------------

class ThreatCounter extends StatelessWidget {
  const ThreatCounter({
    Key? key,
    required this.threat,
    required this.name,
  }) : super(key: key);

  final int threat;
  final String name;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,

      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            name,
            style: const TextStyle(fontSize: 12),
          ),
          Text(
            threat.toString(),
            style: const TextStyle(fontSize: 55),
          ),
        ],
      ),
    );
  }
}

//------------------------------------------------------------------------------
//------------------------------------------------------------------------------

class GameFlow extends StatelessWidget {
  const GameFlow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      slivers: [
        MainPhaseHeader(title: 'Timing and Gameplay'),
        PhaseHeader(title: 'Resource Phase'),
        PhaseStep(description: 'Gain One resource per hero'),
        PhaseStep(description: 'Draw One card'),
        ActionWindow(),
        PhaseHeader(title: 'Planning Phase'),
        ActionWindow(),
        PhaseStep(description: 'First Player plays allies and attachments'),
        ActionWindow(),
        PhaseStep(description: 'Players continue in Player Order to play allies and attachments'),
        PhaseHeader(title: 'Quest Phase'),
        ActionWindow(),
        PhaseStep(description: 'Commit characters to Quest'),
        ActionWindow(),
        PhaseStep(description: 'Reveal One card per player from Encounter Deck'),
        ActionWindow(),
        PhaseStep(description: 'Resolve Questing'),
        ActionWindow(),
        PhaseHeader(title: 'Travel Phase'),
        PhaseStep(description: 'Players may travel to an available location'),
        ActionWindow(),
        PhaseHeader(title: 'Encounter Phase'),
        PhaseStep(description: 'Each player may engage One enemy'),
        ActionWindow(),
        PhaseStep(description: 'Engagement checks are made'),
        ActionWindow(),
        PhaseHeader(title: 'Combat Phase'),
        PhaseStep(description: 'Deal One shadow card to each enemy'),
        ActionWindow(),
        PhaseStep(description: 'Resolve Enemy attacks in player order'),
        PhaseStep(description: 'Resolve Player attacks in player order'),
        PhaseHeader(title: 'Refresh Phase'),
        PhaseStep(description: 'Ready all cards'),
        PhaseStep(description: 'Increase threat by One'),
        PhaseStep(description: 'Pass First Player Token'),
        ActionWindow(),
      ],
    );
  }
}

//------------------------------------------------------------------------------
class ActionWindow extends StatelessWidget {
  const ActionWindow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverList(delegate: SliverChildBuilderDelegate((BuildContext context, int index){
      return const Card(
        color: Colors.amber,
        child: Text(
          'Action Window',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 20),
        ),
      );
    },
    childCount: 1,
    ));

  }
}

//------------------------------------------------------------------------------
class PhaseHeader extends StatelessWidget {
  const PhaseHeader({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      title: Text(title,
      textAlign: TextAlign.center,
        style: const TextStyle(fontSize: 30),
      ),
      centerTitle: true,
      floating: true,
      snap: true,
      pinned: false,
      flexibleSpace: Container(color: Theme.of(context).colorScheme.secondary,),
      expandedHeight: 75,
    );
  }
}

//------------------------------------------------------------------------------
class PhaseStep extends StatelessWidget {
  const PhaseStep({Key? key, required this.description}) : super(key: key);
  final String description;

  @override
  Widget build(BuildContext context) {
    return SliverList(delegate: SliverChildBuilderDelegate((BuildContext context, int index){
      return Card(
        color: Colors.brown[300],
        child: Text(
        description,
        textAlign: TextAlign.center,
        style: const TextStyle(fontSize: 20),
      ));
    },
      childCount: 1,
    ));

  }
}
//------------------------------------------------------------------------------
class MainPhaseHeader extends StatelessWidget {
  const MainPhaseHeader({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      title: Text(title),
      floating: true,
      snap: true,
      pinned: false,
      flexibleSpace: Container(color: Theme.of(context).colorScheme.secondaryContainer,),
      expandedHeight: 40,
    );
  }
}

//------------------------------------------------------------------------------
//-------------------------QUEST CARDS------------------------------------------
class QuestTracker extends StatelessWidget {
  const QuestTracker({Key? key, required this.questCounters,required this.currentCounters, required this.title}) : super(key: key);
  final int questCounters;
  final int currentCounters;
  final String title;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: Column(
        children: [
          Center(
            child: Text(title,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 25),
            ),
          ),
          Center(
            child: Text('$currentCounters / $questCounters',
                textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 50),
            ),
          ),
        ],
      ),
    );
  }
}

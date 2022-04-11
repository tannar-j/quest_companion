

//------------------------------------------------------------------------------
//------------------------QUEST VARIABLES----------------------------------------

import 'package:flutter/material.dart';

class QuestCards {
  int willpower;
  int threat;
  int progressCount;
  bool isLocation;

  QuestCards(this.progressCount, this.isLocation, this.willpower, this.threat);

  increaseCount(){
      progressCount++;
    }

  reduceCount(){
      progressCount--;
  }
}



//------------------------------------------------------------------------------
//------------------------PLAYER VARIABLES--------------------------------------
class Player {
  String playerName;
  int playerThreat;
  bool isFirstPlayer;

  Player(this.playerName, this.playerThreat, this.isFirstPlayer);

  threatUp(){
    playerThreat++;
  }

  threatDown(){
    playerThreat--;
  }

}


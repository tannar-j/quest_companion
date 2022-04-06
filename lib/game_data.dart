

//------------------------------------------------------------------------------
//------------------------QUEST VARIABLES----------------------------------------

class QuestCards {
  int progressCount;
  bool isLocation;

  QuestCards(this.progressCount, this.isLocation);

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


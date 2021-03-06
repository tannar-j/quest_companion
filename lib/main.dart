import 'package:flutter/material.dart';
import 'game_data.dart';
import 'game_elements.dart';

Player _player1 = Player('Player 1', 0, true);
Player _player2 = Player('Player 2', 0, false);
Player _player3 = Player('Player 3', 0, false);
Player _player4 = Player('Player 4', 0, false);

QuestCards _quest = QuestCards(5, false, 0, 0);
int _questTracker = 5;
QuestCards _location = QuestCards(4, true, 0, 0);
int _locationTracker = 0;

PlayerHero _hero1 = PlayerHero('Aragorn', 'Leadership', 5, 12, 0);

var heroList = [_hero1];

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quest Companion',
      theme: ThemeData(
        fontFamily: 'Ringbearer',
        primarySwatch: Colors.grey,
      ),
      home: const DefaultTabController(
          length: 3,
          child: MyHomePage(
            title: 'Quest Companion',
          )),
    );
  }
}

//------------------------------------------------------------------------------
class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final _controller = TextEditingController();
  final _controller2 = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Game Flow'),
              Tab(text: 'Quest'),
              Tab(text: 'Heroes')
            ],
          ),
          title: Text(
            widget.title,
            style: const TextStyle(
              color: Colors.black,
            ),
          ),
          backgroundColor: Theme.of(context).colorScheme.primary,
        ),
        body: Column(
          children: [
            Expanded(
              child: TabBarView(children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Expanded(
                        child: Container(
                      color: Colors.black,
                      width: double.infinity,
                      child: const GameFlow(),
                    )),
                  ],
                ),

//-----------------------------QUEST--------------------------------------------
                Container(
                  color: Colors.black,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Card(
                          color: Colors.brown[400],
                          child: Row(
                            children: [
                              IconButton(
                                onPressed: () => setState(() {
                                  if (_questTracker > 0) {
                                    _questTracker--;
                                  }
                                }),
                                icon: const Icon(Icons.arrow_drop_down_sharp),
                                iconSize: 70,
                              ),
                              Expanded(
                                  child: QuestTracker(
                                questCounters: _quest.progressCount,
                                currentCounters: _questTracker,
                                title: 'Current Quest',
                              )),
                              IconButton(
                                onPressed: () => setState(() {
                                  _questTracker++;
                                }),
                                icon: const Icon(Icons.arrow_drop_up_sharp),
                                iconSize: 70,
                              ),
                            ],
                          ),
                        ),
                        if (_questTracker >= _quest.progressCount)
                          Card(
                            color: Colors.amber,
                            child: Row(
                              children: [
                                Expanded(
                                  child: TextButton(
                                    onPressed: () => showDialog(
                                      context: context,
                                      builder: (BuildContext context) =>
                                          AlertDialog(
                                        title:
                                            const Text('Enter Quest Progress'),
                                        content: Form(
                                            key: _formKey,
                                            child: TextFormField(
                                              validator: (value) {
                                                if (value == null ||
                                                    value.isEmpty) {
                                                  return 'Enter a value';
                                                }
                                                int maximum = int.parse(value);
                                                if (maximum > 20) {
                                                  return 'Value is too High!';
                                                }
                                                return null;
                                              },
                                              keyboardType:
                                                  TextInputType.number,
                                              onSaved: (value) => {
                                                _quest.progressCount =
                                                    int.parse(value!),
                                                _questTracker = 0
                                              },
                                            )),
                                        actions: [
                                          TextButton(
                                              onPressed: () => setState(() {
                                                    if (_formKey.currentState!
                                                        .validate()) {
                                                      _formKey.currentState
                                                          ?.save();
                                                      Navigator.pop(context);
                                                    }
                                                  }),
                                              child: const Text('OK',
                                                  style: TextStyle(
                                                      color: Colors.black)))
                                        ],
                                      ),
                                    ),
                                    child: const Text(
                                      'New Quest Card',
                                      style: TextStyle(color: Colors.black),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        if (_location.progressCount > 0)
                          Card(
                            color: Colors.brown[400],
                            child: Row(
                              children: [
                                IconButton(
                                  onPressed: () => setState(() {
                                    if (_locationTracker > 0) {
                                      _locationTracker--;
                                    }
                                  }),
                                  icon: const Icon(Icons.arrow_drop_down_sharp),
                                  iconSize: 70,
                                ),
                                Expanded(
                                    child: QuestTracker(
                                  questCounters: _location.progressCount,
                                  currentCounters: _locationTracker,
                                  title: 'Current Location',
                                )),
                                IconButton(
                                  onPressed: () => setState(() {
                                    _locationTracker++;
                                  }),
                                  icon: const Icon(Icons.arrow_drop_up_sharp),
                                  iconSize: 70,
                                ),
                              ],
                            ),
                          ),
                        if (_locationTracker >= _location.progressCount)
                          Card(
                            color: Colors.amber,
                            child: Row(
                              children: [
                                Expanded(
                                  child: TextButton(
                                    onPressed: () => showDialog(
                                      context: context,
                                      builder: (BuildContext context) =>
                                          AlertDialog(
                                        title: const Text(
                                          'Enter Location Progress',
                                        ),
                                        content: Form(
                                            key: _formKey,
                                            child: TextFormField(
                                              validator: (value) {
                                                if (value == null ||
                                                    value.isEmpty) {
                                                  return 'Enter a value';
                                                }
                                                int maximum = int.parse(value);
                                                if (maximum > 20) {
                                                  return 'Value is too High!';
                                                }
                                                return null;
                                              },
                                              controller: _controller,
                                              keyboardType:
                                                  TextInputType.number,
                                              onSaved: (value) => {
                                                _location.progressCount =
                                                    int.parse(value!),
                                                _locationTracker = 0
                                              },
                                            )),
                                        actions: [
                                          TextButton(
                                            onPressed: () => setState(() {
                                              if (_formKey.currentState!
                                                  .validate()) {
                                                _formKey.currentState?.save();
                                                Navigator.pop(context);
                                              }
                                            }),
                                            child: const Text('OK',
                                                style: TextStyle(
                                                    color: Colors.black)),
                                          )
                                        ],
                                      ),
                                    ),
                                    child: const Text('New Location Card',
                                        style: TextStyle(color: Colors.black)),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        Row(
                          children: [
                            Expanded(
                              child: Card(
                                color: Colors.lightBlueAccent,
                                child: Column(
                                  children: [
                                    SizedBox(
                                        height: 200,
                                        child: Center(
                                            child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            IconButton(
                                              onPressed: () => setState(() {
                                                _quest.willpower++;
                                              }),
                                              icon: const Icon(
                                                  Icons.arrow_drop_up_sharp),
                                              iconSize: 48,
                                            ),
                                            const Text('Willpower'),
                                            Text(
                                              _quest.willpower.toString(),
                                              style:
                                                  const TextStyle(fontSize: 45),
                                            ),
                                            IconButton(
                                              onPressed: () => setState(() {
                                                if (_quest.willpower > 0) {
                                                  _quest.willpower--;
                                                }
                                              }),
                                              icon: const Icon(
                                                  Icons.arrow_drop_down_sharp),
                                              iconSize: 48,
                                            ),
                                          ],
                                        )))
                                  ],
                                ),
                              ),
                            ),
                            Expanded(
                              child: Card(
                                color: Colors.red[800],
                                child: Column(
                                  children: [
                                    SizedBox(
                                        height: 200,
                                        child: Center(
                                            child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            IconButton(
                                              onPressed: () => setState(() {
                                                _quest.threat++;
                                              }),
                                              icon: const Icon(
                                                  Icons.arrow_drop_up_sharp),
                                              iconSize: 48,
                                            ),
                                            const Text('Threat'),
                                            Text(
                                              _quest.threat.toString(),
                                              style:
                                                  const TextStyle(fontSize: 45),
                                            ),
                                            IconButton(
                                              onPressed: () => setState(() {
                                                if (_quest.threat > 0) {
                                                  _quest.threat--;
                                                }
                                              }),
                                              icon: const Icon(
                                                  Icons.arrow_drop_down_sharp),
                                              iconSize: 48,
                                            ),
                                          ],
                                        )))
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        if (_quest.willpower >= _quest.threat)
                          Card(
                            color: Colors.amber,
                            child: Row(
                              children: [
                                Expanded(
                                    child: TextButton(
                                  onPressed: () => setState(() {
                                    int _progressTokens =
                                        _quest.willpower - _quest.threat;
                                    while (_progressTokens > 0) {
                                      if (_locationTracker <
                                          _location.progressCount) {
                                        _locationTracker++;
                                        _progressTokens--;
                                      }
                                      if (_locationTracker ==
                                          _location.progressCount) {
                                        _questTracker++;
                                        _progressTokens--;
                                      }
                                    }
                                    _quest.willpower = 0;
                                    _quest.threat = 0;
                                  }),
                                  child: const Text('Complete Quest',
                                      style: TextStyle(color: Colors.black)),
                                )),
                              ],
                            ),
                          ),
                        if (_quest.threat > _quest.willpower)
                          Card(
                            color: Colors.amber,
                            child: Row(
                              children: [
                                Expanded(
                                    child: TextButton(
                                  onPressed: () => setState(() {
                                    int _threatTokens =
                                        _quest.threat - _quest.willpower;
                                    _player1.playerThreat += _threatTokens;
                                    _player2.playerThreat += _threatTokens;
                                    _player3.playerThreat += _threatTokens;
                                    _player4.playerThreat += _threatTokens;
                                    _quest.willpower = 0;
                                    _quest.threat = 0;
                                  }),
                                  child: const Text('Increase Threat',
                                      style: TextStyle(color: Colors.black)),
                                )),
                              ],
                            ),
                          ),
                      ],
                    ),
                  ),
                ),

//-----------------------------HEROES-------------------------------------------
                Container(
                    color: Colors.black,
                    child: SingleChildScrollView(
                        child: Column(children: [
                      for (PlayerHero hero in heroList)
                        Row(
                          children: [
                            Expanded(child: Card(child: Text(hero.heroName))),
                          ],
                        ),
                      Card(
                        color: Colors.amber,
                        child: Row(
                          children: [
                            Expanded(
                              child: TextButton(
                                onPressed: () => showDialog(
                                  context: context,
                                  builder: (BuildContext context) =>
                                      AlertDialog(
                                    title: const Text(
                                      'Enter New Hero',
                                    ),
                                    content: Form(
                                        key: _formKey,
                                        child: Column(
                                          children: [
                                            TextFormField(
                                              controller: _controller,
                                              onSaved: (value) => {

                                              }
                                            ),
                                            TextFormField(
                                              controller: _controller2,
                                              keyboardType:
                                                  TextInputType.number,
                                              onSaved: (value) => {

                                              }
                                            ),
                                          ],
                                        )),
                                    actions: [
                                      TextButton(
                                          onPressed: () => setState(() {
                                                Navigator.pop(context);
                                              }),
                                          child: const Text('OK'))
                                    ],
                                  ),
                                ),
                                child: const Text('Add New Hero',
                                    style: TextStyle(color: Colors.black)),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ]))),
              ]),

//----------------------THREAT COUNTER------------------------------------------
            ),
            Container(
              decoration: BoxDecoration(color: Colors.red[900]),
              child: Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      height: 100,
                      child: IconButton(
                        iconSize: 70,
                        icon: const Icon(Icons.arrow_drop_down_sharp),
                        onPressed: () => setState(() {
                          if (_player1.playerThreat > 0) {
                            _player1.playerThreat--;
                          }
                        }),
                      ),
                    ),
                  ),
                  Expanded(
                      child: ThreatCounter(
                    threat: _player1.playerThreat,
                    name: _player1.playerName,
                  )),
                  Expanded(
                    child: SizedBox(
                      height: 100,
                      child: IconButton(
                        iconSize: 70,
                        icon: const Icon(Icons.arrow_drop_up_sharp),
                        onPressed: () => setState(() {
                          if (_player1.playerThreat < 50) {
                            _player1.playerThreat++;
                          }
                        }),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ));
  }
}


//------------------------------------------------------------------------------

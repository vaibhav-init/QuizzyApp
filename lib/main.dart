import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'question.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

void main() {
  runApp(const Quizzler());
}

class Quizzler extends StatelessWidget {
  const Quizzler({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.teal,
          title: Text(
            'Quizzy App',
          ),
        ),
        backgroundColor: Colors.grey[900],
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: quizPage(),
          ),
        ),
      ),
    );
  }
}

class quizPage extends StatefulWidget {
  const quizPage({Key? key}) : super(key: key);

  @override
  State<quizPage> createState() => _quizPageState();
}

class _quizPageState extends State<quizPage> {
  List<Icon> scoreKeeper = [];
  int index = 0;
  int score = 0;

  List<Question> questionBank = [
    Question('Do camels have three sets of eyelids?', true),
    Question('It is possible to sneeze while sleeping', false),
    Question('Australia is a country as well as a continent', true),
    Question('Herbivore animals consume meat', false),
    Question('The national flag of America has 51 stars', true),
    Question('The capital of Spain is Madrid', true),
    Question('Ears are responsible for smelling', false),
    Question('The color of cherries is red.', true),
    Question('Butterflies are not birds', true),
    Question('The capital of France is Washington DC', false),
  ];

  @override
  Widget build(BuildContext context) {
    final player = AudioPlayer();

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          flex: 5,
          child: Center(
            child: Text(
              questionBank[index].questionText,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 25, color: Colors.white),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Container(
              color: Colors.green,
              child: TextButton(
                onPressed: () => {
                  if (questionBank[index].answer == true)
                    {
                      player.play(
                        AssetSource('correct.mp3'),
                      ),
                      scoreKeeper.add(
                        Icon(
                          Icons.check,
                          color: Colors.green,
                        ),
                      ),
                      setState(() {
                        score++;
                      }),
                    }
                  else
                    {
                      player.play(
                        AssetSource('wrong.mp3'),
                      ),
                      scoreKeeper.add(
                        Icon(
                          Icons.close_outlined,
                          color: Colors.red,
                        ),
                      ),
                    },
                  setState(() {
                    index++;
                  }),
                  if (index == 10)
                    {
                      Alert(
                              context: context,
                              title: "Good Game",
                              desc: "Your Score is $score")
                          .show(),
                      setState(() {
                        index = 0;
                        scoreKeeper = [];
                        score = 0;
                      }),
                    }
                },
                child: Text(
                  'True',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Container(
              color: Colors.red,
              child: TextButton(
                onPressed: () => {
                  if (questionBank[index].answer == false)
                    {
                      player.play(
                        AssetSource('correct.mp3'),
                      ),
                      scoreKeeper.add(
                        Icon(
                          Icons.check,
                          color: Colors.green,
                        ),
                      ),
                      setState(() {
                        score++;
                      }),
                    }
                  else
                    {
                      player.play(
                        AssetSource('wrong.mp3'),
                      ),
                      scoreKeeper.add(
                        Icon(
                          Icons.close_outlined,
                          color: Colors.red,
                        ),
                      ),
                    },
                  setState(() {
                    index++;
                  }),
                  if (index == 10)
                    {
                      Alert(
                              context: context,
                              title: "Good Game",
                              desc: "Your Score is $score")
                          .show(),
                      setState(() {
                        index = 0;
                        scoreKeeper = [];
                        score = 0;
                      }),
                    }
                },
                child: Text(
                  'False',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          ),
        ),
        Row(
          children: scoreKeeper,
        )
      ],
    );
  }
}

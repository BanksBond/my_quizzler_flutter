import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:flutter/material.dart';
import 'package:my_quizzler_flutter/quiz_brain.dart';

QuizBrain quizBrain = QuizBrain();
// QuizBrain getEnd = QuizBrain();

void main() => runApp(Quizzler());

class Quizzler extends StatelessWidget {
  const Quizzler({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: const SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  const QuizPage({Key? key}) : super(key: key);

  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Icon> scorekeeper = [];
  int scoreFinal = 0;

  void checkAnswer(bool userPickedAnswer) {
    bool correctAnswer = quizBrain.getQuestionAnswer();
    if (correctAnswer == userPickedAnswer) {
      scoreFinal++;
      scorekeeper.add(const Icon(
        Icons.check,
        color: Colors.green,
      ));
    } else {
      scorekeeper.add(const Icon(
        Icons.close,
        color: Colors.red,
      ));
    }
    setState(() {
      if (quizBrain.getEnd() == true) {
        quizBrain.nextQuestion();
      } else {
        Alert(
            context: context,
            title: "Congratulation",
            desc: "Your Final Score is $scoreFinal .",
            image: Image.asset("assets/congrats.gif"),
            buttons: [
              DialogButton(
                onPressed: () {
                  setState(() {
                    quizBrain.reset();
                    scorekeeper.clear();
                    scoreFinal = 0;
                    Navigator.pop(context);
                  });
                },
                child: const Text(
                  "Restart",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              )
            ]).show();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                quizBrain.getQuestionText(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.green)),
              child: const Text(
                'True',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              onPressed: () {
                checkAnswer(true);
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.red)),
              child: Text(
                'False',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                checkAnswer(false);
              },
            ),
          ),
        ),
        //TODO: Add a Row here as your score keeper
        Row(
          children: scorekeeper,
        )
      ],
    );
  }
}

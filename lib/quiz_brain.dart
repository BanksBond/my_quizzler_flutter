
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import 'questions.dart';

class QuizBrain {
  int _quesNum = 0;

  final List<Question> _questionBank = [
    Question(
        q: "You can lead a buffalo 🐃 down stairs but not up stairs.",
        a: false),
    Question(
        q: "Approximately one quarter of human bones 🦴 are in the feet.",
        a: true),
    Question(q: "A slug's 🐌 blood is green.", a: true),
    Question(q: "A Giraffe 🦒 can clear his ears with his tongue 👅", a: true),
    Question(q: "Is Mount Kilimanjaro 🗻 the world’s tallest peak?", a: false),
    Question(
        q: "Spaghetto is the singular form of the word spaghetti 🍝. ",
        a: true),
    Question(
        q: "Pinocchio 🤥 was Walt Disney’s first animated feature film in full color.",
        a: false),
    Question(q: "The capital of Australia 🦘 is Sydney.", a: false),
    Question(
        q: "The longest river 🌊 in the world is the Amazon River. ", a: false),
    Question(
        q: "Polar bears 🐻‍❄️ can only live in the Arctic region, not in the Antarctic. ",
        a: true),
    Question(
        q: "In Scotland, the unicorn 🦄 is their national animal. ", a: true),
    Question(
        q: "The Atlantic Ocean 🌊 is the world’s biggest ocean. ", a: true),
    Question(q: "Shakespeare 📜 wrote 37 plays.", a: true),
    Question(q: "Copyrights ©️ depreciate over time.", a: true)
  ];

  String getQuestionText() {
    return _questionBank[_quesNum].questionText;
  }

  bool getQuestionAnswer() {
    return _questionBank[_quesNum].questionAnswer;
  }
  
  int lengthQB(){
    return _questionBank.length - 1;
  }

  void nextQuestion() {
    if (_quesNum < lengthQB()) {
      _quesNum++;
    }
  }

  bool getEnd(){
    if(_quesNum < lengthQB()){
      return true;
    }
    else{
      return false;
    }
  }

  int reset(){
    return _quesNum = 0;
  }

}

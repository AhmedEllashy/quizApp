import 'package:flutter/material.dart';
import 'questions.dart';
import 'package:audioplayers/audio_cache.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
MyQuestion question = MyQuestion();
void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        body: QuizApp(),
        backgroundColor: Colors.black,
      ),
    )
  );
}


class QuizApp extends StatefulWidget{

  _QuizAppPage createState() => _QuizAppPage();
}

class _QuizAppPage extends State<QuizApp> {
List<Icon> stateIcons = [];

void soundPlayer(String filePath){
  final player = AudioCache();
   player.play(filePath);
}

  Widget build (BuildContext context){
      return SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [

           Expanded(
             flex: 5,
             child: Center(
               child: Text(question.getQuestion(),
                  style: TextStyle(
                         color: Colors.white,
                          fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2.5,
                  ),
                 textAlign: TextAlign.center,
               ),
             ),),
           Expanded(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: TextButton(
            child: Text('True'),
            onPressed: () {
              setState(() {
                if(stateIcons.length == question.questions.length-1)
                  {
                    Alert(
                      context: context,
                      type: AlertType.success,
                      title: "Quiz",
                      desc: "Congratulations!! You have finished the quiz.",
                      buttons: [
                        DialogButton(
                          child: Text(
                            "Ok",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                          onPressed: ()  {
                            Navigator.pop(context);
                            setState(() {
                              stateIcons = [];
                            });
                            },

                          width: 120,
                        )
                      ],
                    ).show();

                  }
                if(question.checkAnswer() == true){
                  stateIcons.add( Icon( Icons.check, color: Colors.green,) );

                  soundPlayer('true.mp3');
                  question.nextQuestion();
                }else{ stateIcons.add( Icon(Icons.close,color:Colors.red));
                  soundPlayer('false.wav');
                question.nextQuestion();

                }

              });
            },

            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.green),
              foregroundColor: MaterialStateProperty.all(Colors.black),
            ),
          ),
        ),
        ),
           Expanded(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: TextButton(
                  child: Text('False'),
                  onPressed: () {
                    setState(() {
                      if(stateIcons.length == question.questions.length)
                      {

                        Alert(
                          context: context,
                          type: AlertType.success,
                          title: "Quiz",
                          desc: "Congratulations!! You have finished the quiz.",
                          buttons: [
                            DialogButton(
                              child: Text(
                                "Ok",
                                style: TextStyle(color: Colors.white, fontSize: 20),
                              ),
                              onPressed: ()  {
                                Navigator.pop(context);
                                setState(() {
                                  stateIcons = [];
                                });
                              },
                              width: 120,
                            )
                          ],
                        ).show();

                      }
                      if(question.checkAnswer() == false){
                        stateIcons.add( Icon( Icons.check, color: Colors.green,) );
                        soundPlayer('true.mp3');
                        question.nextQuestion();
                      }else{ stateIcons.add( Icon(Icons.close,color:Colors.red));
                      soundPlayer('false.wav');
                      question.nextQuestion();

                      }
                    });
                  },


                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.red),
                    foregroundColor: MaterialStateProperty.all(Colors.black),
                  ),
                ),
              ),
            ),
            Row(
              children: stateIcons,
            )

          ],

        ),
      );
    }
  }
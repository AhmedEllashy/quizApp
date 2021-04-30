
import 'package:audioplayers/audio_cache.dart';

class Questions {
  bool answer = false;
  String question = '';

  Questions(this.question , this.answer);

}

class MyQuestion {
  int questionNumber = 0 ;

  List<Questions> questions = [
    Questions('London \'s the capital of UK .', true),
    Questions('Thomas Edison discovered gravity .' , false),
    Questions('\'A\' is the most common letter used in the English language . ', true),
    Questions('A lion\'s roar can be heard up to eight kilometres away .' , true),
    Questions('Ever year has a 356 day.', false),
    Questions('Some cats are actually allergic to humans', true),
    Questions('You can lead a cow down stairs but not up stairs.', false),
    Questions('Approximately one quarter of human bones are in the feet.', true),
    Questions('A slug\'s blood is green.', true),
    Questions('Buzz Aldrin\'s mother\'s maiden name was \"Moon\".', true),
    Questions('It is illegal to pee in the Ocean in Portugal.', true),
    Questions(
        'No piece of square dry paper can be folded in half more than 7 times.',
        false),
    Questions(
        'In London, UK, if you happen to die in the House of Parliament, you are technically entitled to a state funeral, because the building is considered too sacred a place.',
        true),
    Questions(
        'The loudest sound produced by any animal is 188 decibels. That animal is the African Elephant.',
        false),
    Questions(
        'The total surface area of two human lungs is approximately 70 square metres.',
        true),
    Questions('Google was originally called \"Backrub\".', true),


  ];

  void nextQuestion(){
    if(questionNumber == questions.length -1){
      questionNumber = 0;

    }else{
      questionNumber++;
      print(questionNumber);
    }
  }
  String getQuestion(){
    return questions[questionNumber].question;

  }
  bool checkAnswer(){
  return questions[questionNumber].answer;
  }
}


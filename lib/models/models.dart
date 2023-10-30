class ButtonData {
  final String text;
  final String action;

  ButtonData(this.text, this.action);
  
}

class VideoArguments {
  final String videoUrl;
  final String videoTitle;

  VideoArguments(this.videoUrl, this.videoTitle);
}


class Question {
  final String question;
  final List<String> options;
  final dynamic correctAnswer;

  Question(this.question, this.options, this.correctAnswer);
}
import 'dart:math';

class QuizService {
  // Simple rule‑based generator: extract nouns and create multiple‑choice questions
  List<Map<String, dynamic>> generateQuiz(String lessonText) {
    // Very naive: split into words, pick random unique words as "key terms"
    final words = lessonText.split(RegExp(r"\s+"));
    final Set<String> keyTerms = {};
    while (keyTerms.length < 5 && words.isNotEmpty) {
      final candidate = words[Random().nextInt(words.length)];
      if (candidate.length > 3) keyTerms.add(candidate);
    }
    // For each term, create a question with 3 wrong options (random other terms)
    final quiz = <Map<String, dynamic>>[];
    for (final term in keyTerms) {
      final options = <String>[term];
      while (options.length < 4) {
        final fake = words[Random().nextInt(words.length)];
        if (!options.contains(fake) && fake != term) options.add(fake);
      }
      options.shuffle();
      quiz.add({
        'question': 'What is the meaning of "$term" in this lesson?',
        'options': options,
        'answer': term,
      });
    }
    return quiz;
  }
}

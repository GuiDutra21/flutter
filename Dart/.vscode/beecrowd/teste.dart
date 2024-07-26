import 'dart:io';

void main() {
  while (true) {
    var line = stdin.readLineSync();
    if (line == null) {
      break;
    }
    var words = line.split(" ");
    print(words);
    var count = 0;
    var previous = '';
    for (var i = 0; i < words.length; i++) {
      var word = words[i];
      if (word.length > 0 && word[0].toLowerCase() == previous) {
        count++;
        print(" word : ${word[0]} previous : $previous");
      }
      previous = word[0].toLowerCase();
    }
    print(count);
  }
}
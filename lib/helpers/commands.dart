import 'package:flutter_starter/controllers/preference.dart';
import 'package:flutter_starter/ui/components/messageStream.dart';

import 'dialog.dart';

Future straightCommand(String _userInput, bool _isCommand) async {
  if (_userInput.contains("๊ทธ๋ง")) {
    return bubbleGenerate(
        (stopCommands..shuffle()).first, 2, 'straightCommand');
  } else if (_userInput.contains("์๋")) {
    return bubbleGenerate(
        (helloCommands..shuffle()).first, 2, 'straightCommand');
  }
  return _isCommand = true;
}

Future additionalCommand(String _botOutput, int _flow) async {
  String random_words = (additionalMessage[16][12]..shuffle()).first;
  if (random_words.contains("\n")) {}
  if (_botOutput == bdiDist[16]) {
    print(
        "in func $_botOutput == ${bdiDist[16]},,,${_botOutput == bdiDist[16]}");
    print("ss213$_flow");
    if (_flow == 1) {
      return bubbleGenerate(
          (additionalMessage[16][12]..shuffle()).first, 2, 'additionalCommand');
    } else if (_flow == 0) {
      return bubbleGenerate(
          (additionalMessage[16][11]..shuffle()).first, 2, 'additionalCommand');
    }
  }
}

Future throwsTopic(String _botOutput) async {
  return bubbleGenerate(
      (additionalMessage[16][11]..shuffle()).first, 2, 'topic');
}

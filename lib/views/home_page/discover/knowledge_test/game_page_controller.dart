import 'package:flutter/material.dart';
import 'package:umatter/views/home_page/discover/knowledge_test/multiple_choice/multiple_choice_page.dart';

import 'game_page_model.dart';
import 'true_false/trueorfalse_page.dart';

List<GamePageModel> gamepageController = [
  GamePageModel(
    "True or False",
    "Test your knowledge with True of False",
    const Color(0xff457b9d),
    "",
    const TrueorFalsePage(),
  ),
  GamePageModel(
    "Multiple Choice",
    "Test your knowledge in Multiple Choice.",
    const Color(0xff81b29a),
    "",
    const MultipleChoicePage(),
  )
];

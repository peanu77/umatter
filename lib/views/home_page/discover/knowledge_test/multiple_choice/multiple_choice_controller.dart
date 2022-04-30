import 'package:umatter/views/home_page/discover/knowledge_test/multiple_choice/multiple_choice_model.dart';

List<MultipleChoiceModel> multiplechoiceController = [
  MultipleChoiceModel(
    "Which of the following is not linked to depression?",
    {
      "Back Pain": false,
      "Upset Stomach": false,
      "Kidney Stones": true,
      "Headache": false,
    },
    "Depression can affect your body, too. Everyone is different. Some people have no physical symptoms. Others have problems with headaches, other pains, cramps, and stomach problems. But kidney stones aren’t linked to depression.",
  ),
  MultipleChoiceModel(
    "Which of these symptoms is more likely for women?",
    {
      "Passing up the book club you used to enjoy": false,
      "Dwelling on something that makes you feel guilty": true,
      "One too many glasses of wine": false,
    },
    "Anyone can do any of those things when they’re depressed. But women are more likely than men to have symptoms such as feeling sad, worthless, or guilty. Depressed men are more likely to be irritable and to lose interest in work or hobbies. They’re also more likely to turn to alcohol or other drugs when they feel depressed, which doesn’t help.",
  ),
  MultipleChoiceModel(
    "When you recover, your symptoms...",
    {
      "Will fade within a week": false,
      "Will take a while to go away": true,
      "Won’t ever change": false,
    },
    """Give yourself time to see results from your treatment, whether it includes counseling, lifestyle changes (such as exercise for mild depression), or medication. Your sleep and appetite may get better first.""",
  ),
  MultipleChoiceModel(
    "When you’re depressed, you should:",
    {
      "Take a nap to refresh yourself": false,
      "Exercise, even if you don’t want to": true,
    },
    """The more you move, the better. When you’re depressed, you probably aren’t going to feel like it at first. Try to do it anyway. Have you heard the saying, "go with your plan, not with your emotion"? It’s good advice, because exercise is a treatment for mild depression.""",
  ),
];

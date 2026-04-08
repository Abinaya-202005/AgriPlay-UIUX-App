import 'dart:ui';
import 'package:flutter/material.dart';
import 'reward_screen.dart';

class QuizScreen extends StatefulWidget {
  final String cropName;
  final String cropImage;

  const QuizScreen({
    super.key,
    required this.cropName,
    required this.cropImage,
  });

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int score = 0;

  int? selectedAnswerIndex;
  List<bool> answeredCorrectly = [];
  List<int?> chosenAnswer = [];

  late List<Map<String, Object>> _questions;

  @override
  void initState() {
    super.initState();

    if (widget.cropName == "Brinjal") {
      _questions = [
        {
          'question': 'What is the optimum temperature for Brinjal seed germination?',
          'options': ['10–15°C', '20–25°C', '30–35°C', 'Below 10°C'],
          'answer': 1,
        },
        {
          'question': 'Which type of soil is best for Brinjal cultivation?',
          'options': ['Sandy loam with good drainage', 'Heavy clay', 'Saline soil', 'Desert soil'],
          'answer': 0,
        },
        {
          'question': 'How much spacing is recommended between Brinjal plants?',
          'options': ['20 × 20 cm', '45 × 45 cm', '90 × 90 cm', '10 × 10 cm'],
          'answer': 1,
        },
        {
          'question': 'Brinjal crop requires what type of climate?',
          'options': ['Hot and dry', 'Cold and wet', 'Snowy regions', 'Extremely humid'],
          'answer': 0,
        },
        {
          'question': 'Which nutrient is most important for fruit development in Brinjal?',
          'options': ['Nitrogen', 'Potassium', 'Phosphorus', 'Calcium'],
          'answer': 1,
        },
        {
          'question': 'Common pest affecting Brinjal is:',
          'options': ['Fruit and shoot borer', 'Rice stem borer', 'Aphid only', 'Grasshopper'],
          'answer': 0,
        },
        {
          'question': 'How many months after transplanting is Brinjal ready for harvesting?',
          'options': ['1 month', '2–3 months', '6 months', '1 year'],
          'answer': 1,
        },
        {
          'question': 'What is the average yield of Brinjal per hectare under good management?',
          'options': ['50–70 quintals', '100–150 quintals', '10–20 quintals', '300–400 quintals'],
          'answer': 1,
        },
      ];
    } else if (widget.cropName == "Strawberry") {
      _questions = [
        {
          'question': 'What type of soil is best for strawberry cultivation?',
          'options': ['Sandy loam with good drainage', 'Heavy clay', 'Saline soil', 'Rocky soil'],
          'answer': 0,
        },
        {
          'question': 'What is the ideal soil pH for strawberries?',
          'options': ['4.0–5.0', '5.5–6.5', '7.5–8.5', 'Above 9.0'],
          'answer': 1,
        },
        {
          'question': 'Strawberries require which climate for best yield?',
          'options': ['Cool to mild climate', 'Extremely hot climate', 'Snowy and freezing', 'Very dry desert'],
          'answer': 0,
        },
        {
          'question': 'Recommended spacing for strawberry planting is:',
          'options': ['15 × 15 cm', '45 × 45 cm', '90 × 90 cm', '1 × 1 m'],
          'answer': 0,
        },
        {
          'question': 'Which nutrient is important for good fruit color and sweetness in strawberries?',
          'options': ['Nitrogen', 'Potassium', 'Calcium', 'Sulphur'],
          'answer': 1,
        },
        {
          'question': 'Common pest in strawberries is:',
          'options': ['Red spider mite', 'Rice stem borer', 'Mango hopper', 'Pod borer'],
          'answer': 0,
        },
        {
          'question': 'How many days after planting can strawberries be harvested?',
          'options': ['20–30 days', '90–120 days', '6 months', '1 year'],
          'answer': 1,
        },
        {
          'question': 'Average yield of strawberries per hectare is:',
          'options': ['2–3 tonnes', '8–10 tonnes', '20–25 tonnes', '50 tonnes'],
          'answer': 1,
        },
      ];
    } else if (widget.cropName == "Maize") {
      _questions = [
        {
          'question': 'Maize grows best in which type of soil?',
          'options': ['Well-drained loamy soil', 'Heavy clay', 'Saline soil', 'Desert soil'],
          'answer': 0,
        },
        {
          'question': 'Ideal temperature range for maize germination is:',
          'options': ['10–15°C', '18–25°C', '30–35°C', 'Below 10°C'],
          'answer': 1,
        },
        {
          'question': 'Recommended spacing for maize planting is:',
          'options': ['20 × 20 cm', '60 × 25 cm', '1 × 1 m', '10 × 10 cm'],
          'answer': 1,
        },
        {
          'question': 'Maize requires how much annual rainfall for good growth?',
          'options': ['10–20 cm', '50–75 cm', '150–200 cm', '250 cm'],
          'answer': 1,
        },
        {
          'question': 'Major nutrient required for maize is:',
          'options': ['Potassium', 'Nitrogen', 'Zinc', 'Magnesium'],
          'answer': 1,
        },
        {
          'question': 'Common pest attacking maize is:',
          'options': ['Stem borer', 'Pod borer', 'Aphid', 'Fruit borer'],
          'answer': 0,
        },
        {
          'question': 'Duration of maize crop from sowing to harvest is:',
          'options': ['60–110 days', '200 days', '1 year', '30 days'],
          'answer': 0,
        },
        {
          'question': 'Average grain yield of maize per hectare is:',
          'options': ['2–3 tonnes', '3–4 tonnes', '8–10 tonnes', '15 tonnes'],
          'answer': 1,
        },
      ];
    }

    answeredCorrectly = List.filled(_questions.length, false);
    chosenAnswer = List.filled(_questions.length, null);
  }

  void _checkAnswer(int questionIndex, int selectedIndex) {
    setState(() {
      chosenAnswer[questionIndex] = selectedIndex;
      if (_questions[questionIndex]['answer'] == selectedIndex) {
        answeredCorrectly[questionIndex] = true;
      } else {
        answeredCorrectly[questionIndex] = false;
      }
      score = 0;
      for (int i = 0; i < _questions.length; i++) {
        if (answeredCorrectly[i]) score++;
      }
    });
  }

  void _navigateToReward() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (_) => RewardScreen(
          score: score,
          total: _questions.length,
          cropName: widget.cropName,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(widget.cropImage, fit: BoxFit.cover),
          ),
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
              child: Container(color: Colors.black.withValues(alpha: 0.2)),
            ),
          ),
          SafeArea(
            child: Column(
              children: [
                const SizedBox(height: 16),
                Expanded(
                  child: ListView.builder(
                    padding: const EdgeInsets.all(12),
                    itemCount: _questions.length + 1,
                    itemBuilder: (ctx, index) {
                      if (index == _questions.length) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 24.0, horizontal: 8.0),
                          child: Row(
                            children: [
                              const Spacer(),
                              ClipRRect(
                                borderRadius: BorderRadius.circular(16),
                                child: BackdropFilter(
                                  filter:
                                  ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                                  child: Container(
                                    constraints: const BoxConstraints(
                                        minWidth: 72,
                                        maxWidth: 120,
                                        minHeight: 36),
                                    decoration: BoxDecoration(
                                      color:
                                      Colors.white.withValues(alpha: 0.2),
                                      borderRadius: BorderRadius.circular(16),
                                      border: Border.all(
                                        color:
                                        Colors.white.withValues(alpha: 0.3),
                                        width: 1,
                                      ),
                                    ),
                                    child: TextButton(
                                      style: TextButton.styleFrom(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 10.0, vertical: 6.0),
                                        minimumSize: const Size(72, 36),
                                      ),
                                      onPressed: _navigateToReward,
                                      child: const Text(
                                        "Result →",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      }

                      final question = _questions[index];
                      final options = question['options'] as List<String>;
                      final answer = question['answer'] as int;

                      return Padding(
                        padding: const EdgeInsets.only(bottom: 16.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(16),
                          child: BackdropFilter(
                            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white.withValues(alpha: 0.2),
                                borderRadius: BorderRadius.circular(16),
                                border: Border.all(
                                  color: Colors.white.withValues(alpha: 0.3),
                                  width: 1,
                                ),
                              ),
                              padding: const EdgeInsets.all(12),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "${index + 1}. ${question['question']}",
                                    style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  Column(
                                    children:
                                    List.generate(options.length, (i) {
                                      final isSelected =
                                          chosenAnswer[index] == i;
                                      final isCorrect = answer == i;
                                      Color? textColor;

                                      if (chosenAnswer[index] != null) {
                                        if (isSelected && isCorrect) {
                                          textColor = Colors.green;
                                        } else if (isSelected && !isCorrect) {
                                          textColor = Colors.red;
                                        }
                                      }

                                      return RadioListTile<int>(
                                        value: i,
                                        groupValue: chosenAnswer[index],
                                        onChanged: chosenAnswer[index] == null
                                            ? (val) {
                                          _checkAnswer(index, val!);
                                        }
                                            : null,
                                        title: Text(
                                          options[i],
                                          style: TextStyle(
                                            color:
                                            textColor ?? Colors.black,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      );
                                    }),
                                  ),
                                  if (chosenAnswer[index] != null)
                                    Padding(
                                      padding:
                                      const EdgeInsets.only(top: 8.0),
                                      child: Column(
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        children: [
                                          if (answeredCorrectly[index])
                                            Row(
                                              children: [
                                                const Icon(Icons.check,
                                                    color: Colors.green),
                                                const SizedBox(width: 4),
                                                Text(
                                                  "Correct answer: ${options[answer]}",
                                                  style: const TextStyle(
                                                      color: Colors.green),
                                                ),
                                              ],
                                            ),
                                          if (!answeredCorrectly[index])
                                            Column(
                                              crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  children: [
                                                    const Icon(Icons.close,
                                                        color: Colors.red),
                                                    const SizedBox(width: 4),
                                                    Text(
                                                      "Your answer: ${options[chosenAnswer[index]!]}",
                                                      style: const TextStyle(
                                                          color: Colors.red),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    const Icon(Icons.check,
                                                        color: Colors.green),
                                                    const SizedBox(width: 4),
                                                    Text(
                                                      "Correct answer: ${options[answer]}",
                                                      style: const TextStyle(
                                                          color: Colors
                                                              .green),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                        ],
                                      ),
                                    ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

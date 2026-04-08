import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'quiz_screen.dart';

class VideoScreen extends StatefulWidget {
  final String cropName;
  final String cropImage;

  const VideoScreen({
    super.key,
    required this.cropName,
    required this.cropImage,
  });

  @override
  State<VideoScreen> createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {
  final List<String> brinjalVideos = [
    'assets/videos/brinjal_planting.mp4',
    'assets/videos/brinjal_watering.mp4',
    'assets/videos/brinjal_germinating.mp4',
    'assets/videos/brinjal_maturation.mp4',
    'assets/videos/brinjal_irrigation.mp4',
    'assets/videos/brinjal_harvesting.mp4',
  ];

  final List<String> brinjalStages = [
    "Planting",
    "Watering",
    "Germinating",
    "Maturation",
    "Irrigation",
    "Harvesting",
  ];

  final List<String> brinjalExplanations = [
    "Seeds are sown in well-prepared, moist soil. Ensure spacing for healthy growth.",
    "Water the plants regularly, keeping the soil consistently moist but not waterlogged.",
    "Seeds begin germinating within a few days. Keep the soil warm and avoid direct harsh sunlight.",
    "Plants grow leaves and stems; ensure proper sunlight and remove weeds regularly.",
    "Irrigation is done systematically to ensure plants receive adequate water without flooding.",
    "Harvest mature brinjal fruits carefully to avoid damaging the plant.",
  ];

  final List<String> strawberryVideos = [
    'assets/videos/strawberry_planting.mp4',
    'assets/videos/strawberry_watering.mp4',
    'assets/videos/strawberry_germinating.mp4',
    'assets/videos/strawberry_maturation.mp4',
    'assets/videos/strawberry_irrigation.mp4',
    'assets/videos/strawberry_harvesting.mp4',
  ];

  final List<String> strawberryStages = [
    "Planting",
    "Watering",
    "Germinating",
    "Maturation",
    "Irrigation",
    "Harvesting",
  ];

  final List<String> strawberryExplanations = [
    "Strawberry seedlings are planted in fertile, well-drained soil with good sunlight.",
    "Plants require regular watering to keep the soil moist, especially during early growth.",
    "Strawberry plants develop leaves and flowers; ensure proper spacing and sunlight.",
    "Fully grown strawberry plants can be seen in the field with healthy green leaves under proper sunlight.",
    "Controlled irrigation is essential to keep the soil moist without waterlogging.",
    "Harvest strawberries when they are fully red and ripe for the best flavor.",
  ];

  final List<String> maizeVideos = [
    'assets/videos/maize_planting.mp4',
    'assets/videos/maize_watering.mp4',
    'assets/videos/maize_germinating.mp4',
    'assets/videos/maize_maturation.mp4',
    'assets/videos/maize_irrigation.mp4',
    'assets/videos/maize_harvesting.mp4',
  ];

  final List<String> maizeStages = [
    "Planting",
    "Watering",
    "Germinating",
    "Maturation",
    "Irrigation",
    "Harvesting",
  ];

  final List<String> maizeExplanations = [
    "Maize seeds are planted in rows with proper spacing to ensure healthy growth.",
    "Young maize plants need consistent watering to develop strong roots.",
    "Seeds sprout into seedlings within a few days; protect them from pests.",
    "Maize plants grow tall and develop leaves; provide sufficient nutrients and sunlight.",
    "Irrigation is managed to keep the soil moist during critical growth stages.",
    "Harvest maize cobs when they are fully mature and kernels are hard and golden.",
  ];

  late List<VideoPlayerController> _controllers;
  late List<String> _stages;
  late List<String> _explanations;

  @override
  void initState() {
    super.initState();
    if (widget.cropName == "Brinjal") {
      _controllers =
          brinjalVideos.map((v) => VideoPlayerController.asset(v)).toList();
      _stages = brinjalStages;
      _explanations = brinjalExplanations;
    } else if (widget.cropName == "Strawberry") {
      _controllers =
          strawberryVideos.map((v) => VideoPlayerController.asset(v)).toList();
      _stages = strawberryStages;
      _explanations = strawberryExplanations;
    } else if (widget.cropName == "Maize") {
      _controllers =
          maizeVideos.map((v) => VideoPlayerController.asset(v)).toList();
      _stages = maizeStages;
      _explanations = maizeExplanations;
    } else {
      _controllers = [];
      _stages = [];
      _explanations = [];
    }

    for (var c in _controllers) {
      c.initialize();
    }
  }

  @override
  void dispose() {
    for (var c in _controllers) {
      c.dispose();
    }
    super.dispose();
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
              child: Container(color: Colors.black.withValues(alpha: 0.4)),
            ),
          ),
          SafeArea(
            child: Column(
              children: [
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_back, color: Colors.white),
                      onPressed: () => Navigator.pop(context),
                    ),
                    Expanded(
                      child: Center(
                        child: Text(
                          "${widget.cropName} - Videos",
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 48),
                  ],
                ),
                const SizedBox(height: 16),
                if (_controllers.isEmpty)
                  const Expanded(
                    child: Center(
                      child: Text(
                        "No videos available for this crop yet.",
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ),
                  ),
                if (_controllers.isNotEmpty)
                  Expanded(
                    child: ListView.builder(
                      padding: const EdgeInsets.all(12),
                      itemCount: _controllers.length + 1,
                      itemBuilder: (ctx, i) {
                        if (i == _controllers.length) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 24.0, horizontal: 8.0),
                            child: Row(
                              children: [
                                const Spacer(),
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(16),
                                  child: BackdropFilter(
                                    filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                                    child: Container(
                                      constraints: const BoxConstraints(minWidth: 72, maxWidth: 120, minHeight: 36),
                                      decoration: BoxDecoration(
                                        color: Colors.white.withValues(alpha: 0.2),
                                        borderRadius: BorderRadius.circular(16),
                                        border: Border.all(
                                          color: Colors.white.withValues(alpha: 0.3),
                                          width: 1,
                                        ),
                                      ),
                                      child: TextButton(
                                        style: TextButton.styleFrom(
                                          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
                                          minimumSize: const Size(72, 36),
                                        ),
                                        onPressed: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (_) => QuizScreen(
                                                cropName: widget.cropName,
                                                cropImage: widget.cropImage,
                                              ),
                                            ),
                                          );
                                        },
                                        child: const Text(
                                          "Quiz →",
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

                        final controller = _controllers[i];
                        return Card(
                          color: Colors.white.withValues(alpha: 0.2),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              AspectRatio(
                                aspectRatio: controller.value.aspectRatio,
                                child: VideoPlayer(controller),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  _stages[i],
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  _explanations[i],
                                  style: const TextStyle(
                                    fontSize: 14,
                                    color: Colors.black87,
                                  ),
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  IconButton(
                                    icon: Icon(
                                      controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
                                      color: Colors.white,
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        controller.value.isPlaying ? controller.pause() : controller.play();
                                      });
                                    },
                                  ),
                                ],
                              ),
                            ],
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

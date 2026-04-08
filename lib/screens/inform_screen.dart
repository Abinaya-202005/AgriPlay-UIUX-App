import 'dart:ui';
import 'package:flutter/material.dart';

class InformationScreen extends StatelessWidget {
  final String cropName;
  final String cropImage;

  const InformationScreen({
    super.key,
    required this.cropName,
    required this.cropImage,
  });
  static final Map<String, Map<String, dynamic>> cropDetails = {
    "Carrot": {
      "scientific": "Daucus carota",
      "soil": "Grows best in loose, sandy loam soil rich in organic matter.",
      "rich": "Vitamin A (beta-carotene), Vitamin K, Vitamin C, potassium, and fiber.",
      "benefits": [
        "Improves eyesight",
        "Boosts immunity",
        "Aids digestion",
        "Good for skin and overall health",
      ],
      "other": [
        "Carrot is a root vegetable.",
        "Originated in Central Asia (Afghanistan region).",
        "Usually harvested 2–3 months after sowing.",
        "Can be eaten raw, cooked, or made into juice/sweets.",
      ],
    },
    "Tomato": {
      "scientific": "Solanum lycopersicum",
      "soil":
      "Prefers well-drained loamy soil rich in organic matter, slightly acidic (pH 6.0–6.8).",
      "rich":
      "Vitamin C, Vitamin A, Vitamin K, potassium, folate, and antioxidants (especially lycopene).",
      "benefits": [
        "Improves heart health",
        "Good for skin and hair",
        "Strengthens immunity",
        "Aids digestion and hydration",
      ],
      "other": [
        "Tomato is a fruit botanically, but used as a vegetable in cooking.",
        "Originated in South America (Peru, Ecuador region).",
        "Grows best in warm climate (21–27°C).",
        "Used in salads, curries, sauces, soups, and juices.",
      ],
    },
    "Pumpkin": {
      "scientific": "Cucurbita maxima",
      "soil": "Grows best in well-drained sandy loam soil rich in organic matter.",
      "rich": "Vitamin A, Vitamin C, potassium, fiber, and antioxidants.",
      "benefits": [
        "Good for eyesight and immunity",
        "Helps in digestion",
        "Supports heart health",
        "Low in calories, good for weight management",
      ],
      "other": [
        "Originated in North America.",
        "Grown as a creeper vine plant.",
        "Used in curries, soups, sweets, and also for animal feed.",
      ],
    },
    "Onion": {
      "scientific": "Allium cepa",
      "soil": "Prefers fertile sandy loam to clay loam soil with good drainage.",
      "rich": "Vitamin C, Vitamin B6, folate, and sulfur compounds.",
      "benefits": [
        "Boosts immunity",
        "Controls blood sugar levels",
        "Good for heart health",
        "Has antibacterial and anti-inflammatory properties",
      ],
      "other": [
        "Originated in Central Asia / Iran–Pakistan region.",
        "Grown as a bulb crop.",
        "Used in almost all cuisines – raw, cooked, or fried.",
      ],
    },
    "Brinjal": {
      "scientific": "Solanum melongena",
      "soil": "Best grown in well-drained sandy loam soil rich in organic matter.",
      "rich": "Fiber, Vitamin C, Vitamin K, potassium, and antioxidants (nasunin).",
      "benefits": [
        "Good for digestion",
        "Helps control cholesterol",
        "Supports heart health",
        "Low in calories, suitable for weight management",
      ],
      "other": [
        "Originated in India.",
        "Warm-season crop, grows well in 20–30°C climate.",
        "Used in curries, fries, pickles, and baked dishes.",
      ],
    },
    "Banana": {
      "scientific": "Musa paradisiaca",
      "soil": "Deep, rich, well-drained loamy soil with high organic matter.",
      "rich": "Potassium, Vitamin B6, Vitamin C, fiber, and carbohydrates.",
      "benefits": [
        "Provides instant energy",
        "Good for heart health",
        "Improves digestion",
        "Helps regulate blood pressure",
      ],
      "other": [
        "Originated in Southeast Asia.",
        "Grown in tropical climates.",
        "Used as fresh fruit, in desserts, chips, and smoothies.",
      ],
    },
    "Strawberry": {
      "scientific": "Fragaria × ananassa",
      "soil":
      "Fertile sandy loam soil, rich in organic matter, slightly acidic (pH 5.5–6.5).",
      "rich": "Vitamin C, folate, manganese, fiber, and antioxidants.",
      "benefits": [
        "Strengthens immunity",
        "Good for heart health",
        "Improves skin glow",
        "Aids digestion",
      ],
      "other": [
        "Originated in Europe (cross between wild species).",
        "Grows in cool to temperate climates.",
        "Used in jams, juices, cakes, desserts.",
      ],
    },
    "Lemon": {
      "scientific": "Citrus limon",
      "soil":
      "Well-drained loamy or sandy loam soil, slightly acidic (pH 5.5–6.5).",
      "rich": "Vitamin C, citric acid, potassium, and flavonoids.",
      "benefits": [
        "Strengthens immunity",
        "Good for skin health",
        "Helps in digestion and detoxification",
        "Prevents scurvy (Vitamin C deficiency)",
      ],
      "other": [
        "Originated in Northeast India / Southeast Asia.",
        "Grown in tropical and subtropical climates.",
        "Used in juices, pickles, flavoring, and medicines.",
      ],
    },
    "Cocoa": {
      "scientific": "Theobroma cacao",
      "soil":
      "Deep, well-drained loamy soil with high organic matter, slightly acidic.",
      "rich":
      "Iron, magnesium, antioxidants (flavonoids), and small amounts of caffeine.",
      "benefits": [
        "Improves brain function",
        "Good for heart health",
        "Boosts mood",
        "Rich in antioxidants",
      ],
      "other": [
        "Originated in Central & South America.",
        "Seeds are used to make cocoa powder, butter, and chocolate.",
        "Requires warm, humid climate (tropical).",
      ],
    },
    "Dragon": {
      "scientific": "Hylocereus undatus (Dragon Fruit / Pitaya)",
      "soil": "Well-drained sandy or loamy soil, slightly acidic to neutral.",
      "rich": "Vitamin C, fiber, calcium, iron, magnesium, and antioxidants.",
      "benefits": [
        "Boosts immunity",
        "Improves digestion",
        "Good for skin health",
        "Helps regulate blood sugar",
      ],
      "other": [
        "Originated in Central & South America.",
        "Belongs to the cactus family.",
        "Grown in warm tropical climates.",
      ],
    },
    "Paddy": {
      "scientific": "Oryza sativa",
      "soil":
      "Clayey or loamy soil that can retain water; needs flooded/wet conditions.",
      "rich": "Carbohydrates, small amounts of protein, B vitamins.",
      "benefits": [
        "Staple food for more than half of the world’s population",
        "Provides energy",
        "Gluten-free grain",
      ],
      "other": [
        "Originated in China/India (Asian region).",
        "Requires hot and humid climate.",
        "Harvested after 3–6 months depending on variety.",
      ],
    },
    "Wheat": {
      "scientific": "Triticum aestivum",
      "soil":
      "Well-drained loamy or clay loam soil, moderate water requirement.",
      "rich": "Carbohydrates, protein (gluten), iron, and B vitamins.",
      "benefits": [
        "Provides energy",
        "Source of dietary fiber",
        "Used for making bread, chapati, pasta, biscuits.",
      ],
      "other": [
        "Originated in the Fertile Crescent (Middle East).",
        "Grows best in cool climate.",
        "Major staple crop worldwide.",
      ],
    },
    "Maize": {
      "scientific": "Zea mays",
      "soil": "Well-drained fertile loamy soil with good organic matter.",
      "rich": "Carbohydrates, Vitamin B, fiber, and minerals.",
      "benefits": [
        "Provides energy",
        "Source of animal feed, biofuel, and food products",
        "Gluten-free cereal",
      ],
      "other": [
        "Originated in Central America (Mexico).",
        "Warm-season crop.",
        "Used for food (corn, popcorn), oil, and industrial products.",
      ],
    },
    "Cotton": {
      "scientific": "Gossypium hirsutum",
      "soil": "Black cotton soil (regur soil) or well-drained alluvial soil.",
      "rich": "Not mainly for nutrition – grown for fiber.",
      "benefits": [
        "Provides raw material for textiles and clothing",
        "Cottonseed used for oil and fodder",
      ],
      "other": [
        "Originated in India and Central America.",
        "Needs warm climate with moderate rainfall.",
        "Harvested for fiber (lint) used in fabrics.",
      ],
    },
    "Sugarcane": {
      "scientific": "Saccharum officinarum",
      "soil":
      "Deep, fertile, well-drained loamy soil; requires high water supply.",
      "rich": "Natural sugars (sucrose), small amounts of minerals.",
      "benefits": [
        "Source of sugar and jaggery",
        "Provides raw material for ethanol, paper, and molasses",
      ],
      "other": [
        "Originated in South and Southeast Asia.",
        "Grows well in tropical climate.",
        "Tall grass crop harvested for juice extraction.",
      ],
    },
  };

  @override
  Widget build(BuildContext context) {
    final details = cropDetails[cropName];

    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              cropImage,
              fit: BoxFit.cover,
            ),
          ),
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
              child: Container(
                color: Colors.black.withValues(alpha: 0.4),
              ),
            ),
          ),
          SafeArea(
            child: Stack(
              children: [
                ListView(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: IconButton(
                        icon: const Icon(Icons.arrow_back, color: Colors.white),
                        onPressed: () => Navigator.pop(context),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Center(
                      child: Text(
                        cropName,
                        style: const TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    if (details == null)
                      const Text(
                        "No information available.",
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    if (details != null) ...[
                      _infoTile(
                          "Scientific Name", details["scientific"] as String),
                      _infoTile("Soil Requirement", details["soil"] as String),
                      _infoTile("Rich In", details["rich"] as String),
                      _bulletSection(
                          "Benefits", details["benefits"] as List<dynamic>),
                      _bulletSection("Other Information",
                          details["other"] as List<dynamic>),
                    ],
                  ],
                ),
                Positioned(
                  bottom: 20,
                  right: 20,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 10),
                        decoration: BoxDecoration(
                          color: Colors.white.withValues(alpha: 0.2),
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color: Colors.white.withValues(alpha: 0.3),
                            width: 1,
                          ),
                        ),
                        child: InkWell(
                          onTap: () {
                            Navigator.pushNamed(
                              context,
                              '/video',
                              arguments: {
                                'cropName': cropName,
                                'cropImage': cropImage,
                              },
                            );
                          },
                          child: const Text(
                            "Next →",
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _infoTile(String title, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Text(
        "$title: $value",
        style: const TextStyle(
          fontSize: 18,
          color: Colors.white,
        ),
      ),
    );
  }

  Widget _bulletSection(String title, List<dynamic> items) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "$title:",
            style: const TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          const SizedBox(height: 8),
          ...items.map((e) => Padding(
            padding: const EdgeInsets.only(left: 12, bottom: 6),
            child: Text(
              "• $e",
              style: const TextStyle(fontSize: 17, color: Colors.white),
            ),
          )),
        ],
      ),
    );
  }
}

import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'inform_screen.dart';

class CropSelectionScreen extends StatefulWidget {
  const CropSelectionScreen({super.key});

  @override
  State<CropSelectionScreen> createState() => _CropSelectionScreenState();
}

class _CropSelectionScreenState extends State<CropSelectionScreen> {
  final List<Map<String, String>> crops = const [
    {'name': 'Onion', 'image': 'assets/images/veggies/Onion.jpg'},
    {'name': 'Tomato', 'image': 'assets/images/veggies/Tomato.jpg'},
    {'name': 'Pumpkin', 'image': 'assets/images/veggies/Pumpkin.jpg'},
    {'name': 'Carrot', 'image': 'assets/images/veggies/Carrot.png'},
    {'name': 'Brinjal', 'image': 'assets/images/veggies/Brinjal.webp'},

    {'name': 'Banana', 'image': 'assets/images/fruits/Banana.jpg'},
    {'name': 'Strawberry', 'image': 'assets/images/fruits/Strawberry.jpg'},
    {'name': 'Lemon', 'image': 'assets/images/fruits/Lemon.jpg'},
    {'name': 'Cocoa', 'image': 'assets/images/fruits/Cocoa.webp'},
    {'name': 'Dragon', 'image': 'assets/images/fruits/Dragon.webp'},

    {'name': 'Maize', 'image': 'assets/images/crops/Maize.jpg'},
    {'name': 'Wheat', 'image': 'assets/images/crops/Wheat.jpeg'},
    {'name': 'Paddy', 'image': 'assets/images/crops/Paddy.webp'},
    {'name': 'Sugarcane', 'image': 'assets/images/crops/Sugarcane.png'},
    {'name': 'Cotton', 'image': 'assets/images/crops/Cotton.jpg'},
  ];

  List<Map<String, String>> filteredCrops = [];
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    filteredCrops = crops;
  }

  void _filterSearch(String query) {
    setState(() {
      if (query.isEmpty) {
        filteredCrops = crops;
      } else {
        filteredCrops = crops
            .where((crop) =>
        crop['name']!.toLowerCase() == query.toLowerCase())
            .toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background image
          SizedBox.expand(
            child: Image.asset(
              'assets/images/crops_bg.jpg',
              fit: BoxFit.cover,
            ),
          ),

          // Blurred overlay
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
              child: Container(
                color: Colors.black.withValues(alpha: 0),
              ),
            ),
          ),

          SafeArea(
            child: Column(
              children: [
                const SizedBox(height: 20),

                // Glass-style search bar
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
                      child: Container(
                        color: const Color.fromRGBO(255, 255, 255, 0.2),
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: TextField(
                          controller: _searchController,
                          style: const TextStyle(color: Colors.black),
                          decoration: const InputDecoration(
                            hintText: 'Search Your Favourite',
                            hintStyle: TextStyle(color: Colors.black54),
                            border: InputBorder.none,
                            icon: Icon(Icons.search, color: Colors.black54),
                          ),
                          onSubmitted: (value) => _filterSearch(value),
                        ),
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                // Scrollable 2-column grid cards
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: filteredCrops.isNotEmpty
                        ? GridView.builder(
                      itemCount: filteredCrops.length,
                      gridDelegate:
                      const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 12,
                        mainAxisSpacing: 12,
                        childAspectRatio: 0.85,
                      ),
                      itemBuilder: (context, index) {
                        final crop = filteredCrops[index];
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => InformationScreen(
                                  cropName: crop['name']!,
                                  cropImage: crop['image']!,
                                ),
                              ),
                            );
                          },
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: BackdropFilter(
                              filter:
                              ImageFilter.blur(sigmaX: 6, sigmaY: 6),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: const Color.fromRGBO(
                                      255, 255, 255, 0.25),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Column(
                                  children: [
                                    Expanded(
                                      child: ClipRRect(
                                        borderRadius:
                                        const BorderRadius.vertical(
                                          top: Radius.circular(20),
                                        ),
                                        child: Image.asset(
                                          crop['image']!,
                                          fit: BoxFit.cover,
                                          width: double.infinity,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 8),

                                    // Unique italic text
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          bottom: 10),
                                      child: Text(
                                        crop['name']!,
                                        style: GoogleFonts.firaSans(
                                          fontSize: 18,
                                          fontStyle: FontStyle.italic,
                                          color: Colors.black87,
                                          fontWeight: FontWeight.bold,
                                          letterSpacing: 1.2,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    )
                        : const Center(
                      child: Text(
                        "No crops found!",
                        style: TextStyle(
                          fontSize: 18,
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.bold,
                          color: Colors.redAccent,
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
}


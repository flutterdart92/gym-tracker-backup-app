import 'package:flutter/material.dart';
import '../models/onboarding_content.dart';
import 'signup_screen.dart';

class IntroductionScreen extends StatefulWidget {
  const IntroductionScreen({super.key});

  @override
  State<IntroductionScreen> createState() => _IntroductionScreenState();
}

class _IntroductionScreenState extends State<IntroductionScreen> {
  int _currentIndex = 0; // Removed final so it can update on page change
  final PageController _controller = PageController();

  @override
  Widget build(BuildContext context) {
    bool isLastPage = _currentIndex == onboardingContents.length - 1;

    return Scaffold(
      backgroundColor: const Color(0xFF121212),
      body: SafeArea(
        child: Column(
          children: [
            // 1. App Header Branding
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Row(
                children: [
                  Icon(Icons.eco, color: Color(0xFF2DD4BF), size: 28),
                  SizedBox(width: 8),
                  Text(
                    "Calorii",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),

            // 2. Carousel Slider (Restored PageView.builder so 'i' works properly)
            Expanded(
              child: PageView.builder(
                controller: _controller,
                itemCount: onboardingContents.length,
                onPageChanged: (int index) {
                  setState(() {
                    _currentIndex =
                        index; // Updates state when swiped or clicked next
                  });
                },
                itemBuilder: (context, i) {
                  return Image.asset(
                    onboardingContents[i].imagePath,
                    fit: BoxFit.contain,
                    errorBuilder: (context, error, stackTrace) {
                      return const Center(
                        child: Text(
                          "Image not found.\nCheck asset path.",
                          style: TextStyle(color: Colors.white54),
                          textAlign: TextAlign.center,
                        ),
                      );
                    },
                  );

                  // return Container(
                  //   width: double.infinity,
                  //   // margin: const EdgeInsets.symmetric(horizontal: 8.0),
                  //   decoration: const BoxDecoration(
                  //     color: Color(0xFF1E1E1E),
                  //     // borderRadius: BorderRadius.circular(20),
                  //     // border: Border.all(color: Colors.white12),
                  //   ),
                  //   child: ClipRRect(
                  //     // borderRadius: BorderRadius.circular(20),
                  //     child: Image.asset(
                  //       onboardingContents[i].imagePath, // 'i' is valid here!
                  //       // fit: BoxFit.contain,
                  //       errorBuilder: (context, error, stackTrace) {
                  //         return const Center(
                  //           child: Text(
                  //             "Image not found.\nCheck asset path.",
                  //             style: TextStyle(color: Colors.white54),
                  //             textAlign: TextAlign.center,
                  //           ),
                  //         );
                  //       },
                  //     ),
                  //   ),
                  // );
                },
              ),
            ),
            const SizedBox(height: 16),

            // 3. Bottom Information Container (Uses _currentIndex safely)
            Container(
              padding: const EdgeInsets.all(20.0),
              decoration: const BoxDecoration(
                color: Color(0xFF0D0D0D),
                borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    onboardingContents[_currentIndex].title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    onboardingContents[_currentIndex].description,
                    style: const TextStyle(
                      color: Colors.white70,
                      fontSize: 13,
                      height: 1.3,
                    ),
                    textAlign: TextAlign.center,
                    maxLines: 4,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 20),

                  // Next / Get Started Button
                  SizedBox(
                    width: double.infinity,
                    height: 48,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF2DD4BF),
                        foregroundColor: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24),
                        ),
                      ),
                      onPressed: () {
                        if (isLastPage) {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (_) => const SignupScreen()),
                          );
                        } else {
                          _controller.nextPage(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeInOut,
                          );
                        }
                      },
                      child: Text(
                        isLastPage ? "Get Started" : "Next",
                        style: const TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

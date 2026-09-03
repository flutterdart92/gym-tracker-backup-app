class OnboardingContent {
  final String title;
  final String description;
  final String imagePath;

  OnboardingContent({
    required this.title,
    required this.description,
    required this.imagePath,
  });
}

final List<OnboardingContent> onboardingContents = [
  OnboardingContent(
    title: "See Changes in Just 7 Days",
    description:
        "Most users notice changes in their body, weight, or energy within the first 7 days simply by following their Calorii plan.",
    // imagePath: "assets/images/intro_1.png",
    imagePath:
        "assets/images/Calorii - introduction - 1 - Your transformation starts now.jpeg",
  ),
  OnboardingContent(
    title: "Your Personalized Plan",
    description:
        "Calorii builds a personalized meal and workout plan tailored to your goals and preferences. Update your plan anytime to adjust to your lifestyle.",
    // imagePath: "assets/images/intro_2.png",
    imagePath:
        "assets/images/Calorii - introduction - 2 - your personalized plan.jpeg",
  ),
  OnboardingContent(
    title: "Your Plan, Your Way",
    description:
        "Generate unlimited meal options with recipes for every meal in your plan. Just type the foods you love to eat and build your week around meals you truly enjoy.",
    // imagePath: "assets/images/intro_3.png",
    imagePath:
        "assets/images/Calorii - introduction - 3 - Your plan, your way.jpeg",
  ),
  OnboardingContent(
    title: "Instant Food Logging",
    description:
        "Not following the meal plan? Snap a photo, speak, or type what you ate—Calorii's AI instantly analyzes your meal so you can log it and stay on track.",
    // imagePath: "assets/images/intro_4.png",
    imagePath:
        "assets/images/Calorii - introduction - 4 - instant food logging.jpeg",
  ),
  OnboardingContent(
    title: "Your Week 1 Check-In",
    description:
        "On Day 7, weigh in and use our AI body analyzer for visual feedback beyond the scale. Get insights on body fat percentage, muscle, and areas to improve.",
    // imagePath: "assets/images/intro_5.png",
    imagePath:
        "assets/images/Calorii - introduction - 5 - your week 1 check-in.jpeg",
  ),
];

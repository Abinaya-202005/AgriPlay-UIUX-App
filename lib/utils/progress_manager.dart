
class ProgressManager {
  static int totalPoints = 0;
  static List<String> badges = [];

  static String getBadge(int score) {
    if (score <= 3) return "Beginner Farmer";
    if (score <= 6) return "Smart Learner";
    return "Expert Farmer";
  }

  static void updateProgress(int score) {
    totalPoints += score * 10;
    String badge = getBadge(score);
    if (!badges.contains(badge)) {
      badges.add(badge);
    }
  }
}

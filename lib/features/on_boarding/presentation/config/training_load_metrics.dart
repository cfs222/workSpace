import 'package:himah/features/on_boarding/domain/enums/experiences.dart';

class TrainingLoadMetrics {
  final double difficulty; // للـ progress bar فقط
  final String difficultyLabel;

  const TrainingLoadMetrics({
    required this.difficulty,
    required this.difficultyLabel,
  });
}

/// جدول ثابت: المستوى → عدد الأيام → (النص, قيمة الشريط)
const Map<ExperienceLevel, Map<int, TrainingLoadMetrics>> _metricsTable = {
  ExperienceLevel.newbie: {
    1: TrainingLoadMetrics(difficulty: 0.20, difficultyLabel: 'سهل'),
    2: TrainingLoadMetrics(difficulty: 0.30, difficultyLabel: 'سهل'),
    3: TrainingLoadMetrics(difficulty: 0.50, difficultyLabel: 'متوسط'),
    4: TrainingLoadMetrics(difficulty: 0.70, difficultyLabel: 'صعب'),
    5: TrainingLoadMetrics(difficulty: 0.75, difficultyLabel: 'صعب'),
    6: TrainingLoadMetrics(difficulty: 0.90, difficultyLabel: 'صعب جداً'),
    7: TrainingLoadMetrics(
      difficulty: 1.00,
      difficultyLabel: 'مستحيل: إجهاد مؤكد',
    ),
  },
  ExperienceLevel.beginner: {
    1: TrainingLoadMetrics(difficulty: 0.10, difficultyLabel: 'سهل جداً'),
    2: TrainingLoadMetrics(difficulty: 0.25, difficultyLabel: 'سهل'),
    3: TrainingLoadMetrics(difficulty: 0.45, difficultyLabel: 'متوسط'),
    4: TrainingLoadMetrics(difficulty: 0.55, difficultyLabel: 'متوسط'),
    5: TrainingLoadMetrics(difficulty: 0.70, difficultyLabel: 'صعب'),
    6: TrainingLoadMetrics(difficulty: 0.90, difficultyLabel: 'صعب جداً'),
    7: TrainingLoadMetrics(
      difficulty: 1.00,
      difficultyLabel: 'مستحيل: إجهاد مؤكد',
    ),
  },
  ExperienceLevel.intermediate: {
    1: TrainingLoadMetrics(difficulty: 0.10, difficultyLabel: 'سهل جداً'),
    2: TrainingLoadMetrics(difficulty: 0.15, difficultyLabel: 'سهل جداً'),
    3: TrainingLoadMetrics(difficulty: 0.30, difficultyLabel: 'سهل'),
    4: TrainingLoadMetrics(difficulty: 0.50, difficultyLabel: 'متوسط'),
    5: TrainingLoadMetrics(difficulty: 0.70, difficultyLabel: 'صعب'),
    6: TrainingLoadMetrics(difficulty: 0.80, difficultyLabel: 'صعب'),
    7: TrainingLoadMetrics(
      difficulty: 1.00,
      difficultyLabel: 'مستحيل: إجهاد مؤكد',
    ),
  },
  ExperienceLevel.advanced: {
    1: TrainingLoadMetrics(difficulty: 0.10, difficultyLabel: 'سهل جداً'),
    2: TrainingLoadMetrics(difficulty: 0.15, difficultyLabel: 'سهل جداً'),
    3: TrainingLoadMetrics(difficulty: 0.25, difficultyLabel: 'سهل'),
    4: TrainingLoadMetrics(difficulty: 0.45, difficultyLabel: 'متوسط'),
    5: TrainingLoadMetrics(difficulty: 0.55, difficultyLabel: 'متوسط'),
    6: TrainingLoadMetrics(difficulty: 0.70, difficultyLabel: 'صعب'),
    7: TrainingLoadMetrics(
      difficulty: 1.00,
      difficultyLabel: 'مستحيل: إجهاد مؤكد',
    ),
  },
};

TrainingLoadMetrics getTrainingLoadMetrics({
  required int dayCount,
  required ExperienceLevel experience,
}) {
  return _metricsTable[experience]?[dayCount] ??
      const TrainingLoadMetrics(difficulty: 0.5, difficultyLabel: 'متوسط');
}

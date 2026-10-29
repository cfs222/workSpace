import 'package:himah/features/on_boarding/domain/enums/experiences.dart';

class ExperienceUiConfig {
  final String title;
  final String subtitle;
  final String motivationText; // النص الجديد

  const ExperienceUiConfig({
    required this.title,
    required this.subtitle,
    required this.motivationText,
  });
}

const Map<ExperienceLevel, ExperienceUiConfig> experienceUiConfigs = {
  ExperienceLevel.newbie: ExperienceUiConfig(
    title: 'جديد',
    subtitle: 'لم يسبق لي التدريب من قبل',
    motivationText: 'نبدأ بصنع جسم رياضي',
  ),
  ExperienceLevel.beginner: ExperienceUiConfig(
    title: 'البداية',
    subtitle: 'أقل من سنة تقريباً',
    motivationText: 'نبدأ من التأسيس',
  ),
  ExperienceLevel.intermediate: ExperienceUiConfig(
    title: 'متمرس',
    subtitle: 'من سنة إلى 3 سنوات تقريباً',
    motivationText: 'نبدأ في تحقيق الهدف',
  ),
  ExperienceLevel.advanced: ExperienceUiConfig(
    title: 'محترف',
    subtitle: 'أكثر من 3 سنوات من التدريب المنتظم',
    motivationText: 'نبدأ بالتقدم نحو مستوى النخبة',
  ),
};

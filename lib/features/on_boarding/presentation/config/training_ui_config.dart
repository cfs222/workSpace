import 'package:himah/core/constants/app_assets.dart';
import 'package:himah/features/on_boarding/domain/enums/tranings.dart';

class TrainingUiConfig {
  final String label;
  final String iconPath;
  final bool isSvg;

  const TrainingUiConfig({
    required this.label,
    required this.iconPath,
    this.isSvg = false,
  });
}

const Map<Tranings, TrainingUiConfig> trainingUiConfigs = {
  Tranings.fullBody: TrainingUiConfig(
    label: 'الجسم كامل',
    iconPath: AppAssets.fullBody,
  ),
  Tranings.push: TrainingUiConfig(label: 'دفع', iconPath: AppAssets.push),
  Tranings.pull: TrainingUiConfig(label: 'سحب', iconPath: AppAssets.pull),
  Tranings.leg: TrainingUiConfig(label: 'أرجل', iconPath: AppAssets.leg),
  Tranings.upper: TrainingUiConfig(
    label: 'علوي',
    iconPath: AppAssets.upper,
    isSvg: true,
  ),
  Tranings.lower: TrainingUiConfig(
    label: 'سفلي',
    iconPath: AppAssets.lower,
    isSvg: true,
  ),
  Tranings.posterior: TrainingUiConfig(
    label: 'السلسلة الخلفية',
    iconPath: AppAssets.posterior,
  ),
  Tranings.anterior: TrainingUiConfig(
    label: 'السلسلة الأمامية',
    iconPath: AppAssets.anterior,
  ),
  Tranings.rest: TrainingUiConfig(
    label: 'راحة',
    iconPath: AppAssets.rest,
    isSvg: true,
  ),
};

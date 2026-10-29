import 'package:himah/features/on_boarding/domain/enums/goals.dart';

class GoalConfig {
  final String imagePath;
  final double strength;
  final double muscleSize;

  const GoalConfig({
    required this.imagePath,
    required this.strength,
    required this.muscleSize,
  });
}

const Map<Goals, GoalConfig> goalConfigs = {
  Goals.power: GoalConfig(
    imagePath: 'assets/images/on_boarding/power.png',
    strength: 0.9,
    muscleSize: 0.4,
  ),
  Goals.muscleSize: GoalConfig(
    imagePath: 'assets/images/on_boarding/muscle_size.png',
    strength: 0.4,
    muscleSize: 0.9,
  ),
  Goals.fatloss: GoalConfig(
    imagePath: 'assets/images/on_boarding/fat_loose.png',
    strength: 0.6,
    muscleSize: 0.4,
  ),
  Goals.all: GoalConfig(
    imagePath: 'assets/images/on_boarding/man_overall.png',
    strength: 0.5,
    muscleSize: 0.5,
  ),
};

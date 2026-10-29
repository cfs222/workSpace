import 'package:himah/features/on_boarding/domain/enums/experiences.dart';
import 'package:himah/features/on_boarding/domain/enums/goals.dart';
import 'package:himah/features/on_boarding/domain/enums/weak_days.dart';

class UserParams {
  final Goals goal;
  final ExperienceLevel experience;
  final int trainingDayCount;
  final WeakDays traningDays;

  UserParams({
    required this.goal,
    required this.experience,
    required this.trainingDayCount,
    required this.traningDays,
  });
}

class GoalsParams {
  final Goals goal;
  GoalsParams({required this.goal});
}

class ExperienceParams {
  final ExperienceLevel experience;
  ExperienceParams({required this.experience});
}

class TrainingDayCountParams {
  final int trainingDayCount;
  TrainingDayCountParams({required this.trainingDayCount});
}

class TrainingDaysParams {
  final List<WeakDays> traningDays;
  TrainingDaysParams({required this.traningDays});
}

// TODO: LEARN T & Make it
// class TParams {
//   final T params;
//   TrainingDaysParams({required this.traningDays});
// }

import 'package:himah/features/on_boarding/domain/entities/traning_schedule_entity.dart';
import 'package:himah/features/on_boarding/domain/enums/experiences.dart';
import 'package:himah/features/on_boarding/domain/enums/goals.dart';
import 'package:himah/features/on_boarding/domain/enums/weak_days.dart';

class UserEntity {
  final Goals goal;
  final ExperienceLevel experience;
  final int trainingDayCount;
  final List<WeakDays> trainingDays;
  final TraningScheduleEntity? trainingSchedule;

  const UserEntity({
    required this.goal,
    required this.experience,
    required this.trainingDayCount,
    required this.trainingDays,
    this.trainingSchedule,
  });
}

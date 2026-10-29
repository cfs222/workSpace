import 'package:himah/features/on_boarding/domain/enums/goals.dart';
import 'package:himah/features/on_boarding/domain/enums/traning_schedule_type.dart';
import 'package:himah/features/on_boarding/domain/enums/tranings.dart';

class TraningScheduleEntity {
  final TraningScheduleType type;
  final Goals goal;
  final int trainingDayCount;
  final int restDayCount;
  final List<Tranings> weeklyWorkoutSplit;

  TraningScheduleEntity({
    required this.goal,
    required this.trainingDayCount,
    required this.type,
    required this.restDayCount,
    required this.weeklyWorkoutSplit,
  });
}

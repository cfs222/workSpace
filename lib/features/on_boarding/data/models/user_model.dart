import 'package:himah/core/databases/api/end_points.dart';
import 'package:himah/features/on_boarding/domain/entities/user_entitiy.dart';
import 'package:himah/features/on_boarding/domain/enums/experiences.dart';
import 'package:himah/features/on_boarding/domain/enums/goals.dart';
import 'package:himah/features/on_boarding/domain/enums/weak_days.dart';

class UserModel extends UserEntity {
  const UserModel({
    required super.goal,
    required super.experience,
    required super.trainingDayCount,
    required super.trainingDays,
    super.trainingSchedule,
  });

  factory UserModel.fromEntity(UserEntity entity) {
    return UserModel(
      goal: entity.goal,
      experience: entity.experience,
      trainingDayCount: entity.trainingDayCount,
      trainingDays: entity.trainingDays,
      trainingSchedule: entity.trainingSchedule,
    );
  }

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      goal: Goals.values.byName(json[ApiKey.goal] as String),
      experience: ExperienceLevel.values.byName(
        json[ApiKey.experience] as String,
      ),
      trainingDayCount: json[ApiKey.trainingDayCount] as int,
      trainingDays: (json[ApiKey.trainingDays] as List)
          .map((e) => WeakDays.values.byName(e as String))
          .toList(),
      // trainingSchedule نتجاهله حالياً
    );
  }

  Map<String, dynamic> toJson() {
    return {
      ApiKey.goal: goal.name,
      ApiKey.experience: experience.name,
      ApiKey.trainingDayCount: trainingDayCount,
      ApiKey.trainingDays: trainingDays.map((e) => e.name).toList(),
    };
  }
}

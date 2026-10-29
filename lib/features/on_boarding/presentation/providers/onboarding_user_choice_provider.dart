import 'package:flutter_riverpod/legacy.dart';
import 'package:himah/features/on_boarding/domain/enums/experiences.dart';
import 'package:himah/features/on_boarding/domain/enums/goals.dart';
import 'package:himah/features/on_boarding/domain/enums/training_space.dart';
import 'package:himah/features/on_boarding/domain/enums/weak_days.dart';

/// الهدف — له قيمة افتراضية (الشاشة الأولى)
final goalChoiceProvider = StateProvider<Goals>((ref) => Goals.all);

/// مستوى الخبرة — يجب أن يختار المستخدم
final experienceChoiceProvider = StateProvider<ExperienceLevel?>((ref) => null);

/// عدد أيام التدريب — يجب أن يختار المستخدم
final trainingDayCountProvider = StateProvider<int?>((ref) => null);

/// أيام التدريب المختارة — قائمة (multi-select)
final trainingDaysProvider = StateProvider<List<WeakDays>>((ref) => []);

final trainingSpaceProvider = StateProvider<TrainingSpace?>((ref) => null);

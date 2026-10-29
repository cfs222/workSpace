import 'package:himah/features/on_boarding/domain/enums/tranings.dart';
import 'package:himah/features/on_boarding/domain/enums/weak_days.dart';

class TraningEntity {
  final Tranings type;
  final WeakDays day;

  const TraningEntity({required this.type, required this.day});

  bool get isRest => type == Tranings.rest;
}

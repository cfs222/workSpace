import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';

import '../entities/user_entitiy.dart';

abstract class UserRepository {
  /// يحفظ المستخدم بعد اكتمال الـ Onboarding
  Future<Either<Failure, Unit>> createUser(UserEntity user);

  /// يجلب المستخدم المحفوظ حالياً (إن وجد)
  Future<Either<Failure, UserEntity?>> getUserData();
}

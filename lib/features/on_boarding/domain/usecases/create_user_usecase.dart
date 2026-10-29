import 'package:dartz/dartz.dart';
import 'package:himah/core/errors/failure.dart';
import 'package:himah/features/on_boarding/domain/entities/user_entitiy.dart';
import 'package:himah/features/on_boarding/domain/repositories/user_repository.dart';

class CreateUser {
  final UserRepository repository;

  CreateUser({required this.repository});

  Future<Either<Failure, Unit>> call(UserEntity user) {
    return repository.createUser(user);
  }
}

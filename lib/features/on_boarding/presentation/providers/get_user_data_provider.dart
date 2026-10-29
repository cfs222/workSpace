import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:himah/features/on_boarding/domain/usecases/get_user_data_usecase.dart';
import 'package:himah/features/on_boarding/presentation/providers/onboarding_dependencies.dart';

final getCurrentUserUseCaseProvider = Provider<GetUserData>((ref) {
  return GetUserData(repository: ref.read(userRepositoryProvider));
});

import 'package:inovatask/data/models/trainingseries.dart';
import 'package:inovatask/domain/repositories/my_application_repository.dart';

class GetCoachDataUseCase {
  GetCoachDataUseCase(this.repository);

  final MyApplicationRepository repository;

  Future<TrainingSeries> call() {
    return repository.getData();
  }
}

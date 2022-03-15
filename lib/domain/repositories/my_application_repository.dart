import 'package:inovatask/data/models/trainingseries.dart';

abstract class MyApplicationRepository {
  Future<bool> login(String email, String password);

  Future<TrainingSeries> getData();
}

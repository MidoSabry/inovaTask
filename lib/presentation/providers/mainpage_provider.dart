import 'package:flutter/material.dart';
import 'package:inovatask/data/models/trainingseries.dart';
import 'package:inovatask/domain/usecases/get_coach_data_usecase.dart';

class MainProvider with ChangeNotifier {
  MainProvider(this._getCoachDataUsecase);

  final GetCoachDataUseCase _getCoachDataUsecase;
  TrainingSeries? trainingSeriesData;

  void loadData() async {
    try {
      trainingSeriesData = await _getCoachDataUsecase();
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }
}

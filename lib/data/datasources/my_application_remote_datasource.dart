import 'package:inovatask/data/models/trainingseries.dart';
import 'package:inovatask/data/models/user.dart';

import '../../../../core/service/network_service.dart';

abstract class MyApplicationRemoteDataSource {
  Future<TrainingSeries> getCoachData();
  Future<User?> login(String email, String password);
}

class MyApplicationRemoteDataSourceImpl
    implements MyApplicationRemoteDataSource {
  final NetworkService _networkService;

  MyApplicationRemoteDataSourceImpl(this._networkService);

  var listOfData = 'data/dumydata/data.json';

  @override
  Future<TrainingSeries> getCoachData() async {
    await Future.delayed(Duration(seconds: 3));
    return TrainingSeries(
        seriesName: "seriesName1",
        coverPhoto:
            "https://images.theconversation.com/files/396768/original/file-20210423-15-v2ycyo.jpg?ixlib=rb-1.1.0&rect=8%2C8%2C5982%2C3979&q=45&auto=format&w=926&fit=clip",
        coachName: "jhon",
        description:
            "quia et suscipit\nsuscipit recusandae consequuntur expedita et cum\nreprehenderit molestiae ut ut quas totam\nnostrum rerum est autem sunt rem eveniet architecto");
  }

  @override
  Future<User?> login(String email, String password) async {
    return User(id: "1", email: 'test@test.com', name: "Ahmed Ali");
  }
}

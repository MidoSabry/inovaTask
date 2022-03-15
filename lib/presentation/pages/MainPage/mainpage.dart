import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:inovatask/core/service/cache_service.dart';
import 'package:inovatask/core/service/network_service.dart';
import 'package:inovatask/data/datasources/my_application_local_datasource.dart';
import 'package:inovatask/data/datasources/my_application_remote_datasource.dart';
import 'package:inovatask/data/repositories/my_application_repository_impl.dart';
import 'package:inovatask/domain/usecases/get_coach_data_usecase.dart';
import 'package:inovatask/injector.dart';
import 'package:inovatask/presentation/providers/mainpage_provider.dart';
import 'package:inovatask/shared/resources/color_manager.dart';
import 'package:inovatask/shared/resources/strings_manager.dart';
import 'package:inovatask/shared/resources/values_manager.dart';
import 'package:inovatask/shared/widgets/textbutton.dart';
import 'package:provider/provider.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Injector().mainProvider..loadData(),
      builder: (context, _) => Scaffold(
          body: Consumer<MainProvider>(
        builder: (context, _, __) => _buildBody(context),
      )),
    );
  }

  Widget _buildBody(BuildContext context) {
    final provider = context.read<MainProvider>();
    if (provider.trainingSeriesData == null) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    } else {
      final trainingData = provider.trainingSeriesData!;
      return SingleChildScrollView(
        child: Column(
          children: [
            if (trainingData.coverPhoto != null)
              Image.network(trainingData.coverPhoto!),
            SizedBox(
              height: 10.h,
            ),
            Text(
              "The Challange",
              style: Theme.of(context)
                  .textTheme
                  .headline1!
                  .copyWith(fontSize: AppSize.s40.sp),
            ),
            Text(
              trainingData.coachName.toString(),
              style: Theme.of(context)
                  .textTheme
                  .bodyText1!
                  .copyWith(fontSize: AppSize.s20.sp),
            ),
            SizedBox(
              height: 20.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                defaultTextButton(function: () {}, text: 'OverView'),
                defaultTextButton(function: () {}, text: 'Classes'),
                defaultTextButton(function: () {}, text: 'Comunity'),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              alignment: Alignment.topLeft,
              child: Text("About the series",
                  style: Theme.of(context).textTheme.headline1!.copyWith(
                        fontSize: AppSize.s20.sp,
                      )),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              trainingData.description.toString(),
              style: Theme.of(context)
                  .textTheme
                  .bodyText1!
                  .copyWith(fontSize: AppSize.s20.sp),
            ),
          ],
        ),
      );
    }
  }
}

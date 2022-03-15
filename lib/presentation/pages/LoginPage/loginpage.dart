import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:inovatask/core/service/cache_service.dart';
import 'package:inovatask/core/service/network_service.dart';
import 'package:inovatask/data/datasources/my_application_local_datasource.dart';
import 'package:inovatask/data/datasources/my_application_remote_datasource.dart';
import 'package:inovatask/data/repositories/my_application_repository_impl.dart';
import 'package:inovatask/domain/repositories/my_application_repository.dart';
import 'package:inovatask/domain/usecases/login_usecase.dart';
import 'package:inovatask/injector.dart';
import 'package:inovatask/presentation/pages/MainPage/mainpage.dart';
import 'package:inovatask/presentation/providers/user_provider.dart';
import 'package:inovatask/shared/resources/values_manager.dart';
import 'package:inovatask/shared/widgets/default_button.dart';
import 'package:inovatask/shared/widgets/myTextFormField.dart';
import 'package:inovatask/shared/widgets/navigateTo.dart';
import 'package:inovatask/shared/widgets/textbutton.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  //const LoginPage({ Key? key }) : super(key: key);

  final TextEditingController emailFieldController = TextEditingController();
  final TextEditingController passwordFieldController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Injector().userProvider,
      builder: (context, _) => Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Center(
            child: Column(
              children: [
                SizedBox(height: 50),
                Text(
                  "Hello",
                  style: Theme.of(context)
                      .textTheme
                      .headline1!
                      .copyWith(fontSize: AppSize.s60.sp),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Text(
                  "Login with your email and password",
                  textAlign: TextAlign.center,
                  style: Theme.of(context)
                      .textTheme
                      .headline1!
                      .copyWith(fontSize: AppSize.s20.sp),
                ),
                SizedBox(height: 10.h),
                defaultTextFailed(
                  label: 'Email',
                  controller: emailFieldController,
                  type: TextInputType.emailAddress,
                  prefix: Icons.email_outlined,
                ),
                SizedBox(height: 20.h),
                defaultTextFailed(
                  label: 'Password',
                  controller: passwordFieldController,
                  type: TextInputType.visiblePassword,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Enter your password';
                    } else if (value.length < 6) {
                      return 'password is short';
                    }
                    return null;
                  },
                  prefix: Icons.lock,
                ),
                SizedBox(
                  height: 20.h,
                ),
                defaultButton(
                  text: 'Login',
                  background: Colors.blue,
                  radius: 20,
                  width: 100.h,
                  function: () {
                    context.read<UserProvider>().login(
                        emailFieldController.text,
                        passwordFieldController.text,
                        () => navigateTo(context, MainPage()));
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

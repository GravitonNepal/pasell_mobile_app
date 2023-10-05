import 'package:awesome_notifications/awesome_notifications.dart';

import '../../Bloc/Auth/auth_bloc.dart';
import '../../Helpers/ValidatorsForm.dart';
import '../Home/HomePage.dart';
import '../../Widgets/AnimationRoute.dart';
import '../../Widgets/TextFormFrave.dart';
import '../../Widgets/CustomText.dart';
import '../../Widgets/CustomButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'LoadingPage.dart';

class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passowrdController = TextEditingController();
  final _keyForm = GlobalKey<FormState>();

  bool isChangeSuffixIcon = true;
  void notify() async {
    await AwesomeNotifications().createNotification(
      content: NotificationContent(
          id: 1,
          channelKey: 'key1',
          title: 'Logged in Successfully',
          body: 'pasell',
          notificationLayout: NotificationLayout.BigPicture,
          bigPicture:
              'https://images.idgesg.net/images/article/2019/01/android-q-notification-inbox-100785464-large.jpg?auto=webp&quality=85,70'),
    );
  }

  @override
  Widget build(BuildContext context) {
    final authBloc = BlocProvider.of<AuthBloc>(context);

    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is LoadingState) {
          // modalLoading(context, 'Validating...');
        } else if (state is FailureState) {
          Navigator.of(context).pop();
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: CustomText(text: state.error, fontSize: 18),
              backgroundColor: Color.fromARGB(255, 15, 15, 15)));
        } else if (state is LogInState) {
          Navigator.of(context).pop();
          Navigator.pushAndRemoveUntil(
              context,
              customRoute(page: HomePage(), curved: Curves.easeInOut),
              (route) => false);
        }
      },
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 250, 248, 248),
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 252, 248, 248),
          elevation: 0,
          leading: IconButton(
            icon: Icon(Icons.arrow_back,
                size: 25, color: Color.fromARGB(255, 9, 9, 9)),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        body: SafeArea(
          child: Form(
            key: _keyForm,
            child: ListView(
              physics: BouncingScrollPhysics(),
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      child: Image.asset(
                        'Assets/logoo.png',
                        height: 40,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: CustomText(
                    text: 'Login',
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 25, 175, 202),
                  ),
                ),
                Padding(padding: EdgeInsets.all(0.0)),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: TextFormFrave(
                    controller: emailController,
                    type: TextInputType.emailAddress,
                    validator: validatedEmail,
                    hintText: 'Enter your Email ID',
                    fontSize: 15,
                    isIcon: false,
                  ),
                ),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: TextFormFrave(
                    controller: passowrdController,
                    obscureText: isChangeSuffixIcon,
                    hintText: 'Enter your password',
                    fontSize: 15,
                    isIcon: false,
                    suffixIcon: isChangeSuffixIcon
                        ? Icons.visibility_off_outlined
                        : Icons.visibility_outlined,
                    isSuffixIcon: true,
                    onPressedSuffixIcon: () => setState(
                        () => isChangeSuffixIcon = !isChangeSuffixIcon),
                    validator: passwordValidator,
                  ),
                ),
                SizedBox(height: 40),
                Padding(
                  padding: const EdgeInsets.only(left: 230),
                  child: TextButton(
                    child: CustomText(
                        text: 'Forgot password?',
                        color: Color.fromARGB(205, 16, 16, 16),
                        fontSize: 15),
                    onPressed: () => Navigator.of(context).push(customRoute(
                        page: LoadingPage(), curved: Curves.easeInOut)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: CustomButton(
                    color: Colors.white,
                    text: 'Login',
                    height: 30,
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    onPressed: () {
                      if (_keyForm.currentState.validate()) {
                        authBloc.add(LoginEvent(
                            email: emailController.text,
                            password: passowrdController.text));
                        notify();
                        Navigator.of(context).pushReplacementNamed('homePage');
                      }
                    },
                  ),
                ),
                SizedBox(
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: TextButton(
                      child: CustomText(
                        text: 'Do not have an account? Sign up',
                        fontSize: 14,
                        color: Color.fromARGB(200, 17, 16, 16),
                      ),
                      onPressed: () => Navigator.of(context)
                          .pushReplacementNamed('signUpPage'),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

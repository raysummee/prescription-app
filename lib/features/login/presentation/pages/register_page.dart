import 'package:app/core/config/app_config.dart';
import 'package:app/features/login/data/repository/authentication_repository.dart';
import 'package:app/features/shared/components/loading_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';

import '../bloc/authentication/authentication_bloc.dart';
import '../bloc/login/login_cubit.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => AuthenticationRepositoryImp(),
      child: BlocProvider(
        create: (context) =>
            LoginCubit(context.read<AuthenticationRepositoryImp>()),
        child: const LoginView(),
      ),
    );
  }
}

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final appTheme = AppConfig.of(context).appTheme;
    return Scaffold(
      body: MultiBlocListener(
        listeners: [
          BlocListener<LoginCubit, LoginState>(
            listener: (context, state) {
              if (state is LoginLoading) {
                LoadingDialog.show(context);
              }
              if (state is LoginSuccess) {
                LoadingDialog.close();
                context.read<AuthenticationBloc>().add(AuthenticationStarted());
              }
              if (state is LoginError) {
                LoadingDialog.close();
                Fluttertoast.showToast(msg: state.message);
              }
            },
          ),
          BlocListener<AuthenticationBloc, AuthenticationState>(
            listener: (context, state) {
              if (state is AuthenticationSuccess) {
                context.go("/");
              }
            },
          ),
        ],
        child: SafeArea(
          top: false,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  "assets/images/banner.webp",
                  height: 0.35.sh,
                  fit: BoxFit.cover,
                ),
                SizedBox(
                  height: 29.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 22.w),
                  child: Text(
                    "Welcome to",
                    style:
                        TextStyle(fontSize: 24.sp, fontWeight: FontWeight.w700),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 0.2.sw, right: 22.w),
                  child: Text(
                    "The App",
                    style:
                        TextStyle(fontSize: 36.sp, fontWeight: FontWeight.w700),
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Container(
                    margin: EdgeInsets.symmetric(horizontal: 22.w),
                    decoration: BoxDecoration(
                        color: appTheme.colorSecondary,
                        borderRadius: BorderRadius.circular(9.w)),
                    alignment: Alignment.center,
                    height: 60.w,
                    child: TextField(
                      keyboardType: TextInputType.emailAddress,
                      controller: _emailController,
                      decoration: InputDecoration(
                          hintText: "Email",
                          border: InputBorder.none,
                          hintStyle: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500,
                              color: appTheme.colorTextSecondary),
                          contentPadding:
                              EdgeInsets.symmetric(horizontal: 17.w)),
                    )),
                SizedBox(
                  height: 8.h,
                ),
                Container(
                    margin: EdgeInsets.symmetric(horizontal: 22.w),
                    decoration: BoxDecoration(
                        color: appTheme.colorSecondary,
                        borderRadius: BorderRadius.circular(9.w)),
                    alignment: Alignment.center,
                    height: 60.w,
                    child: TextField(
                      obscureText: true,
                      controller: _passwordController,
                      decoration: InputDecoration(
                          hintText: "Password",
                          border: InputBorder.none,
                          hintStyle: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500,
                              color: appTheme.colorTextSecondary),
                          contentPadding:
                              EdgeInsets.symmetric(horizontal: 17.w)),
                    )),
                SizedBox(
                  height: 8.h,
                ),
                Container(
                    margin: EdgeInsets.symmetric(horizontal: 22.w),
                    decoration: BoxDecoration(
                        color: appTheme.colorSecondary,
                        borderRadius: BorderRadius.circular(9.w)),
                    alignment: Alignment.center,
                    height: 60.w,
                    child: TextField(
                      obscureText: true,
                      controller: _confirmController,
                      decoration: InputDecoration(
                          hintText: "Confirm Password",
                          border: InputBorder.none,
                          hintStyle: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500,
                              color: appTheme.colorTextSecondary),
                          contentPadding:
                              EdgeInsets.symmetric(horizontal: 17.w)),
                    )),
                SizedBox(
                  height: 23.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 22.w),
                  child: ElevatedButton(
                      onPressed: () {
                        context.read<LoginCubit>().signup(
                            email: _emailController.text,
                            password: _passwordController.text,
                            confirm: _confirmController.text);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: appTheme.colorPrimary,
                        elevation: 0.0,
                        fixedSize: Size(1.sw, 60.h),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: const Text("Sign up")),
                ),
                Center(
                  child: TextButton(
                      onPressed: () {
                        context.pushReplacement("/login");
                      },
                      child: Text(
                        "Login instead",
                        style: TextStyle(color: appTheme.colorPrimary),
                      )),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

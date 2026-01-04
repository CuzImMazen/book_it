import 'package:book_it/core/error/auth_error_mapper.dart';
import 'package:book_it/core/extensions/localization_extension.dart';
import 'package:book_it/core/style/colors.dart';
import 'package:book_it/core/utils/helpers.dart';
import 'package:book_it/core/utils/validators.dart';
import 'package:book_it/core/widgets/back_button_row.dart';
import 'package:book_it/features/Authentication/presentation/ViewModel/cubit/authentication_cubit.dart';
import 'package:book_it/core/widgets/label_text.dart';
import 'package:book_it/core/widgets/primary_button.dart';
import 'package:book_it/core/widgets/custom_text_field.dart';
import 'package:book_it/features/Authentication/presentation/widgets/dont_have_account_row.dart';
import 'package:book_it/core/widgets/primary_text.dart';
import 'package:book_it/core/widgets/secondary_text.dart';
import 'package:book_it/features/Favourites/presentation/viewModel/cubit/favourites_cubit.dart';
import 'package:book_it/features/History/presentation/ViewModel/cubit/booking_history_cubit.dart';
import 'package:book_it/features/Home/presentation/viewModel/cubit/property_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SignInForm extends StatefulWidget {
  const SignInForm({super.key});

  @override
  State<SignInForm> createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _phoneController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();
  @override
  void dispose() {
    _phoneController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthenticationCubit, AuthenticationState>(
      listener: (context, state) {
        if (state is AuthenticationSignInFailure) {
          showSnackBar(
            context: context,
            message: state.error.localized(context),
            duration: Duration(seconds: 2),
            color: Colors.red,
          );
        }
        if (state is AuthenticationSignInSuccess) {
          Future.wait([
            context.read<PropertyCubit>().getProperties(const {}),
            context.read<FavouritesCubit>().fetchFavourites(),
            context.read<BookingHistoryCubit>().fetchAllBookings(),
          ]);
          showSnackBar(
            context: context,
            message: context.auth.auth_signedInSuccess,
            color: Colors.green,
            duration: Duration(seconds: 2),
          );
          context.go("/main");
        }
      },
      builder: (context, state) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: SingleChildScrollView(
            child: Form(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 60),
                  if (state is! AuthenticationSignOutSuccess)
                    BackButtonRow(
                      onTap: () {
                        if (state is! AuthenticationLoading) {
                          FocusScope.of(context).unfocus();
                          context.pop();
                        }
                      },
                    ),
                  SizedBox(height: 50),
                  PrimaryText(text: context.auth.auth_welcomeBack),
                  SizedBox(height: 10),
                  SecondaryText(text: context.auth.auth_loginSubtitle),

                  SizedBox(height: 80),
                  LabelText(text: context.auth.auth_phoneNumber),
                  SizedBox(height: 15),
                  CustomTextField(
                    isNumber: true,
                    controller: _phoneController,
                    validator: (value) => phoneValidator(context, value),
                    hintText: context.auth.auth_enterPhone,
                    prefixIcon: Icons.phone,
                  ),
                  SizedBox(height: 20),
                  LabelText(text: context.auth.auth_password),
                  SizedBox(height: 15),
                  CustomTextField(
                    controller: _passwordController,
                    validator: (value) => passwordValidator(context, value),
                    isPassword: true,
                    hintText: context.auth.auth_enterPassword,
                    prefixIcon: Icons.lock,
                  ),

                  SizedBox(height: 60),
                  if (state is AuthenticationLoading)
                    Center(
                      child: CircularProgressIndicator(color: kPrimaryColor),
                    )
                  else
                    Column(
                      children: [
                        PrimaryButton(
                          text: context.auth.auth_signIn,
                          onTap: () {
                            if (_formKey.currentState!.validate()) {
                              FocusScope.of(context).unfocus();
                              context.read<AuthenticationCubit>().signIn(
                                phoneNumber: _phoneController.text.trim(),
                                password: _passwordController.text.trim(),
                              );
                            }
                          },
                        ),
                        SizedBox(height: 20),
                        DontHaveAccountRow(),
                      ],
                    ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

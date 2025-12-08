import 'package:book_it/core/style/colors.dart';
import 'package:book_it/core/utils/helpers.dart';
import 'package:book_it/features/Authentication/presentation/ViewModel/cubit/authentication_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthenticationCubit, AuthenticationState>(
      listener: (context, state) {
        if (state is AuthenticationSignOutSuccess) {
          showSnackBar(
            context: context,
            message: "Successfully logged out",
            color: Colors.green,
            duration: Duration(seconds: 2),
          );
          context.go("/signin");
        }
        if (state is AuthenticationSignOutFailure) {
          showSnackBar(
            context: context,
            message: state.message,
            color: Colors.red,
            duration: Duration(seconds: 2),
          );
        }
      },
      builder: (context, state) {
        if (state is AuthenticationLoading) {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(color: kPrimaryColor),
            ),
          );
        }
        return Scaffold(
          body: Padding(
            padding: EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 50),
                Text("Settings", style: TextStyle(fontSize: 30)),
                SizedBox(height: MediaQuery.of(context).size.height / 3),
                Center(
                  child: GestureDetector(
                    onTap: () {
                      context.read<AuthenticationCubit>().signOut();
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Text(
                          "Logout",
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

import 'package:book_it/core/style/colors.dart';
import 'package:book_it/core/utils/helpers.dart';
import 'package:book_it/features/Authentication/presentation/ViewModel/cubit/authentication_cubit.dart';
import 'package:book_it/core/extensions/localization_extension.dart';
import 'package:book_it/features/Settings/presentation/viewModel/cubit/darkmode_cubit.dart';
import 'package:book_it/features/Settings/presentation/viewModel/cubit/darkmode_state.dart';
import 'package:book_it/features/Settings/presentation/viewModel/cubit/language_cubit.dart';
import 'package:book_it/features/Settings/presentation/widgets/settings_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<AuthenticationCubit, AuthenticationState>(
        listener: (context, state) {
          if (state is AuthenticationSignOutFailure) {
            showSnackBar(
              context: context,
              message: state.message,
              color: Colors.red,
              duration: const Duration(seconds: 3),
            );
          }
          if (state is AuthenticationSignOutSuccess) {
            context.go("/signin");
            showSnackBar(
              context: context,
              message: "You logged out successfully",
              color: Colors.green,
            );
          }
        },
        builder: (context, state) {
          if (state is AuthenticationLoading) {
            return const Center(
              child: CircularProgressIndicator(color: kPrimaryColor),
            );
          }
          return SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: ListView(
                children: [
                  const SizedBox(height: 40),
                  Center(
                    child: Text(
                      context.loc.settingsName,
                      style: const TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 40),

                  // Dark Mode
                  SettingsCard(
                    icon: Icons.dark_mode,
                    title: context.loc.darkMode,
                    trailing: BlocBuilder<DarkmodedCubit, DarkmodeState>(
                      builder: (context, state) {
                        final isDark =
                            state.themeMode == ThemeMode.dark ||
                            (state.themeMode == ThemeMode.system &&
                                MediaQuery.of(context).platformBrightness ==
                                    Brightness.dark);

                        return Switch.adaptive(
                          activeThumbColor: kPrimaryColor,
                          value: isDark,
                          onChanged: (value) {
                            context.read<DarkmodedCubit>().toggleTheme(value);
                          },
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Language Selection
                  SettingsCard(
                    icon: Icons.language,
                    title: context.loc.languaSett,
                    onTap: () => showLanguageDialog(
                      context,
                      currentLang: context
                          .read<LanguageCubit>()
                          .state
                          .languageCode,
                      onSelect: (lang) async {
                        await context.read<LanguageCubit>().changeLanguage(
                          lang,
                        );
                      },
                    ),
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      size: 18,
                      color: Colors.grey.shade500,
                    ),
                  ),
                  const SizedBox(height: 16),

                  SettingsCard(
                    icon: Icons.sync,
                    title: context.loc.myproperties,
                    onTap: () {
                      final authState = context
                          .read<AuthenticationCubit>()
                          .state;
                      final bool isOwner =
                          authState is AuthenticationSignInSuccess &&
                          authState.user.role == "owner";

                      if (isOwner) {
                        context.go("/main/myproperties");
                      } else {
                        showCantAccessOwnerFeatureDialog(context);
                      }
                    },
                    trailing: const Icon(
                      Icons.arrow_forward_ios,
                      size: 18,
                      color: Colors.grey,
                    ),
                  ),

                  const SizedBox(height: 16),

                  // Logout
                  SettingsCard(
                    icon: Icons.logout,
                    title: context.loc.logOute,
                    onTap: () => showLogoutDialog(
                      context,
                      onConfirm: () =>
                          context.read<AuthenticationCubit>().signOut(),
                    ),
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      size: 18,
                      color: Colors.grey.shade500,
                    ),
                  ),
                  const SizedBox(height: 40),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

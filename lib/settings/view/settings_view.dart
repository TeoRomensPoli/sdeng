import 'package:app_ui/app_ui.dart';
import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sdeng/app/bloc/app_bloc.dart';
import 'package:sdeng/login/login.dart';
import 'package:sdeng/payment_formula/payment_formula.dart';
import 'package:sdeng/profile_modal/view/profile_modal.dart';
import 'package:sdeng/settings/user_profile.dart';

@visibleForTesting
class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    final user = context.read<AppBloc>().state.sdengUser;

    return BlocListener<AppBloc, AppState>(
      listener: (context, state) {
        if (state.status == AppStatus.unauthenticated) {
          Navigator.of(context).pop();
          Navigator.of(context).push(LoginPage.route());
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: AppLogo.light(),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(
              AppSpacing.xlg - AppSpacing.xs,
              AppSpacing.md,
              AppSpacing.xlg - AppSpacing.xs,
              AppSpacing.xs,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text('Settings',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Profile',
                          style: Theme.of(context).textTheme.titleSmall?.copyWith(
                              color: AppColors.blueGrey,
                              fontWeight: AppFontWeight.semiBold,
                              fontSize: 17,
                          ),
                        ),
                        const Text(
                          'Update your profile details here',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Color(0xFF475467),
                            height: 1.3,
                          ),
                        ),
                      ],
                    ),
                    SecondaryButton(
                      text: 'Edit',
                      onPressed: () {
                        showAppModal(
                            isDismissible: true,
                            enableDrag: false,
                            context: context,
                            content: ProfileModal(
                              userId: user!.id,
                              sdengUser: user,
                            )
                        );
                      }
                    )
                  ],
                ),
                const Divider(
                  height: AppSpacing.xxlg,
                  indent: 0,
                  endIndent: 0,
                ),
                Text(
                  'General',
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      color: AppColors.blueGrey,
                      fontWeight: AppFontWeight.semiBold,
                      fontSize: 17
                  ),
                ),
                SettingTile(
                  title: 'Payment Formula Settings',
                  trailing: const Icon(
                    Icons.chevron_right,
                  ),
                  onTap: () {
                    Navigator.of(context).push(PaymentFormulaPage.route());
                  },
                ),
                const Divider(
                  color: AppColors.borderOutline,
                  height: AppSpacing.xs,
                  indent: 20,
                  endIndent: 20,
                ),
                Text(
                  'Legal',
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      color: AppColors.blueGrey,
                      fontWeight: AppFontWeight.medium
                  ),
                ),
                SettingTile(
                  key: const Key('userProfilePage_termsOfServiceItem'),
                  leading: const Icon(FeatherIcons.info, color: AppColors.highEmphasisSurface, size: 20,),
                  title: 'Terms of Use & Privacy Policy',
                  onTap: () {

                  },
                ),
                const SettingTile(
                  key: Key('userProfilePage_aboutItem'),
                  leading: Icon(FeatherIcons.info, color: AppColors.highEmphasisSurface, size: 20,),
                  title: 'About',
                ),
                const SizedBox(height: AppSpacing.lg),
                const SizedBox(height: AppSpacing.lg),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

@visibleForTesting
class UserProfileTitle extends StatelessWidget {
  const UserProfileTitle({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.all(AppSpacing.lg),
      child: Text(
        'Profile',
        style: theme.textTheme.headlineLarge,
      ),
    );
  }
}
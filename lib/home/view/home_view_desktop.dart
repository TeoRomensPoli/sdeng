import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sdeng/app/bloc/app_bloc.dart';
import 'package:sdeng/athletes_full/view/athletes_page.dart';
import 'package:sdeng/medical/view/medicals_page.dart';
import 'package:sdeng/notes/view/notes_page.dart';
import 'package:sdeng/payments/view/payments_page.dart';
import 'package:sdeng/profile_modal/view/profile_modal.dart';
import 'package:sdeng/settings/view/settings_page.dart';
import 'package:sdeng/teams/view/teams_page.dart';

class HomeViewDesktop extends StatelessWidget {
  const HomeViewDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<AppBloc>();

    return MultiBlocListener(
      listeners: [
        BlocListener<AppBloc, AppState>(
          listener: (context, state) {
            if (state.showProfileOverlay) {
              showAppModal(
                isDismissible: false,
                enableDrag: false,
                context: context,
                content: ProfileModal(userId: state.sdengUser!.id),
              );
            }
          },
        ),
      ],
      child: Scaffold(
        appBar: AppBar(
          title: AppLogo.light(),
          centerTitle: false,
          actions: [
            UserProfileButton(
              onPressed: () => Navigator.of(context).push(SettingsPage.route()),
            )
          ],
        ),
        body: SafeArea(
          child: GridView.builder(
            padding: const EdgeInsets.all(16.0),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 16.0,
              mainAxisSpacing: 16.0,
              childAspectRatio: 1.5,
            ),
            itemCount: 6, // Total number of AppCards and InfoCard
            itemBuilder: (context, index) {
              if (index == 0) {
                return InfoCard(
                  title:
                      'Welcome, ${bloc.state.sdengUser?.societyName ?? 'null'}',
                  content:
                      'Here\'s a simple dashboard where you can easily reach all services',
                );
              } else {
                final cards = [
                  HomeCard(
                    title: 'Teams',
                    content: Text(
                      bloc.state.homeValues?['teams'].toString() ?? 'null',
                      style: const TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Inter',
                      ),
                    ),
                    image: Assets.images.logo1.svg(height: 87),
                    action: SecondaryButton(
                      text: 'View all',
                      onPressed: () =>
                          Navigator.of(context).push(TeamsPage.route()),
                    ),
                  ),
                  HomeCard(
                    title: 'Athletes',
                    content: Text(
                      bloc.state.homeValues?['athletes'].toString() ?? 'null',
                      style: const TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Inter',
                      ),
                    ),
                    image: Assets.images.logo3.svg(height: 87),
                    action: SecondaryButton(
                      text: 'View all',
                      onPressed: () =>
                          Navigator.of(context).push(AthletesPage.route()),
                    ),
                  ),
                  HomeCard(
                    title: 'Medical Visits',
                    content: Text(
                      '${bloc.state.homeValues?['expired_medicals'].toString() ?? 'null'} Expired',
                      style: const TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Inter',
                      ),
                    ),
                    image: Assets.images.logo5.svg(height: 87),
                    action: SecondaryButton(
                      text: 'Fix',
                      onPressed: () =>
                          Navigator.of(context).push(MedicalsPage.route()),
                    ),
                  ),
                  HomeCard(
                    title: 'Payments',
                    content: Text(
                      bloc.state.homeValues?['payments'].toString() ?? 'null',
                      style: const TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Inter',
                      ),
                    ),
                    image: Assets.images.logo2.svg(height: 87),
                    action: SecondaryButton(
                      text: 'View all',
                      onPressed: () =>
                          Navigator.of(context).push(PaymentsPage.route()),
                    ),
                  ),
                  HomeCard(
                    title: 'Notes',
                    content: Text(
                      bloc.state.homeValues?['notes'].toString() ?? 'null',
                      style: const TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Inter',
                      ),
                    ),
                    image: Assets.images.logo4.svg(height: 87),
                    action: SecondaryButton(
                      text: 'View all',
                      onPressed: () =>
                          Navigator.of(context).push(NotesPage.route()),
                    ),
                  ),
                ];
                return cards[index - 1];
              }
            },
          ),
        ),
      ),
    );
  }
}

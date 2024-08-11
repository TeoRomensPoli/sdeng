import 'package:athletes_repository/athletes_repository.dart';
import 'package:authentication_client/authentication_client.dart';
import 'package:documents_repository/documents_repository.dart';
import 'package:medicals_repository/medicals_repository.dart';
import 'package:notes_repository/notes_repository.dart';
import 'package:payments_repository/payments_repository.dart';
import 'package:teams_repository/teams_repository.dart';
import 'package:persistent_storage/persistent_storage.dart';
import 'package:sdeng/app/view/app.dart';
import 'package:user_repository/user_repository.dart';

import 'bootstrap.dart';

void main() {
  bootstrap(
    (
      sharedPreferences,
    ) async {

      final apiClient = FlutterSdengApiClient();

      final persistentStorage = PersistentStorage(
        sharedPreferences: sharedPreferences,
      );

      final authenticationClient = AuthenticationClient();

      final userRepository = UserRepository(
        authenticationClient: authenticationClient,
        apiClient: apiClient,
      );

      final newsRepository = TeamsRepository(
        apiClient: apiClient,
      );

      final medicalsRepository = MedicalsRepository(
        apiClient: apiClient,
      );

      final paymentsRepository = PaymentsRepository(
        apiClient: apiClient,
      );

      final notesRepository = NotesRepository(
        apiClient: apiClient,
      );

      final documentsRepository = DocumentsRepository(
        apiClient: apiClient,
      );

      final athletesRepository = AthletesRepository(
        storage: AthletesStorage(storage: persistentStorage),
        apiClient: apiClient,
      );

      return App(
        userRepository: userRepository,
        teamsRepository: newsRepository,
        athletesRepository: athletesRepository,
        medicalsRepository: medicalsRepository,
        paymentsRepository: paymentsRepository,
        notesRepository: notesRepository,
        documentsRepository: documentsRepository,
        user: await userRepository.user.first,
      );
    },
  );
}
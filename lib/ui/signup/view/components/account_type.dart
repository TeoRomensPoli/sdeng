import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sdeng/ui/signup/bloc/signup_bloc.dart';

class AccountType extends StatelessWidget {
  const AccountType({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 16.0),
          child: Text(
            'What type of user are you?',
            style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                    color: Colors.grey,
                    width: 0.5
                )
            ),
            child: ListTile(
              leading: Image.asset(
                  'assets/icons/3d-user.png'),
              title: const Text('Athlete'),
              titleTextStyle: const TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'ProductSans'
              ),
              subtitle: const Text('I\'m an athlete'),
              subtitleTextStyle: const TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                  fontFamily: 'ProductSans'
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                    color: Colors.grey,
                    width: 0.5
                )
            ),
            child: ListTile(
              leading: Image.asset('assets/icons/3d-admin.png'),
              title: const Text('Staff'),
              titleTextStyle: const TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'ProductSans'
              ),
              subtitle: const Text('I\'m a staff member'),
              subtitleTextStyle: const TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                  fontFamily: 'ProductSans'
              ),
              onTap: () {
                context.read<SignupBloc>().nextStep();
              },
            ),
          ),
        ),
        const SizedBox(height: 20,)
      ],
    );
  }
}
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quadro/screens/password_manager.dart';
import '../components/profile_image.dart';
import '../components/text_field.dart';
import 'package:quadro/components/profile_options.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Settings")
              ],
            ),
            Options(
                icon: Icons.key_outlined,
                option: "Password Manager",
                onTap: (){
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const PasswordManager())
                  );
                },
                arrow: Icons.arrow_forward_ios_outlined),
            Options(
                icon: Icons.delete,
                option: "Delete",
                onTap: (){
                  showDeleteConfirmationDialog(context);

                },
                arrow: Icons.arrow_forward_ios_outlined),

          ],
        ),
      ),
    );
  }
}
Future<void> showDeleteConfirmationDialog(BuildContext context) async {
  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Delete account  Confirmation'),
        content: Text('Are you sure you want to Delete your account?'),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(); // Close the dialog
            },
            child: Text('Cancel',
              style: TextStyle(
                  color: Colors.teal,
                  fontSize: 15
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              // Perform the logout action here
              Navigator.of(context).pop(); // Close the dialog
            },
            child: Text('Delete',
              style: TextStyle(
                  color: Colors.teal,
                  fontSize: 15
              ),
            ),
          )],
      );
    },
  );
}
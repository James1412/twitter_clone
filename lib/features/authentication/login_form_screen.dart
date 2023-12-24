import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:twitter/features/authentication/view_models/login_view_model.dart';
import 'package:twitter/util.dart';

import '../../constants/gaps.dart';
import '../../constants/sizes.dart';
import '../navigation/widgets/app_bar.dart';

class LoginFormScreen extends ConsumerStatefulWidget {
  const LoginFormScreen({super.key});

  @override
  CreateAccountScreenState createState() => CreateAccountScreenState();
}

class CreateAccountScreenState extends ConsumerState<LoginFormScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final Map<String, String> _formData = {};

  @override
  Widget build(BuildContext context) {
    final isDark = isDarkMode(ref);
    return Scaffold(
      appBar: const AppBarWidget(
        leadingType: LeadingType.cancel,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Gaps.v24,
              const Text(
                "Log in",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w800,
                ),
              ),
              Gaps.v24,
              TextFormField(
                onChanged: (value) {
                  setState(() {
                    _formData['email'] = value;
                  });
                },
                keyboardType: TextInputType.emailAddress,
                autocorrect: false,
                decoration: const InputDecoration(
                  labelText: "Email",
                ),
              ),
              Gaps.v12,
              TextFormField(
                obscureText: true,
                onChanged: (value) {
                  setState(() {
                    _formData['password'] = value;
                  });
                },
                autocorrect: false,
                decoration: const InputDecoration(
                  labelText: "password",
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            GestureDetector(
              onTap: () {
                if (_formData.isNotEmpty) {
                  ref.read(loginProvider.notifier).login(
                        _formData['email']!,
                        _formData['password']!,
                        context,
                      );
                }
              },
              child: Container(
                width: Sizes.size96,
                height: 47,
                decoration: BoxDecoration(
                  color: isDark ? Colors.white : Colors.black,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Center(
                  child: Text(
                    "Next",
                    style: TextStyle(
                      color: isDark ? Colors.black : Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

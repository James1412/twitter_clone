import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:twitter/features/authentication/confirmation_screen.dart';
import 'package:twitter/features/authentication/customize_experience_screen.dart';
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

  final TextEditingController _birthdayController = TextEditingController();
  late DateTime _initialDate;
  final bool _pickingDate = false;
  bool _writingEmail = false;
  final bool _agreed = false;

  @override
  void initState() {
    super.initState();
    _birthdayController.addListener(() {
      setState(() {
        _formData['birthday'] = _birthdayController.text;
      });
    });
    DateTime currentDate = DateTime.now();
    final minDate =
        DateTime(currentDate.year - 10, currentDate.month, currentDate.day);
    _initialDate = minDate;

    setState(() {});
  }

  @override
  void dispose() {
    _birthdayController.dispose();
    super.dispose();
  }

  String? _isEmailValid(String? value) {
    if (value == null) return null;
    final regExp = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
    );
    if (!regExp.hasMatch(value)) {
      return "incorrect email";
    }
    return null;
  }

  String _isPasswordValid(String? value) {
    return 'incorrect password';
  }

  bool _isFormValid() => _formKey.currentState?.validate() ?? false;

  @override
  Widget build(BuildContext context) {
    final isDark = isDarkMode(ref);
    return Scaffold(
      appBar: AppBarWidget(
        leadingType: _agreed ? LeadingType.back : LeadingType.cancel,
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
                  _isFormValid();
                  setState(() => _formData['email'] = value);
                },
                validator: _isEmailValid,
                onTap: () {
                  setState(() {
                    _writingEmail = true;
                  });
                },
                keyboardType: TextInputType.emailAddress,
                autocorrect: false,
                decoration: InputDecoration(
                  labelText:
                      _writingEmail ? "Email" : "Phone number or email address",
                  suffixIcon: _agreed ||
                          (_formData['email'] != null &&
                              _isEmailValid(_formData["email"]) == null)
                      ? const Icon(Icons.check_circle, color: Colors.green)
                      : null,
                ),
              ),
              Gaps.v12,
              TextFormField(
                onChanged: (value) {
                  _isFormValid();
                  setState(() => _formData['password'] = value);
                },
                validator: _isPasswordValid,
                autocorrect: false,
                decoration: InputDecoration(
                  labelText: "password",
                  suffixIcon: _agreed ||
                          (_formData['password'] != null &&
                              _isEmailValid(_formData["password"]) == null)
                      ? const Icon(Icons.check_circle, color: Colors.green)
                      : null,
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
                if (_isFormValid()) {
                  context.go('/');
                }
              },
              child: Container(
                width: Sizes.size96,
                height: 47,
                decoration: BoxDecoration(
                  color: _isFormValid()
                      ? isDark
                          ? Colors.white
                          : Colors.black
                      : Colors.grey,
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

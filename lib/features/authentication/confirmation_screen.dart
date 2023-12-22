// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:twitter/constants/gaps.dart';
import 'package:twitter/constants/sizes.dart';
import 'package:twitter/features/authentication/password_screen.dart';
import 'package:twitter/features/navigation/widgets/app_bar.dart';

class ConfirmationScreen extends StatefulWidget {
  Map<String, String> formData;
  ConfirmationScreen({super.key, required this.formData});

  @override
  State<ConfirmationScreen> createState() => _ConfirmationScreenState();
}

class _ConfirmationScreenState extends State<ConfirmationScreen> {
  FocusNode fieldOne = FocusNode();
  FocusNode fieldTwo = FocusNode();
  FocusNode fieldThree = FocusNode();
  FocusNode fieldFour = FocusNode();
  FocusNode fieldFive = FocusNode();
  FocusNode fieldSix = FocusNode();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool isValid = false;
  final Map<String, String> _formValue = {};

  void _onNextTap() {
    if (_formKey.currentState != null) {
      if (_formKey.currentState!.validate()) {
        _formKey.currentState?.save();
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => const PasswordScreen()),
        );
      }
    }
  }

  bool? _onMove() {
    if (_formKey.currentState != null) {
      if (_formKey.currentState!.validate()) {
        return true;
      } else {
        return false;
      }
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(leadingType: LeadingType.back),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: Sizes.size32,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Gaps.v20,
            const Text(
              "We sent you a code",
              style: TextStyle(
                fontWeight: FontWeight.w800,
                fontSize: Sizes.size28,
              ),
            ),
            Gaps.v16,
            const Text(
              "Enter it below to verify",
            ),
            Text(
              widget.formData['email']!,
            ),
            Gaps.v60,
            Form(
              key: _formKey,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                    width: Sizes.size28,
                    child: TextFormField(
                      validator: (value) {
                        if (value == "") {
                          isValid = false;
                          return "Invalid";
                        }
                        isValid = true;
                        setState(() {});
                        return null;
                      },
                      onSaved: (value) {
                        print(_formValue);
                      },
                      focusNode: fieldOne,
                      onChanged: (value) {
                        if (value != "") {
                          _formValue['first'] = value;
                        }
                        FocusScope.of(context).requestFocus(fieldTwo);
                      },
                      maxLength: 1,
                      showCursor: false,
                      decoration: const InputDecoration(
                        helperStyle: TextStyle(
                          color: Colors.transparent,
                        ),
                      ),
                      style: const TextStyle(fontSize: Sizes.size32),
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.number,
                    ),
                  ),
                  SizedBox(
                    width: Sizes.size28,
                    child: TextFormField(
                      validator: (value) {
                        if (value == "") {
                          isValid = false;
                          return "Invalid";
                        }
                        isValid = true;
                        setState(() {});
                        return null;
                      },
                      onSaved: (value) {},
                      focusNode: fieldTwo,
                      onChanged: (value) {
                        if (value != "") {
                          _formValue['second'] = value;
                        }
                        FocusScope.of(context).requestFocus(fieldThree);
                      },
                      maxLength: 1,
                      showCursor: false,
                      decoration: const InputDecoration(
                        helperStyle: TextStyle(
                          color: Colors.transparent,
                        ),
                      ),
                      style: const TextStyle(fontSize: Sizes.size32),
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.number,
                    ),
                  ),
                  SizedBox(
                    width: Sizes.size28,
                    child: TextFormField(
                      validator: (value) {
                        if (value == "") {
                          isValid = false;
                          return "Invalid";
                        }
                        isValid = true;
                        setState(() {});
                        return null;
                      },
                      onSaved: (value) {},
                      focusNode: fieldThree,
                      onChanged: (value) {
                        if (value != "") {
                          _formValue['third'] = value;
                        }
                        FocusScope.of(context).requestFocus(fieldFour);
                      },
                      maxLength: 1,
                      showCursor: false,
                      decoration: const InputDecoration(
                        helperStyle: TextStyle(
                          color: Colors.transparent,
                        ),
                      ),
                      style: const TextStyle(fontSize: Sizes.size32),
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.number,
                    ),
                  ),
                  SizedBox(
                    width: Sizes.size28,
                    child: TextFormField(
                      validator: (value) {
                        if (value == "") {
                          isValid = false;
                          return "Invalid";
                        }
                        isValid = true;
                        setState(() {});
                        return null;
                      },
                      onSaved: (value) {},
                      focusNode: fieldFour,
                      onChanged: (value) {
                        if (value != "") {
                          _formValue['four'] = value;
                        }
                        FocusScope.of(context).requestFocus(fieldFive);
                      },
                      maxLength: 1,
                      showCursor: false,
                      decoration: const InputDecoration(
                        helperStyle: TextStyle(
                          color: Colors.transparent,
                        ),
                      ),
                      style: const TextStyle(fontSize: Sizes.size32),
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.number,
                    ),
                  ),
                  SizedBox(
                    width: Sizes.size28,
                    child: TextFormField(
                      validator: (value) {
                        if (value == "") {
                          isValid = false;
                          return "Invalid";
                        }
                        isValid = true;
                        setState(() {});
                        return null;
                      },
                      onSaved: (value) {},
                      focusNode: fieldFive,
                      onChanged: (value) {
                        if (value != "") {
                          _formValue['fifth'] = value;
                        }
                        FocusScope.of(context).requestFocus(fieldSix);
                      },
                      maxLength: 1,
                      showCursor: false,
                      decoration: const InputDecoration(
                        helperStyle: TextStyle(
                          color: Colors.transparent,
                        ),
                      ),
                      style: const TextStyle(fontSize: Sizes.size32),
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.number,
                    ),
                  ),
                  SizedBox(
                    width: Sizes.size28,
                    child: TextFormField(
                      validator: (value) {
                        if (value == "") {
                          isValid = false;
                          return "Invalid";
                        }
                        isValid = true;
                        setState(() {});
                        return null;
                      },
                      onSaved: (value) {},
                      focusNode: fieldSix,
                      onChanged: (value) {
                        if (value != "") {
                          _formValue['sixth'] = value;
                        }
                        if (_onMove() == false) {
                          setState(() {
                            isValid = false;
                          });
                        }
                      },
                      maxLength: 1,
                      showCursor: false,
                      decoration: const InputDecoration(
                        helperStyle: TextStyle(
                          color: Colors.transparent,
                        ),
                      ),
                      style: const TextStyle(fontSize: Sizes.size32),
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.number,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: Sizes.size32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Spacer(),
            const Text(
              "Didn't receive email?",
              style: TextStyle(color: Colors.blue),
            ),
            Gaps.v20,
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: isValid ? Colors.black : Colors.grey,
                borderRadius: BorderRadius.circular(Sizes.size24),
              ),
              child: TextButton(
                onPressed: _onNextTap,
                child: const Text(
                  "Next",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w800,
                    fontSize: Sizes.size16,
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

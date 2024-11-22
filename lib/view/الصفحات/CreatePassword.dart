import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:invest/controller/auth/CreatePassword.dart';

class CreatePassword extends StatefulWidget {
  @override
  _CreatePasswordState createState() => _CreatePasswordState();
}

class _CreatePasswordState extends State<CreatePassword> {
  bool _obscureText = true;
  bool hasMinLength = false;
  bool hasNumber = false;
  bool hasUpperCase = false;
  final TextEditingController _passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _passwordController.addListener(_validatePassword);
  }

  void _validatePassword() {
    final password = _passwordController.text;
    setState(() {
      hasMinLength = password.length >= 8;
      hasNumber = password.contains(RegExp(r'\d'));
      hasUpperCase = password.contains(RegExp(r'[A-Z]'));
    });
  }

  @override
  Widget build(BuildContext context) {
    CreatePasswordControllerimp controller =
        Get.put(CreatePasswordControllerimp());

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Get.back();
          },
        ),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: constraints.maxHeight,
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: IntrinsicHeight(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Create a password',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 24),
                      TextField(
                        controller: _passwordController,
                        obscureText: _obscureText,
                        decoration: InputDecoration(
                          labelText: 'Password',
                          suffixIcon: IconButton(
                            icon: Icon(
                              _obscureText
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                            ),
                            onPressed: () {
                              setState(() {
                                _obscureText = !_obscureText;
                              });
                            },
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                      SizedBox(height: 16),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildPasswordRequirement(
                            "8 إلى 128 حرف",
                            hasMinLength,
                          ),
                          _buildPasswordRequirement(
                            "على الأقل رقم واحد",
                            hasNumber,
                          ),
                          _buildPasswordRequirement(
                            "على الأقل حرف كبير واحد",
                            hasUpperCase,
                          ),
                        ],
                      ),
                      SizedBox(height: 24),
                      Spacer(),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                const Color.fromRGBO(251, 192, 45, 1),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          onPressed: hasMinLength && hasNumber && hasUpperCase
                              ? () {
                                  controller.goToWelcome();
                                }
                              : null,
                          child: Text(
                            'Next',
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildPasswordRequirement(String text, bool isValid) {
    return Row(
      children: [
        Icon(
          isValid ? Icons.check : Icons.close,
          color: isValid ? Colors.green : Colors.red,
        ),
        SizedBox(width: 8),
        Text(
          text,
          style: TextStyle(
            color: isValid ? Colors.green : Colors.red,
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    _passwordController.dispose();
    super.dispose();
  }
}

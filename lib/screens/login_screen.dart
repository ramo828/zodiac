import 'package:flutter/material.dart';
import '../constants/app_constants.dart';
import '../widgets/app_widgets.dart';

/// Giriş Ekranı (Login)
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: MediaQuery.of(context).size.height * 0.1),
            Text(
              AppStrings.welcomeTitle,
              style: Theme.of(context).textTheme.headlineLarge,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.08),
            CustomTextField(
              controller: _emailController,
              labelText: AppStrings.emailLabel,
              hintText: AppStrings.emailHint,
              prefixIcon: Icons.email,
            ),
            const SizedBox(height: 20),
            CustomTextField(
              controller: _passwordController,
              labelText: AppStrings.passwordLabel,
              hintText: AppStrings.passwordHint,
              prefixIcon: Icons.lock,
              obscureText: true,
            ),
            const SizedBox(height: 30),
            CustomButton(
              text: AppStrings.loginButton,
              onPressed: () {
                // Sistəmə daxil olma əməliyyatı
              },
            ),
            const SizedBox(height: 16),
            TextButton(
              onPressed: () {
                // Şifrəni xatırlatma əməliyyatı
              },
              child: const Text(AppStrings.forgotPassword),
            ),
          ],
        ),
      ),
    );
  }
}

import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../constants/app_constants.dart';
import '../widgets/app_widgets.dart';

/// Qeydiyyat Ekranı (Register)
class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _birthDateController = TextEditingController();
  final _genderController = TextEditingController();

  DateTime? _selectedDate;
  String? _selectedGender;

  Future<void> _selectDate(BuildContext context) async {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return ClipRRect(
          borderRadius: const BorderRadius.vertical(top: Radius.circular(25)),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
            child: Container(
              height: 350,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surface.withValues(alpha: 0.2),
                borderRadius: const BorderRadius.vertical(top: Radius.circular(25)),
                border: Border(
                  top: BorderSide(
                    color: Theme.of(context).colorScheme.primary.withValues(alpha: 0.5),
                    width: 1.5,
                  ),
                ),
              ),
              child: Column(
                children: [
                  const SizedBox(height: 10),
                  Container(width: 40, height: 4, decoration: BoxDecoration(color: Colors.white54, borderRadius: BorderRadius.circular(2))),
                  const SizedBox(height: 10),
                  Expanded(
                    child: CupertinoTheme(
                      data: const CupertinoThemeData(
                        textTheme: CupertinoTextThemeData(
                          dateTimePickerTextStyle: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ),
                      child: CupertinoDatePicker(
                        mode: CupertinoDatePickerMode.date,
                        initialDateTime: _selectedDate ?? DateTime(2000),
                        minimumDate: DateTime(1920),
                        maximumDate: DateTime.now(),
                        onDateTimeChanged: (DateTime newDate) {
                          setState(() {
                            _selectedDate = newDate;
                            _birthDateController.text = "\${newDate.day.toString().padLeft(2, '0')}/\${newDate.month.toString().padLeft(2, '0')}/\${newDate.year}";
                          });
                        },
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
                    child: CustomButton(
                      text: 'Təsdiqlə',
                      onPressed: () {
                         if (_birthDateController.text.isEmpty) {
                            final d = _selectedDate ?? DateTime(2000);
                            setState(() {
                              _birthDateController.text = "\${d.day.toString().padLeft(2, '0')}/\${d.month.toString().padLeft(2, '0')}/\${d.year}";
                            });
                         }
                         Navigator.pop(context);
                      },
                    ),
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            ),
          ),
        );
      }
    );
  }

  void _selectGender(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return ClipRRect(
          borderRadius: const BorderRadius.vertical(top: Radius.circular(25)),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
            child: Container(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surface.withValues(alpha: 0.2),
                borderRadius: const BorderRadius.vertical(top: Radius.circular(25)),
                border: Border(
                  top: BorderSide(
                    color: Theme.of(context).colorScheme.primary.withValues(alpha: 0.5),
                    width: 1.5,
                  ),
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(height: 10),
                  Container(width: 40, height: 4, decoration: BoxDecoration(color: Colors.white54, borderRadius: BorderRadius.circular(2))),
                  const SizedBox(height: 20),
                  ListTile(
                    leading: const Icon(Icons.male, color: Colors.blue, size: 28),
                    title: const Text('Kişi', style: TextStyle(color: Colors.white, fontSize: 18)),
                    onTap: () {
                      setState(() {
                        _selectedGender = 'Kişi';
                        _genderController.text = 'Kişi';
                      });
                      Navigator.pop(context);
                    },
                  ),
                  Divider(color: Colors.white.withValues(alpha: 0.1)),
                  ListTile(
                    leading: const Icon(Icons.female, color: Colors.pink, size: 28),
                    title: const Text('Qadın', style: TextStyle(color: Colors.white, fontSize: 18)),
                    onTap: () {
                      setState(() {
                        _selectedGender = 'Qadın';
                        _genderController.text = 'Qadın';
                      });
                      Navigator.pop(context);
                    },
                  ),
                  const SizedBox(height: 30),
                ],
              ),
            ),
          ),
        );
      }
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _birthDateController.dispose();
    _genderController.dispose();
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
            SizedBox(height: MediaQuery.of(context).size.height * 0.05),
            Text(
              AppStrings.registerTitle,
              style: Theme.of(context).textTheme.headlineLarge,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.05),
            CustomTextField(
              controller: _nameController,
              labelText: AppStrings.fullName,
              hintText: AppStrings.fullNameHint,
              prefixIcon: Icons.person,
            ),
            const SizedBox(height: 16),
            CustomTextField(
              controller: _emailController,
              labelText: AppStrings.emailLabel,
              hintText: AppStrings.emailHint,
              prefixIcon: Icons.email,
            ),
            const SizedBox(height: 16),
            CustomTextField(
              controller: _birthDateController,
              labelText: "Doğum tarixi",
              hintText: "GG/AA/İİİİ",
              prefixIcon: Icons.calendar_today,
              readOnly: true,
              onTap: () => _selectDate(context),
            ),
            const SizedBox(height: 16),
            CustomTextField(
              controller: _genderController,
              labelText: "Cinsiyyət",
              hintText: "Seçin",
              prefixIcon: Icons.wc,
              readOnly: true,
              onTap: () => _selectGender(context),
            ),
            const SizedBox(height: 16),
            CustomTextField(
              controller: _passwordController,
              labelText: AppStrings.passwordLabel,
              hintText: AppStrings.passwordHint,
              prefixIcon: Icons.lock,
              obscureText: true,
            ),
            const SizedBox(height: 16),
            CustomTextField(
              controller: _confirmPasswordController,
              labelText: AppStrings.passwordRepeat,
              hintText: AppStrings.passwordRepeatHint,
              prefixIcon: Icons.lock_outline,
              obscureText: true,
            ),
            const SizedBox(height: 30),
            CustomButton(
              text: AppStrings.registerButton,
              onPressed: () {
                // Qeydiyyat əməliyyatı
              },
            ),
            const SizedBox(height: 16),
            TextButton(
              onPressed: () {
                // Giriş səhifəsinə qaytar
              },
              child: const Text(
                'Artıq hesabım var',
                style: TextStyle(color: Colors.white70),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

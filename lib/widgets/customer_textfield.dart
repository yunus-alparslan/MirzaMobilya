import 'package:flutter/material.dart';

class CustomerTextField extends StatefulWidget {
  final String labelTextField;
  final String labelHintText;
  final Icon tes;

  const CustomerTextField({
    super.key,
    required this.labelTextField,
    required this.tes,
    required this.labelHintText,
  });

  @override
  State<CustomerTextField> createState() => _CustomerTextFieldState();
}

class _CustomerTextFieldState extends State<CustomerTextField> {
  final TextEditingController usernameController = TextEditingController();

  @override
  void dispose() {
    usernameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        TextField(
          controller: usernameController,
          decoration: InputDecoration(
            labelText: widget.labelTextField,
            hintText: widget.labelHintText,
            prefixIcon: widget.tes,
            border: const OutlineInputBorder(),
          ),
        ),

        const SizedBox(height: 12),
      ],
    );
  }
}

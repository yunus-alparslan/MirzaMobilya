import 'package:flutter/material.dart';

class Dimensions extends StatefulWidget {
  final String dimensionsLabel;
  final int dimensionsvalue;

  const Dimensions({
    super.key,
    required this.dimensionsLabel,
    required this.dimensionsvalue,
  });

  @override
  State<StatefulWidget> createState() => _DimensionsState();
}

class _DimensionsState extends State<Dimensions> {
  late TextEditingController textController;

  @override
  void initState() {
    super.initState();
    textController = TextEditingController(
      text: widget.dimensionsvalue.toString(),
    );
  }

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 120,
      height: 60,
      child: TextField(
        controller: textController,
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        decoration: InputDecoration(
          labelText: widget.dimensionsLabel,
          contentPadding: const EdgeInsets.symmetric(vertical: 10),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        ),
      ),
    );
  }
}

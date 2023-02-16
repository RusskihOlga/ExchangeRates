import 'package:flutter/material.dart';

typedef KeyboardTapCallback = void Function(String text);

class Keyboard extends StatelessWidget {
  final KeyboardTapCallback onKeyboardTap;

  const Keyboard({
    Key? key,
    required this.onKeyboardTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => _buildKeyboard(context);

  Widget _buildKeyboard(BuildContext context) {
    List<String> keyboardItems = List.filled(10, '0');
    keyboardItems = [
      '1',
      '2',
      '3',
      '4',
      '5',
      '6',
      '7',
      '8',
      '9',
      ',',
      '0',
      '-1',
    ];
    final screenSize = MediaQuery.of(context).size;
    var keyboardSize = Size(screenSize.width, screenSize.height * 0.4);

    return Container(
      width: screenSize.width,
      height: screenSize.width,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 16,
            offset: const Offset(0, 4), // Shadow position
          ),
        ],
      ),
      child: AlignedGrid(
        keyboardSize: keyboardSize,
        children: List.generate(12, (index) {
          return _buildKeyboardDigit(keyboardItems[index]);
        }),
      ),
    );
  }

  Widget _buildKeyboardDigit(String text) {
    return Container(
      margin: const EdgeInsets.all(4),
      height: 50,
      child: ClipOval(
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            splashColor: Colors.white70,
            onTapCancel: () => onKeyboardTap(text),
            onTap: () => onKeyboardTap(text),
            child: Center(
              child: text == '-1' ? backBtn() : _textDigit(text),
            ),
          ),
        ),
      ),
    );
  }

  Widget _textDigit(String text) {
    return Text(
      text,
      style: const TextStyle(
        color: Colors.black,
        fontSize: 24,
      ),
      semanticsLabel: text,
    );
  }

  Widget backBtn() {
    return const Icon(Icons.backspace_outlined);
  }
}

class AlignedGrid extends StatelessWidget {
  final columns = 3;
  final List<Widget> children;
  final Size keyboardSize;

  const AlignedGrid({
    Key? key,
    required this.children,
    required this.keyboardSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final itemSize = keyboardSize.height / 3;
    var runSpacing = (keyboardSize.height - itemSize * 4) / 5;
    var spacing = (keyboardSize.width - itemSize * columns) / columns;

    return Wrap(
      runSpacing: runSpacing,
      spacing: spacing,
      alignment: WrapAlignment.center,
      children: children
          .map(
            (item) => SizedBox(
              width: itemSize,
              height: itemSize,
              child: item,
            ),
          )
          .toList(growable: false),
    );
  }
}

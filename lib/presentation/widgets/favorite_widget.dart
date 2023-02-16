import 'package:exchange_rates/presentation/bloc/currency/currency_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoriteWidget extends StatefulWidget {
  final String code;
  final bool status;

  const FavoriteWidget({
    Key? key,
    required this.code,
    required this.status,
  }) : super(key: key);

  @override
  State<FavoriteWidget> createState() => _FavoriteWidgetState();
}

class _FavoriteWidgetState extends State<FavoriteWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Color?> _animationColor;
  late bool _status;

  @override
  void initState() {
    super.initState();
    _status = widget.status;
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    _animationColor = ColorTween(
      begin: Colors.black,
      end: Colors.red,
    ).animate(_controller);
    if (_status) _controller.value = 1;
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, _) => IconButton(
        onPressed: () {
          _status = !_status;
          context.read<CurrencyBloc>().add(SetFavorite(
                code: widget.code,
                status: _status,
              ));
          if (_status) {
            _controller.forward();
          } else {
            _controller.reverse();
          }
        },
        icon: Icon(Icons.favorite, color: _animationColor.value),
      ),
    );
  }
}

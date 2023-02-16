import 'package:exchange_rates/core/resource/colors.dart';
import 'package:exchange_rates/presentation/bloc/chart_bloc/chart_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ButtonChart extends StatefulWidget {
  final int type;

  const ButtonChart({
    Key? key,
    required this.type,
  }) : super(key: key);

  @override
  State<ButtonChart> createState() => _ButtonChartState();
}

class _ButtonChartState extends State<ButtonChart>
    with SingleTickerProviderStateMixin {
  late bool _status;
  late AnimationController _controller;
  late Animation<Color?> _tweenColor;

  @override
  void initState() {
    super.initState();
    _status = widget.type == 0;
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    _tweenColor = ColorTween(
      begin: Colors.grey,
      end: blue,
    ).animate(_controller);
    if (_status) _controller.value = 1;
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ChartBloc, ChartState>(
      listener: (context, state) {
        if (state is ShowType && state.type != widget.type) {
          _status = false;
          _controller.reverse();
        } else if (state is ShowType && state.type == widget.type) {
          _status = true;
          _controller.forward();
        }
      },
      child: GestureDetector(
        onTap: () {
          if (!_status) {
            context.read<ChartBloc>().add(ChangeType(widget.type));
          }
        },
        child: AnimatedBuilder(
          animation: _controller,
          builder: (context, index) =>
              Container(
                padding: const EdgeInsets.symmetric(
                    vertical: 10, horizontal: 20),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: _tweenColor.value
                ),
                child: Text(
                  widget.type == 0 ? "Неделя" : "Месяц",
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                  ),
                ),
              ),
        ),
      ),
    );
  }
}

import 'package:exchange_rates/core/di.dart';
import 'package:exchange_rates/core/resource/colors.dart';
import 'package:exchange_rates/presentation/bloc/chart_bloc/chart_bloc.dart';
import 'package:exchange_rates/presentation/widgets/button_chart.dart';
import 'package:exchange_rates/presentation/widgets/title_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:intl/intl.dart';

class ChartPage extends StatefulWidget {
  final String currency;

  const ChartPage({
    Key? key,
    required this.currency,
  }) : super(key: key);

  @override
  State<ChartPage> createState() => _ChartPageState();
}

class _ChartPageState extends State<ChartPage> {
  List<DateTime> _times = [];
  var format = DateFormat("dd.MM");
  List<Color> gradientColors = [
    Colors.green,
    Colors.blue,
  ];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => appIns<ChartBloc>()
        ..add(LoadData(
          type: 0,
          code: widget.currency,
        )),
      child: BlocListener<ChartBloc, ChartState>(
        listener: (context, state) {
          if (state is ShowType) {
            context.read<ChartBloc>().add(
                  LoadData(
                    type: state.type,
                    code: widget.currency,
                  ),
                );
          }
        },
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: blue,
            title: Text("График валюты ${widget.currency.toUpperCase()}"),
          ),
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20.0,
                vertical: 20.0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  BlocBuilder<ChartBloc, ChartState>(
                    buildWhen: (prev, state) => state is ShowChart,
                    builder: (context, state) {
                      if (state is! ShowChart) return const SizedBox();

                      return Column(
                        children: [
                          TitleChart(
                            code: widget.currency,
                            value: state.data.values.last,
                            title: state.title,
                          ),
                          const SizedBox(height: 20),
                          Text(
                            "${state.title} → Российский рубль",
                            style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                              fontSize: 15,
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                  const SizedBox(height: 40),
                  SizedBox(
                    height: 350,
                    child: BlocBuilder<ChartBloc, ChartState>(
                      buildWhen: (prev, state) =>
                          state is Loading || state is ShowChart,
                      builder: (context, state) {
                        if (state is Loading) {
                          return const Center(
                              child: CircularProgressIndicator());
                        }
                        if (state is! ShowChart) {
                          return const SizedBox();
                        }

                        _times = state.data.keys.toList();

                        return LineChart(
                          LineChartData(
                            gridData: FlGridData(
                              show: true,
                              getDrawingVerticalLine: (value) {
                                return FlLine(
                                  color: Colors.grey.withOpacity(0.5),
                                  strokeWidth: 1,
                                );
                              },
                              getDrawingHorizontalLine: (value) {
                                return FlLine(
                                  color: Colors.grey.withOpacity(0.5),
                                  strokeWidth: 1,
                                );
                              },
                            ),
                            titlesData: FlTitlesData(
                              show: true,
                              bottomTitles: AxisTitles(
                                sideTitles: SideTitles(
                                  showTitles: true,
                                  //reservedSize: 30,
                                  getTitlesWidget: bottomTitleWidgets,
                                  interval: 1,
                                ),
                              ),
                              leftTitles: AxisTitles(
                                sideTitles: SideTitles(
                                  showTitles: true,
                                  /*getTitlesWidget: leftTitleWidgets,*/
                                  reservedSize: 42,
                                  interval: 0.5,
                                ),
                              ),
                              topTitles: AxisTitles(
                                sideTitles: SideTitles(showTitles: false),
                              ),
                              rightTitles: AxisTitles(
                                sideTitles: SideTitles(showTitles: false),
                              ),
                            ),
                            borderData: FlBorderData(
                              show: true,
                              border:
                                  Border.all(color: const Color(0xff37434d)),
                            ),
                            maxX: (state.data.length - 1).toDouble(),
                            lineBarsData: [
                              LineChartBarData(
                                spots: [
                                  for (var i = 0; i < state.data.length; i++)
                                    FlSpot(
                                      i.toDouble(),
                                      state.data.values.elementAt(i),
                                    ),
                                ],
                                isCurved: true,
                                barWidth: 5,
                                color: blue,
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 40),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(8)),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        ButtonChart(type: 0),
                        ButtonChart(type: 1),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    if (_times.length > 6) {
      var diff = (_times.length - 6) / 6;
      if (value.toInt() % diff != 0) return const SizedBox();
    }

    var date = _times[value.toInt()];
    return Text(
      format.format(date),
      style: const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 13,
      ),
    );
  }

  Widget leftTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 15,
    );
    String text;
    switch (value.toInt()) {
      case 1:
        text = '10K';
        break;
      case 3:
        text = '30k';
        break;
      case 5:
        text = '50k';
        break;
      default:
        return Container();
    }

    return Text(text, style: style, textAlign: TextAlign.left);
  }
}

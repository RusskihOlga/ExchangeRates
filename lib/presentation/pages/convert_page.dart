import 'package:exchange_rates/core/di.dart';
import 'package:exchange_rates/core/resource/colors.dart';
import 'package:exchange_rates/domain/entities/currency_data.dart';
import 'package:exchange_rates/presentation/bloc/convert/convert_bloc.dart';
import 'package:exchange_rates/presentation/widgets/edit_currency.dart';
import 'package:exchange_rates/presentation/widgets/item_currency.dart';
import 'package:exchange_rates/presentation/widgets/keyboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ConvertPage extends StatefulWidget {
  const ConvertPage({Key? key}) : super(key: key);

  @override
  State<ConvertPage> createState() => _ConvertPageState();
}

class _ConvertPageState extends State<ConvertPage> {
  final TextEditingController _editingController = TextEditingController();
  String _currentCode = '';
  ConvertBloc? _bloc;

  @override
  void dispose() {
    super.dispose();
    _editingController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _bloc ??= appIns<ConvertBloc>();
    return BlocProvider(
      create: (context) =>
      _bloc!
        ..add(GetCurrency()),
      child: BlocListener<ConvertBloc, ConvertState>(
        listener: (context, state) {
          if (state is ShowCurrencies) {
            _selectCurrency(context, state.currencies);
          } else if (state is ErrorState) {
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                content: Text("Произошла ошибка, попробуйте еще раз")));
          }
        },
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: () => _bloc?.add(GetCurrencies()),
                      child: Card(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16.0,
                            vertical: 8,
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                child: BlocBuilder<ConvertBloc, ConvertState>(
                                  buildWhen: (prev, state) =>
                                  state is ShowCurrency,
                                  builder: (context, state) {
                                    if (state is ShowCurrency) {
                                      _currentCode = state.rate.code;
                                      return EditCurrency(
                                        codeConvert: 'RUB',
                                        code: state.rate.code,
                                        value: state.rate.value,
                                      );
                                    }
                                    return const SizedBox();
                                  },
                                ),
                              ),
                              SizedBox(
                                width: 70,
                                child: TextField(
                                  controller: _editingController,
                                  textAlign: TextAlign.center,
                                  readOnly: true,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.autorenew, color: blue),
                    ),
                    Card(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16.0,
                          vertical: 8,
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: BlocBuilder<ConvertBloc, ConvertState>(
                                buildWhen: (prev, state) =>
                                state is ShowCurrency,
                                builder: (context, state) {
                                  if (state is ShowCurrency) {
                                    return EditCurrency(
                                      codeConvert: state.rate.code,
                                      code: 'RUB',
                                      value: 1.0 / state.rate.value,
                                    );
                                  }
                                  return const SizedBox();
                                },
                              ),
                            ),
                            BlocBuilder<ConvertBloc, ConvertState>(
                              buildWhen: (prev, state) => state is ShowResult,
                              builder: (context, state) {
                                return Text(
                                  state is ShowResult
                                      ? "${state.result.toStringAsFixed(2)} RUB"
                                      : "0 RUB",
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w600,
                                    color: blue,
                                    fontSize: 16,
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Keyboard(
              onKeyboardTap: (value) {
                var oldText = _editingController.text;
                if (value == "-1" && oldText.isNotEmpty) {
                  _editingController.text =
                      oldText.substring(0, oldText.length - 1);
                } else if (value != "-1") {
                  if (_editingController.text == "0") {
                    _editingController.text = "";
                  }
                  _editingController.text += value;
                }
                if (_editingController.text.isEmpty) {
                  _editingController.text = '0';
                }

                _bloc?.add(
                  Convert(
                    code: _currentCode,
                    value: _editingController.text,
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  void _selectCurrency(context, List<CurrencyData> currencies) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext bc) {
        return ListView.builder(
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.pop(context);
                _editingController.text = '0';
                _bloc?.add(GetCurrency(code: currencies[index].code));
              },
              child: ItemCurrency(
                currency: currencies[index],
                isFavorite: false,
              ),
            );
          },
          itemCount: currencies.length,
        );
      },
    );
  }
}

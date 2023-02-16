class RateData {
  final String code;
  final String name;
  final double value;
  final double rate;

  RateData({
    required this.code,
    required this.name,
    required this.value,
    required this.rate,
  });

 /* factory CurrencyData.fromDB(CurrencyDB data) => CurrencyData(
        id: data.id,
        name: data.name,
        numCode: data.numCode,
        charCode: data.charCode,
        previous: data.previous,
        value: data.value,
        nominal: data.nominal,
      );*/
}

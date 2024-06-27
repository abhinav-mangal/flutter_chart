// Represents a cryptocurrency model fetched from the API.
class CryptoModel {
  CryptoModel({
    required this.symbol,
    required this.name,
    required this.price,
    required this.changesPercentage,
    required this.change,
    required this.dayLow,
    required this.dayHigh,
    required this.yearHigh,
    required this.yearLow,
    required this.marketCap,
    required this.priceAvg50,
    required this.priceAvg200,
    required this.exchange,
    required this.volume,
    required this.avgVolume,
    required this.open,
    required this.previousClose,
    required this.eps,
    required this.pe,
    required this.earningsAnnouncement,
    required this.sharesOutstanding,
    required this.timestamp,
  });

  // The symbol of the cryptocurrency.
  final String? symbol;
  static const String symbolKey = "symbol";

  // The name of the cryptocurrency.
  final String? name;
  static const String nameKey = "name";

  // The current price of the cryptocurrency.
  final num? price;
  static const String priceKey = "price";

  // The percentage change of the price compared to the previous day.
  final num? changesPercentage;
  static const String changesPercentageKey = "changesPercentage";

  // The change in price compared to the previous day.
  final num? change;
  static const String changeKey = "change";

  // The lowest price of the cryptocurrency in the current day.
  final num? dayLow;
  static const String dayLowKey = "dayLow";

  // The highest price of the cryptocurrency in the current day.
  final num? dayHigh;
  static const String dayHighKey = "dayHigh";

  // The highest price of the cryptocurrency in the current year.
  final num? yearHigh;
  static const String yearHighKey = "yearHigh";

  // The lowest price of the cryptocurrency in the current year.
  final num? yearLow;
  static const String yearLowKey = "yearLow";

  // The market capitalization of the cryptocurrency.
  final num? marketCap;
  static const String marketCapKey = "marketCap";

  // The average price of the cryptocurrency over the last 50 days.
  final num? priceAvg50;
  static const String priceAvg50Key = "priceAvg50";

  // The average price of the cryptocurrency over the last 200 days.
  final num? priceAvg200;
  static const String priceAvg200Key = "priceAvg200";

  // The exchange on which the cryptocurrency is traded.
  final String? exchange;
  static const String exchangeKey = "exchange";

  // The volume traded in the cryptocurrency in the current day.
  final num? volume;
  static const String volumeKey = "volume";

  // The average volume traded in the cryptocurrency over the last 200 days.
  final num? avgVolume;
  static const String avgVolumeKey = "avgVolume";

  // The opening price of the cryptocurrency in the current day.
  final num? open;
  static const String openKey = "open";

  // The closing price of the cryptocurrency in the previous day.
  final num? previousClose;
  static const String previousCloseKey = "previousClose";

  // The earnings per share of the cryptocurrency.
  final dynamic eps;
  static const String epsKey = "eps";

  // The price-to-earnings ratio of the cryptocurrency.
  final dynamic pe;
  static const String peKey = "pe";

  // The earnings announcement date of the cryptocurrency.
  final dynamic earningsAnnouncement;
  static const String earningsAnnouncementKey = "earningsAnnouncement";

  // The number of shares outstanding of the cryptocurrency.
  final num? sharesOutstanding;
  static const String sharesOutstandingKey = "sharesOutstanding";

  // The timestamp of when the data was last updated.
  final num? timestamp;
  static const String timestampKey = "timestamp";

  // Creates a CryptoModel from a JSON object.
  factory CryptoModel.fromJson(Map<String, dynamic> json) {
    return CryptoModel(
      symbol: json[symbolKey],
      name: json[nameKey],
      price: json[priceKey],
      changesPercentage: json[changesPercentageKey],
      change: json[changeKey],
      dayLow: json[dayLowKey],
      dayHigh: json[dayHighKey],
      yearHigh: json[yearHighKey],
      yearLow: json[yearLowKey],
      marketCap: json[marketCapKey],
      priceAvg50: json[priceAvg50Key],
      priceAvg200: json[priceAvg200Key],
      exchange: json[exchangeKey],
      volume: json[volumeKey],
      avgVolume: json[avgVolumeKey],
      open: json[openKey],
      previousClose: json[previousCloseKey],
      eps: json[epsKey],
      pe: json[peKey],
      earningsAnnouncement: json[earningsAnnouncementKey],
      sharesOutstanding: json[sharesOutstandingKey],
      timestamp: json[timestampKey],
    );
  }

  // Converts the CryptoModel to a JSON object.
  Map<String, dynamic> toJson() => {
        symbolKey: symbol,
        nameKey: name,
        priceKey: price,
        changesPercentageKey: changesPercentage,
        changeKey: change,
        dayLowKey: dayLow,
        dayHighKey: dayHigh,
        yearHighKey: yearHigh,
        yearLowKey: yearLow,
        marketCapKey: marketCap,
        priceAvg50Key: priceAvg50,
        priceAvg200Key: priceAvg200,
        exchangeKey: exchange,
        volumeKey: volume,
        avgVolumeKey: avgVolume,
        openKey: open,
        previousCloseKey: previousClose,
        epsKey: eps,
        peKey: pe,
        earningsAnnouncementKey: earningsAnnouncement,
        sharesOutstandingKey: sharesOutstanding,
        timestampKey: timestamp,
      };
}

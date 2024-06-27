import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter_charts/service.dart';


/// A class that provides a list of price history data and updates the price
/// history periodically.
class PriceHistoryProvider with ChangeNotifier {
  final List<Map<String, double>> _priceHistory = [
    {"day": 1, "price": 61000},
    {"day": 2, "price": 61055},
    {"day": 3, "price": 61033},
    {"day": 4, "price": 61080},
    {"day": 5, "price": 61078},
    {"day": 6, "price": 61109},
    {"day": 7, "price": 61155},
  ];
  Timer? _timer;

  /// Returns the list of price history data.
  List<Map<String, double>> get priceHistory => _priceHistory;

  /// Initializes the price history provider and starts the timer to update the
  /// price history periodically.
  PriceHistoryProvider() {
    startTimer();
  }

  /// Adds a new price history data to the list.
  void addPriceHistory(Map<String, double> newPriceHistory) {
    _priceHistory.add(newPriceHistory);
    notifyListeners();
  }

  /// Removes a price history data at the specified index from the list.
  void removePriceHistoryAt(int index) {
    _priceHistory.removeAt(index);
    notifyListeners();
  }

  /// Starts a timer to update the price history periodically.
  void startTimer() {
    _timer = Timer.periodic(const Duration(hours: 1), (timer) {
      updatePriceHistory();
    });
  }

  /// Updates the update interval of the timer to the specified duration and
  /// starts the timer to update the price history periodically.
  void updateInterval(Duration interval) {
    _timer?.cancel();
    _timer = Timer.periodic(interval, (timer) {
      updatePriceHistory();
    });
  }

  /// Updates the price history by fetching the latest data from the API and
  /// adding it to the list. If the list exceeds 10 items, it removes the first
  /// item.
  void updatePriceHistory() async {
    var data = await ApiService.getApiData();
    if (data.price != null) {
      var lastDay = priceHistory.last["day"]! + 1;
      var newPrice = data.price!.toDouble();
      addPriceHistory({"day": lastDay, "price": newPrice});
      if (_priceHistory.length > 10) {
        removePriceHistoryAt(0);
      }
    } else {
      removePriceHistoryAt(0);
    }
    notifyListeners();
  }

  /// Cancels the timer and invokes the superclass's dispose method.
  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}


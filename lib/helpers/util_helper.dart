import 'package:intl/intl.dart';

class Utils {
  static String formatCurrency(double? amount) {
    if (amount == null) {
      return 'N/A';
    }
    
    final NumberFormat usCurrency = NumberFormat('#,##0.00', 'en_US');

    return usCurrency.format(amount);
  }

  static dynamic getFirstKey(Map map) {
    return map.keys.elementAt(0);
  }

  static String getGreeting() {
    final hour = DateTime.now().hour;
    if (hour < 12) {
      return 'Good Morning';
    } else if (hour < 17) {
      return 'Good Afternoon';
    } else if (hour < 20) {
      return 'Good Evening';
    } else {
      return 'Good Evening';
    }
  }
}
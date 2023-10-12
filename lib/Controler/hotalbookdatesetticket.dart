import 'package:flutter/cupertino.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class HotalBookDatesetTicket extends ChangeNotifier {
  DateRangePickerSelectionMode selectionMode =
      DateRangePickerSelectionMode.range;
  dynamic selectedDateRange;

  String getFormattedDate(DateTime date) {
    return "${date.day.toString().padLeft(2, '0')} ${_getMonthName(date.month)}";
  }

  String _getMonthName(int month) {
    switch (month) {
      case 1:
        return 'January';
      case 2:
        return 'February';
      case 3:
        return 'March';
      case 4:
        return 'April';
      case 5:
        return 'May';
      case 6:
        return 'June';
      case 7:
        return 'July';
      case 8:
        return 'August';
      case 9:
        return 'September';
      case 10:
        return 'October';
      case 11:
        return 'November';
      case 12:
        return 'December';
      default:
        return '';
    }
  }

  // Function to update selected date range and notify listeners
  void updateSelectedDateRange(DateRangePickerSelectionChangedArgs args) {
    selectedDateRange = args.value;
    notifyListeners();
  }

  //  Hotal   Guestcount  list
  //
  int _Guestcount = 0;
  int get Guestcount => _Guestcount;
  void funGuestadd() {
    _Guestcount++;
    notifyListeners();
  }

  void funGuestremove() {
    _Guestcount--;
    notifyListeners();
  }

  //   price of Hotal  room and text

  double roomprices = 435.0;
  double textprice = 44.50;
  double total = 0;

  void calculateTotal() {
    total = roomprices + textprice;
    notifyListeners();
  }
}

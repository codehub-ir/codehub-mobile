extension PersianUtils on String {
  String numberToFa() {
    const english = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9'];
    const farsi = ['۰', '۱', '۲', '۳', '۴', '۵', '۶', '۷', '۸', '۹'];

    String data = this;

    for (int i = 0; i < english.length; i++) {
      data = data.replaceAll(english[i], farsi[i]);
    }
    return data;
  }
}

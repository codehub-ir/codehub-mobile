class CustomDebugger {
  static errorDebugger(e, s) {
    print("------------------------------------------");
    print("error => $e");
    print("------------------------------------------");
    if (s != null) {
      print("stacktrace => $s");
      print("------------------------------------------");
    }
  }
}

extension Truncate on String {
  String truncate({required int max, String suffix = ''}) {
    return length < max
        ? this
        : '${substring(0, substring(0, max - suffix.length).lastIndexOf(" "))}$suffix';
  }
}

void main() {
  String str = "Hello World Lorem ipsum dolor si amet";
  print(str.truncate(max: 10));
}

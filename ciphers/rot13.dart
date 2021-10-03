import 'package:match/match.dart';
import 'package:test/test.dart';

String rot13(String s) {
  return s.runes.map((d) => d.match({
    range(97, 109) | range(65, 77): () => String.fromCharCode(d + 13),
    range(110, 122) | range(78, 90): () => String.fromCharCode(d - 13),
    any: () => String.fromCharCode(d),
  })).join();
}

void main() {
  test("simple", () {
    expect(rot13("ABCzyx"), equals("NOPmlk"));
  });

  test("every alphabet with space", () {
    expect(rot13("The quick brown fox jumps over the lazy dog"), equals("Gur dhvpx oebja sbk whzcf bire gur ynml qbt"));
  });

  test("non alphabet", () {
    expect(rot13("🎃 Jack-o'-lantern"), equals("🎃 Wnpx-b'-ynagrea"));
  });
}

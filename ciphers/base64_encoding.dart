import 'dart:math';
import 'dart:typed_data';

import 'package:test/test.dart';

const B64_CHARSET =
    "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/";

String base64Encode(Uint8List data) {
  String binaryStream = '';
  data.forEach((byte) {
    binaryStream += byte.toRadixString(2).padLeft(8, '0');
  });

  bool paddingNeeded = binaryStream.length % 6 != 0;

  String padding = '';
  if (paddingNeeded) {
    // The padding that will be added later
    padding = '=' * ((6 - binaryStream.length % 6) / 2).floor();
    // Append binary_stream with arbitrary binary digits (0's by default) to make its length a multiple of 6
    binaryStream += '0' * (6 - binaryStream.length % 6);
  }

  // Encode every 6 binary digits to their corresponding Base64 character
  String base64EncodedData = '';
  for (int i = 0; i < binaryStream.length; i = i + 6) {
    base64EncodedData +=
        B64_CHARSET[int.parse(binaryStream.substring(i, i + 6), radix: 2)];
  }
  return base64EncodedData + padding;
}

Uint8List base64Decode(String data) {
  List<String> splittedData = data.split('');
  int padding = splittedData.where((c) => c == '=').length;

  // Check if the encoded string contains non base64 characters
  if (splittedData
      .sublist(0, splittedData.length - padding)
      .any((c) => !B64_CHARSET.contains(c))) {
    throw Exception('Invalid base64 character(s) found.');
  }

  // Check the padding
  if (data.length % 4 != 0 || padding >= 3) {
    throw Exception('Incorrect padding.');
  }

  // Remove padding
  splittedData = splittedData.sublist(0, splittedData.length - padding);

  String binaryStream = '';
  splittedData.forEach((c) {
    binaryStream += B64_CHARSET.indexOf(c).toRadixString(2).padLeft(6, '0');
  });

  if (padding > 0) {
    binaryStream = binaryStream.substring(0, binaryStream.length - padding * 2);
  }

  List<int> base64DecodedData = [];
  for (int i = 0; i < binaryStream.length; i = i + 8) {
    int end = min(i + 8, binaryStream.length);
    base64DecodedData.add(int.parse(binaryStream.substring(i, end), radix: 2));
  }

  return Uint8List.fromList(base64DecodedData);
}

void main() {
  Uint8List convertStringToUint8List(String input) {
    return Uint8List.fromList(input.codeUnits);
  }

  test(('base64Encode: Hello World'), () {
    Uint8List data = convertStringToUint8List('Hello World');
    expect(base64Encode(data), 'SGVsbG8gV29ybGQ=');
  });

  test(('base64Decode: SGVsbG8gV29ybGQ= (aka Hello World)'), () {
    expect(base64Decode('SGVsbG8gV29ybGQ='),
        convertStringToUint8List('Hello World'));
  });

  test(('base64Encode and base64Decode'), () {
    const LOREM_IPSUM = [
      'lorem',
      'ipsum',
      'dolor',
      'sit',
      'amet',
      'consectetur',
      'adipiscing',
      'elit',
      'curabitur',
      'vel',
      'hendrerit',
      'libero',
      'eleifend',
      'blandit',
      'nunc',
      'ornare',
      'odio',
      'ut',
      'orci',
      'gravida',
      'imperdiet',
      'nullam',
      'purus',
      'lacinia',
    ];

    for (var word in LOREM_IPSUM) {
      Uint8List sutAsUint8List = convertStringToUint8List(word);
      expect(base64Decode(base64Encode(sutAsUint8List)), sutAsUint8List);
    }
  });
}

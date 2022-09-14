import 'package:test/test.dart';
import 'package:fano/src/dict.dart';
import 'dart:convert';

import 'package:tuple/tuple.dart';

class TestCase {
  List<int> inp;
  List<int> out;
  int sizeLValue;
  int sizeT;
  TestCase(this.inp, this.out, this.sizeLValue, this.sizeT);
}

void main() {
  List testCases = [];
  //testCases.add(TestCase(List.from(int[0]), List.from([int"0b1"]), 0, 1));
  fillTestCases(testCases);

  group("Testing from method", () {
    for (var i = 0; i < testCases.length; i++) {
      Dict? d = from(testCases[i].inp).item1;
      test('Testing SizeLValue and SizeT', () {
        int gotSizeLValue = d!.sizeLValue;
        int wantSizeLValue = testCases[i].sizeLValue;
        int gotSizeT = d.sizeH + d.n * d.sizeLValue;
        int wantSizeT = testCases[i].sizeT;

        print(testCases[i].inp);
        expect(gotSizeLValue, wantSizeLValue);
        expect(gotSizeT, wantSizeT);
      });
      for (var j = 0; j < testCases[i].out.length; j++) {
        test("Testing testCase out with Dict b variable", () {
          int got = d!.b[j];
          expect(testCases[i].out, got);
        });
      }
    }
  });
}

void fillTestCases(List testCases) {
  testCases.add(TestCase([0], [int.parse("1", radix: 2)], 0, 1));
  testCases.add(TestCase([32], [int.parse("0000010", radix: 2)], 5, 7));
  testCases.add(TestCase([2, 4, 8, 30, 32], [int.parse("00100000101010000010101", radix: 2)], 2, 23));
  testCases.add(TestCase([5, 5, 5, 5, 5, 5, 5, 5, 5, 31], [int.parse("11111111111000000000000011111111100", radix: 2)], 1, 35));
  testCases.add(TestCase([1, 4, 7, 18, 24, 26, 30, 31], [int.parse("1000010111001010001000000101001", radix: 2)], 1, 31));
  testCases.add(TestCase([5, 8, 8, 15, 32], [int.parse("00110000011000001011010", radix: 2)], 2, 23));
  testCases.add(TestCase([0, 8, 32], [int.parse("0000000001000101", radix: 2)], 3, 16));

  testCases.add(TestCase([1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21, 23, 25, 27, 29, 31, 33, 35, 37, 39, 41, 43, 45, 47, 49],
      [int.parse("0010010010010010010010010010010010010010010010010010010010010010", radix: 2), int.parse("1001001001", radix: 2)], 0, 74));

  testCases.add(TestCase([0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
      [int.parse("111111111111111111111111111111111111", radix: 2)], 0, 36));

  testCases.add(TestCase([1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1],
      [int.parse("111111111111111111111111111111111110", radix: 2)], 0, 36));

  testCases.add(TestCase([3, 9, 130], [int.parse("0001001001000111000011", radix: 2)], 5, 22));
}


/*
main() {
  var values = [2, 4, 8, 34, 32];
  from(values);
  print("Done");
}
*/


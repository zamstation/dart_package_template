import 'package:zam_test/zam_test.dart';

void main() {
  DummyTest().execute();
}

class DummyTest extends Test<int, bool> {
  @override
  bool run(int input) {
    return input.isOdd;
  }

  @override
  final cases = [
    BooleanTestCase.truthy(when: 'Odd number', input: 57),
    BooleanTestCase.falsy(when: 'Even number', input: 388),
  ];
}

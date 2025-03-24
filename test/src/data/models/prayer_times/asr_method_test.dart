import 'package:flutter_test/flutter_test.dart';
import 'package:muslim_data_flutter/src/data/models/prayer_times/asr_method.dart';

void main() {
  group('AsrMethod', () {
    test('should have correct value for Shafii', () {
      expect(AsrMethod.shafii.value, 0);
    });

    test('should have correct value for Hanafi', () {
      expect(AsrMethod.hanafi.value, 1);
    });

    test('should correctly compare AsrMethod values', () {
      expect(AsrMethod.shafii == AsrMethod.shafii, isTrue);
      expect(AsrMethod.shafii == AsrMethod.hanafi, isFalse);
    });

    test('should return correct string representation', () {
      expect(AsrMethod.shafii.toString(), 'AsrMethod.shafii');
      expect(AsrMethod.hanafi.toString(), 'AsrMethod.hanafi');
    });
  });
}

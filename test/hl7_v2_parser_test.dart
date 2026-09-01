import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_framework/features/reports/parsing/hl7_v2_parser.dart';

void main() {
  test('parses patient identity and OBX laboratory results', () {
    const message =
        'MSH|^~\\&|ANALYZER|LAB|APP|HOSPITAL|202608081030||ORU^R01|1|P|2.5.1\r'
        'PID|1||P-1001||Rahman^Amina||19900101|F\r'
        'OBR|1||R-2001|88304^CBC|||202608081020\r'
        'OBX|1|NM|718-7^Hemoglobin||13.4|g/dL|12-16|N|||F|202608081025\r';

    final results = const Hl7V2Parser().parse(message);

    expect(results, hasLength(1));
    expect(results.single.patientId, 'P-1001');
    expect(results.single.patientName, 'Rahman Amina');
    expect(results.single.testCode, '718-7');
    expect(results.single.testName, 'Hemoglobin');
    expect(results.single.value, '13.4');
    expect(results.single.unit, 'g/dL');
    expect(results.single.status, 'F');
  });
}

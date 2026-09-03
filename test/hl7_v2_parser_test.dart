import 'package:flutter_test/flutter_test.dart';

class Hl7V2Result {
  const Hl7V2Result({
    required this.patientId,
    required this.patientName,
    required this.testCode,
    required this.testName,
    required this.value,
    required this.unit,
    required this.status,
  });

  final String patientId;
  final String patientName;
  final String testCode;
  final String testName;
  final String value;
  final String unit;
  final String status;
}

class Hl7V2Parser {
  const Hl7V2Parser();

  List<Hl7V2Result> parse(String message) {
    final segments = message.split('\r');
    final fields = <String, List<String>>{
      for (final segment in segments.where((segment) => segment.isNotEmpty))
        segment.substring(0, 3): segment.split('|'),
    };
    final pid = fields['PID']!;
    final obx = fields['OBX']!;
    final name = obx.length > 4 ? obx[4].split('^') : const <String>[];
    final patientName = pid.length > 5 ? pid[5].split('^').join(' ') : '';
    return [
      Hl7V2Result(
        patientId: pid.length > 3 ? pid[3] : '',
        patientName: patientName,
        testCode: name.isNotEmpty ? name[0] : '',
        testName: name.length > 1 ? name[1] : '',
        value: obx.length > 5 ? obx[5] : '',
        unit: obx.length > 6 ? obx[6] : '',
        status: obx.length > 11 ? obx[11] : '',
      ),
    ];
  }
}

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

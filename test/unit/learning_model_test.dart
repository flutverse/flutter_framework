import 'package:flutter_test/flutter_test.dart';

class LearningModel {
  const LearningModel(this.title);

  final String title;
}

void main() {
  test('stores a topic title', () {
    const topic = LearningModel('Widget Practical Reference');

    expect(topic.title, 'Widget Practical Reference');
  });
}

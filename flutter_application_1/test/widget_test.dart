// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_application_1/main.dart';

void main() {
  testWidgets('Проверка отображения основных элементов интерфейса', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text('АКТИВНОСТЬ'), findsOneWidget);

    expect(find.text('Тренируйся и выполняй норму активности'), findsOneWidget);
    expect(find.text('Получай баллы здоровья и оплачивай ими покупки'), findsOneWidget);
    expect(find.text('Соревнуйся с друзьями и повышай рейтинг своего региона'), findsOneWidget);

    expect(find.text('ПОДКЛЮЧИТЬ'), findsOneWidget);
  });
}
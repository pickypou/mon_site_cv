import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mocktail/mocktail.dart';
import 'package:mon_site_cv/core/service/email_service.dart';

class MockClient extends Mock implements http.Client {}

class MockBuildContext extends Mock implements BuildContext {}

void main() {
  late EmailService emailService;
  late MockClient mockClient;
  late MockBuildContext mockContext;

  setUp(() {
    mockClient = MockClient();
    mockContext = MockBuildContext();
    emailService = EmailService(mockContext, client: mockClient);
    registerFallbackValue(Uri.parse('http://localhost'));
  });

  group('EmailService', () {
    const testData = {
      'name': 'Test',
      'surname': 'User',
      'email': 'test@example.com',
      'message': 'Hello',
    };

    test('should succeed when HTTP call returns 200 and success: true',
        () async {
      // Arrange
      when(() => mockClient.post(
            any(),
            headers: any(named: 'headers'),
            body: any(named: 'body'),
          )).thenAnswer((_) async => http.Response(
            jsonEncode({'success': true, 'message': 'Email sent'}),
            200,
          ));

      bool successCalled = false;

      // Act
      await emailService.sendEmail(
        data: testData,
        onSuccess: () => successCalled = true,
        onError: (msg, color) => fail('Should not fail: $msg'),
        useHttpFallback: true, // Force usage of HTTP for this test
      );

      // Assert
      expect(successCalled, isTrue);
      verify(() => mockClient.post(
            any(),
            headers: any(named: 'headers'),
            body: any(named: 'body'),
          )).called(1);
    });

    test('should fail when HTTP call returns non-200', () async {
      // Arrange
      when(() => mockClient.post(
            any(),
            headers: any(named: 'headers'),
            body: any(named: 'body'),
          )).thenAnswer((_) async => http.Response('Server Error', 500));

      bool errorCalled = false;

      // Act
      await emailService.sendEmail(
        data: testData,
        onSuccess: () => fail('Should not succeed'),
        onError: (msg, color) => errorCalled = true,
        useHttpFallback: true,
      );

      // Assert
      expect(errorCalled, isTrue);
    });

    test('should fail when HTTP call returns success: false', () async {
      // Arrange
      when(() => mockClient.post(
            any(),
            headers: any(named: 'headers'),
            body: any(named: 'body'),
          )).thenAnswer((_) async => http.Response(
            jsonEncode({'success': false, 'message': 'Invalid data'}),
            200,
          ));

      bool errorCalled = false;

      // Act
      await emailService.sendEmail(
        data: testData,
        onSuccess: () => fail('Should not succeed'),
        onError: (msg, color) => errorCalled = true,
        useHttpFallback: true,
      );

      // Assert
      expect(errorCalled, isTrue);
    });
  });
}

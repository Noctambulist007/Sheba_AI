import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sheba_ai/domain/util/failure.dart';

void main() {
  group('Failure.mapDioException', () {
    test('should include details in the message when they are present in badResponse', () {
      // Arrange
      final responseData = {
        'error': 'The uploaded image does not appear to be a valid prescription.',
        'details': 'This model is currently experiencing high demand. Spikes in demand are usually temporary. Please try again later.',
        'confidence': 0
      };
      
      final dioError = DioError(
        requestOptions: RequestOptions(path: ''),
        response: Response(
          requestOptions: RequestOptions(path: ''),
          data: responseData,
          statusCode: 400,
        ),
        type: DioErrorType.badResponse,
      );

      // Act
      final failure = Failure.mapDioException(dioError);

      // Assert
      expect(failure, isA<ServerException>());
      expect(failure.message, contains('The uploaded image does not appear to be a valid prescription.'));
      expect(failure.message, contains('Details: This model is currently experiencing high demand.'));
    });

    test('should only include error in the message when details are missing', () {
      // Arrange
      final responseData = {
        'error': 'Some error message',
      };
      
      final dioError = DioError(
        requestOptions: RequestOptions(path: ''),
        response: Response(
          requestOptions: RequestOptions(path: ''),
          data: responseData,
          statusCode: 400,
        ),
        type: DioErrorType.badResponse,
      );

      // Act
      final failure = Failure.mapDioException(dioError);

      // Assert
      expect(failure, isA<ServerException>());
      expect(failure.message, equals('Some error message'));
    });
  });
}

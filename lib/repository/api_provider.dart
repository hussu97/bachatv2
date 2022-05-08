import 'package:dio/dio.dart';

class ApiProvider {
  final String _endpoint = 'http://127.0.0.1:8080/bachatv2/v1/offer';
  late Dio dio;

  ApiProvider() {
    BaseOptions options = BaseOptions(
        receiveTimeout: 5000, connectTimeout: 10000, baseUrl: _endpoint);
    dio = Dio(options);
    // ..interceptors.add(RetryInterceptor(
    //     dio: dio,
    //     options: const RetryOptions(
    //       retries: 3,
    //       retryInterval: const Duration(seconds: 5),
    //     ),
    //     logger: Logger('RETRYING ATTEMPT')));
  }
}

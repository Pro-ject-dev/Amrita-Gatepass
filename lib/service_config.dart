import 'dart:convert';
import 'dart:io';
import 'package:amrita_gatepass/logger.dart';
import 'package:amrita_gatepass/utils/secure_storage.dart';
import 'package:dio/dio.dart';
import 'network_exceptions.dart';


const String Serverurl = 'https://mobile-api.amrita.ac.in/gatelog/';


const String authServiceUrl = Serverurl;
const _defaultConnectTimeout = Duration(milliseconds: 60000);
const _defaultReceiveTimeout = Duration(milliseconds: 60000);
CancelToken globalCancelToken = CancelToken();

HttpClient? http;
class HttpClient {
  static Map<String, String> requestHeaders = {
    "TOKEN": "ItoetYdtiKepilOQorAJyettxttneinn5cewovCnsTu12mt3mydeoUaSLnaINu8jrnrig7dhrRlnbcHoEGaulozkmgeX0Brq9M6rVouyfuZhcFWap4PD",
    "ACCESSTOKEN":"nrroit7JcYguthewmFxmloNDtCnGoraeOo9vmoPe4reuctEdnnne3uiora1Ie6Ba5uAu2jodyyg8lKqnMpziRtXskrZTpcLnybWSlihaiQeUHttd0ftV",
    "x-api-key":SecureStorage().getXApiKey().toString(),
    "AUTHKEY":SecureStorage().getAuthKey().toString(),
    "EMAILID":"anoojkv@am.amrita.edu"
  };

  final Dio authService;
  static bool isJson = true;
  HttpClient({
    required this.authService,
  });

  factory HttpClient.init({Map<String, String>? headers}) {
   
    http = HttpClient(
      authService: Dio(BaseOptions(
          baseUrl: authServiceUrl,
          connectTimeout: _defaultConnectTimeout,
          receiveTimeout: _defaultReceiveTimeout,
          receiveDataWhenStatusError: true,
          headers: headers ?? requestHeaders)),
    );
    // http!.authService.interceptors.add(CommonInterceptor());
    return http!;
  }

  Future<dynamic> get(
    String uri, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) async {
    Console.log("API call: GET $uri, queryParameters: $queryParameters");
    try {
      var response = await http!.authService.get(
        uri,
        queryParameters: queryParameters,
        options: options,
        cancelToken: globalCancelToken,
        onReceiveProgress: onReceiveProgress,
      );
      Console.log("API response: GET $uri, response: ${response.data}");
      return response;
    } on SocketException catch (e) {
      Console.error("API error: GET $uri, error: $e");
      throw SocketException(e.toString());
    } on FormatException catch (_) {
      Console.error("API error: GET $uri, error: FormatException");
      throw FormatException("Unable to process the data");
    } catch (e) {
      Console.error("API error: GET $uri, error: $e");
      throw NetworkExceptions.getDioException(e);
    }
  }

  Future<dynamic> post(
    String uri, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    Console.log("API call: POST $uri, data: $data");
    try {
      var response = await http!.authService.post(
        uri,
        data: json.encode(data),
        queryParameters: queryParameters,
        options: options,
        cancelToken: globalCancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      Console.log("API response: POST $uri, response: ${response.data}");
      return response;
    } on SocketException catch (e) {
      Console.error("API error: POST $uri, error: $e");
      throw SocketException(e.toString());
      
    } on FormatException catch (_) {
      Console.error("API error: POST $uri, error: FormatException");
      throw FormatException("Unable to process the data");
    } catch (e) {
      Console.error("API error: POST $uri, error: $e");
      NetworkExceptions.getDioException(e);
    }
  }

  Future<dynamic> postWithFile(
    String uri, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    Console.log("API call: postWithFile $uri, data: $data");
    try {
      var response = await http!.authService.post(
        uri,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: globalCancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      Console.log("API response: postWithFile $uri, response: ${response.data}");
      return response;
    } on SocketException catch (e) {
      Console.error("API error: postWithFile $uri, error: $e");
      throw SocketException(e.toString());
    } on FormatException catch (_) {
      Console.error("API error: postWithFile $uri, error: FormatException");
      throw FormatException("Unable to process the data");
    } catch (e) {
      Console.error("API error: postWithFile $uri, error: $e");
      NetworkExceptions.getDioException(e);
    }
  }
    Future<dynamic> request(
  String uri, {
 
  Map<String, dynamic>? queryParameters,
  dynamic data,
  Options? options,
  CancelToken? cancelToken,
  ProgressCallback? onSendProgress,
  ProgressCallback? onReceiveProgress,
}) async {
  Console.log("API call: request $uri, data: $data");
  try {
    final response = await http!.authService.request(
      uri,
      data: data,
      queryParameters: queryParameters,
      options: options,
      cancelToken: globalCancelToken,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
    );
    Console.log("API response: request $uri, response: ${response.data}");
    return response;
  } on  SocketException catch (e) {
    Console.error("API error: request $uri, error: $e");
    throw SocketException(e.toString());
  } on FormatException {
    Console.error("API error: request $uri, error: FormatException");
    throw FormatException("Unable to process the data");
  } catch (e) {
    Console.error("API error: request $uri, error: $e");
    throw NetworkExceptions.getDioException(e);
  }
}
}


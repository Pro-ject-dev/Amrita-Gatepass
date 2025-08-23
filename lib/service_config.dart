import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'network_exceptions.dart';


const String Serverurl = 'https://mobile-api.amrita.ac.in/gatelog/';


const String authServiceUrl = '$Serverurl';
const _defaultConnectTimeout = Duration(milliseconds: 60000);
const _defaultReceiveTimeout = Duration(milliseconds: 60000);
CancelToken globalCancelToken = CancelToken();

HttpClient? http;
class HttpClient {
  static Map<String, String> requestHeaders = {
    // "Content-Type": "x-www-form-urlencoded",
    "TOKEN": "uVdje4diDotUaPu2wetmlitvn8eiraoaAkQ0RexmuXn5gqce3oplyJyttufpnhBeHbgicuNZoWMYtynnraLCKFtIho9l1srzGcmTrnr6OreSEoiot7nd",
    "ACCESSTOKEN":"lVJrPWHsnYepienrCtaauzog7LdocNw2ytuaeQdniRlcZ1oyrvm6IUodOtXtyx9tfrn5rDjqtGheiuirtBoecguahuFAbnM8in4k3pln0tommoESKeeT",
    "x-api-key":"8dbc466c-755f-4b6c-88b6-ca4e721fdff9",
    "AUTHKEY":"4mrtOPEqStErbI8R87lPMTqyIfYaDAVGT2HQQH1+nDc=",
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
    try {
      var response = await http!.authService.get(
        uri,
        queryParameters: queryParameters,
        options: options,
        cancelToken: globalCancelToken,
        onReceiveProgress: onReceiveProgress,
      );

      return response;
    } on SocketException catch (e) {
      throw SocketException(e.toString());
    } on FormatException catch (_) {
      throw FormatException("Unable to process the data");
    } catch (e) {
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

      return response;
    } on SocketException catch (e) {
      throw SocketException(e.toString());
      
    } on FormatException catch (_) {
      throw FormatException("Unable to process the data");
    } catch (e) {
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

      return response;
    } on SocketException catch (e) {
      throw SocketException(e.toString());
    } on FormatException catch (_) {
      throw FormatException("Unable to process the data");
    } catch (e) {
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

    return response;
  } on  SocketException catch (e) {
    throw SocketException(e.toString());
  } on FormatException {
    throw FormatException("Unable to process the data");
  } catch (e) {
    throw NetworkExceptions.getDioException(e);
  }
}
}


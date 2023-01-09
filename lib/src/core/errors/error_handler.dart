import 'dart:io';

import 'package:dio/dio.dart';
import 'package:news_app/src/data/models/error_model.dart';

const NOT_IMPLEMENTED = "Not Implemented";
const REQUEST_CANCELLED = "Request Cancelled";
const UNEXPECTED_ERROR = "Unexpected error occurred";
const REQUEST_TIMEOUT = "Connection request timeout";
const NO_INTERNET = "No internet connection";
const SEND_TIMEOUT = "Send timeout in connection with API server";
const FORMAT_EXCEPTION = "Unexpected error occurred";

class CacheException implements Exception {}

class PluginException implements Exception {}

enum EResponseException {
  REQUESTCANCELED(REQUEST_CANCELLED),
  REQUESTTIMEOUT(REQUEST_TIMEOUT),
  SENDTIMEOUT(SEND_TIMEOUT),
  NOTIMPLEMENTED(NOT_IMPLEMENTED),
  NOINTERNETCONNECTION(NO_INTERNET),
  FORMATEXCEPTION(FORMAT_EXCEPTION),
  UNABLETOPROCESS("Unable to process the data"),
  DEFAULTERROR("CUSTOM"),
  UNEXPECTEDERROR(UNEXPECTED_ERROR);

  const EResponseException(this.message);
  final String message;
}

class ResponseException {
  String message;
  ResponseException({
    this.message = "",
  });

  factory ResponseException.error(
      {required EResponseException type, String? message}) {
    if (type == EResponseException.REQUESTCANCELED) {
      return ResponseException(message: type.message);
    }
    if (type == EResponseException.REQUESTTIMEOUT) {
      return ResponseException(message: type.message);
    }
    if (type == EResponseException.SENDTIMEOUT) {
      return ResponseException(message: type.message);
    }
    if (type == EResponseException.NOTIMPLEMENTED) {
      return ResponseException(message: type.message);
    }
    if (type == EResponseException.NOINTERNETCONNECTION) {
      return ResponseException(message: type.message);
    }
    if (type == EResponseException.FORMATEXCEPTION) {
      return ResponseException(message: type.message);
    }
    if (type == EResponseException.UNABLETOPROCESS) {
      return ResponseException(message: type.message);
    }
    if (type == EResponseException.DEFAULTERROR) {
      return ResponseException(message: message ?? type.message);
    }
    if (type == EResponseException.UNEXPECTEDERROR) {
      return ResponseException(message: type.message);
    }
    return ResponseException(message: message ?? type.message);
  }

  static String getErrorMessage(ResponseException responseException) {
    return responseException.message;
  }

  static ResponseException getDioException(dynamic error) {
    if (error is Exception) {
      try {
        ResponseException responseException;
        if (error is DioError) {
          switch (error.type) {
            case DioErrorType.cancel:
              responseException = ResponseException.error(
                type: EResponseException.REQUESTCANCELED,
              );
              break;
            case DioErrorType.connectTimeout:
              responseException = ResponseException.error(
                type: EResponseException.REQUESTTIMEOUT,
              );
              break;
            case DioErrorType.other:
              if (error.message.contains("SocketException")) {
                responseException = ResponseException.error(
                  type: EResponseException.NOINTERNETCONNECTION,
                );
              } else {
                responseException = ResponseException.error(
                  type: EResponseException.UNEXPECTEDERROR,
                );
              }

              break;
            case DioErrorType.receiveTimeout:
              responseException = ResponseException.error(
                type: EResponseException.SENDTIMEOUT,
              );
              break;
            case DioErrorType.response:
              final data = ErrorModel.fromJson(error.response?.data);
              if (error.response?.statusCode != 200) {}
              responseException = ResponseException.error(
                type: EResponseException.DEFAULTERROR,
                message: data.message,
              );
              break;
            case DioErrorType.sendTimeout:
              responseException = ResponseException.error(
                type: EResponseException.SENDTIMEOUT,
              );
              break;
          }
        } else if (error is SocketException) {
          responseException = ResponseException.error(
            type: EResponseException.NOINTERNETCONNECTION,
          );
        } else {
          responseException = ResponseException.error(
            type: EResponseException.UNEXPECTEDERROR,
          );
        }
        return responseException;
      } on FormatException catch (_) {
        return ResponseException.error(
          type: EResponseException.FORMATEXCEPTION,
        );
      } catch (_) {
        return ResponseException.error(
          type: EResponseException.UNEXPECTEDERROR,
        );
      }
    } else {
      if (error.toString().contains("is not a subtype of")) {
        return ResponseException.error(
          type: EResponseException.UNABLETOPROCESS,
        );
      } else {
        return ResponseException.error(
          type: EResponseException.UNEXPECTEDERROR,
        );
      }
    }
  }

  @override
  String toString() => 'ResponseException(message: $message)';
}

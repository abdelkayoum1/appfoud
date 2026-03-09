import 'package:dio/dio.dart';

abstract class Failure {
  final String? error;

  Failure({this.error});
}

class FailureServer extends Failure {
  FailureServer({super.error});

  factory FailureServer.fromDioError(DioException dioerror) {
    switch (dioerror.type) {
      case DioExceptionType.connectionTimeout:
        return FailureServer(error: 'error connecttimeout witch api_sever');

      case DioExceptionType.sendTimeout:
        return FailureServer(error: 'error sendtimeout witch api_sever');
      case DioExceptionType.receiveTimeout:
        return FailureServer(error: 'error receiveTimeout witch api_sever');
      case DioExceptionType.badCertificate:
        return FailureServer(error: 'bad certificate');

      case DioExceptionType.badResponse:
        return FailureServer.frmResponse(
          dioerror.response!.statusCode!,
          dioerror.response!.data!,
        );
      case DioExceptionType.cancel:
        return FailureServer(error: 'cancel');

      case DioExceptionType.connectionError:
        return FailureServer(error: 'error connectionerror');

      case DioExceptionType.unknown:
        if (dioerror.message!.contains('sSocketException')) {
          return FailureServer(error: 'inknow internet');
        }
        return FailureServer(error: 'uknow problem ');
      // ignore: unreachable_switch_default
      default:
        return FailureServer(error: 'error');
    }
  }

  factory FailureServer.frmResponse(int statuscode, dynamic reponse) {
    if (statuscode == 400 || statuscode == 401 || statuscode == 403) {
      return FailureServer(error: reponse['error']['message']);
    } else if (statuscode == 404) {
      return FailureServer(error: 'server not_found');
    } else if (statuscode == 500) {
      return FailureServer(error: 'error');
    } else {
      return FailureServer(error: 'error error');
    }
  }
}

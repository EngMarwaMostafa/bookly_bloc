
import 'package:dio/dio.dart';

abstract class Failure{
  final String errMessage;
  Failure(this.errMessage);

}

class ServerFailure extends Failure {
  ServerFailure(super.errMessage);

  factory ServerFailure.fromDioError(DioError dioError){
    switch (dioError.type) {
      case DioErrorType.connectionTimeout:
        return ServerFailure('Connection timeout with ApiServer');

      case DioErrorType.sendTimeout:
        return ServerFailure('Send timeout with ApiServer');

      case DioErrorType.receiveTimeout:
        return ServerFailure('Receive timeout with ApiServer');

      case DioErrorType.badResponse:
        return ServerFailure.fromResponse(
            dioError.response!.statusCode!, dioError.response!.data);

      case DioErrorType.cancel:
        return ServerFailure('Request to ApiServer was canceled');
    }
    return ServerFailure('Unexpected Error, Please try later');

}
  factory ServerFailure.fromResponse(int statusCode,dynamic response){
    if(statusCode == 400 || statusCode == 401 || statusCode == 403){
      return ServerFailure(response['error']['message']);
    }else if(statusCode == 404){
      return ServerFailure('Method not found');
    }else if(statusCode == 500) {
      return ServerFailure('Internal Server Error');
    }else{
      return ServerFailure('Opps there error');
    }
  }
}
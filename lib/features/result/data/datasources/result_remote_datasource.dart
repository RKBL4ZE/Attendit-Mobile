import 'dart:convert';

import 'package:Attendit/features/result/data/models/rank_model.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/exceptions.dart';
import '../models/result_model.dart';
import 'package:http/http.dart' as http;

abstract class IResultRemoteDataSource {
  /// Calls the ipuresults.xyz api and get [List<ResultDataModel>]
  /// the user had an internet connection.
  ///
  /// Throws [ServerException] if there is server error
  Future<ResultDataModel> getResult({String enrollment});

  /// Calls the ipuresults.xyz api and get [List<RankModel>]
  /// the user had an internet connection.
  ///
  /// Throws [ServerException] if there is server error
  Future<List<RankModel>> getRankList(
      {String rankType,
      String takenFrom,
      String batch,
      String institutionCode,
      num limit = 20,
      num offset = 0});
}

@Injectable(as: IResultRemoteDataSource)
@lazySingleton
class ResultRemoteDataSource implements IResultRemoteDataSource {
  final http.Client client = http.Client();
  @override
  Future<ResultDataModel> getResult({String enrollment}) async {
    try {
      final response = await client
          .get('https://api.ipuresults.xyz/v1/results/$enrollment', headers: {
        'Content-Type': 'application/json',
      });
      if (response.statusCode == 200) {
		  final Map<String, dynamic> ret = json.decode(response.body);
		  print(ret);
        final val =  ResultDataModel.fromJson(ret['data']);
		return val;
      } else {
        throw ServerException();
      }
    } catch (e) {
      throw ServerException();
    }
  }

  @override
  Future<List<RankModel>> getRankList(
      {String rankType,
      String takenFrom,
      String batch,
      String institutionCode,
      num limit = 20,
      num offset = 0}) async {
    try {
      final response = await client.get(
          'https://api.ipuresults.xyz/v1/ranks/$rankType?fileId=$takenFrom&offset=$offset&limit=$limit&institutionCode=$institutionCode&batch=$batch',
          headers: {
            'Content-Type': 'application/json',
          });
      if (response.statusCode == 200) {
        return json
            .decode(response.body)
            .map<List<RankModel>>((e) => RankModel.fromJson(e))
            .toList();
      } else {
        throw ServerException();
      }
    } catch (e) {
      throw ServerException();
    }
  }
}

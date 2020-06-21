import 'package:Attendit/core/error/exceptions.dart';
import 'package:Attendit/core/network/graphql_service.dart';
import 'package:Attendit/core/util/gql_query.dart';
import 'package:Attendit/features/timetable/data/models/timetable_model.dart';
import 'package:Attendit/features/timetable/domain/entities/timetable.dart';
import 'package:injectable/injectable.dart';

abstract class ITimeTableRemoteDatasource {
  Future<List<GroupModel>> getTimeTable();
}

@Injectable(as: ITimeTableRemoteDatasource)
@lazySingleton
class TimeTableRemoteDatasource implements ITimeTableRemoteDatasource {
  final IGraphQLService _client;

  TimeTableRemoteDatasource(this._client);

  @override
  Future<List<GroupModel>> getTimeTable() async {
    try {
      final result = await _client.query(
          query: Gqlquery.studentTimeTableQuery); //todo: future change query
      if (result.exception == null) {
        return result.data["Student"]['batch']['classroom']['groups']
            .map<GroupModel>((e) => GroupModel.fromJson(e))
            .toList();
      }
      throw UnauthorizedException();
    } on UnauthorizedException {
      throw UnauthorizedException();
    } on Exception catch (exception) {
      print(exception);
      throw ServerException();
    }
  }
}

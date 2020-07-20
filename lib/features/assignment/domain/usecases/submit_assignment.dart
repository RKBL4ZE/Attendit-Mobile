import 'dart:io';

import 'package:Attendit/core/error/failures.dart';
import 'package:Attendit/core/usecase/usecase.dart';
import 'package:Attendit/features/assignment/domain/repositories/i_assignment_repository.dart';

import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

@lazySingleton
class SubmitAssignment implements UseCase<bool, Params> {
  final IAssignmentRepository repository;

  SubmitAssignment(this.repository);

  @override
  Future<Either<Failure, bool>> call(Params params) async {
    return await repository.submitAssignment(
      id: params.id,
      file: params.file,
    );
  }
}

class Params extends Equatable {
  final String id;

  final File file;

  Params({
    @required this.id,
    @required this.file,
  });

  @override
  List<Object> get props => [id, file];
}

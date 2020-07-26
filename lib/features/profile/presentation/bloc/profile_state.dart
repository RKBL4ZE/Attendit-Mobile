part of 'profile_bloc.dart';

abstract class ProfileState {}

class ProfileInitial extends ProfileState {}

class ProfileLoaded extends ProfileState {
  final Map<String, dynamic> _allDetails;

  StudentDetailsModel student;

  ProfileLoaded(this._allDetails) {
    student = _allDetails['Student'];
  }
}

class ProfileLoading extends ProfileState {}

class ProfileError extends ProfileState {
  final String message;

  ProfileError({@required this.message});
}

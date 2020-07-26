part of 'virtualidcard_bloc.dart';

abstract class VirtualidcardState {}

class VirtualidcardInitial extends VirtualidcardState {}

class VirtualidcardLoaded extends VirtualidcardState {
  final Map<String, dynamic> _allDetails;

  StudentDetailsModel student;

  VirtualidcardLoaded(this._allDetails) {
    student = _allDetails['Student'];
  }
}

class VirtualidcardLoading extends VirtualidcardState {}

class VirtualidcardError extends VirtualidcardState {
  final String message;

  VirtualidcardError({@required this.message});
}

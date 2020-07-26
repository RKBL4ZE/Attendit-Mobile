part of 'virtualidcard_bloc.dart';

// abstract class VirtualidcardEvent {}

// class GetVirtualidcard extends VirtualidcardEvent {
//   final String enrollment;

//   GetVirtualidcard({this.enrollment});
// }

abstract class VirtualidcardEvent extends Equatable {
  const VirtualidcardEvent();
}

class GetVirtualidcardEvent extends VirtualidcardEvent {
  @override
  List<Object> get props => [];
}

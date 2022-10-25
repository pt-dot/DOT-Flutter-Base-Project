import 'package:base_flutter/src/core/data/models/user.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';

class ProfileState extends Equatable {
  final User? user;
  final FormzStatus status;

  const ProfileState({
    this.user,
    this.status = FormzStatus.pure,
  });

  ProfileState copyWith({
    User? user,
    FormzStatus? status,
  }) =>
      ProfileState(
        user: user ?? this.user,
        status: status ?? FormzStatus.pure,
      );

  @override
  List<Object?> get props => [
        user,
        status,
      ];

  @override
  bool get stringify => true;
}

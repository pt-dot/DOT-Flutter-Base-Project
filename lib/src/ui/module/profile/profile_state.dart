import 'package:base_flutter/src/core/models/user.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';

class ProfileState extends Equatable {
  final User? user;
  final FormzSubmissionStatus status;

  const ProfileState({
    this.user,
    this.status = FormzSubmissionStatus.initial,
  });

  ProfileState copyWith({
    User? user,
    FormzSubmissionStatus? status,
  }) =>
      ProfileState(
        user: user ?? this.user,
        status: status ?? FormzSubmissionStatus.initial,
      );

  @override
  List<Object?> get props => [
        user,
        status,
      ];

  @override
  bool get stringify => true;
}

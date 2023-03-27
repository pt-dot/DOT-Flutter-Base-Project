part of 'update_profile_bloc.dart';

abstract class UpdateProfileState extends Equatable {
  const UpdateProfileState();
  
  @override
  List<Object> get props => [];
}

class UpdateProfileInitial extends UpdateProfileState {}

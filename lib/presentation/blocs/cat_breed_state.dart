import 'package:equatable/equatable.dart';
import '../../domain/entities/cat_breed.dart';

abstract class CatBreedState extends Equatable {
  const CatBreedState();

  @override
  List<Object> get props => [];
}

class CatBreedInitial extends CatBreedState {}

class CatBreedLoading extends CatBreedState {}

class CatBreedLoaded extends CatBreedState {
  final List<CatBreed> breeds;

  const CatBreedLoaded(this.breeds);

  @override
  List<Object> get props => [breeds];
}

class CatBreedError extends CatBreedState {
  final String message;

  const CatBreedError(this.message);

  @override
  List<Object> get props => [message];
}

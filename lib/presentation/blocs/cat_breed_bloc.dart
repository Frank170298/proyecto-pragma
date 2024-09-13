import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/usecases/get_cat_breeds.dart';
import 'cat_breed_event.dart';
import 'cat_breed_state.dart';

class CatBreedBloc extends Bloc<CatBreedEvent, CatBreedState> {
  final GetCatBreeds getCatBreeds;

  CatBreedBloc(this.getCatBreeds) : super(CatBreedInitial()) {
    on<GetCatBreedsEvent>((event, emit) async {
      emit(CatBreedLoading());
      try {
        final breeds = await getCatBreeds();
        emit(CatBreedLoaded(breeds));
      } catch (e) {
        emit(const CatBreedError('Error al cargar las razas de gatos'));
      }
    });
  }
}

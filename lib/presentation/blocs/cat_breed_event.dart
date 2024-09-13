// cat_breed_event.dart

abstract class CatBreedEvent {}

class GetCatBreedsEvent extends CatBreedEvent {}

class LoadMoreCatBreedsEvent
    extends CatBreedEvent {} // Evento para cargar más razas

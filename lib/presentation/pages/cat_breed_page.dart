// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pruyeba_tecnica_pragma/presentation/pages/cat_bread_detail_page.dart';
import '../blocs/cat_breed_bloc.dart';
import '../blocs/cat_breed_state.dart';
import '../blocs/cat_breed_event.dart';

class CatBreedPage extends StatefulWidget {
  const CatBreedPage({super.key});

  @override
  _CatBreedPageState createState() => _CatBreedPageState();
}

class _CatBreedPageState extends State<CatBreedPage> {
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = "";
  final ScrollController _scrollController = ScrollController();
  bool _isLoadingMore = false;

  @override
  void initState() {
    super.initState();

    _scrollController.addListener(() {
      if (_scrollController.position.pixels >=
          _scrollController.position.maxScrollExtent - 200) {
        _loadMoreBreeds();
      }
    });
  }

  void _loadMoreBreeds() {
    if (!_isLoadingMore) {
      _isLoadingMore = true;
      context.read<CatBreedBloc>().add(LoadMoreCatBreedsEvent());
      Future.delayed(const Duration(seconds: 1), () {
        _isLoadingMore = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cat Breeds'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _searchController,
              decoration: const InputDecoration(
                labelText: 'Buscar raza',
                border: OutlineInputBorder(),
                suffixIcon: Icon(Icons.search),
              ),
              onChanged: (value) {
                setState(() {
                  _searchQuery = value.toLowerCase();
                });
              },
            ),
          ),
          Expanded(
            child: BlocBuilder<CatBreedBloc, CatBreedState>(
              builder: (context, state) {
                if (state is CatBreedInitial) {
                  context.read<CatBreedBloc>().add(GetCatBreedsEvent());
                  return const Center(child: CircularProgressIndicator());
                } else if (state is CatBreedLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is CatBreedLoaded) {
                  final filteredBreeds = state.breeds.where((breed) {
                    return breed.name.toLowerCase().contains(_searchQuery);
                  }).toList();

                  return ListView.builder(
                    controller: _scrollController,
                    itemCount: filteredBreeds.length + 1,
                    itemBuilder: (context, index) {
                      if (index == filteredBreeds.length) {
                        return _isLoadingMore
                            ? const Padding(
                                padding: EdgeInsets.all(8.0),
                                child:
                                    Center(child: CircularProgressIndicator()),
                              )
                            : const SizedBox.shrink();
                      }
                      final breed = filteredBreeds[index];
                      print(breed.name);
                      return InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  CatBreedDetailPage(breed: breed),
                            ),
                          );
                        },
                        child: Card(
                          margin: const EdgeInsets.all(10),
                          child: Column(
                            children: [
                              Image.network(
                                "https://cdn2.thecatapi.com/images/${breed.referenceImageId}.jpg",
                                height: 150,
                                fit: BoxFit.cover,
                                errorBuilder: (context, error, stackTrace) {
                                  return Image.asset(
                                    'assets/images/sin_imagen.jpg',
                                    height: 150,
                                    fit: BoxFit.cover,
                                  );
                                },
                              ),
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(breed.name,
                                        style: const TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold)),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('País de origen: ${breed.origin}'),
                                    Text('Inteligencia: ${breed.intelligence}'),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 10),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                } else if (state is CatBreedError) {
                  return Center(child: Text('Error: ${state.message}'));
                } else {
                  return const Center(child: Text('Unexpected State'));
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _searchController.dispose();
    super.dispose();
  }
}

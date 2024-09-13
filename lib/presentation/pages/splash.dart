import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pruyeba_tecnica_pragma/data/api/cat_api_service.dart';
import 'package:pruyeba_tecnica_pragma/domain/usecases/get_cat_breeds.dart';
import 'package:pruyeba_tecnica_pragma/presentation/blocs/cat_breed_bloc.dart';
import 'dart:async';
import 'cat_breed_page.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    _navigateToHome(context);

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Cat Breeds',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Image.asset(
              'assets/images/splash.png',
              height: 200,
            ),
          ],
        ),
      ),
    );
  }

  void _navigateToHome(BuildContext context) {
    Timer(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (_) => CatBreedBloc(GetCatBreeds(CatApiService())),
            child: CatBreedPage(),
          ),
        ),
      );
    });
  }
}

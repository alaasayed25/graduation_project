import 'package:flutter/material.dart';
import '../../../model/movie.dart';

class MovieDetailsScreen extends StatelessWidget {
  final Movie movie;

  const MovieDetailsScreen(
      {super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff121212),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              "https://image.tmdb.org/t/p/w500${movie.posterPath}",
              width: double.infinity,
              height: 400,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Text(
                movie.title,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  const Icon(Icons.star,
                      color: Colors.amber),
                  const SizedBox(width: 6),
                  Text(
                    movie.rating.toString(),
                    style: const TextStyle(
                        color: Colors.white),
                  ),
                  const SizedBox(width: 20),
                  Text(
                    movie.releaseDate,
                    style: const TextStyle(
                        color: Colors.white70),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Text(
                movie.overview,
                style: const TextStyle(
                    color: Colors.white70),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
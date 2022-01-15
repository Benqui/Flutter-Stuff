import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:peliculas_app/models/models.dart';
import 'package:peliculas_app/providers/movies_provider.dart';
import 'package:provider/provider.dart';

class CastingCards extends StatelessWidget {
  final int movieId;
  const CastingCards({Key? key, required this.movieId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final moviesProvider = Provider.of<MoviesProvider>(context, listen: false);
    return FutureBuilder(
      future: moviesProvider.getmovieCast(movieId),
      builder: (_, AsyncSnapshot<List<Cast>> snapshot) {
        if (!snapshot.hasData) {
          // if (true) {
          return Container(
            constraints: BoxConstraints(maxWidth: 150),
            height: 180,
            child: CupertinoActivityIndicator(),
          );
        }

        final castResponse = snapshot.data!;

        return Container(
          width: double.infinity,
          height: 180,
          margin: EdgeInsets.only(bottom: 30),
          // color: Colors.lightGreenAccent,
          child: ListView.builder(
            itemBuilder: (context, index) => _CastCard(
              actor: castResponse[index],
            ),
            itemCount: castResponse.length,
            scrollDirection: Axis.horizontal,
          ),
        );
      },
    );
  }
}

class _CastCard extends StatelessWidget {
  final Cast actor;
  const _CastCard({Key? key, required this.actor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      width: 110,
      height: 100,
      // color: Colors.redAccent,
      child: Column(
        children: [
          const SizedBox(height: 5),
          ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: FadeInImage(
              placeholder: const AssetImage('assets/no-image.jpg'),
              image: NetworkImage(actor.fullProfilePath),
              height: 140,
              width: 100,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            actor.name,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 5),
        ],
      ),
    );
  }
}

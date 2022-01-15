import 'package:flutter/material.dart';
import 'package:peliculas_app/models/models.dart';

class MovieSlider extends StatefulWidget {
  final List<Movie> movies;
  final String? title;

  final Function onNextPage;

  const MovieSlider({
    Key? key,
    required this.movies,
    required this.onNextPage,
    this.title,
  }) : super(key: key);

  @override
  State<MovieSlider> createState() => _MovieSliderState();
}

class _MovieSliderState extends State<MovieSlider> {
  final ScrollController scrollControl = ScrollController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    scrollControl.addListener(() {
      if (scrollControl.position.pixels >=
          scrollControl.position.maxScrollExtent - 500) {
        widget.onNextPage();
      }
      // print(scrollControl.position.pixels);
      // print(scrollControl.position.maxScrollExtent);
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.movies.isEmpty) {
      // if (true) {
      return SizedBox(
        width: double.infinity,
        height: 280,
        child: Center(
          child: Column(
            children: const [
              CircularProgressIndicator(),
              SizedBox(height: 5),
              Text(
                'Loading',
                textAlign: TextAlign.center,
              )
            ],
          ),
        ),
      );
    }

    return SizedBox(
      width: double.infinity,
      height: 280,
      // color: Colors.lightGreenAccent,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (widget.title != null)
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                widget.title!,
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
            ),
          const SizedBox(
            height: 5,
          ),
          Expanded(
            child: ListView.builder(
              controller: scrollControl,
              scrollDirection: Axis.horizontal,
              itemCount: widget.movies.length,
              itemBuilder: (_, index) => _MoviePoster(widget.movies[index],
                  '${widget.title}-${widget.movies[index].id}'),
            ),
          )
        ],
      ),
    );
  }
}

class _MoviePoster extends StatelessWidget {
  final Movie movie;
  final String heroId;
  const _MoviePoster(this.movie, this.heroId);

  @override
  Widget build(BuildContext context) {
    movie.heroId = heroId;

    return Container(
      width: 140,
      height: 190,
      // color: Colors.red,
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          GestureDetector(
            onTap: () =>
                Navigator.pushNamed(context, 'details', arguments: movie),
            child: Hero(
              tag: movie.heroId!,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(35),
                child: FadeInImage(
                  placeholder: const AssetImage('assets/no-image.jpg'),
                  image: NetworkImage(movie.fullPosterImg),
                  width: 130,
                  height: 175,
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            movie.title,
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

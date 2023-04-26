import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasks2/Data/Model/moviemodel.dart';
import 'package:tasks2/Data/Repository/movierepo.dart';
import 'package:tasks2/Logic/bloc.dart';
import 'package:tasks2/Logic/event.dart';
import 'package:tasks2/Logic/state.dart';
import 'package:tasks2/Widget/customcolumn.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  var response;
  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => Repository(),
      child: BlocProvider(
        create: ((context) => MovieBloc(context.read<Repository>())),
        child: Scaffold(
          backgroundColor: Colors.black87,
          appBar: AppBar(
            backgroundColor: Colors.black,
            leading: IconButton(
              icon: Image.asset(
                'images/logo.jpeg',
              ),
              onPressed: () {},
            ),
            actions: [
              IconButton(
                icon: const Icon(Icons.search),
                onPressed: () {},
              ),
              const Padding(
                padding: EdgeInsets.only(top: 16),
                child: Text(
                  "4K",
                  style: TextStyle(
                      color: Color.fromARGB(137, 8, 249, 3),
                      fontSize: 20,
                      fontWeight: FontWeight.w600),
                ),
              ),
              IconButton(
                icon: const Icon(Icons.bar_chart),
                onPressed: () {},
              ),
              IconButton(
                icon: const Icon(Icons.library_books),
                onPressed: () {},
              ),
              IconButton(
                icon: const Icon(Icons.person),
                onPressed: () {},
              ),
            ],
          ),
          body: BlocListener<MovieBloc, MovieState>(
            listener: (context, state) {
              if (state is LoadingState) {
                const LinearProgressIndicator();
              }

              if (state is LoadedState) {
                response = state.movieData;

                setState(() {
                  response;
                });
              }

              if (state is ErrorState) {}
            },
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(right: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    response != null
                        ? GridView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: response.length,
                            itemBuilder: ((context, index) {
                              return CustomColumn(
                                imagePath:
                                    "${response[index].mediumCoverImage}",
                                text: "${response[index].title}",
                                color: Colors.white,
                                size: 20,
                                fontWeight: FontWeight.bold,
                                overflow: TextOverflow.ellipsis,
                                text1: "${response[index].year}",
                                color1: Colors.white54,
                                size1: 15,
                              );
                            }),
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              mainAxisExtent: 320,
                              mainAxisSpacing: 10,
                              crossAxisSpacing: 10,
                            ),
                          )
                        : SizedBox(),
                    BlocBuilder<MovieBloc, MovieState>(
                        builder: (context, state) {
                      return ElevatedButton(
                          onPressed: () {
                            BlocProvider.of<MovieBloc>(context)
                                .add(ButtonEvent());
                          },
                          child: Column(
                            children: [
                              Text("Press to get value"),
                            ],
                          ));
                    })
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

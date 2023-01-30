import 'package:flutter/material.dart';
import 'package:music_app/controller/provider/searchscreen_provider.dart';
import 'package:provider/provider.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Provider.of<SearchScreenProvider>(context, listen: false)
        .fetchingAllSongsAndAssigningToFoundSongs();
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color.fromARGB(255, 50, 6, 107),
            Color.fromARGB(255, 15, 2, 44),
          ],
        ),
      ),
      child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            leading: IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: const Icon(Icons.arrow_back, color: Colors.white)),
            toolbarHeight: 80,
            backgroundColor: Colors.transparent,
            actions: [
              Container(
                padding: const EdgeInsets.fromLTRB(0, 15, 50, 0),
                width: MediaQuery.of(context).size.width * 0.8,
                child: TextField(
                  style: const TextStyle(fontWeight: FontWeight.bold),
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.fromLTRB(50, 0, 0, 0),
                    filled: true,
                    fillColor: Colors.white.withOpacity(.5),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide.none),
                    hintText: 'Artists,songs,or albums',
                    hintStyle: const TextStyle(
                        fontFamily: 'UbuntuCondensed', color: Colors.white),
                    prefixIcon: const Icon(Icons.search),
                  ),
                  onChanged: ((value) {
                    Provider.of<SearchScreenProvider>(context, listen: false)
                        .runFilter(value);
                  }),
                ),
              )
            ],
          ),
          body: Consumer<SearchScreenProvider>(
            builder: (context, value, child) {
              return value.showListView() ?? Container();
            },
          )),
    );
  }
}

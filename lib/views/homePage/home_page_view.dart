import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled1/controls/functions/data_fetching.dart';

class HomePageView extends StatefulWidget {
  const HomePageView({super.key});

  @override
  State<HomePageView> createState() => _HomePageViewState();
}

class _HomePageViewState extends State<HomePageView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Center(
            child: FutureBuilder<dynamic>(
          future: DataFetching().dataFetching(),
          builder: (context, AsyncSnapshot<dynamic> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return const Text('Something Went Wrong');
            } else {
              return ListView.builder(
                itemCount: snapshot.data[0].length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    child: ListTile(
                      leading: CircleAvatar(
                        child: Text((index + 1).toString()),
                      ),
                      title: Text(snapshot.data[0][index]['name']['title'] +
                          ' ' +
                          snapshot.data[0][index]['name']['first'] +
                          ' ' +
                          snapshot.data[0][index]['name']['last']),
                      subtitle: Text(snapshot.data[0][index]['email']),
                    ),
                  );
                },
              );
            }
          },
        )),
      ),
    );
  }
}

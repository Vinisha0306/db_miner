import 'package:db_miner/Controller/Api_Controller.dart';
import 'package:db_miner/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Controller/themeController.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    QuotesController listnable = Provider.of<QuotesController>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Quotes'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed(AppRoutes.likePage);
            },
            icon: const Icon(
              Icons.thumb_up_off_alt_rounded,
            ),
          ),
          IconButton(
            onPressed: () {
              Provider.of<ThemeController>(context, listen: false)
                  .ChangeTheme();
            },
            icon: Provider.of<ThemeController>(context).isdark
                ? const Icon(
                    CupertinoIcons.moon_fill,
                  )
                : const Icon(
                    Icons.sunny,
                  ),
          ),
        ],
      ),
      body: listnable.allQuotes.isNotEmpty
          ? ListView.builder(
              itemCount: listnable.allQuotes.length,
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.all(16.0),
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, AppRoutes.detailPage,
                        arguments: index);
                  },
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.primaries[index % 18].shade300,
                      borderRadius: BorderRadius.circular(10),
                      image: const DecorationImage(
                        image: NetworkImage(
                            'https://i.pinimg.com/564x/50/d5/f4/50d5f4e6d5656c0bbc57c0c32e90b6b5.jpg'),
                        fit: BoxFit.fill,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(32.0),
                      child: Text(
                        listnable.allQuotes[index].text,
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            )
          : const Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}

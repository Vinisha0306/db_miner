import 'package:db_miner/Controller/Api_Controller.dart';
import 'package:db_miner/Controller/DbController.dart';
import 'package:db_miner/Controller/wallpaperController.dart';
import 'package:db_miner/modal/Api_modal.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    int index = ModalRoute.of(context)!.settings.arguments as int;
    Quotes data = Provider.of<QuotesController>(context).allQuotes[index];
    WallPaperController listnable = Provider.of<WallPaperController>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Details',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Container(
              height: 300,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.purple.shade300,
                image: DecorationImage(
                  image: NetworkImage(listnable.image),
                  fit: BoxFit.fill,
                ),
              ),
              alignment: Alignment.center,
              child: Text(
                data.text,
                style: const TextStyle(
                  shadows: [
                    BoxShadow(
                      color: Colors.black,
                      offset: Offset(3, 3),
                    )
                  ],
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(
                  Provider.of<WallPaperController>(context).allWallPaper.length,
                  (index) => GestureDetector(
                    onTap: () {
                      Provider.of<WallPaperController>(context, listen: false)
                          .getImage(index: index);
                    },
                    child: Container(
                      margin: const EdgeInsets.all(10),
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        color: Colors.primaries[index % 18].shade300,
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                          image: NetworkImage(
                              Provider.of<WallPaperController>(context)
                                  .allWallPaper[index]
                                  .largeImageUrl),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
      floatingActionButton: ElevatedButton.icon(
        onPressed: () {
          Provider.of<DbController>(context, listen: false).insertData(
            quotes: data,
            image: listnable.image,
          );
        },
        icon: const Icon(Icons.thumb_up_alt),
        label: const Text('Like'),
      ),
    );
  }
}

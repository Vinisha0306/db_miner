import 'package:db_miner/Controller/DbController.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LikePage extends StatelessWidget {
  const LikePage({super.key});

  @override
  Widget build(BuildContext context) {
    DbController listnable = Provider.of<DbController>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Liked Quotes',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: listnable.allLikeQuotesData.isNotEmpty
            ? ListView.builder(
                itemCount: listnable.allLikeQuotesData.length,
                itemBuilder: (context, index) => Container(
                  margin: const EdgeInsets.all(10),
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: NetworkImage(
                        "${listnable.allLikeQuotesData[index].image}",
                      ),
                      fit: BoxFit.fill,
                    ),
                  ),
                  child: Column(
                    children: [
                      Text(
                        "${listnable.allLikeQuotesData[index].text}",
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
                      IconButton(
                        onPressed: () {
                          Provider.of<DbController>(context, listen: false)
                              .DeleteData(
                                  id: listnable.allLikeQuotesData[index].id);
                        },
                        icon: const Icon(
                          Icons.delete,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              )
            : const Center(
                child: Text('No Any Liked Quotes'),
              ),
      ),
    );
  }
}

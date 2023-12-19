import 'package:cat_app/data/models/response/cat_response.dart';
import 'package:flutter/material.dart';

class HomeDetails extends StatelessWidget {
  const HomeDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cats = ModalRoute.of(context)?.settings.arguments as CatResponse;
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Details"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Hero(
                tag: cats.url!,
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Image.network(cats.url!,
                      width: width / 2, height: height / 3),
                ),
              ),
              if (cats.breeds?.isNotEmpty ?? false) ...[
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "NAME:",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 18,
                    color: Colors.grey[600],
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  cats.breeds!.first.name!,
                  textAlign: TextAlign.start,
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 18,
                    color: Colors.blue,
                  ),
                ),
                const SizedBox(height: 40),
                Text(
                  "DESCRIPTION:",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 18,
                    color: Colors.grey[600],
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  cats.breeds!.first.description!,
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 18,
                    color: Colors.blue,
                  ),
                )
              ],
            ],
          ),
        ),
      ),
    );
  }
}

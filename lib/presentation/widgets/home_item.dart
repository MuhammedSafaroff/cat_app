import 'package:cat_app/data/models/response/cat_response.dart';
import 'package:flutter/material.dart';

class HomeItem extends StatefulWidget {
  const HomeItem({
    Key? key,
    required this.item,
    this.onTap,
  }) : super(key: key);
  final CatResponse item;

  final void Function()? onTap;

  @override
  State<HomeItem> createState() => _HomeItemState();
}

class _HomeItemState extends State<HomeItem> {
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(15.0)),
      ),
      child: Hero(
        tag: widget.item.url!,
        child: Material(
          borderRadius: BorderRadius.circular(15.0),
          color: Colors.white,
          shadowColor: Colors.black.withOpacity(0.15),
          child: InkWell(
            borderRadius: BorderRadius.circular(15.0),
            onTap: widget.onTap,
            child: Image.network(
              widget.item.url!,
            ),
          ),
        ),
      ),
    );
  }
}

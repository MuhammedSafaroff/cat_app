import 'package:cat_app/presentation/blocs/bottom_nav/bottom_nav_cubit.dart';
import 'package:cat_app/presentation/constant/pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> with TickerProviderStateMixin {
  late AnimationController controller;
  late Animation<Offset> offset;
  late Animation<Offset> offsetR;
  int lastIndex = 0;
  bool sideControl = true;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
      reverseDuration: const Duration(milliseconds: 200),
    );

    offset = Tween<Offset>(begin: const Offset(1.0, 0.0), end: Offset.zero)
        .animate(CurvedAnimation(parent: controller, curve: Curves.easeIn));
    offsetR = Tween<Offset>(begin: const Offset(-1.0, 0.0), end: Offset.zero)
        .animate(CurvedAnimation(parent: controller, curve: Curves.easeIn));

    controller.forward();
    navigationCurrentIndex.addListener(() {
      if (lastIndex < navigationCurrentIndex.value) {
        sideControl = true;
        controller.reset();
        controller.forward();
      } else {
        sideControl = false;
        controller.reset();
        controller.forward();
      }
      lastIndex = navigationCurrentIndex.value;
    });
  }

  Animation<Offset> howSide(bool val) {
    if (val) {
      return offset;
    } else {
      return offsetR;
    }
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomNavCubit, int>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text(AppPages.titles[state]),
          ),
          body: SlideTransition(
            position: howSide(sideControl),
            child: IndexedStack(
              index: state,
              children: AppPages.pages,
            ),
          ),
          bottomNavigationBar: BottomNavigationBar(
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: "Home",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: "Profile",
              ),
            ],
            currentIndex: state,
            onTap: (v) {
              context.read<BottomNavCubit>().changeIndex(v);
            },
          ),
        );
      },
    );
  }
}

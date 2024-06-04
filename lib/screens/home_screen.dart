import 'package:flutter/material.dart';
import 'package:heroicons_flutter/heroicons_flutter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Column(
        children: [
          TopHeader(),
          SizedBox(
            height: 20,
          ),
          ScrollableTabs(),
          SizedBox(
            height: 30,
          ),
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [DailyPlanContainer(), ImageNoteContainer()]),
        ],
      ),
    );
  }
}

class TopHeader extends StatelessWidget {
  const TopHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "My",
              style: TextStyle(
                  fontSize: 40,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              "Notes",
              style: TextStyle(
                  fontSize: 40,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            )
          ],
        ),
        Padding(
            padding: EdgeInsets.only(top: 20),
            child: Icon(
              HeroiconsSolid.squares2x2,
              color: Colors.white,
            ))
      ],
    );
  }
}

class ScrollableTabs extends StatelessWidget {
  const ScrollableTabs({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          CustomTab(title: "All"),
          CustomTab(title: "Important"),
          CustomTab(title: "Reminders"),
        ],
      ),
    );
  }
}

class CustomTab extends StatelessWidget {
  const CustomTab({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 5),
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(
                width: 2, color: const Color.fromARGB(255, 197, 197, 197)),
            borderRadius: BorderRadius.all(Radius.circular(30))),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: Text(
            title,
            style: TextStyle(
                color: Color.fromARGB(255, 197, 197, 197), fontSize: 25),
          ),
        ),
      ),
    );
  }
}

class DailyPlanContainer extends StatefulWidget {
  const DailyPlanContainer({super.key});

  @override
  State<DailyPlanContainer> createState() => _DailyPlanContainerState();
}

class _DailyPlanContainerState extends State<DailyPlanContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 2.2,
      height: 300,
      decoration: BoxDecoration(
          color: Color.fromARGB(255, 255, 137, 59),
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(70),
              bottomLeft: Radius.circular(40),
              bottomRight: Radius.circular(40))),
      child: Column(
        children: [
          SizedBox(
            height: 40,
          ),
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: PlanForTheDayLabel())
        ],
      ),
    );
  }
}

class ImageNoteContainer extends StatefulWidget {
  const ImageNoteContainer({super.key});

  @override
  State<ImageNoteContainer> createState() => _ImageNoteContainerState();
}

class _ImageNoteContainerState extends State<ImageNoteContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 2.2,
      height: 300,
      decoration: BoxDecoration(
          color: Color.fromARGB(255, 240, 208, 21),
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(70),
              topLeft: Radius.circular(70),
              bottomLeft: Radius.circular(40))),
      child: Column(children: [
        SizedBox(
          height: 40,
        ),
        Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: ImageNotesLabel())
      ]),
    );
  }
}

class PlanForTheDayLabel extends StatelessWidget {
  const PlanForTheDayLabel({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(children: [
          Text(
            "Plan for",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
          ),
          Text(
            "The Day",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
          )
        ]),
        Container(
          decoration: BoxDecoration(
              color: Color.fromARGB(255, 224, 121, 53), shape: BoxShape.circle),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: const Icon(
              HeroiconsSolid.heart,
              size: 30,
              color: Color.fromARGB(255, 187, 78, 5),
            ),
          ),
        )
      ],
    );
  }
}

class ImageNotesLabel extends StatelessWidget {
  const ImageNotesLabel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(children: [
          Text(
            "Image",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
          ),
          Text(
            "Notes",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
          )
        ]),
        Container(
          decoration: BoxDecoration(
              color: Color.fromARGB(255, 247, 220, 70), shape: BoxShape.circle),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: const Icon(
              HeroiconsOutline.heart,
              size: 30,
            ),
          ),
        )
      ],
    );
  }
}

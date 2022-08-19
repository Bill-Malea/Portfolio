import 'package:flutter/material.dart';
import 'package:portfolio/models/project_model.dart';

class ProjectWidget extends StatelessWidget {
  final Project project;
  final double bottomPadding;
  const ProjectWidget(
      {required this.project,
      required this.bottomPadding,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        InkWell(
          onTap: () {
            onProjectClick();
          },
          child: ListTile(
              leading: Image.asset(
                project.image,
                width: width * .25,
                height: width * .25,
              ),
              title: Text(
                project.name,
                style: const TextStyle(
                  fontSize: 15,
                ),
              ),
              subtitle: Text(
                project.description,
                textScaleFactor: 1.2,
                style: const TextStyle(
                  fontSize: 10,
                ),
              )),
        ),
        const SizedBox(height: 10),
      ],
    );
  }

  void onProjectClick() {
  //  html.window.open(project.link, "Billmalea");
  }
}

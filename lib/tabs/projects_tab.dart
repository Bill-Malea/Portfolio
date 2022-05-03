import 'package:flutter/material.dart';
import 'package:portfolio/models/project_model.dart';
import 'package:provider/provider.dart';
import '../providers/projectsprovider.dart';
import '../widgets/project_widget.dart';

class ProjectsTab extends StatefulWidget {
  const ProjectsTab({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<ProjectsTab> {
  @override
  Widget build(BuildContext context) {
    final List<Project> projects =
        Provider.of<Projectsprovider>(context).projects;

    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: ListView.builder(
          itemCount: projects.length,
          itemBuilder: (context, index) {
            return ProjectWidget(
              project: projects[index],
              bottomPadding: 15,
            );
          }),
    );
  }
}

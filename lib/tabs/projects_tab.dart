import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/models/project_model.dart';
import 'package:provider/provider.dart';
import '../providers/projectsprovider.dart';
import '../widgets/project_widget.dart';

class ProjectsTab extends StatefulWidget {
  final List<Project> project;
   const ProjectsTab({Key? key, required this.project}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<ProjectsTab> {
  @override
  Widget build(BuildContext context) {
   
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: ListView.builder(
          itemCount: widget.project.length,
          itemBuilder: (context, index) {
            return ProjectWidget(
              project: widget.project[index],
              bottomPadding: 15,
            );
          }),
    );
  }
}

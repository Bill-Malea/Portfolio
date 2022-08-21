import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/models/project_model.dart';
import 'package:portfolio/providers/projectsprovider.dart';
import 'package:provider/provider.dart';

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
    bool ismobile(){
  if(width>500){
    return false;
  }
  return true;
    }
  
    return Column(
      children: [
        InkWell(
          onTap: () {
          Provider.of<Projectsprovider>(context,listen: false).urllauch(link: project.link);
          },
          child: ListTile(
              leading:  CachedNetworkImage(
  imageUrl:project.image,
  imageBuilder: (context, imageProvider) => Container(
  height: ismobile() ?100: 150,
  width: ismobile() ?100: 150,
     decoration:  BoxDecoration(
                      
                          
                          image: DecorationImage(image: imageProvider,
          fit: BoxFit.fitHeight,),
                         
                        ),
   
  ),
  placeholder: (context, url) => SizedBox(
    height: 20,
    child: CircularProgressIndicator(color: Theme.of(context).appBarTheme.backgroundColor,
    strokeWidth: 1.0),
  ),
  errorWidget: (context, url, error) => const Icon(Icons.error),
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

}

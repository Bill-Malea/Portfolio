import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/providers/projectsprovider.dart';
import 'package:provider/provider.dart';

class AboutTab extends StatefulWidget {
  const AboutTab({Key? key}) : super(key: key);

  @override
  State<AboutTab> createState() => _AboutTabState();
}

class _AboutTabState extends State<AboutTab> {
 
  @override
  Widget build(BuildContext context) {
    var _links = Provider.of<Projectsprovider>(context).links;
   
    return SingleChildScrollView(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              CircleAvatar(
                radius: 100,
                backgroundImage: Image.asset('assets/avatar.jpg').image,
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'Bill Malea',
                textScaleFactor: 4,
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                'Tech Stack',
                style: Theme.of(context).textTheme.bodyText2,
                textScaleFactor: 2,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                'Flutter.React Js. Node Js. Firebase.Aws ',
                style: Theme.of(context).textTheme.caption,
                textScaleFactor: 2,
                textAlign: TextAlign.center,
              ),
             //  'Likes Traveling,Gaming.'
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
            clipBehavior: Clip.antiAlias,
            onPressed: () {
             
              Provider.of<Projectsprovider>(context,listen: false).urllauch(link:  _links.call().cv);
              
            },
            child: const Text(
              'Download CV',
              style: TextStyle(
                fontSize: 14,
              ),
            ),
          ),
 const SizedBox(
                height: 20,
              ),

           
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  TextButton.icon(
                    icon: SizedBox(
                        width: 20,
                        height: 20,
                        child: Image.asset('assets/github.png')),
                    label: const Text('Github'), onPressed: () { 
                         Provider.of<Projectsprovider>(context,listen: false).urllauch(link:  _links.call().github);
                     },
                    
                  ),
                  TextButton.icon(
                    icon: SizedBox(
                        width: 20,
                        height: 20,
                        child: Image.asset('assets/twitter.png')),
                    label: const Text('Twitter'), onPressed: () { 
                         Provider.of<Projectsprovider>(context,listen: false).urllauch(link:  _links.call().twitterlink);
                     },
                   
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  TextButton.icon(
                    icon: SizedBox(
                        width: 20,
                        height: 20,
                        child: Image.asset('assets/instagram.png')),
                    label: const Text('Instagram'), onPressed: () { 
                         Provider.of<Projectsprovider>(context,listen: false).urllauch(link:  _links.call().instalink);
                     },
                   
                  ),
                  TextButton.icon(
                    icon: SizedBox(
                        width: 20,
                        height: 20,
                        child: Image.asset('assets/facebook.png')),
                    label: const Text('Facebook'), onPressed: () { 
                         Provider.of<Projectsprovider>(context,listen: false).urllauch(link:  _links.call().facebook);
                     },
                   
                  ),
                  TextButton.icon(
                    icon: SizedBox(
                        width: 20,
                        height: 20,
                        child: Image.asset('assets/linkedin.png')),
                    label: const Text('Linkedin'), onPressed: () { 
                         Provider.of<Projectsprovider>(context,listen: false).urllauch(link:  _links.call().linkedin);
                     },
                   
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

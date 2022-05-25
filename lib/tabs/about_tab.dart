import 'package:flutter/material.dart';
import 'package:portfolio/config/constants.dart';
// ignore: avoid_web_libraries_in_flutter
import 'dart:html' as html;

import 'package:portfolio/providers/projectsprovider.dart';
import 'package:provider/provider.dart';

class AboutTab extends StatefulWidget {
  const AboutTab({Key? key}) : super(key: key);

  @override
  State<AboutTab> createState() => _AboutTabState();
}

class _AboutTabState extends State<AboutTab> {
  @override
  void didChangeDependencies() {
    Provider.of<Projectsprovider>(context).loadprojects();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
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
                'Flutter.React Js. Node Js. Firebase. Aws   \nLikes Traveling,Gaming.',
                style: Theme.of(context).textTheme.caption,
                textScaleFactor: 2,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 40,
              ),
              TextButton.icon(
                icon: const Icon(Icons.download),
                label: const Text('Download CV'),
                onPressed: () =>
                    html.window.open(Constants.PROFILE_TWITTER, 'BillMalea'),
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
                    label: const Text('Github'),
                    onPressed: () =>
                        html.window.open(Constants.PROFILE_GITHUB, 'BillMalea'),
                  ),
                  TextButton.icon(
                    icon: SizedBox(
                        width: 20,
                        height: 20,
                        child: Image.asset('assets/twitter.png')),
                    label: const Text('Twitter'),
                    onPressed: () => html.window
                        .open(Constants.PROFILE_TWITTER, 'BillMalea'),
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
                    label: const Text('Instagram'),
                    onPressed: () => html.window
                        .open(Constants.PROFILE_INSTAGRAM, 'BillMalea'),
                  ),
                  TextButton.icon(
                    icon: SizedBox(
                        width: 20,
                        height: 20,
                        child: Image.asset('assets/facebook.png')),
                    label: const Text('Facebook'),
                    onPressed: () => html.window
                        .open(Constants.PROFILE_FACEBOOK, 'BillMalea'),
                  ),
                  TextButton.icon(
                    icon: SizedBox(
                        width: 20,
                        height: 20,
                        child: Image.asset('assets/linkedin.png')),
                    label: const Text('Linkedin'),
                    onPressed: () => html.window
                        .open(Constants.PROFILE_LINKEDIN, 'BillMalea'),
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

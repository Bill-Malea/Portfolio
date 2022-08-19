import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/providers/projectsprovider.dart';
import 'package:provider/provider.dart';
import '../models/MessageModel.dart';

// ignore: must_be_immutable
class ContactTab extends StatefulWidget {
 
   const ContactTab({Key? key,}) : super(key: key);

  @override
  _ContactTabState createState() => _ContactTabState();
}

class _ContactTabState extends State<ContactTab> {
  
final _key = GlobalKey<FormState>();

 

     
  @override
  Widget build(BuildContext context) {

  var _name='';
  var   _email='';
  var   _subject ='';
  var   _message ='';

     
  void  send() {
      if (_key.currentState!.validate()) {
         _key.currentState!.save(); 
      if (kDebugMode) {
       print(_name);
     }

 Provider.of<Projectsprovider>(context,listen: false).sendmessage(message:Message(subject: _subject,
  name: _name,
   message: _message,
   email: _email));
      }
     
      }

    return Form(
      key: _key,
      child: Container(
        margin: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Get In Touch',
              style: TextStyle(fontSize: 15),
            ),
            const SizedBox(
              height: 20,
            ),
            FormInputFieldWithIcon(
              ismessage: false,
              labelText: 'Name',
               validator: (text) {
                if (text == null || text.isEmpty) {
                  return 'Text is empty';
                }
                return null;
               
              },
                onchanged: (val) {
                  setState(() {
                   _name = val!;
                    
                  });
                 
                
                }, 
            ),
            const SizedBox(
              height: 10,
            ),
             FormInputFieldWithIcon(
              ismessage: false,
              labelText: 'Email',
              validator: (text) {
                if (text == null || text.isEmpty) {
                  return 'Text is empty';
                }
                  return null;
              },
                onchanged: (val) {
                  setState(() {
                    _email = val!;
                    
                  });
                 
                }, 
            ),
            const SizedBox(
              height: 10,
            ),
             FormInputFieldWithIcon(
              ismessage: false,
              labelText: 'Subject',
              validator:(text) {
                if (text == null || text.isEmpty) {
                  return 'Text is empty';
                }
              return null;
              },
                onchanged: (val) {
                  setState(() {
                    _subject = val!;
                    
                  });
                 
                }, 
            ),
            const SizedBox(
              height: 10,
            ),
             FormInputFieldWithIcon(
              ismessage: true,
              labelText: 'Message',
              validator: (text) {
                if (text == null || text.isEmpty) {
                  return 'Text is empty';
                }
                
              },
                onchanged: (val) {
                  
                  setState(() {
                   _message = val!;
                   
                  });

               
                }, 
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
              clipBehavior: Clip.antiAlias,
              onPressed:send,
              child: const Text(
                'Send Message',
                style: TextStyle(
                  fontSize: 14,
                ),
              ),
            ),
            Row(
              mainAxisAlignment:
                  MainAxisAlignment.spaceBetween,
              children: const [
                FooterIcon(
                
                  location: 'Eldoret,Kenya',
                  type: 'Address',
                ),
                FooterIcon(
                  
                  location: 'Bill.malea@yahoo.com',
                  type: 'Email ',
                ),
                FooterIcon(
                 
                  location: '+254727800223',
                  type: 'Lets Talk',
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class FooterIcon extends StatelessWidget {
  const FooterIcon({
    Key? key,
    required this.location,
   
    required this.type,
  }) : super(key: key);

  final String location;
  final String type;


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(children: [
        const SizedBox(
          height: 20,
        ),
       
        Text(
          type,
          style: const TextStyle(fontSize: 11),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          location,
          style: const TextStyle(fontSize: 11),
        ),
      ]),
    );
  }
}

class FormInputFieldWithIcon extends StatelessWidget {
   FormInputFieldWithIcon({
    Key? key,
    required this.labelText,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    required this.ismessage, required this.validator, required this.onchanged,
  }) : super(key: key);

  final String labelText;
  final bool ismessage;
  final TextInputType keyboardType;
  final bool obscureText;
   final String? Function(String?) validator;
    final void Function(String?) onchanged;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: TextFormField(
        onFieldSubmitted:validator ,
        maxLines: ismessage ? 5 : 1,
        onChanged: onchanged,
        style: const TextStyle(
          fontSize: 12,
        ),
        decoration: InputDecoration(
          hintText: labelText,
          hintStyle: const TextStyle(
            fontSize: 12,
          ),
          floatingLabelBehavior:
              FloatingLabelBehavior.never,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(6),
            borderSide: BorderSide(
              color: Theme.of(context).primaryColor,
              width: 0.0,
            ),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: BorderSide(
              color: Theme.of(context).primaryColor,
              width: 0.0,
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: const BorderSide(
              color: Colors.red,
              width: 0.0,
            ),
          ),
          labelStyle: const TextStyle(
            fontSize: 12,
          ),
          filled: true,
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: BorderSide(
              color: Theme.of(context).primaryColor,
              width: 1.0,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: BorderSide(
              color: Theme.of(context).primaryColor,
              width: 1.0,
            ),
          ),
          errorStyle: const TextStyle(
            fontSize: 12,
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class ContactTab extends StatefulWidget {
  const ContactTab({Key? key}) : super(key: key);

  @override
  _ContactTabState createState() => _ContactTabState();
}

class _ContactTabState extends State<ContactTab> {
  @override
  Widget build(BuildContext context) {
    return Container(
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
          const FormInputFieldWithIcon(
            ismessage: false,
            labelText: 'Name',
          ),
          const SizedBox(
            height: 10,
          ),
          const FormInputFieldWithIcon(
            ismessage: false,
            labelText: 'Email',
          ),
          const SizedBox(
            height: 10,
          ),
          const FormInputFieldWithIcon(
            ismessage: false,
            labelText: 'Subject',
          ),
          const SizedBox(
            height: 10,
          ),
          const FormInputFieldWithIcon(
            ismessage: true,
            labelText: 'Message',
          ),
          const SizedBox(
            height: 10,
          ),
          ElevatedButton(
            clipBehavior: Clip.antiAlias,
            onPressed: () {},
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
                icon: Icons.map,
                location: 'Eldoret,Kenya',
                type: 'Address',
              ),
              FooterIcon(
                icon: Icons.mail,
                location: 'Bill.malea@yahoo.com',
                type: 'Email ',
              ),
              FooterIcon(
                icon: Icons.message,
                location: '+254727800223',
                type: 'Lets Talk',
              ),
            ],
          )
        ],
      ),
    );
  }
}

class FooterIcon extends StatelessWidget {
  const FooterIcon({
    Key? key,
    required this.location,
    required this.icon,
    required this.type,
  }) : super(key: key);

  final String location;
  final String type;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(children: [
        const SizedBox(
          height: 20,
        ),
        Icon(icon),
        const SizedBox(
          height: 10,
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
  const FormInputFieldWithIcon({
    Key? key,
    required this.labelText,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    required this.ismessage,
  }) : super(key: key);

  final String labelText;
  final bool ismessage;
  final TextInputType keyboardType;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: TextFormField(
        maxLines: ismessage ? 5 : 1,
        onChanged: (val) {
          // setState(() {
          //   _transactionid = val;
          // });
        },
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

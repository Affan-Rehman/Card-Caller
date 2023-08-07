import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.teal,
        body: SafeArea(
          child: Column(mainAxisAlignment: MainAxisAlignment.start,children: <Widget>[
            const SizedBox(height: 70,),
            const CircleAvatar(backgroundColor: Color.fromARGB(255, 192, 40, 29),radius: 50,backgroundImage: AssetImage("assets/profile.jpeg"),),
            Text("Affan Rehman",style: GoogleFonts.zenKurenaido(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 30),),
            Text("Software Engineer",style: GoogleFonts.lato(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.white,letterSpacing: 3)),
            const SizedBox(height: 30,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal:20),
              child: Card(
                elevation: 10
                ,child: Container(color:Colors.white,child: ListTile(leading: const Icon(Icons.phone,color:  Colors.teal),title: const Text("+923030250707",style: TextStyle(color: Colors.black),),onTap: () =>makePhoneCall("03030250707"),))),
            ),
            const SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal:20),
              child: Card(
                elevation: 10,
                child: Container(color:Colors.white,child: ListTile(leading: const Icon(Icons.email,color:  Colors.teal,),title: const Text("arehman.bese21seecs@seecs.edu.pk",style: TextStyle(color: Colors.black),),
                onTap: () =>openEmailScreen("arehman.bese21seecs@seecs.edu.pk"),)),
              ),
            ),

          ],
          ),
        ),
      ),
    );
  }


void makePhoneCall(String phoneNumber) async {
  final url = 'tel:$phoneNumber';
  if (await canLaunchUrl(Uri.parse(url))) {
    await launchUrl(Uri.parse(url));
  } else {
    throw 'Could not launch $url';
  }
}

void openEmailScreen(String recipient) async {
  final Uri uri = Uri(
    scheme: 'mailto',
    path: recipient,
  );

  if (await canLaunchUrl(uri)) {
    await launchUrl(uri);
  } else {
    throw 'Could not open email screen';
  }
}
}

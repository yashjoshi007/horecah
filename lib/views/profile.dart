import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:horecah/view_models/form1_vm.dart';
import 'package:provider/provider.dart';

import '../models/form1_model.dart';
import '../view_models/form2_vm.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var user = Provider.of<FirstPageViewModel>(context);
    var user1 = Provider.of<SecondPageViewModel>(context);
    List<String> selectedLanguages = user1.getSelectedLanguages();

    return Scaffold(
      appBar: AppBar(title: Text('Profile',style: GoogleFonts.poppins(color: Colors.white),),backgroundColor: Colors.indigo,),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Name:', style: GoogleFonts.poppins(fontWeight: FontWeight.bold)),
              SizedBox(height: 4),
              Text('${user.user.name ?? 'N/A'}',style: GoogleFonts.poppins()),
              SizedBox(height: 16),
              Text('Email:', style: GoogleFonts.poppins(fontWeight: FontWeight.bold)),
              SizedBox(height: 4),
              Text('${user.user.email ?? 'N/A'}',style: GoogleFonts.poppins()),
              SizedBox(height: 16),
              Text('Phone:', style: GoogleFonts.poppins(fontWeight: FontWeight.bold)),
              SizedBox(height: 4),
              Text('${user.user.phone ?? 'N/A'}',style: GoogleFonts.poppins()),
              SizedBox(height: 16),
              Text('City:', style: GoogleFonts.poppins(fontWeight: FontWeight.bold)),
              SizedBox(height: 4),
              Text('${user.city ?? 'N/A'}',style: GoogleFonts.poppins()),
              SizedBox(height: 16),
              Text('Info:', style: GoogleFonts.poppins(fontWeight: FontWeight.bold)),
              SizedBox(height: 4),
              Text('${user1.info ?? 'N/A'}',style: GoogleFonts.poppins()),
              SizedBox(height: 16),
              Text('Profile:', style:GoogleFonts.poppins(fontWeight: FontWeight.bold)),
              SizedBox(height: 4),
              Text('${user1.profileLink ?? 'N/A'}',style: GoogleFonts.poppins()),
              SizedBox(height: 16),
              Text('Selected Languages:', style: GoogleFonts.poppins(fontWeight: FontWeight.bold)),
              SizedBox(height: 4),
              Text(selectedLanguages.join(', '),style: GoogleFonts.poppins()),
            ],
          ),
        ),
      ),
    );
  }
}

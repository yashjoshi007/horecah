import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../components/textfield.dart';
import '../view_models/form1_vm.dart';

class Form1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<FirstPageViewModel>(context);
    return Scaffold(
      appBar: AppBar(title: Text('Form 1', style: GoogleFonts.poppins(color: Colors.white),),backgroundColor: Colors.indigo,),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Name',style: GoogleFonts.poppins()),
            MyTextField(
              keyboardType: TextInputType.name,
              hintText: 'Name',
              obscureText: false,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your name';
                }
                return null;
              },
              onSaved: viewModel.setName,
              onChanged: viewModel.setName, // Add onChanged callback
            ),
            SizedBox(height: 20,),
            Text('Email',style: GoogleFonts.poppins()),
            MyTextField(
              keyboardType: TextInputType.emailAddress,
              hintText: 'Email',
              obscureText: false,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your email';
                }
                return null;
              },
              onSaved: viewModel.setEmail,
              onChanged: viewModel.setEmail, // Add onChanged callback
            ),
            SizedBox(height: 20,),
            Text('Mobile Number',style: GoogleFonts.poppins()),
            MyTextField(
              keyboardType: TextInputType.phone,
              hintText: 'Phone',
              obscureText: false,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your phone number';
                }
                return null;
              },
              onSaved: viewModel.setPhone,
              onChanged: viewModel.setPhone, // Add onChanged callback
            ),
            SizedBox(height: 20,),
            DropdownButtonFormField<String>(
              value: viewModel.city,
              onChanged: viewModel.setCity,
              items: viewModel.cities.map((city) {
                return DropdownMenuItem<String>(
                  value: city,
                  child: Text(city,style: GoogleFonts.poppins()),
                );
              }).toList(),
              decoration: InputDecoration(labelText: 'City',labelStyle: GoogleFonts.poppins()),
            ),
            Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  margin: EdgeInsets.only(top: 20),
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: viewModel.isFormValid()
                        ? () {
                      Navigator.pushNamed(context, '/second');
                    }
                        : null,
                    child: Text('Next', style: GoogleFonts.poppins(color: viewModel.isFormValid()? Colors.white : Colors.grey),),
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5), // rectangular border
                      ), backgroundColor: Colors.indigo,
                    ),
                  ),
                ),),)

          ],
        ),
      ),
    );
  }
}

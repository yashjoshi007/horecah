import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:horecah/views/profile.dart';
import 'package:provider/provider.dart';

import '../view_models/form2_vm.dart';

class Form2 extends StatefulWidget {
  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<Form2> {
  late TextEditingController _aboutController;
  late TextEditingController _profileLinkController;

  @override
  void initState() {
    super.initState();
    _aboutController = TextEditingController();
    _profileLinkController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<SecondPageViewModel>(context);

    return Scaffold(
      appBar: AppBar(title: Text('Form 2',style: GoogleFonts.poppins(color: Colors.white),),backgroundColor: Colors.indigo,),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('About',style: GoogleFonts.poppins(color: Colors.grey)),
              // About Section
              Container(
                padding: EdgeInsets.all(12),
                height: MediaQuery.of(context).size.height/3,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: TextField(
                  controller: _aboutController,
                  onChanged: (value) => viewModel.info = value,
                  maxLines: null,
                  keyboardType: TextInputType.multiline,
                  decoration: InputDecoration(
                    hintText: 'About',
                    hintStyle: GoogleFonts.poppins(
                      color: Colors.grey, // Customize hint text color
                      fontStyle: FontStyle.normal,// Customize hint text size
                    ),
                    border: InputBorder.none,
                  ),
                ),
              ),



              SizedBox(height: 16), // Add some space
              // Buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    flex: 6, // 60% width
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          viewModel.info = 'Default AI Text';
                          _aboutController.text = viewModel.info;
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5), // rectangular border
                        ),
                        backgroundColor: Colors.indigo,
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.lightbulb,
                            color: Colors.yellow, // Change icon color here
                          ),
                          SizedBox(width: 8), // Add spacing between icon and text
                          Text(
                            'Write with AI',
                            style: GoogleFonts.poppins(color: Colors.white),
                          ),
                        ],
                      ),
                    ),

                  ),
                  SizedBox(width: 16), // 10% space
                  Expanded(
                    flex: 3, // 30% width
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          _aboutController.clear();
                        });
                      },
                      child: Text('Type',style: GoogleFonts.poppins(color:Colors.black)),
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5), // rectangular border
                        ),
                        backgroundColor: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(height: 16), // Add some space
              // Profile Link TextField
              Text('Profile Link',style: GoogleFonts.poppins(color: Colors.grey)),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey, // Set border color here
                    width: 1.0, // Set border width here
                  ),
                  borderRadius: BorderRadius.circular(8.0), // Set border radius here
                ),
                child: TextField(
                  controller: _profileLinkController,
                  onChanged: (value) => viewModel.profileLink = value,
                  decoration: InputDecoration(
                    labelText: 'Type',
                    border: InputBorder.none, // Remove TextField's default border
                    contentPadding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0), // Adjust padding as needed
                  ),
                ),
              ),

              SizedBox(height: 16), // Add some space
              // Dropdown for Languages
              // Dropdown for Languages
              DropdownButtonFormField<String>(
                value: viewModel.selectedLanguages.length <= 6
                    ? viewModel.selectedLanguages.isNotEmpty
                    ? viewModel.selectedLanguages[0]
                    : null
                    : null, // Set value to null if more than 6 languages are selected
                onChanged: (String? value) {
                  if (value != null) {
                    if (viewModel.selectedLanguages.length <= 6) {
                      viewModel.toggleLanguage(value); // Toggle the selected language
                    }
                  }
                },
                items: viewModel.availableLanguages.map((language) {
                  return DropdownMenuItem<String>(
                    value: language,
                    child: Text(language, style: GoogleFonts.poppins()),
                  );
                }).toList(),
                decoration: InputDecoration(
                  labelText: 'Languages (max 6)',
                  errorText: viewModel.selectedLanguages.length == 6
                      ? 'Max 6 languages Selected'
                      : null,
                  errorStyle: TextStyle(color: Colors.red), // Set error text color to red
                ),
              ),

              SizedBox(height: 8), // Add some space
              // Checkbox list for languages
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: viewModel.availableLanguages.map((language) {
                  return CheckboxListTile(
                    title: Text(language,style: GoogleFonts.poppins()),
                    value: viewModel.isLanguageSelected(language),
                    onChanged: (bool? value) {
                      viewModel.toggleLanguage(language);
                    },
                  );
                }).toList(),
              ),
              SizedBox(height: 16), // Add some space
              // Submit and Back Buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    flex: 6,
                    child: ElevatedButton(
                      onPressed: () {
                        if (viewModel.isInfoValid() &&
                            viewModel.isProfileLinkValid()) {
                          // Show confirmation dialog
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                content: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 16.0),
                                      child: Center(
                                        child: Text('Are you sure?', style: GoogleFonts.poppins(), textAlign: TextAlign.center),
                                      ),
                                    ),
                                    SizedBox(height: 16),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.stretch,
                                      children: [
                                         // Add spacing between buttons
                                        ElevatedButton(
                                          onPressed: () {
                                            // Handle submission
                                            Navigator.pop(context);
                                            Navigator.pushNamed(context, '/profile');
                                          },
                                          child: Text('Confirm', style: GoogleFonts.poppins(color: Colors.white)),
                                          style: ElevatedButton.styleFrom(
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(5), // rectangular border
                                            ),
                                            backgroundColor: Colors.indigo,
                                          ),
                                        ),
                                        SizedBox(height: 8),
                                        ElevatedButton(
                                          onPressed: () {
                                            Navigator.of(context).pop(); // Close the dialog
                                          },
                                          child: Text('Go back', style: GoogleFonts.poppins(color: Colors.white)),
                                          style: ElevatedButton.styleFrom(
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(5), // rectangular border
                                            ),
                                            backgroundColor: Colors.indigo,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              );
                            },
                          );
                        }
                        else
                          {
                            Fluttertoast.showToast(
                              msg: 'Fill all the fields.',
                              toastLength: Toast.LENGTH_SHORT, // Duration for which the toast should appear
                              gravity: ToastGravity.CENTER, // Position of the toast
                              backgroundColor: Colors.grey[700], // Background color of the toast
                              textColor: Colors.white, // Text color of the toast
                            );
                          }
                      },
                      child: Text('Submit',style: GoogleFonts.poppins(color:Colors.white)),
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5), // rectangular border
                        ),
                        backgroundColor: Colors.indigo,
                      ),
                    ),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    flex: 3,
                    child: TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text('Back',style: GoogleFonts.poppins(color:Colors.black),),
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5), // rectangular border
                        ),
                        backgroundColor: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _aboutController.dispose();
    _profileLinkController.dispose();
    super.dispose();
  }
}

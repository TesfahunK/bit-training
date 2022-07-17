// ignore_for_file: deprecated_member_use

import 'package:bit_initial/ui/widgets/text-field-widget.dart';
import 'package:bit_initial/utils/data/date-helper.dart';
import 'package:bit_initial/utils/ui/helpers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math' show pi;

class PersonalDataScreen extends StatefulWidget {
  PersonalDataScreen({Key? key}) : super(key: key);

  @override
  State<PersonalDataScreen> createState() => _PersonalDataScreenState();
}

class _PersonalDataScreenState extends State<PersonalDataScreen> {
  late TextEditingController _name;
  TextEditingController _dob = new TextEditingController();
  TextEditingController _job = new TextEditingController();
  TextEditingController _incom = new TextEditingController();
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();

  @override
  void initState() {
    _name = new TextEditingController();
    super.initState();
  }

  String? _gender = "female";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Center(
              child: Container(
                padding: EdgeInsets.all(10),
                height: 150,
                width: 150,
                color: Colors.white,
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: Container(
                        clipBehavior: Clip.antiAlias,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage(
                                    "https://img.freepik.com/free-photo/happy-man-with-long-thick-ginger-beard-has-friendly-smile_273609-16616.jpg?w=1800")),
                            color: Colors.black.withOpacity(0.05),
                            borderRadius: BorderRadius.circular(10)),
                        height: 100,
                        width: 100,
                      ),
                    ),
                    Positioned(
                      bottom: 5,
                      right: 10,
                      child: InkWell(
                        onTap: () {
                          Scaffold.of(context).showSnackBar(SnackBar(
                              duration: Duration(milliseconds: 500),
                              margin: EdgeInsets.all(10),
                              elevation: 0,
                              behavior: SnackBarBehavior.floating,
                              backgroundColor: Colors.pinkAccent,
                              content: Text("Camera Clicked")));
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                    color: Color(0xff9e9e9e).withOpacity(0.7),
                                    blurRadius: 10,
                                    offset: Offset(2, 2))
                              ],
                              border: Border.all(width: 3, color: Colors.white),
                              color: Color(0xffd1c4e9),
                              borderRadius: BorderRadius.circular(10)),
                          height: 35,
                          width: 35,
                          child: Center(
                            child: Icon(
                              Icons.camera_alt,
                              size: 15,
                              color: Colors.deepPurple,
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          SliverList(
              delegate: SliverChildListDelegate([
            Form(
                key: _formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CustomTextField(
                      label: "Your Name",
                      controller: _name,
                      validator: (str) {
                        if (str!.isEmpty) {
                          return "required";
                        }

                        return null;
                      },
                    ),
                    CustomTextField(
                      controller: _dob,
                      label: "Date Of Birth",
                      suffix: Transform.rotate(
                        angle: -(pi * 0.5),
                        child: Icon(Icons.chevron_left),
                      ),
                      validator: (str) {
                        if (str!.isEmpty) {
                          return "required";
                        }

                        return null;
                      },
                      onTap: () {
                        datePicker(context,
                            initialDate: DateTime(DateTime.now().year - 16),
                            lastDate: DateTime(DateTime.now().year - 16),
                            onpicked: (s) {
                          if (s != null) {
                            setState(() {
                              _dob = new TextEditingController(
                                  text: beautifiedDate(s));
                            });
                          }
                        });
                      },
                    ),
                    CustomTextField(
                      label: "Your Job",
                      controller: _job,
                      validator: (str) {
                        if (str!.isEmpty) {
                          return "required";
                        }

                        return null;
                      },
                    ),
                    CustomTextField(
                      controller: _incom,
                      label: "Monthly Income",
                      suffix: Transform.rotate(
                        angle: -(pi * 0.5),
                        child: Icon(Icons.chevron_left),
                      ),
                    ),
                  ],
                )),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Gender",
                    style: TextStyle(fontWeight: FontWeight.w300),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Expanded(
                          child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 1),
                        height: 50,
                        decoration: BoxDecoration(
                            color: Color(0xffc5cae9).withOpacity(0.3),
                            borderRadius: BorderRadius.circular(8)),
                        child: Wrap(
                          crossAxisAlignment: WrapCrossAlignment.center,
                          spacing: 10,
                          children: [
                            Radio(
                              activeColor: Colors.white,
                              fillColor:
                                  MaterialStateProperty.all(Colors.deepPurple),
                              value: "female",
                              groupValue: _gender,
                              onChanged: (String? value) {
                                setState(() {
                                  _gender = value;
                                });
                              },
                            ),
                            Text(
                              "Female",
                              style: TextStyle(fontWeight: FontWeight.w300),
                            ),
                          ],
                        ),
                      )),
                      SizedBox(
                        width: 20,
                      ),
                      Expanded(
                          child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 1),
                        height: 50,
                        decoration: BoxDecoration(
                            color: Color(0xffc5cae9).withOpacity(0.3),
                            borderRadius: BorderRadius.circular(8)),
                        child: Wrap(
                          crossAxisAlignment: WrapCrossAlignment.center,
                          spacing: 10,
                          children: [
                            Radio(
                              activeColor: Colors.white,
                              fillColor:
                                  MaterialStateProperty.all(Colors.deepPurple),
                              value: "male",
                              groupValue: _gender,
                              onChanged: (String? value) {
                                setState(() {
                                  _gender = value;
                                });
                              },
                            ),
                            Text(
                              "Male",
                              style: TextStyle(fontWeight: FontWeight.w300),
                            ),
                          ],
                        ),
                      )),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              child: CupertinoButton(
                  color: Colors.deepPurple,
                  child: Text("submit"),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // TODO : do your tasks

                      Scaffold.of(context).showSnackBar(SnackBar(
                          duration: Duration(milliseconds: 200),
                          margin: EdgeInsets.all(10),
                          elevation: 0,
                          behavior: SnackBarBehavior.floating,
                          backgroundColor: Colors.green,
                          content: Text("Form is Valid")));
                    }
                  }),
            )
          ])),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 150,
            ),
          )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_project/shopTime_weekDays_class.dart';


var open_time_controller=TextEditingController();
var close_time_controller=TextEditingController();



List<TextEditingController> other_open_time_controllers = [];
List<TextEditingController> other_close_time_controllers = [];
var index = 0;
var other_open_time_controller=TextEditingController();
var other_close_time_controller=TextEditingController();
var open_select_weekdays_controller1=TextEditingController();
// var tt="iii";

class SimpleCustomAlert extends StatefulWidget{
  const SimpleCustomAlert({super.key});


  @override
  State<SimpleCustomAlert> createState() => _SimpleCustomAlertState();
}

class _SimpleCustomAlertState extends State<SimpleCustomAlert> {
  // final title;
  int _expandedPanel = -1;

  bool _isExpanded = false;

  void _toggleExpanded() {
    setState(() {
      _isExpanded = !_isExpanded;
    });
  }

  List<String> selectedWeekdays = [];
  List<String> selectedOffWeekdays = [];
  List<String> otherSelectedWeekdays = [];


  final _formKey = GlobalKey<FormState>();
  bool hasErrors = false;

  List<Widget> uiElements = [];

  void addNewUIElement() {
    // index = index + 1;
    // other_open_time_controllers.add(other_open_time_controller);
    // other_close_time_controllers.add(other_open_time_controller);
    setState(() {
      // Add a new UI element to the list
      if(uiElements.length<1) {
        //
        //   var len = uiElements.length+1;
        uiElements.add(Column(
          children: [
            Container(
                child: Text('Shop Timing', style: TextStyle(fontSize: 20),)),

            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Column(
                    children: [
                      Text("Open Timing"),
                      Container(

                        height: 40,
                        width: 100,

                        decoration: BoxDecoration(
                          color: Colors.white,

                        ),
                        child: TextFormField(

                          readOnly: true,
                          onTap: () {
                            showDialog(context: context,
                                barrierDismissible: false,
                                builder: (BuildContext context) {
                                  return otherOpenTimingPage();
                                }
                            );
                          },
                          textAlign: TextAlign.center,

                          controller: other_open_time_controller,

                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 10.0, horizontal: 10.0),
                            // labelText: 'Open Time',
                            hintText: '  Click',
                            // prefixIcon: Icon(Icons.access_time_sharp),
                            border: OutlineInputBorder(
                              // borderRadius: BorderRadius.circular(10.0),
                            ),

                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(width: 40,),

                Padding(
                  padding: const EdgeInsets.only(right: 20.0),
                  child: Column(
                    children: [
                      Text("Close Timing"),
                      Container(
                        // padding: EdgeInsets.only(right: 20),
                        height: 40,
                        width: 100,
                        decoration: BoxDecoration(
                          color: Colors.white,

                        ),
                        child: TextFormField(
                          readOnly: true,
                          textAlign: TextAlign.center,
                          onTap: () {
                            showDialog(context: context,
                                barrierDismissible: false,
                                builder: (BuildContext context) {
                                  return otherCloseTimingPage();
                                }
                            );
                          },
                          controller: other_close_time_controller,

                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 10.0, horizontal: 10.0),
                            // labelText: 'Close Time',
                            hintText: '  Click',
                            // prefixIcon: Icon(Icons.access_time_sharp),
                            border: OutlineInputBorder(
                              // borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            SizedBox(height: 10,),

            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Text("Select Weekdays",style: TextStyle(fontSize: 20),),
                  SizedBox(height: 16.0),
                  otherDaysSelectChipField(
                    onSelectionChanged: (otherSelectedWeekdays) {
                      setState(() {
                        this.otherSelectedWeekdays = otherSelectedWeekdays;
                      });
                    },
                  ),
                  SizedBox(height: 10.0),
                  Text('Selected Weekdays: ${otherSelectedWeekdays.join(', ')}'),

                ],
              ),
            ),
          ],
        ),);
      }
    });

  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4)
      ),
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          autovalidateMode:AutovalidateMode.always,
          child: Column(
            children: [

              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Text("Select for Shop Off days",style: TextStyle(fontSize: 20),),
                    SizedBox(height: 16.0),
                    shopOffSelectChipField(
                      onSelectionChanged: (selectedOffWeekdays) {
                        setState(() {
                          this.selectedOffWeekdays = selectedOffWeekdays;
                        });
                      },
                    ),
                    SizedBox(height: 10.0),
                    Text('Selected Off days: ${selectedOffWeekdays.join(', ')}'),

                  ],
                ),
              ),

              Column(
                // crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(child: Text('Shop Timing',style: TextStyle(fontSize: 20),)),
                  SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: Column(
                          children: [
                            Text("Open Timing"),
                            Container(

                              height: 40,
                              width: 100,

                              decoration: BoxDecoration(
                                color: Colors.white,

                              ),
                              child: TextFormField(

                                readOnly: true,
                                onTap: (){
                                  showDialog(context: context,
                                      barrierDismissible: false,
                                      builder: (BuildContext context){
                                        return openTimingPage();
                                      }
                                  );
                                },
                                textAlign: TextAlign.center,
                                controller: open_time_controller,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please select Time';
                                  }
                                  return null; // Return null if the input is valid
                                },
                                // onSaved: (value) {
                                //   _inputValue = value!;
                                // },
                                decoration: InputDecoration(
                                  contentPadding:EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                                  // labelText: 'Open Time',
                                  hintText: '  Click',
                                  // prefixIcon: Icon(Icons.access_time_sharp),
                                  border: OutlineInputBorder(
                                    // borderRadius: BorderRadius.circular(10.0),
                                  ),

                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      SizedBox(width: 40,),

                      Padding(
                        padding: const EdgeInsets.only(right: 20.0),
                        child: Column(
                          children: [
                            Text("Close Timing"),
                            Container(
                              // padding: EdgeInsets.only(right: 20),
                              height: 40,
                              width: 100,
                              decoration: BoxDecoration(
                                color: Colors.white,

                              ),
                              child: TextFormField(
                                readOnly: true,
                                textAlign: TextAlign.center,
                                onTap: (){
                                  showDialog(context: context,
                                      barrierDismissible: false,
                                      builder: (BuildContext context){
                                        return closeTimingPage();
                                      }
                                  );
                                },
                                controller: close_time_controller,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please select Time';
                                  }
                                  return null; // Return null if the input is valid
                                },
                                // onSaved: (value) {
                                //   _inputValue = value!;
                                // },

                                decoration: InputDecoration(
                                  contentPadding:EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                                  // labelText: 'Close Time',
                                  hintText: '  Click',
                                  // prefixIcon: Icon(Icons.access_time_sharp),
                                  border: OutlineInputBorder(
                                    // borderRadius: BorderRadius.circular(10.0),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 10,),


                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        Text("Select Weekdays",style: TextStyle(fontSize: 20),),
                        SizedBox(height: 16.0),
                        weekDaysChipField(
                          onSelectionChanged: (selectedWeekdays) {
                            setState(() {
                              this.selectedWeekdays = selectedWeekdays;
                            });
                          },
                        ),
                        SizedBox(height: 10.0),
                        Text('Selected Weekdays: ${selectedWeekdays.join(', ')}'),

                      ],
                    ),
                  ),

                  Column(children: uiElements),



                  SizedBox(height: 20),


                  Container(
                    height: 40,
                    width: 250,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      border: Border.all(color: Colors.black, width: 1.0),
                    ),
                    child: ElevatedButton(
                      onPressed: addNewUIElement,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [

                          Text('Add New UI Element ',style: TextStyle(fontSize: 18),),
                          // SizedBox(width: 2,),
                          Icon(Icons.add_circle_outline_outlined)
                        ],
                      ),
                    ),
                  ),

                ],
              ),



              SizedBox(height: 20,),
              Container(
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  border: Border.all(color: Colors.black, width: 1.0),
                ),
                child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        hasErrors = !_formKey.currentState!.validate();
                      });

                      // Only pop the dialog if there are no errors
                      if (!hasErrors) {
                        Navigator.pop(context);
                      }
                    },
                    child: Text('Save',style: TextStyle(fontSize: 20))
                ),
              ),

              SizedBox(height: 10,),

            ],
          ),
        ),
      ),
    );

  }
}



//
// import 'package:flutter/material.dart';
// import 'package:flutter_project/shopTime_weekDays_class.dart';
//
// var open_time_controller = TextEditingController();
// var close_time_controller = TextEditingController();
//
// List<TextEditingController> other_open_time_controllers = [];
// List<TextEditingController> other_close_time_controllers = [];
// // var index = 0;
// // var other_open_time_controller = TextEditingController();
// // var other_close_time_controller = TextEditingController();
// // var open_select_weekdays_controller1 = TextEditingController();
//
// class SimpleCustomAlert extends StatefulWidget {
//   const SimpleCustomAlert({super.key});
//
//   @override
//   State<SimpleCustomAlert> createState() => _SimpleCustomAlertState();
// }
//
// class _SimpleCustomAlertState extends State<SimpleCustomAlert> {
//   int _expandedPanel = -1;
//   bool _isExpanded = false;
//
//   void _toggleExpanded() {
//     setState(() {
//       _isExpanded = !_isExpanded;
//     });
//   }
//
//   List<String> selectedWeekdays = [];
//   List<String> selectedOffWeekdays = [];
//   List<String> otherSelectedWeekdays = [];
//
//   final _formKey = GlobalKey<FormState>();
//   bool hasErrors = false;
//
//   List<Widget> uiElements = [];
//
//   void addNewUIElement() {
//     var newOpenTimeController = TextEditingController();
//     var newCloseTimeController = TextEditingController();
//     other_open_time_controllers.add(newOpenTimeController);
//     other_close_time_controllers.add(newCloseTimeController);
//
//     setState(() {
//       uiElements.add(
//         Column(
//           children: [
//             Container(
//               child: Text(
//                 'Shop Timing',
//                 style: TextStyle(fontSize: 20),
//               ),
//             ),
//             SizedBox(
//               height: 10,
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.only(left: 20.0),
//                   child: Column(
//                     children: [
//                       Text("Open Timing"),
//                       Container(
//                         height: 40,
//                         width: 100,
//                         decoration: BoxDecoration(
//                           color: Colors.white,
//                         ),
//                         child: TextFormField(
//                           readOnly: true,
//                           onTap: () {
//                             showDialog(
//                               context: context,
//                               barrierDismissible: false,
//                               builder: (BuildContext context) {
//                                 return OtherOpenTimingPage(
//                                     openTimeController: newOpenTimeController);
//                               },
//                             );
//                           },
//                           textAlign: TextAlign.center,
//                           controller: newOpenTimeController,
//                           decoration: InputDecoration(
//                             contentPadding: EdgeInsets.symmetric(
//                               vertical: 10.0,
//                               horizontal: 10.0,
//                             ),
//                             hintText: '  Click',
//                             border: OutlineInputBorder(),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 SizedBox(
//                   width: 40,
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.only(right: 20.0),
//                   child: Column(
//                     children: [
//                       Text("Close Timing"),
//                       Container(
//                         height: 40,
//                         width: 100,
//                         decoration: BoxDecoration(
//                           color: Colors.white,
//                         ),
//                         child: TextFormField(
//                           readOnly: true,
//                           textAlign: TextAlign.center,
//                           onTap: () {
//                             showDialog(
//                               context: context,
//                               barrierDismissible: false,
//                               builder: (BuildContext context) {
//                                 return OtherCloseTimingPage(
//                                     closeTimeController:
//                                     newCloseTimeController);
//                               },
//                             );
//                           },
//                           controller: newCloseTimeController,
//                           decoration: InputDecoration(
//                             contentPadding: EdgeInsets.symmetric(
//                               vertical: 10.0,
//                               horizontal: 10.0,
//                             ),
//                             hintText: '  Click',
//                             border: OutlineInputBorder(),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//             SizedBox(
//               height: 10,
//             ),
//             Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: Column(
//                 children: [
//                   Text(
//                     "Select Weekdays",
//                     style: TextStyle(fontSize: 20),
//                   ),
//                   SizedBox(height: 16.0),
//                   otherDaysSelectChipField(
//                     onSelectionChanged: (otherSelectedWeekdays) {
//                       setState(() {
//                         this.otherSelectedWeekdays = otherSelectedWeekdays;
//                       });
//                     },
//                   ),
//                   SizedBox(height: 10.0),
//                   Text(
//                       'Selected Weekdays: ${otherSelectedWeekdays.join(', ')}'),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       );
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Dialog(
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
//       child: SingleChildScrollView(
//         child: Form(
//           key: _formKey,
//           autovalidateMode: AutovalidateMode.always,
//           child: Column(
//             children: [
//               Padding(
//                 padding: const EdgeInsets.all(16.0),
//                 child: Column(
//                   children: [
//                     Text(
//                       "Select for Shop Off days",
//                       style: TextStyle(fontSize: 20),
//                     ),
//                     SizedBox(height: 16.0),
//                     shopOffSelectChipField(
//                       onSelectionChanged: (selectedOffWeekdays) {
//                         setState(() {
//                           this.selectedOffWeekdays = selectedOffWeekdays;
//                         });
//                       },
//                     ),
//                     SizedBox(height: 10.0),
//                     Text(
//                       'Selected Off days: ${selectedOffWeekdays.join(', ')}',
//                     ),
//                   ],
//                 ),
//               ),
//               Column(
//                 children: [
//                   Container(
//                     child: Text(
//                       'Shop Timing',
//                       style: TextStyle(fontSize: 20),
//                     ),
//                   ),
//                   SizedBox(
//                     height: 10,
//                   ),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Padding(
//                         padding: const EdgeInsets.only(left: 20.0),
//                         child: Column(
//                           children: [
//                             Text("Open Timing"),
//                             Container(
//                               height: 40,
//                               width: 100,
//                               decoration: BoxDecoration(
//                                 color: Colors.white,
//                               ),
//                               child: TextFormField(
//                                 readOnly: true,
//                                 onTap: () {
//                                   showDialog(
//                                     context: context,
//                                     barrierDismissible: false,
//                                     builder: (BuildContext context) {
//                                       return openTimingPage();
//                                     },
//                                   );
//                                 },
//                                 textAlign: TextAlign.center,
//                                 controller: open_time_controller,
//                                 validator: (value) {
//                                   if (value == null || value.isEmpty) {
//                                     return 'Please select Time';
//                                   }
//                                   return null;
//                                 },
//                                 decoration: InputDecoration(
//                                   contentPadding: EdgeInsets.symmetric(
//                                     vertical: 10.0,
//                                     horizontal: 10.0,
//                                   ),
//                                   hintText: '  Click',
//                                   border: OutlineInputBorder(),
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                       SizedBox(
//                         width: 40,
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.only(right: 20.0),
//                         child: Column(
//                           children: [
//                             Text("Close Timing"),
//                             Container(
//                               height: 40,
//                               width: 100,
//                               decoration: BoxDecoration(
//                                 color: Colors.white,
//                               ),
//                               child: TextFormField(
//                                 readOnly: true,
//                                 textAlign: TextAlign.center,
//                                 onTap: () {
//                                   showDialog(
//                                     context: context,
//                                     barrierDismissible: false,
//                                     builder: (BuildContext context) {
//                                       return closeTimingPage();
//                                     },
//                                   );
//                                 },
//                                 controller: close_time_controller,
//                                 validator: (value) {
//                                   if (value == null || value.isEmpty) {
//                                     return 'Please select Time';
//                                   }
//                                   return null;
//                                 },
//                                 decoration: InputDecoration(
//                                   contentPadding: EdgeInsets.symmetric(
//                                     vertical: 10.0,
//                                     horizontal: 10.0,
//                                   ),
//                                   hintText: '  Click',
//                                   border: OutlineInputBorder(),
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//                   SizedBox(
//                     height: 10,
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.all(16.0),
//                     child: Column(
//                       children: [
//                         Text(
//                           "Select Weekdays",
//                           style: TextStyle(fontSize: 20),
//                         ),
//                         SizedBox(height: 16.0),
//                         weekDaysChipField(
//                           onSelectionChanged: (selectedWeekdays) {
//                             setState(() {
//                               this.selectedWeekdays = selectedWeekdays;
//                             });
//                           },
//                         ),
//                         SizedBox(height: 10.0),
//                         Text(
//                             'Selected Weekdays: ${selectedWeekdays.join(', ')}'),
//                       ],
//                     ),
//                   ),
//                   Column(children: uiElements),
//                   SizedBox(height: 20),
//                   Container(
//                     height: 40,
//                     width: 250,
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(20.0),
//                       border: Border.all(color: Colors.black, width: 1.0),
//                     ),
//                     child: ElevatedButton(
//                       onPressed: addNewUIElement,
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Text(
//                             'Add New UI Element ',
//                             style: TextStyle(fontSize: 18),
//                           ),
//                           Icon(Icons.add_circle_outline_outlined)
//                         ],
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//               SizedBox(
//                 height: 20,
//               ),
//               Container(
//                 height: 40,
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(20.0),
//                   border: Border.all(color: Colors.black, width: 1.0),
//                 ),
//                 child: ElevatedButton(
//                   onPressed: () {
//                     setState(() {
//                       hasErrors = !_formKey.currentState!.validate();
//                     });
//
//                     if (!hasErrors) {
//                       Navigator.pop(context);
//                     }
//                   },
//                   child: Text('Save', style: TextStyle(fontSize: 20)),
//                 ),
//               ),
//               SizedBox(
//                 height: 10,
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
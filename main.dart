import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  // ********** calculation ************* //

  TextEditingController _controller1 = TextEditingController();
  TextEditingController _controller2 = TextEditingController();
 double height=0.00;
 double weight=0.0;
 double bmi=0.00;
 bool _showbmi=false;
  void calculate() {
    height = double.parse(_controller1.text);
    weight = double.parse(_controller2.text);
    double heightinmetres = height / 100;
    double total = weight / (heightinmetres * heightinmetres);
    setState(() {
      bmi = total;
      _showbmi = true;
    });
  }
    String getBMICategory(double bmi) {
      if (bmi < 18.5) {
        return 'Underweight';
      } else if (bmi >= 18.5 && bmi < 25) {
        return 'Normal weight';
      } else if (bmi >= 25 && bmi < 30) {
        return 'Overweight';
      } else if (bmi >= 30 && bmi < 35) {
        return 'Obesity (Class 1)';
      } else if (bmi >= 35 && bmi < 40) {
        return 'Obesity (Class 2)';
      } else {
        return 'Obesity (Class 3)';
      }
    }




  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(statusBarColor: Colors.transparent));

    return MaterialApp(
       // theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          leading: Icon(
            Icons.notes,
            size: 30,
          ),
          toolbarHeight: 40 ,
          backgroundColor: Colors.purple[400],
          elevation: 0,
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: Icon(
                Icons.info_outline,color: Colors.white,size: 30,
              ),
            )
          ],

        ),

        body: SingleChildScrollView(
          child: Container(
            color: Colors.white60,
            child: Column(
              children: [
                Container(
                  height: 190,
                  decoration: BoxDecoration(
                      color: Colors.purple ,
                      // gradient: LinearGradient(
                      //   colors:[Color(5)]
                      // ),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(100),
                        bottomRight: Radius.circular(100),
                      )

                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 25.0),
                    child: Align(
                      alignment: Alignment.center,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'BMI',
                            style: GoogleFonts.abhayaLibre(
                              fontSize: 35,color: Colors.white,fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'CALCULATOR',
                            style: GoogleFonts.abyssinicaSil(
                              fontSize: 35,color: Colors.white,fontWeight: FontWeight.bold,
                            ),
                          )

                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20,),
                Padding(
                  padding: const EdgeInsets.fromLTRB(30,10,40,0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      inputForm(
                        title: "Height(in cm):",
                        controller: _controller1,
                        hintText: 'Eg 160',
                      ),
                      inputForm(
                        title: "Weight(in kg):",
                        controller: _controller2,
                        hintText: 'Eg 60',

                      ),
                      SizedBox(height: 20,),
                  GestureDetector(
                    onTap: (){
                      calculate();
                      //debugPrint('testing action'),
                    },
                      child:Container(
                        height: 60,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.purple[300],
                          borderRadius: BorderRadius.circular(25),border: Border.all(),
                        ),
                        child: Center(
                          child: Text(
                            'CALCULATE',
                            style: GoogleFonts.adamina(
                                fontSize: 20,
                                color: Colors.black,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                        ),

                      ),

                  ),
                      SizedBox(height: 20,),
                      bmi!=null && _showbmi
                          ?Container(
                        height: 60,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(25),
                        ),


                        child: Center(
                          child: Column(
                            children: [
                              Text(
                                'BMI : ${bmi.toStringAsFixed(2)}',
                                style: GoogleFonts.aldrich(
                                fontSize: 16,
                              ) ,

                              ),
                              Text(
                                'Category: ${getBMICategory(bmi)}',
                                style: GoogleFonts.alata(
                                  fontSize: 18,color: Colors.red,
                                ),
                              ),
                            ],
                          ),



                        ),

                      )


                    :SizedBox(height: 80,),
                      SizedBox(height: 30,),
                      Container(
                        alignment: Alignment.center,
                        height: 250,
                        width: 550,// Adjust the height according to your design
                        decoration: BoxDecoration(
                           borderRadius: BorderRadius.circular(20),
                          color: Colors.yellow[300],gradient: LinearGradient(
                          colors: [Colors.yellow,Colors.white],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          stops: [0.0, 1.0], // Gradient stops
                          tileMode: TileMode.clamp,
                        ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Underweight: BMI less than 18.5',
                              style: GoogleFonts.akayaKanadaka(
                                fontSize: 18,
                              ),
                            ),
                            Text(
                              'Normal weight: BMI between 18.5 and 24.9',
                              style: GoogleFonts.akayaKanadaka(
                                fontSize: 18,
                              ),
                            ),
                            Text(
                              'Overweight: BMI between 25 and 29.9',
                              style: GoogleFonts.akayaKanadaka(
                                fontSize: 18,
                              ),
                            ),
                            Text(
                              'Obesity (Class 1): BMI between 30 and 34.9',
                              style: GoogleFonts.akayaKanadaka(
                                fontSize: 18,
                              ),
                            ),
                            Text(
                              'Obesity (Class 2): BMI between 35 and 39.9',
                              style: GoogleFonts.akayaKanadaka(
                                fontSize: 18,
                              ),
                            ),
                            Text(
                              'Obesity (Class 3): BMI 40 or greater',
                              style: GoogleFonts.akayaKanadaka(
                                fontSize: 18,
                              ),
                            ),
                          ],
                        ),
                      ),



                    ],
                  ),
                )

              ],
            ),
          ),
        ),


      ),
    );
  }
}

// *********** form **********//

Widget inputForm({required String title , required TextEditingController controller, required String hintText})
{
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        title,style: GoogleFonts.abhayaLibre(
          fontSize: 20,fontWeight: FontWeight.bold,
      ),
      ),
      SizedBox(height: 5,),

      Container(
        height: 50,
        decoration: BoxDecoration(
          // color:Colors.pinkAccent[100],
          gradient: LinearGradient(
            colors: [Colors.blue,Colors.white],
            begin: Alignment.topRight,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(width: 2)
        ),
        child: TextField(
            controller: controller,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
              ),
              hintText: hintText,
            ),
        ),
      ),
      SizedBox(height: 10,),
    ],
  );
}

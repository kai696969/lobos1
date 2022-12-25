import 'package:flutter/material.dart';
import 'package:flutter_math_fork/flutter_math.dart';
import 'package:flutter/rendering.dart';
import 'package:extended_math/extended_math.dart';
import 'package:flutter_math_fork/tex.dart';
import 'package:lobos/formulaPage.dart';
import 'package:lobos/rcPage.dart';
import 'package:lobos/rczPage.dart';
import 'package:lobos/vZ.dart';
import 'package:lobos/zInPage.dart';
import 'package:lobos/zInusingRcPage.dart';

import 'Voplus.dart';




class calculation extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _calculationState();
  }
}

class _calculationState extends State<calculation>
{
  Complex j =  Complex(re:0 , im: 1);                       // j
  double pi = 3.14159265359;
  double realZL = 0;                                                  //input
  double imaginaryZL = 0;                                        //input
  double realZo = 0;                                                  //input
  double imaginaryZo = 0;                                        //input
  var zlvalue = Complex(re:0 , im:0);                        // to calculate ZL value
  var zlvalue1 = Complex(re:0 , im:0);                      // to display ZL value
  var zovalue = Complex(re:0 , im:0);                       // to calculate ZO value
  var zovalue1 = Complex(re:0 , im:0);                     // to display ZO value
  var rctop = Complex(re:0 , im:0);                           // to calculate rctop value
  var rctop1 = Complex(re:0 , im:0);                         // to display rctop value
  var rcbtm = Complex(re:0 , im:0);                          // to calculate rcbtm value
  var rcbtm1 = Complex(re:0 , im:0);                        // to display rcbtm value
  var rcvalue = Complex(re:0 , im:0);                       // to calculate rcvalue  using ZL and ZO
  var rcvalue1 = Complex(re:0 , im:0);                      // to display rcvalue calculate using ZL and ZO
  var rcvalue11 = Complex(re:0 , im:0);                      // to display rcvalue calculate using ZL and ZO
  double beta = 0;                                                     //input
  double zPosition = 0;                                             //input
  double SWR = 0;                                                   //input
  double thetaRc = 0;                                               //input
  double thetaRo = 0;                                                //input
  double swrValue = 0;                                               // to calculate SWR
  double swrValue1 = 0;                                             // to display SWR
  double thetaRo1 = 0;                                               // to calculate Ro
  double thetaRo2 = 0;                                               // to display Ro
  var rcUsingSwr = Complex(re:0 , im:0);                  // to calculate rcUsingSwr
  var rcUsingSwr1 = Complex(re:0 , im:0);                // to display rcUsingSwr
  var j2betaZpos  = Complex(re:0 , im:0);                 // to calculate j2betaZpos
  var j2betaZpos1 = Complex(re:0 , im:0);                 // to display j2betaZpos
  var rcAtz  = Complex(re:0 , im:0);                            // to calculate rc@z
  var rcAtz1  = Complex(re:0 , im:0);                         // to display rc@z
  double tanbetaz = 0;
  var zIn  = Complex(re:0 , im:0);                             // to calculate zIn
  var zIn1  = Complex(re:0 , im:0);                           // to display zIn
  var zIntop  = Complex(re:0 , im:0);                        // to calculate zIntop
  var zIntop1  = Complex(re:0 , im:0);                       // to display zIntop
  var zInbtm  = Complex(re:0 , im:0);                       // to calculate zInbtm
  var zInbtm1  = Complex(re:0 , im:0);                      // to display zInbtm1
  double phaseVelocity = 0;                                       // input
  double omega = 0;                                                 // input
  double lambda = 0;                                                // input
  double freq =0;                                                       //input
  double Vg = 0;                                                        // input
  double Zg = 0;                                                        //input
  var zInusingRczTop  = Complex(re:0 , im:0);
  var zInusingRczTop1  = Complex(re:0 , im:0);
  var zInusingRczBtm  = Complex(re:0 , im:0);
  var zInusingRczBtm1  = Complex(re:0 , im:0);
  var zInusingRcz = Complex(re:0 , im:0);
  var zInusingRcz1 = Complex(re:0 , im:0);
  var VZ = Complex(re:0 , im:0);
  var VZ1 = Complex(re:0 , im:0);
  var voplus = Complex(re:0 , im:0);
  var voplus1 = Complex(re:0 , im:0);
  TextEditingController reZL = TextEditingController(text: '');  // realZL
  TextEditingController imZL = TextEditingController(text: '');  // imaginaryZL
  TextEditingController reZo = TextEditingController(text: '');  // realZo
  TextEditingController imZo = TextEditingController(text: ''); // imaginaryZo
  TextEditingController betaa = TextEditingController(text: ''); // Beta
  TextEditingController zPos = TextEditingController(text: ''); // Z position
  TextEditingController swr = TextEditingController(text: ''); // SWR
  TextEditingController thetaRcc = TextEditingController(text: ''); // thetaRc
  TextEditingController thetaRoo = TextEditingController(text: ''); // thetaRo
  TextEditingController uP = TextEditingController(text: ''); // phaseVelocity
  TextEditingController w = TextEditingController(text: ''); // Omega
  TextEditingController lambdaa = TextEditingController(text: ''); // Lambda
  TextEditingController Freq = TextEditingController(text: ''); //  Frequency



  void calculateValues(double freq, double lambda, double beta ,double omega , double phaseVelocity, double thetaRo) {
  }

  @override
  void initState() {
    super.initState();

    bool updatingLambda = false;
    bool updatingBeta = false;

    lambdaa.addListener(()                                                      // user input in lamda to get beta
    {
      if (lambdaa.text.isNotEmpty && !updatingLambda) {
        updatingBeta = true;
        setState(() {
          lambda = double.parse(lambdaa.text);
          beta = (2 * pi) / lambda;
          betaa.text = beta.toStringAsExponential(5);
        }); updatingBeta = false;
      }
    });

    betaa.addListener(()                                                             // user input in beta to get lambda
    {
      if (betaa.text.isNotEmpty  && !updatingBeta) {
        updatingLambda = true;
        setState(() {
          beta = double.parse(betaa.text);
          lambda = (2 * pi) / beta;
          lambdaa.text = lambda.toString();
        });
        updatingLambda = false;
      }
    });


    Freq.addListener(() {                                                                       // user input in frequency to get omega(w)
      freq = double.parse(Freq.text);
      omega = 2*pi*freq;
      w.text = omega.toString();
    });


    Freq.addListener(() {                                                                       // user input in freq to get phase velocity
      if (Freq.text.isNotEmpty && lambdaa.text.isNotEmpty) {
        setState(() {
          freq = double.parse(Freq.text);
          lambda = double.parse(lambdaa.text);
          phaseVelocity = freq / lambda;
          uP.text = phaseVelocity.toStringAsFixed(3);
        });
      }
    });

    lambdaa.addListener(() {                                                                  // user input in lambda to get phase velocity
      if (Freq.text.isNotEmpty && lambdaa.text.isNotEmpty) {
        setState(() {
          freq = double.parse(Freq.text);
          lambda = double.parse(lambdaa.text);
          phaseVelocity = freq / lambda;
          uP.text = phaseVelocity.toStringAsFixed(3);
        });
      }
    });



    thetaRcc.addListener(() {                                                                       // user input in theta rc to get theta ro
      if (thetaRcc.text.isNotEmpty && betaa.text.isNotEmpty && zPos.text.isNotEmpty) {
        setState(() {
          thetaRc = double.parse(thetaRcc.text);
          beta = double.parse(betaa.text);
          zPosition = double.parse(zPos.text);
          thetaRo = thetaRc - (2*beta*zPosition);
          thetaRoo.text = thetaRo.toStringAsFixed(3);
        });
      }
    });

    betaa.addListener(() {                                                                  // user input in beta to get theta ro
      if (thetaRcc.text.isNotEmpty && betaa.text.isNotEmpty && zPos.text.isNotEmpty) {
        setState(() {
          thetaRc = double.parse(thetaRcc.text);
          beta = double.parse(betaa.text);
          zPosition = double.parse(zPos.text);
          thetaRo = thetaRc - (2*beta*zPosition);
          thetaRoo.text = thetaRo.toStringAsFixed(3);
        });
      }
    });


    zPos.addListener(() {                                                                  // user input in zpos to get theta ro
      if (thetaRcc.text.isNotEmpty && betaa.text.isNotEmpty && zPos.text.isNotEmpty) {
        setState(() {
          thetaRc = double.parse(thetaRcc.text);
          beta = double.parse(betaa.text);
          zPosition = double.parse(zPos.text);
          thetaRo = thetaRc - (2*beta*zPosition);
          thetaRoo.text = thetaRo.toStringAsFixed(3);
        });
      }
    });

    w.addListener(() {                                                                  // user input w  to get phase velocity
      if (w.text.isNotEmpty && betaa.text.isNotEmpty && zPos.text.isNotEmpty) {
        setState(() {
          omega = double.parse(w.text);
          beta = double.parse(betaa.text);
          phaseVelocity = omega/beta;
          uP.text = phaseVelocity.toStringAsFixed(3);
        });
      }
    });

    betaa.addListener(() {                                                                  // user input beta  to get phase velocity
      if (thetaRcc.text.isNotEmpty && betaa.text.isNotEmpty && zPos.text.isNotEmpty) {
        setState(() {
          omega = double.parse(w.text);
          beta = double.parse(betaa.text);
          phaseVelocity = omega/beta;
          uP.text = phaseVelocity.toStringAsFixed(3);
        });
      }
    });
    // Call the calculateValues() function with the required parameters
    calculateValues(freq, lambda, beta,omega,phaseVelocity, thetaRo);
  }

  Widget build(BuildContext context) {
    return Scaffold (
      appBar: AppBar(
        title: Text('Calculator'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Padding(
                padding: const EdgeInsets.only(left: 20.0, right: 10.0, top: 10.0),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  child: Column(

                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: SizedBox(
                              height: 100,
                              child: Padding(
                                padding:  const EdgeInsets.only(right:8.0, top: 30.0),
                                child: TextField(
                                  controller: reZL,
                                  decoration: InputDecoration(
                                      labelText: "Real ZL (ohms)",
                                      border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(10))
                                  ),
                                  keyboardType: TextInputType.number,
                                ),
                              ),
                            ),
                          ),
                          Expanded(child:
                          SizedBox(
                            height: 100,
                            child: Padding(
                              padding:  const EdgeInsets.only(right:8.0, top: 30.0),
                              child: TextField(
                                controller: imZL,
                                decoration: InputDecoration(
                                    labelText: "Imaginary ZL (johms)",
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10))
                                ),
                                keyboardType: TextInputType.number,
                              ),
                            ),
                          ),
                          ),
                          Expanded(
                            child: SizedBox(
                              height: 100,
                              child: Padding(
                                padding:  const EdgeInsets.only(right:8.0, top: 30.0),
                                child: TextField(
                                  controller: reZo,
                                  decoration: InputDecoration(
                                      labelText: "Real Zo (ohms)",
                                      border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(10))
                                  ),
                                  keyboardType: TextInputType.number,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(child:
                          SizedBox(
                            height: 100,
                            child: Padding(
                              padding:  const EdgeInsets.only(right:8.0, top: 30.0),
                              child: TextField(
                                controller: imZo,
                                decoration: InputDecoration(
                                    labelText: "Imaginary Zo (johms)",
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10))
                                ),
                                keyboardType: TextInputType.number,
                              ),
                            ),
                          ),
                          ),
                          Expanded(
                            child: SizedBox(
                              height: 100,
                              child: Padding(
                                padding:  const EdgeInsets.only(right:8.0, top: 30.0),
                                child: TextField(
                                  controller: betaa,
                                  decoration: InputDecoration(
                                      labelText: "Beta",
                                      border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(10))
                                  ),
                                  keyboardType: TextInputType.number,
                                ),
                              ),
                            ),
                          ),
                          Expanded(child:
                          SizedBox(
                            height: 100,
                            child: Padding(
                              padding:  const EdgeInsets.only(right:8.0, top: 30.0),
                              child: TextField(
                                controller: zPos,
                                decoration: InputDecoration(
                                    labelText: "Z position",
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10))
                                ),
                                keyboardType: TextInputType.number,
                              ),
                            ),
                          ),
                          )

                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: SizedBox(
                              height: 100,
                              child: Padding(
                                padding:  const EdgeInsets.only(right:8.0, top: 30.0),
                                child: TextField(
                                  controller: swr,
                                  decoration: InputDecoration(
                                      labelText: "SWR",
                                      border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(10))
                                  ),
                                  keyboardType: TextInputType.number,
                                ),
                              ),
                            ),
                          ),
                          Expanded(child:
                          SizedBox(
                            height: 100,
                            child: Padding(
                              padding:  const EdgeInsets.only(right:8.0, top: 30.0),
                              child: TextField(
                                controller: thetaRoo,
                                decoration: InputDecoration(
                                    labelText: "thetaRo",
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10))
                                ),
                                keyboardType: TextInputType.number,
                              ),
                            ),
                          ),
                          ),
                          Expanded(
                            child: SizedBox(
                              height: 100,
                              child: Padding(
                                padding:  const EdgeInsets.only(right:8.0, top: 30.0),
                                child: TextField(
                                  controller: thetaRcc,
                                  decoration: InputDecoration(
                                      labelText: "thetaRc",
                                      border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(10))
                                  ),
                                  keyboardType: TextInputType.number,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(child:
                          SizedBox(
                            height: 100,
                            child: Padding(
                              padding:  const EdgeInsets.only(right:8.0, top: 30.0),
                              child: TextField(
                                controller: uP,
                                decoration: InputDecoration(
                                    labelText: "Phase Velocity(m/s)",
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10))
                                ),
                                keyboardType: TextInputType.number,
                              ),
                            ),
                          ),
                          ),
                          Expanded(
                            child: SizedBox(
                              height: 100,
                              child: Padding(
                                padding:  const EdgeInsets.only(right:8.0, top: 30.0),
                                child: TextField(
                                  controller: w,
                                  decoration: InputDecoration(
                                      labelText: "w",
                                      border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(10))
                                  ),
                                  keyboardType: TextInputType.number,
                                ),
                              ),
                            ),
                          ),
                          Expanded(child:
                          SizedBox(
                            height: 100,
                            child: Padding(
                              padding:  const EdgeInsets.only(right:8.0, top: 30.0),
                              child: TextField(
                                controller: lambdaa,
                                decoration: InputDecoration(
                                    labelText: "Lambda",
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10))
                                ),
                                keyboardType: TextInputType.number,
                              ),
                            ),
                          ),
                          )
                        ],
                      ),
                      Row(
                        children: [

                          Expanded(child:
                          SizedBox(
                            height: 100,
                            child: Padding(
                              padding:  const EdgeInsets.only(right: 8.0, top: 30.0),
                              child: TextField(
                                controller: Freq,
                                decoration: InputDecoration(
                                    labelText: "Frequency",
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10))
                                ),
                                keyboardType: TextInputType.number,
                              ),
                            ),
                          ),
                          ),

                        ],
                      ),

                      SizedBox(
                        height: 20,
                      ),
                      ElevatedButton(
                        style:ElevatedButton.styleFrom( padding: EdgeInsets.all(10.0) , minimumSize: Size(100.0,50.0)),
                        onPressed: () {
                          _validateRcInput1(reZL.text);
                          _validateRcInput1(imZL.text);
                          _validateRcInput1(reZo.text);
                          _validateRcInput1(imZo.text);
                          _validateRcInput1(betaa.text);
                          _validateRcInput1(zPos.text);
                          _validateRcInput1(swr.text);
                          _validateRcInput1(thetaRcc.text);
                          _validateRcInput1(thetaRoo.text);

                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context)=>rcPage(j:j ,realZL:realZL ,  imaginaryZL:imaginaryZL , realZo:realZo ,
                                imaginaryZo:imaginaryZo  , zlvalue:zlvalue , zovalue: zovalue , zlvalue1:zlvalue1 , zovalue1: zovalue1,
                                rctop:rctop , rcbtm:rcbtm , rctop1:rctop1 ,
                                rcbtm1:rcbtm1, beta:beta , zPosition:zPosition , SWR:SWR , rcUsingSwr1:rcUsingSwr1 ,
                                thetaRc:thetaRc , thetaRo:thetaRo , swrValue:swrValue, thetaRo1:thetaRo1, swrValue1:swrValue1 ,
                                thetaRo2:thetaRo2, j2betaZpos:j2betaZpos , j2betaZpos1:j2betaZpos1
                                , rcAtz:rcAtz, rcAtz1:rcAtz1 , rcvalue1: rcvalue1, rcvalue11: rcvalue11,

                              ),),);
                        },
                        child: Math.tex("{${"Reflection${r'\ \,'}Coefficient"}}${r'\ \,'}${r'\Gamma_L '} " , textStyle:  TextStyle(fontSize: 23 , color: Colors.white , ) ,),
                      ),

                      SizedBox(
                        height: 10,
                      ),
                      ElevatedButton(
                        style:ElevatedButton.styleFrom( padding: EdgeInsets.all(10.0) , minimumSize: Size(100.0,50.0)),
                        onPressed: () {
                          _validatezInInput1(reZL.text);
                          _validatezInInput1(imZL.text);
                          _validatezInInput1(reZo.text);
                          _validatezInInput1(imZo.text);
                          _validatezInInput1(betaa.text);
                          _validatezInInput1(zPos.text);
                          _validatezInInput1(swr.text);
                          _validatezInInput1(thetaRcc.text);
                          _validatezInInput1(thetaRoo.text);
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context)=>zInPage( j:j ,realZL:realZL ,  imaginaryZL:imaginaryZL , realZo:realZo ,
                                  imaginaryZo:imaginaryZo  , zlvalue:zlvalue , zovalue: zovalue ,zlvalue1:zlvalue1 , zovalue1: zovalue1 ,
                                  rctop:rctop , rcbtm:rcbtm , rctop1:rctop1 , rcbtm1:rcbtm1, beta:beta , zPosition:zPosition, zIn:zIn ,
                                  zIntop:zIntop , zInbtm:zInbtm , zIntop1:zIntop1 , zInbtm1:zInbtm1
                                  ,zIn1:zIn1 , tanbetaz:tanbetaz ),),);
                        },
                        child: Math.tex("{${"Input${r'\ \,'}Impedance"}}${r'\ \,'}${r'\Z_'}{in}(-${r'\ell'}) " , textStyle:  TextStyle(fontSize: 23.3 , color: Colors.white ) ,),
                      ),

                      // SizedBox(
                      //   height: 10,
                      // ),
                      // ElevatedButton(
                      //   style:ElevatedButton.styleFrom( padding: EdgeInsets.all(10.0) , minimumSize: Size(100.0,50.0)),
                      //   onPressed: () {
                      //     _validatevZ1(reZL.text);
                      //     _validatevZ1(imZL.text);
                      //     _validatevZ1(reZo.text);
                      //     _validatevZ1(imZo.text);
                      //     _validatevZ1(betaa.text);
                      //     _validatevZ1(zPos.text);
                      //     _validatevZ1(swr.text);
                      //     _validatevZ1(thetaRcc.text);
                      //     _validatevZ1(thetaRoo.text);
                      //
                      //     Navigator.of(context).push(
                      //
                      //       MaterialPageRoute(
                      //         builder: (context)=>vZ(
                      //
                      //         ),
                      //       ),
                      //     );
                      //
                      //   },
                      //   child: Math.tex("{${"V_o^+"}}" , textStyle:  TextStyle(fontSize: 23 , color: Colors.white , ) ,),
                      // ),

                      SizedBox(
                        height: 10,
                      ),
                      ElevatedButton (
                        style:ElevatedButton.styleFrom( padding: EdgeInsets.all(10.0) , minimumSize: Size(290.0,10.0)),
                        onPressed: () {
                          reZL.clear();
                          imZL.clear();
                          reZo.clear();
                          imZo.clear();
                          betaa.clear();
                          zPos.clear();
                          swr.clear();
                          thetaRcc.clear();
                          thetaRoo.clear();
                          uP.clear();
                          w.clear();
                          lambdaa.clear();
                          Freq.clear();
                        },
                        child: Text('Clear All' , style: TextStyle(fontSize: 25),),
                      ),

                    ],
                  ),
                )
            ),
          )
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              child: Text('Content' , style: TextStyle(fontSize: 25),),
              decoration: BoxDecoration(
                color: Colors.yellow[800],
              ),
            ),
            ListTile(
              title: Text("Home" , style: TextStyle(fontSize: 18),),
              onTap: () {
                Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => calculation()),
                );
              },
            ),
            ListTile(
              title: Math.tex("{${"Reflection${r'\ \,'}Coefficient"}}${r'\ \,'}${r'\Gamma_L '} " , textStyle:  TextStyle(fontSize: 18 , color: Colors.black , fontWeight: FontWeight.bold) ,),
              onTap: () {
                Navigator.pop(context); // Close the drawer
                Navigator.push(context,
                  MaterialPageRoute(
                    builder: (context) => rcPage(j: j, imaginaryZL: imaginaryZL, realZL: realZL, realZo: realZo, imaginaryZo: imaginaryZo, rcvalue1: rcvalue1,
                        rcvalue11: rcvalue11, zovalue: zovalue, zlvalue: zlvalue, zovalue1: zovalue1, zlvalue1: zlvalue1, rcbtm: rcbtm, rctop: rctop, rcbtm1: rcbtm1, rctop1: rctop1,
                        beta: beta, zPosition: zPosition, SWR: SWR, rcUsingSwr1: rcUsingSwr1, thetaRc: thetaRc, thetaRo: thetaRo, swrValue: swrValue, thetaRo1: thetaRo1,
                        swrValue1: swrValue1, thetaRo2: thetaRo2, j2betaZpos: j2betaZpos, j2betaZpos1: j2betaZpos1, rcAtz: rcAtz, rcAtz1: rcAtz1),),);
              },
            ),
            ListTile(
              title: Text('Reflection Coefficient at $zPosition m ', style:  TextStyle(fontSize: 18 , color: Colors.black , fontWeight: FontWeight.bold) ,),
              onTap: () {
                Navigator.pop(context); // Close the drawer
                Navigator.pushReplacement(context,
                  MaterialPageRoute(
                    builder: (context) => rczPage(j: j, imaginaryZL: imaginaryZL, realZL: realZL, realZo: realZo, imaginaryZo: imaginaryZo, rcvalue1: rcvalue1,
                        zovalue: zovalue, zovalue1: zovalue1, zlvalue: zlvalue, rcbtm: rcbtm, rctop: rctop, rcbtm1: rcbtm1, rctop1: rctop1, beta: beta,
                        zPosition: zPosition, SWR: SWR, thetaRc: thetaRc, thetaRo: thetaRo, swrValue: swrValue, thetaRo1: thetaRo1, swrValue1: swrValue1,
                        thetaRo2: thetaRo2, j2betaZpos1: j2betaZpos1, j2betaZpos: j2betaZpos, rcAtz: rcAtz, rcAtz1: rcAtz1),),);
              },
            ),
            ListTile(
              title: Math.tex(" ${r'\Z_'}{in}${r'\,'}at${r'\,'}$zPosition m" , textStyle:  TextStyle(fontSize: 18 , color: Colors.black , fontWeight: FontWeight.bold) ,),
              onTap: () {
                Navigator.pop(context); // Close the drawer
                Navigator.pushReplacement(context,
                  MaterialPageRoute(
                    builder: (context) => zInusingRcPage(j: j, imaginaryZL: imaginaryZL, realZL: realZL, realZo: realZo, imaginaryZo: imaginaryZo, rcvalue1: rcvalue1,
                        zovalue: zovalue, zovalue1: zovalue1, zlvalue: zlvalue, rcbtm: rcbtm, rctop: rctop, rcbtm1: rcbtm1, rctop1: rctop1, beta: beta, zPosition: zPosition,
                        SWR: SWR, thetaRc: thetaRc, thetaRo: thetaRo, swrValue: swrValue, thetaRo1: thetaRo1, swrValue1: swrValue1,
                        thetaRo2: thetaRo2, j2betaZpos1: j2betaZpos1, j2betaZpos: j2betaZpos, rcAtz: rcAtz, rcAtz1: rcAtz1,
                        zInusingRcz1: zInusingRcz1, zInusingRcz: zInusingRcz, zInusingRczTop: zInusingRczTop, zInusingRczBtm: zInusingRczBtm,
                        zInusingRczTop1: zInusingRczTop1, zInusingRczBtm1: zInusingRczBtm1),),);
              },
            ),
            ListTile(
              title: Math.tex("{${"Input${r'\ \,'}Impedance"}}${r'\ \,'}${r'\Z_'}{in}(-${r'\ell'}) " , textStyle:  TextStyle(fontSize: 18 , color: Colors.black , fontWeight: FontWeight.bold) ,),
              onTap: () {
                Navigator.pop(context); // Close the drawer
                Navigator.pushReplacement(context,
                  MaterialPageRoute(
                    builder: (context) => zInPage(j: j, realZL: realZL, imaginaryZL: imaginaryZL, realZo: realZo, imaginaryZo: imaginaryZo, zlvalue: zlvalue,
                        zovalue: zovalue, zlvalue1: zlvalue1, zovalue1: zovalue1, rctop: rctop, rcbtm: rcbtm, rctop1: rctop1, rcbtm1: rcbtm1, beta: beta,
                        zPosition: zPosition, zIn: zIn, zIn1: zIn1, zIntop: zIntop, zInbtm: zInbtm, zIntop1: zIntop1, zInbtm1: zInbtm1, tanbetaz: tanbetaz),),);
              },
            ),
            ListTile(
              title: Math.tex("${r'\ V_{in}'}" , textStyle:  TextStyle(fontSize: 18  , color: Colors.black,fontWeight: FontWeight.bold ) ,),
              onTap: () {
                Navigator.pop(context); // Close the drawer
                Navigator.pushReplacement(context,
                  MaterialPageRoute(
                    builder: (context) => vZ(j: j, imaginaryZL: imaginaryZL, realZL: realZL, realZo: realZo, imaginaryZo: imaginaryZo, rcvalue1: rcvalue1,
                        zovalue: zovalue, zlvalue: zlvalue, rcbtm: rcbtm, rctop: rctop, rcbtm1: rcbtm1, rctop1: rctop1, beta: beta, zPosition: zPosition, SWR: SWR,
                        thetaRc: thetaRc, thetaRo: thetaRo, swrValue: swrValue, thetaRo1: thetaRo1, swrValue1: swrValue1, thetaRo2: thetaRo2,
                        j2betaZpos1: j2betaZpos1, j2betaZpos: j2betaZpos, rcAtz: rcAtz, rcAtz1: rcAtz1, zInusingRcz1: zInusingRcz1, zInusingRcz: zInusingRcz,
                        zInusingRczTop: zInusingRczTop, zInusingRczBtm: zInusingRczBtm, zInusingRczTop1: zInusingRczTop1,
                        zInusingRczBtm1: zInusingRczBtm1, Zg: Zg, Vg: Vg, VZ: VZ, VZ1: VZ1, voplus: voplus, voplus1: voplus1),),);
              },
            ),
            ListTile(
              title: Math.tex("${r'\ V_o^+'}" , textStyle:  TextStyle(fontSize: 18  , color: Colors.black,fontWeight: FontWeight.bold ) ,),
              onTap: () {
                Navigator.pop(context); // Close the drawer
                Navigator.pushReplacement(context,
                  MaterialPageRoute(
                    builder: (context) => Voplus(j: j, imaginaryZL: imaginaryZL, realZL: realZL, realZo: realZo, imaginaryZo: imaginaryZo, rcvalue1: rcvalue1,
                        zovalue: zovalue, zlvalue: zlvalue, rcbtm: rcbtm, rctop: rctop, rcbtm1: rcbtm1, rctop1: rctop1, beta: beta, zPosition: zPosition, SWR: SWR,
                        thetaRc: thetaRc, thetaRo: thetaRo, swrValue: swrValue, thetaRo1: thetaRo1, swrValue1: swrValue1, thetaRo2: thetaRo2,
                        j2betaZpos1: j2betaZpos1, j2betaZpos: j2betaZpos, rcAtz: rcAtz, rcAtz1: rcAtz1, zInusingRcz1: zInusingRcz1, zInusingRcz: zInusingRcz,
                        zInusingRczTop: zInusingRczTop, zInusingRczBtm: zInusingRczBtm, zInusingRczTop1: zInusingRczTop1, zInusingRczBtm1: zInusingRczBtm1,
                        Zg: Zg, Vg: Vg, VZ: VZ, VZ1: VZ1, voplus: voplus, voplus1: voplus1),),);
              },
            ),
            ListTile(
              title: Math.tex("Formula Page" , textStyle:  TextStyle(fontSize: 18  , color: Colors.black,fontWeight: FontWeight.bold ) ,),
              onTap: () {
                Navigator.pop(context); // Close the drawer
                Navigator.pushReplacement(context,
                  MaterialPageRoute(
                    builder: (context) => formulaPage(),),);
              },
            ),

          ],
        ),
      ),
    );
  }






  _validateRcInput1(String input)
  {
    if (reZL.text != "" && imZL.text!= "" && reZo.text!= ""  &&  imZo.text!= "" && betaa.text!= "" && zPos.text!= ""  &&  swr.text!= "" && thetaRcc.text!= "" && thetaRoo.text!= ""  )
    {
      setState(() {
        realZL = double.parse(reZL.text);
        imaginaryZL = double.parse(imZL.text);
        realZo = double.parse(reZo.text);
        imaginaryZo = double.parse(imZo.text);
        final zlvalue = Complex(re:realZL , im:imaginaryZL) ;
        final zovalue = Complex(re:realZo , im:imaginaryZo) ;
        final rctop = ((zlvalue)-(zovalue));
        final rcbtm = ((zlvalue)+(zovalue));
        final rcvalue = rctop/rcbtm;
        rcvalue11 = rcvalue;
        rcvalue1 = rcvalue;
        rctop1 = rctop;
        rcbtm1 = rcbtm;
        zlvalue1 = zlvalue;
        zovalue1 = zovalue;
        beta = double.parse(betaa.text);
        zPosition = double.parse(zPos.text);
        SWR = double.parse(swr.text);
        thetaRc = double.parse(thetaRcc.text);
        thetaRo = double.parse(thetaRoo.text);
        final swrValue = ((1-SWR) / (1+ SWR));
        final thetaRo1 = thetaRc - 2*beta*zPosition;
        final rcUsingSwr = Complex(re: swrValue*cos(thetaRo1) , im: swrValue*sin(thetaRo1));
        rcUsingSwr1 = rcUsingSwr;
        swrValue1 = swrValue;
        thetaRo2 = thetaRo1;


      });
    }
    else if (reZL.text!= "" && imZL.text!= "" && reZo.text!= ""  &&  imZo.text!= "")
    {
      setState(() {
        realZL = double.parse(reZL.text);
        imaginaryZL = double.parse(imZL.text);
        realZo = double.parse(reZo.text);
        imaginaryZo = double.parse(imZo.text);
        final zlvalue = Complex(re:realZL , im:imaginaryZL) ;
        final zovalue = Complex(re:realZo , im:imaginaryZo) ;
        final rctop = ((zlvalue)-(zovalue));
        final rcbtm = ((zlvalue)+(zovalue));
        final rcvalue = rctop/rcbtm;
        rcvalue1 = rcvalue;
        rcvalue11 = rcvalue;
        rctop1 = rctop;
        rcbtm1 = rcbtm;
        zlvalue1 = zlvalue;
        zovalue1 = zovalue;
      });
    }
    else if (betaa.text!= "" && zPos.text!= ""  &&  swr.text!= "" && thetaRcc.text!= "" && thetaRoo.text!= "")
    {
      setState(() {
        beta = double.parse(betaa.text);
        zPosition = double.parse(zPos.text);
        SWR = double.parse(swr.text);
        thetaRc = double.parse(thetaRcc.text);
        thetaRo = double.parse(thetaRoo.text);
        final swrValue = ((1-SWR) / (1+ SWR));
        final thetaRo1 = thetaRc - 2*beta*zPosition;
        final rcUsingSwr = Complex(re: swrValue*cos(thetaRo1) , im: swrValue*sin(thetaRo1));
        rcUsingSwr1 = rcUsingSwr;
        rcvalue1 = rcUsingSwr1;
        swrValue1 = swrValue;
        thetaRo2 = thetaRo1;
      });
    }
    else
    {}
  }
  _validatezInInput1(String input)
  {
    bool useForumla1 = reZL.text!= "" && imZL.text!= "" && reZo.text!= "" &&  imZo.text!= "" && betaa.text!= "" && zPos.text!= "";
    if (useForumla1)
    {
      setState(() {
        realZL = double.parse(reZL.text);
        imaginaryZL = double.parse(imZL.text);
        realZo = double.parse(reZo.text);
        imaginaryZo = double.parse(imZo.text);
        beta = double.parse(betaa.text);
        zPosition = double.parse(zPos.text);
        final tanbetaz = tan(beta*zPosition);
        final j = Complex(re:0 , im:1);
        final zlvalue = Complex(re:realZL , im:imaginaryZL) ;
        final zovalue = Complex(re:realZo , im:imaginaryZo) ;
        final zIntop =((zlvalue + (zovalue* j * -tanbetaz)));
        final zInbtm =  (zovalue + (zlvalue*j* -tanbetaz));
        final zIn= (zIntop/ zInbtm)* (zovalue);
        zlvalue1 = zlvalue;
        zovalue1 = zovalue;
        zIntop1= zIntop;
        zInbtm1 = zInbtm;
        zIn1 = zIn;
      });
    }

    else if (reZL.text!= "" && imZL.text!= "" )
    {
      setState(() {
        print(Text("hi"));
      });
    }
  }


}







import 'package:flutter/material.dart';
import 'package:flutter_math_fork/flutter_math.dart';
import 'package:flutter/rendering.dart';
import 'package:extended_math/extended_math.dart';
import 'package:flutter_math_fork/tex.dart';
import 'package:lobos/rcPage.dart';
import 'package:lobos/rczPage.dart';
import 'package:lobos/vZ.dart';
import 'package:lobos/zInPage.dart';
import 'package:lobos/zInusingRcPage.dart';
import 'Voplus.dart';
import 'calculation.dart';

class formulaPage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return _formulaPageState();
  }
}

class _formulaPageState extends State<formulaPage>
{
  Complex j =  Complex(re:0 , im: 1);                       // j
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
  double thetaRo = 0;                                               //input
  double swrValue = 0;                                             // to calculate SWR
  double swrValue1 = 0;                                           // to display SWR
  double thetaRo1 = 0;                                             // to calculate Ro
  double thetaRo2 = 0;                                             // to display Ro
  var rcUsingSwr = Complex(re:0 , im:0);                // to calculate rcUsingSwr
  var rcUsingSwr1 = Complex(re:0 , im:0);              // to display rcUsingSwr
  var j2betaZpos  = Complex(re:0 , im:0);               // to calculate j2betaZpos
  var j2betaZpos1 = Complex(re:0 , im:0);             // to display j2betaZpos
  var rcAtz  = Complex(re:0 , im:0);                      // to calculate rc@z
  var rcAtz1  = Complex(re:0 , im:0);                    // to display rc@z
  num rcAtzImg  = 0;
  double tanbetaz = 0;
  var zIn  = Complex(re:0 , im:0);
  var zIn1  = Complex(re:0 , im:0);                           // to display zIn
  var zIntop  = Complex(re:0 , im:0);
  var zIntop1  = Complex(re:0 , im:0);                       // to display zIntop
  var zInbtm  = Complex(re:0 , im:0);
  var zInbtm1  = Complex(re:0 , im:0);                      // to display zInbtm1
  var zInusingRczTop  = Complex(re:0 , im:0);
  var zInusingRczTop1  = Complex(re:0 , im:0);
  var zInusingRczBtm  = Complex(re:0 , im:0);
  var zInusingRczBtm1  = Complex(re:0 , im:0);
  var zInusingRcz = Complex(re:0 , im:0);
  var zInusingRcz1 = Complex(re:0 , im:0);
  double Vg = 0;                                                        // input
  double Zg = 0;
  var VZ = Complex(re:0 , im:0);
  var VZ1 = Complex(re:0 , im:0);
  var voplus = Complex(re:0 , im:0);
  var voplus1 = Complex(re:0 , im:0);


  @override
  Widget build(BuildContext context) {
    return Scaffold (
      appBar: AppBar(
        title: Text('Formula Page'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child:SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Padding(
            padding:  EdgeInsets.only(left: 10.0, right: 10.0 , top: 30.0),
            child: Container(
              height: 5000,
              width: 500,
              child:  Column(
                children:
                [
                  Text("Symbols" , style: TextStyle(fontSize: 25 , fontWeight: FontWeight.bold, decoration: TextDecoration.underline, color: Colors.blue),),


                  SizedBox(height: 20),
                  ExpansionTile(title: Math.tex("${r'\beta : \;Beta/Wave\;Number\;(m)'} ", textStyle:TextStyle(fontSize: 25 , ),),
                    backgroundColor: Colors.grey[200],
                    children:[
                      ListTile(title: Math.tex("${r'\beta = \frac{2\pi}{\lambda}'}", textStyle:TextStyle(fontSize: 25 ,  ),),),
                    ],),


                  SizedBox(height: 20),
                  ExpansionTile(title: Math.tex("${r'\Z : \;Z\;position\;(m)'} ", textStyle:TextStyle(fontSize: 25 ,  ),),
                    backgroundColor: Colors.grey[200],
                    children:[
                      ListTile(title: Math.tex("${r'\Z  :\,-\ell < Z < 0'}", textStyle:TextStyle(fontSize: 25 ,  ),),),
                    ],),


                  SizedBox(height: 20),
                  ExpansionTile(title: Math.tex("${r'\omega : Omega\;(Hz)'} ", textStyle:TextStyle(fontSize: 25 , ),),
                    backgroundColor: Colors.grey[200],
                    children:[
                      ListTile(title: Math.tex("${r'\omega : \;2\pi\!f'}", textStyle:TextStyle(fontSize: 25 ,  ),),),
                      ListTile(title: Math.tex("${r'\ f = Frequency\;in\;Hz'}", textStyle:TextStyle(fontSize: 20 , color: Colors.red , fontWeight: FontWeight.bold ),),),
                    ],),


                  SizedBox(height: 20),
                  ExpansionTile(title: Math.tex("${r'\lambda : \;Wavelength\;(m)'} ", textStyle:TextStyle(fontSize: 25 ,  ),),
                    backgroundColor: Colors.grey[200],
                    children:[
                      ListTile(title: Math.tex("${r'\lambda = \frac{2\pi}{\beta}'}", textStyle:TextStyle(fontSize: 25 ,  ),),),
                    ],),

                  SizedBox(height: 20),
                  ExpansionTile(title: Math.tex("${r'\!u_p: Phase\;Velocity\,(m/s)'} ", textStyle:TextStyle(fontSize: 25 ,  ),),
                    backgroundColor: Colors.grey[200],
                    children:[
                      ListTile(title: Math.tex("${r'\!u_p = f\lambda'} ", textStyle:TextStyle(fontSize: 25 ,  ),),),
                      ListTile(title: Math.tex("${r'\ f = Frequency\;in\;Hz'}", textStyle:TextStyle(fontSize: 20 , color: Colors.red , fontWeight: FontWeight.bold ),),),

                    ],),


                  SizedBox(height: 20),
                  ExpansionTile(title: Math.tex("${r'\theta_o :'} ", textStyle:TextStyle(fontSize: 25 ,  fontWeight: FontWeight.bold),),
                    backgroundColor: Colors.grey[200],
                    children:[
                      ListTile(title: Math.tex(" ${r' \theta_o '}=${r' \theta_ '}${r' \Gamma '}{-2}${r'\beta'}{z}", textStyle:TextStyle(fontSize: 25 , ),),),
                    ],),


                  SizedBox(height: 20),
                  ExpansionTile(title: Math.tex(" ${r' \theta_ '}${r' \Gamma:'} ", textStyle:TextStyle(fontSize: 25 , ),),
                    backgroundColor: Colors.grey[200],

                    children:[
                      ListTile(title: Math.tex("${r' \theta_ '}${r' \Gamma '} = ${r' \theta_o '}{+2}${r'\beta'}{z}", textStyle:TextStyle(fontSize: 25 , ),),),
                      ListTile( title: Math.tex("${r' \theta_ '}${r' \Gamma '} = {0,-2}${r'\pi'}{,-4}${r'\pi'}{,.....}${r'\;'}{at}${r'\ z_'}{max}  ", textStyle: TextStyle(fontSize: 25 , ) ,  )),
                      ListTile( title: Math.tex("${r' \theta_ '}${r' \Gamma '} = ${r'\pi'}{,-}${r'\pi'}{,-3}${r'\pi'}{,.....}${r'\;'}{at}${r'\ z_'}{min}  ", textStyle: TextStyle(fontSize: 25 , ) ,  )),
                    ],),



                  SizedBox(height: 20),
                  Text("Equations" , style: TextStyle(fontSize: 25 , fontWeight: FontWeight.bold, decoration: TextDecoration.underline,color: Colors.blue),),
                  SizedBox(height: 20),
                  ExpansionTile(title: Math.tex("{${"Reflection${r'\ \,'}Coefficient"}}${r'\ \,'}${r'\Gamma_L '} " , textStyle:  TextStyle(fontSize: 23 ,  fontWeight: FontWeight.bold),),
                    backgroundColor: Colors.grey[200],
                    children:[
                      ListTile( title: Math.tex("${r'\Gamma_L = \frac{Z_L- Z_o}{Z_L+ Z_o}'}", textStyle: TextStyle(fontSize: 25 ,) ,  )),
                      ListTile( title: Math.tex("", textStyle: TextStyle(fontSize: 20 , color: Colors.red) ,  )),
                      ListTile( title: Math.tex("{${"|"}}${r'\Gamma_L'}{${"|"}}${r'\angle'}${r' \theta_o '} = ${r'\frac{1-SWR}{1+SWR}'}${r'\angle'}${r' \theta_o '}", textStyle: TextStyle(fontSize: 25 , ) ,  )),
                      ListTile( title: Math.tex("", textStyle: TextStyle(fontSize: 20 , color: Colors.red) ,  )),
                      ListTile( title: Math.tex("${r'\Gamma_L'}{(z)} = ${r'\Gamma_L *'}e^{{j2}${ r'\beta '}z}", textStyle:  TextStyle(fontSize: 23 ,  ) ,  )),
                    ],),


                  SizedBox(height: 20),
                  ExpansionTile(title: Math.tex("Input${r'\ \,'}Impedance${r'\ \,'}${r'\Z_'}{in}(-${r'\ell'}) " , textStyle:  TextStyle(fontSize: 23 ,  fontWeight: FontWeight.bold),),
                    backgroundColor: Colors.grey[200],
                    children:[
                      ListTile( title: Math.tex("${r'\Z_'}{in}(-${r'\ell'}) =${r'\frac{Z_L + jZ_otan(\beta \ell)}{Z_o + jZ_Ltan(\beta \ell)}'}${r' \Z_o \;\;\Omega'}", textStyle: TextStyle(fontSize: 25 ,) ,  )),
                      ListTile( title: Math.tex("", textStyle: TextStyle(fontSize: 20 , color: Colors.red) ,  )),
                      ListTile( title: Math.tex("${r'\Z_'}{in}(-${r'\ell'}) = ${r'\frac{1+ \Gamma_L e^{2j \beta z}}{1- \Gamma_L e^{2j \beta z}}'}${r' \Z_o \;\;\Omega'}", textStyle: TextStyle(fontSize: 25 , ) ,  )),
                      ListTile( title: Math.tex("Z= ${r'\,'}-${r'\ell'} ", textStyle: TextStyle(fontSize: 20 , color: Colors.red , fontWeight: FontWeight.bold) ,  )),
                      ListTile( title: Math.tex("${r'\tan(\beta \ell) \,in\,radians'} ", textStyle: TextStyle(fontSize: 20 , color: Colors.red , fontWeight: FontWeight.bold) ,  )),
                    ],),

                  SizedBox(height: 20),
                  ExpansionTile(title: Math.tex("Voltage${r'\;\;'}V(Z) " , textStyle:  TextStyle(fontSize: 23 ,  fontWeight: FontWeight.bold),),
                    backgroundColor: Colors.grey[200],
                    children:[
                      ListTile( title: Math.tex("V(Z) = ${r'\ V_o^+'}${r'\,'}e^{-j${ r'\beta '}z} + ${r'\ V_o^-'}${r'\,'}e^{j${ r'\beta '}z} ", textStyle: TextStyle(fontSize: 25 ,) ,)),
                      ListTile( title: Math.tex(" ${r'\quad'}${r'\quad'}${r'\quad'}= ${r'\ V_o^+'}${r'\,'}e^{-j${ r'\beta '}z}(1+ ${r'\Gamma_L'}e^{j2${ r'\beta '}z})${r'\ V'} ", textStyle: TextStyle(fontSize: 25 ,) ,)),
                      ListTile( title: Math.tex("  ${r'\ V_o^+'}= Incident${r'\,'}Voltage  ", textStyle: TextStyle(fontSize: 20 , color: Colors.red , fontWeight: FontWeight.bold) ,)),
                      ListTile( title: Math.tex("  ${r'\ V_o^-'}= Reflected${r'\,'}Voltage  ", textStyle: TextStyle(fontSize: 20 , color: Colors.red , fontWeight: FontWeight.bold) ,)),
                    ],),

                  SizedBox(height: 20),
                  ExpansionTile(title: Math.tex(" Current${r'\;\;'}I(Z)  " , textStyle:  TextStyle(fontSize: 23 ,  fontWeight: FontWeight.bold),),
                    backgroundColor: Colors.grey[200],
                    children:[
                      ListTile( title: Math.tex("I(Z) =${r'\frac {1}{Z_o}'}(${r'\ V_o^+'}${r'\,'}e^{-j${ r'\beta '}z} - ${r'\ V_o^-'}${r'\,'}e^{j${ r'\beta '}z})" , textStyle: TextStyle(fontSize: 25 ,) ,)),
                      ListTile( title: Math.tex(" ${r'\quad'}${r'\quad'}${r'\quad'}= ${r'\frac {V_o^+}{Z_o}'}${r'\,'}e^{-j${ r'\beta '}z}(1- ${r'\Gamma_L'}e^{j2${ r'\beta '}z})${r'\ A'} ", textStyle: TextStyle(fontSize: 25 ,) ,)),

                    ],),

                  SizedBox(height: 20),
                  ExpansionTile(title: Math.tex("Power${r'\;\;'}(${r'\! P_L'})  " , textStyle:  TextStyle(fontSize: 23 ,  fontWeight: FontWeight.bold),),
                    backgroundColor: Colors.grey[200],
                    children:[
                      ListTile( title: Math.tex("${r'\! P_L= \frac{V_g ^{\;\,2}}{8Z_g}'}(1-|${r'\Gamma_L'}|^2)${r'\ W'}", textStyle: TextStyle(fontSize: 25 ,)),),
                      ListTile( title: Math.tex("", textStyle: TextStyle(fontSize: 20 , color: Colors.red) ,  )),
                      ListTile( title: Math.tex("${r'\! P_L= \frac {1}{2}|\frac{V_g }{Z_g+ Z_{in}}|^2\;Re(Z_{in})'}${r'\ W'}", textStyle: TextStyle(fontSize: 25 ,)),),
                      ListTile( title: Math.tex("  ${r'\ V_g'}=   ", textStyle: TextStyle(fontSize: 20 , color: Colors.red , fontWeight: FontWeight.bold) ,)),
                      ListTile( title: Math.tex("  ${r'\ Z_g'}=  ", textStyle: TextStyle(fontSize: 20 , color: Colors.red , fontWeight: FontWeight.bold) ,)),
                    ],),

                  SizedBox(height: 20),
                  ExpansionTile(title: Math.tex("${r'Power\;Available\;\;'}(${r'\! P_{av}'})  " , textStyle:  TextStyle(fontSize: 23 ,  fontWeight: FontWeight.bold),),
                    backgroundColor: Colors.grey[200],
                    children:[
                      ListTile( title: Math.tex("${r'\! P_{av}= \frac{V_g ^{\;\,2}}{8Z_g}'}${r'\ \quad if\; Z_g = Z_o'}", textStyle: TextStyle(fontSize: 25 ,)),),
                    ],),



















                ],
              ),
            ),
          ),
        ),
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
}







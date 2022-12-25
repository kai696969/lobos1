import 'package:flutter/material.dart';
import 'package:extended_math/extended_math.dart';
import 'package:flutter_math_fork/flutter_math.dart';
import 'package:lobos/rcPage.dart';
import 'package:lobos/rczPage.dart';
import 'package:lobos/zInPage.dart';
import 'package:lobos/zInusingRcPage.dart';
import 'package:lobos/formulaPage.dart';
import 'Voplus.dart';
import 'calculation.dart';


class vZ extends StatelessWidget {
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



  vZ({required this.j , required this.imaginaryZL , required this.realZL ,
    required this.realZo , required this.imaginaryZo , required this.rcvalue1,
    required this.zovalue , required this.zlvalue , required this.rcbtm , required this.rctop ,required this.rcbtm1 , required this.rctop1 ,
    required this.beta , required this.zPosition , required this.SWR , required this.thetaRc,required this.thetaRo,required this.swrValue
    ,required this.thetaRo1, required this.swrValue1 , required this.thetaRo2 , required this.j2betaZpos1 , required this.j2betaZpos
    ,required this.rcAtz , required this.rcAtz1, required this.zInusingRcz1 , required this.zInusingRcz , required this.zInusingRczTop,
    required this.zInusingRczBtm, required this.zInusingRczTop1, required this.zInusingRczBtm1, required this.Zg , required this.Vg,
    required this.VZ , required this.VZ1 , required this.voplus , required this.voplus1
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Math.tex("${r'\ V_{in}'}" , textStyle:  TextStyle(fontSize: 28  , color: Colors.black ) ,),
        centerTitle: true,
        backgroundColor: Colors.yellow[800],
      ),
      body: Container(
        child: Padding(
          padding:  EdgeInsets.only(left: 10.0, right: 10.0 , top: 30.0),
          child: SingleChildScrollView(
            child:  Column(
              children: [
                Text("Result:  ${VZ1.re.toStringAsFixed(3)} + ${VZ1.im.toStringAsFixed(3)}j \n   "  , style: TextStyle(color: Colors.black , fontSize: 25, ) ),
                ExpansionTile(

                  title: Text('More',style:TextStyle(color: Colors.black ),),
                  backgroundColor: Colors.grey[200],
                  collapsedBackgroundColor: Colors.yellow[300],
                  children: [
                    ListTile( title: Math.tex("V(-${r'\ell'}) = ${r'\ V_{in}'} = ${r'\frac {Z_{in}}{Z_{in}+ Z_g}'}${r'\ V_g'}",  textStyle: TextStyle(fontSize: 25 , color: Colors.deepPurple , fontWeight: FontWeight.bold) ,  )),
                    ListTile(title: Text.rich(TextSpan(text: 'Step 1:   ', style: TextStyle(fontSize: 25 ,  decoration: TextDecoration.underline,),),)),
                    ListTile(title: Math.tex("${r'\ Z_{in} ='}${zInusingRcz1.re.toStringAsFixed(3)} + ${zInusingRcz1.im.toStringAsFixed(3)}j", textStyle: TextStyle(fontSize: 25 , ),)),
                    ListTile(title: Math.tex("${r'\ Z_{in} + Z_g ='}${zInusingRcz1.re.toStringAsFixed(3)} + ${zInusingRcz1.im.toStringAsFixed(3)}j + ${Zg}", textStyle: TextStyle(fontSize: 22 , ),)),
                    ListTile(title: Math.tex("${r'\quad'}${r'\quad'} ${r'\quad'}${r'\quad'}= ${(zInusingRcz1.re + Zg).toStringAsFixed(3)} + ${zInusingRcz1.im.toStringAsFixed(3)}j ", textStyle: TextStyle(fontSize: 25 , ),)),
                    ListTile( title: Math.tex("${r'\frac {Z_{in}}{Z_{in}+ Z_g}'} = ${(((zInusingRcz.module/(sqrt((zInusingRcz1.re + Zg)* (zInusingRcz1.re + Zg) + (zInusingRcz1.im * zInusingRcz1.im )))))*cos((zInusingRcz1.argument-atan(((zInusingRcz1.im)/(zInusingRcz1.re + Zg)))))).toStringAsFixed(3)}+${(((zInusingRcz.module/(sqrt((zInusingRcz1.re + Zg)* (zInusingRcz1.re + Zg) + (zInusingRcz1.im * zInusingRcz1.im )))))*sin((zInusingRcz1.argument-atan(((zInusingRcz1.im)/(zInusingRcz1.re + Zg)))))).toStringAsFixed(3)}j", textStyle: TextStyle(fontSize: 25 , ),  )),
                    ListTile( title: Math.tex("${r'\frac {Z_{in}}{Z_{in}+ Z_g}'}V_g = (${(((zInusingRcz.module/(sqrt((zInusingRcz1.re + Zg)* (zInusingRcz1.re + Zg) + (zInusingRcz1.im * zInusingRcz1.im )))))*cos((zInusingRcz1.argument-atan(((zInusingRcz1.im)/(zInusingRcz1.re + Zg)))))).toStringAsFixed(3)}+${(((zInusingRcz.module/(sqrt((zInusingRcz1.re + Zg)* (zInusingRcz1.re + Zg) + (zInusingRcz1.im * zInusingRcz1.im )))))*sin((zInusingRcz1.argument-atan(((zInusingRcz1.im)/(zInusingRcz1.re + Zg)))))).toStringAsFixed(3)}j)*${Vg}", textStyle: TextStyle(fontSize: 25 , ),  )),
                    ListTile(title: Math.tex("${r'\quad'}${r'\quad'} ${r'\quad'}${r'\quad'}${r'\quad'}=  ${VZ1.re.toStringAsFixed(3)} + ${VZ1.im.toStringAsFixed(3)}j", textStyle: TextStyle(fontSize: 25 , ),)),
                    ExpansionTile(title: Text("Details ",style: TextStyle(fontSize: 20 ,color: Colors.blue)),
                        children: [
                          ListTile( title: Math.tex("A+jB", textStyle: TextStyle(fontSize: 25) ,)),
                          ListTile( title: Math.tex(" ${'='} ${r'\sqrt{A^2 + B^2} \angle'} ${r'\tan^-1'}{(} ${r'\frac{B}{A}'}{)}", textStyle: TextStyle(fontSize: 25) ,)),
                          ListTile( title: Math.tex("{${(zInusingRcz1).re.toStringAsFixed(3)}+${(zInusingRcz1).im.toStringAsFixed(3)}j}", textStyle: TextStyle(fontSize: 25) ,)),
                          ListTile( title: Math.tex("${'=' }${zInusingRcz1.module.toStringAsFixed(3)}${r'\angle'}${zInusingRcz1.argument.toStringAsFixed(3)}rad", textStyle: TextStyle(fontSize: 25) ,)),
                          ListTile( title: Math.tex("{ ${(zInusingRcz1.re + Zg).toStringAsFixed(3)}+${(zInusingRcz1).im.toStringAsFixed(3)}j} " , textStyle: TextStyle(fontSize: 25) ,)),
                          ListTile( title: Math.tex("${'=' }${(sqrt((zInusingRcz1.re + Zg)* (zInusingRcz1.re + Zg) + (zInusingRcz1.im * zInusingRcz1.im ) )).toStringAsFixed(3)}${r'\angle'}${atan(((zInusingRcz1.im)/(zInusingRcz1.re + Zg))).toStringAsFixed(3)}rad", textStyle: TextStyle(fontSize: 25) ,)),
                          ListTile( title: Math.tex(" ${r'\frac'}{${zInusingRcz1.module.toStringAsFixed(3)}}{${(sqrt((zInusingRcz1.re + Zg)* (zInusingRcz1.re + Zg) + (zInusingRcz1.im * zInusingRcz1.im ) )).toStringAsFixed(3)}}${r'\angle'}(${zInusingRcz1.argument.toStringAsFixed(3)})-(${atan(((zInusingRcz1.im)/(zInusingRcz1.re + Zg))).toStringAsFixed(3)})rad" , textStyle: TextStyle(fontSize: 25) ,)),
                          ListTile( title: Math.tex("= ${(zInusingRcz.module/(sqrt((zInusingRcz1.re + Zg)* (zInusingRcz1.re + Zg) + (zInusingRcz1.im * zInusingRcz1.im ) ))).toStringAsFixed(3)}${r'\angle'}${(zInusingRcz1.argument-atan(((zInusingRcz1.im)/(zInusingRcz1.re + Zg)))).toStringAsFixed(3)}rad" , textStyle: TextStyle(fontSize: 25) ,)),
                          ListTile( title: Math.tex("{=}${(((zInusingRcz.module/(sqrt((zInusingRcz1.re + Zg)* (zInusingRcz1.re + Zg) + (zInusingRcz1.im * zInusingRcz1.im )))))*cos((zInusingRcz1.argument-atan(((zInusingRcz1.im)/(zInusingRcz1.re + Zg)))))).toStringAsFixed(3)}+${(((zInusingRcz.module/(sqrt((zInusingRcz1.re + Zg)* (zInusingRcz1.re + Zg) + (zInusingRcz1.im * zInusingRcz1.im )))))*sin((zInusingRcz1.argument-atan(((zInusingRcz1.im)/(zInusingRcz1.re + Zg)))))).toStringAsFixed(3)}j", textStyle: TextStyle(fontSize: 25 ,) ,  )),
                          ExpansionTile(title: Text("Details ",style: TextStyle(fontSize: 20 ,color: Colors.blue)),
                            children: [
                              ListTile( title: Math.tex("${(zInusingRcz.module/(sqrt((zInusingRcz1.re + Zg)* (zInusingRcz1.re + Zg) + (zInusingRcz1.im * zInusingRcz1.im )))).toStringAsFixed(3)}cos(${(zInusingRcz1.argument-atan(((zInusingRcz1.im)/(zInusingRcz1.re + Zg)))).toStringAsFixed(3)})+${(zInusingRcz.module/(sqrt((zInusingRcz1.re + Zg)* (zInusingRcz1.re + Zg) + (zInusingRcz1.im * zInusingRcz1.im )))).toStringAsFixed(3)}sin(${(zInusingRcz1.argument-atan(((zInusingRcz1.im)/(zInusingRcz1.re + Zg)))).toStringAsFixed(3)})j", textStyle: TextStyle(fontSize: 25 ,) ,  )),
                              ListTile( title: Math.tex("{=}${(((zInusingRcz.module/(sqrt((zInusingRcz1.re + Zg)* (zInusingRcz1.re + Zg) + (zInusingRcz1.im * zInusingRcz1.im )))))*cos((zInusingRcz1.argument-atan(((zInusingRcz1.im)/(zInusingRcz1.re + Zg)))))).toStringAsFixed(3)}+${(((zInusingRcz.module/(sqrt((zInusingRcz1.re + Zg)* (zInusingRcz1.re + Zg) + (zInusingRcz1.im * zInusingRcz1.im )))))*sin((zInusingRcz1.argument-atan(((zInusingRcz1.im)/(zInusingRcz1.re + Zg)))))).toStringAsFixed(3)}j", textStyle: TextStyle(fontSize: 25 ,) ,  )),
                            ],)
                        ]
                    ),

                  ],
                ),

              ],
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





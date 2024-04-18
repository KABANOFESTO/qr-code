
import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:my_project/result_screen.dart';

const bgcolor= Color (0xfffafafa);

 class QRScanner extends StatefulWidget {
  const QRScanner({super.key});

  @override
  State<QRScanner> createState() => _QRScannerState();
}

class _QRScannerState extends State<QRScanner> {

  bool isScanCompleted = false;
  void closeScreen(){
    isScanCompleted = false;
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgcolor,
      appBar: AppBar(
        centerTitle:true ,
        title:const Text(
                   "QR Scanner",
                    style:TextStyle(
                      color: Colors.black87,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1,
                    )
                    ),
      ),
      body: Container(
        width: double.infinity,
        padding:const EdgeInsets.all(16),
        child: Column(
          children: [
           const Expanded (
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("place the QR code in the area",
                    style:TextStyle(
                      color: Colors.black87,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1,
                    )
                    ),
                    SizedBox(
                      height: 10,

                    ),
                    Text("Scanning will be started automatically",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black54,

                    ),
                    ),
                  ],
                ),
                ),
            Expanded(
              flex: 4,
              child:MobileScanner(
                 allowDuplicates: true,
                
               onDetect: (BarcodeCapture barcode, {dynamic args}) {

                if(!isScanCompleted){
                  String code = barcode.rawValue  ?? '---';
                  isScanCompleted = true;
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>ResultScreen(
                    closeScreen:closeScreen,
                    code: code,
                    )));
                }
               },
              )
                ),
            Expanded(
              child:  Container(
                alignment: Alignment.center,
                child:const Text(
                     "Developed by kabano",
                    style:TextStyle(
                      color: Colors.black87,
                      fontSize: 14,
                      letterSpacing: 1,
                    )
                    ),
                )
                ),
          ],
        ),
      ),
      );
  }
}
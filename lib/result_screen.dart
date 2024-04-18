import 'package:flutter/material.dart';
import 'package:my_project/qr_scanner.dart';
import 'package:qr_flutter/qr_flutter.dart';

class ResultScreen extends StatelessWidget {
  final String code;
  final Function() closeScreen;

  const ResultScreen({super.key,required this.closeScreen,required this.code});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgcolor,
       appBar: AppBar(
        leading: IconButton(
          onPressed: (){
            closeScreen();
            Navigator.pop(context);
        }, 
        icon:const Icon(Icons.arrow_back_ios_new_rounded, 
        color: Colors.black87,
        )),
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
      body:Padding(
        padding:const EdgeInsets.all(12.0),
        child: Column(
          children: [

            QrImageView(
              data: code,
              size:  150,
              version: QrVersions.auto,
              ),

          const  Text(
                   "Scanned result",
                    style:TextStyle(
                      fontSize: 16,
                      color: Colors.black54,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1,
                    )
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                 Text(
                   code,
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.black87,
                      letterSpacing: 1,
                    )
                    ),
                    const  SizedBox(
                      height: 10,
                    ),
                   SizedBox (
                    width:MediaQuery.of(context).size.width - 100,
                    height: 48,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                      ),
                      onPressed: () {},
                      child:const Text(
                   "Copy",
                    style:TextStyle(
                      fontSize: 16,
                      color: Colors.black87,
                      letterSpacing: 1,
                    ),
                    ),
                    ),
                    ),
          ],
        ),
        ),
    );
  }
}
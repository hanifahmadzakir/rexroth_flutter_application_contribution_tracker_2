import 'package:flutter/material.dart';
import 'package:slide_to_confirm/slide_to_confirm.dart';

class CheckinButton extends StatefulWidget {
  const CheckinButton({super.key});

  @override
  State<CheckinButton> createState() => _CheckinButtonState();
}

class _CheckinButtonState extends State<CheckinButton> {

  void onConfirmation(){
    print('Check-In!!!');
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () => showDialog(
                  context: context, 
                  builder: (BuildContext context) => AlertDialog(
                    title: const Text('Please Input Job/Assignment Title'),
                    content: const TextField(),
                    actions: <Widget>[
                      ConfirmationSlider(
                        onConfirmation: (){
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Check-in confirmed!')),
                          );
                          onConfirmation();
                          Navigator.pop(context);
                        }
                        )
                    ],
                  ),
                ),
                style: ButtonStyle(),
                child: Text('Check-in', style: TextStyle(fontSize: 20)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

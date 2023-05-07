import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:client/globals.dart' as globals;

ShowDialog(BuildContext context, String name, Widget list){
  return showDialog(
      context: context,
      builder: (BuildContext context) {
        return Center(
          child: Material(
            type: MaterialType.transparency,
            child: Container(
              width: kIsWeb
                  ? globals.scaleWidthWeb * 2
                  : double.infinity,
              height: kIsWeb
                  ? globals.scaleHeight * 25
                  : globals.scaleHeight * 17,
              decoration: BoxDecoration(
                color: Theme.of(context).cardColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: SingleChildScrollView(
                padding: EdgeInsets.all(globals.scaleHeight),
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 2,
                        ),
                        borderRadius:
                        const BorderRadius.all(
                            Radius.circular(5)),
                      ),
                      height: globals.scaleHeight * 3,
                      child: Center(
                        child: FittedBox(
                          child: Text(
                            name,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          ),
                        ),
                      ),
                    ),
                    globals.space(),
                    list,
                  ],
                ),
              ),
            ),
          ),
        );
      });
}
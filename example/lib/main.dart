import 'package:css_units/css_units.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Example app for css_units package',
      debugShowCheckedModeBanner: false,
      home: MyAppContent(),
    );
  }
}

class MyAppContent extends StatelessWidget {
  const MyAppContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CssViewportUnits.initContextSizes(context);
    return Scaffold(
      appBar: AppBar(title: const Text("Example css_units package")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 6.vmin,
              child: Text(
                '60 vmin width',
                style: TextStyle(fontSize: 5.vmin),
              ),
            ),
            Container(
              alignment: Alignment.center,
              width: 60.vmin,
              height: 60.vmin,
              margin: EdgeInsets.all(1.vmin),
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(1.vmin),
              ),
              child: Text(
                "Text 2 rem",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 2.rem,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 6.vmin),
          ],
        ),
      ),
    );
  }
}

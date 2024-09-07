import 'package:flutter/material.dart';
import 'package:weatherapp/views/search_view.dart';

class ErrorView extends StatelessWidget {
  const ErrorView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xffFFFFFF),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return SearchView();
                }));
              },
              icon: Icon(
                Icons.search_outlined,
                color: Color(0xff6B63FF),
                size: 30,
              )),
        ],
      ),
      backgroundColor: const Color(0xffFFFFFF),
      body: const Center(
        child: Text(
          'OOPS! There was an error',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,
            color: Color(0xff6B63FF),
          ),
        ),
      ),
    );
  }
}

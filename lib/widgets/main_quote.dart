import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:quote_generator_ho/widgets/my_icon.dart';
import '../helpers/colors.dart';
import '../helpers/quote.dart';
import 'package:http/http.dart' as http;

Future<Quote> getQuote() async {
  final response = await http.get(Uri.parse("https://api.quotable.io/random"));

  if (response.statusCode == 200) {
    return Quote.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('failed to load');
  }
}

class MainQuote extends StatefulWidget {
  const MainQuote({super.key});

  @override
  State<MainQuote> createState() => _MainQuoteState();
}

class _MainQuoteState extends State<MainQuote> {
  Future<Quote?>? quote;
  IconData theIcon = start;
  void getQ() {
    setState(() {
      quote = getQuote();
      theIcon = retry;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(28.0),
      child: Container(
        padding: const EdgeInsets.all(28),
        color: tblack15,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              FutureBuilder<Quote?>(
                  future: quote,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (snapshot.connectionState ==
                        ConnectionState.none) {
                      return const Text(
                        'Click the buttton to get a quote! :)',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      );
                    } else if (snapshot.hasData) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(
                            "   \"${snapshot.data!.content}\"",
                            textAlign: TextAlign.left,
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 30,
                                fontFamily: 'imprima'),
                          ),
                          const SizedBox(height: 20),
                          Text(
                            snapshot.data!.author,
                            textAlign: TextAlign.right,
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontFamily: 'imprima'),
                          )
                        ],
                      );
                    } else if (snapshot.hasError) {
                      return Text("${snapshot.error}");
                    } else {
                      return const Text('data');
                    }
                  }),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () => getQ(),
                    child: MyIcon(
                      theIcon: theIcon,
                    ),
                  ),
                  const SizedBox(
                    width: 50,
                  ),
                  InkWell(
                    onTap: () => getQ(),
                    child: MyIcon(
                      theIcon: heartOutline,
                    ),
                  ),
                ],
              ),
            ]),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:proyect_practic_concept/presentation/providers/chat_provider.dart';
import 'package:proyect_practic_concept/presentation/widget/screen/chat_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => ChatProvider())],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            leading: const Padding(
              padding: EdgeInsets.all(4.0),
              child: CircleAvatar(
                backgroundImage: NetworkImage(
                    'https://scontent-scl2-1.xx.fbcdn.net/v/t39.30808-6/423716597_439357878635716_2349199792506771469_n.jpg?_nc_cat=106&ccb=1-7&_nc_sid=6ee11a&_nc_eui2=AeFM86_nO9D956SUBKcGEF1DefGrs-6yoNh58auz7rKg2EurGQL9CRpDEBM_vkG4fsDeAQIL6PMcxJPP1uNDY3pY&_nc_ohc=RENJUrXmy3sQ7kNvgFSFSxB&_nc_ht=scontent-scl2-1.xx&oh=00_AYAFTb9IeHFx6OxpMpQ5BqV9Fnp_bCsz7IOGx57--q5UVw&oe=668E53D0'),
              ),
            ),
            title: const Text('mi amor <3'),
          ),
          body: const ChatScreen(),
        ),
      ),
    );
  }
}

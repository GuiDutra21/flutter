import 'package:chat/core/services/notification/chat_notification_service.dart';
import 'package:chat/pages/auth_or_app_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    final colorScheme = ColorScheme.fromSeed(
      seedColor: Colors.blue,
      primary: Colors.blue[700],
      onPrimary: Colors.white,
      brightness: Brightness.light, // ou Brightness.dark para modo escuro
    );

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ChatNotificationService())
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: colorScheme,
          useMaterial3: true, // Habilita Material Design 3
          scaffoldBackgroundColor: Colors.white,
      
          appBarTheme: AppBarTheme(
            backgroundColor: colorScheme.primary,
            foregroundColor: colorScheme.onPrimary,
            centerTitle: true
          ),
      
          textTheme: const TextTheme(
            bodyMedium: TextStyle(fontSize: 16),
          ),
      
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              backgroundColor: colorScheme.primary,
              foregroundColor: colorScheme.onPrimary,
            ),
          
          ),
          iconTheme: IconThemeData(
            color: Colors.white
          )
        ),
        home: const AuthOrApp(),
      ),
    );
  }
}

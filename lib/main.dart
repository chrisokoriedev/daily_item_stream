import 'core/app_import.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(ItemAdapter());
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        buttonTheme: const ButtonThemeData(shape: StadiumBorder()),
        colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.deepPurple, brightness: Brightness.dark),
        useMaterial3: true,
      ),
      home: const Homepage(),
    );
  }
}

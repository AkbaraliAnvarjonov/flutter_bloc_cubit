import 'package:flutter/material.dart';
import 'package:flutter_bloc_cubit/ui/calc_area_page/calc_area_page.dart';
import 'package:flutter_bloc_cubit/ui/cars_consumer_page/cars_page.dart';
import 'package:flutter_bloc_cubit/ui/text_maker_page/text_maker_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const CalcAreaPage(),
                    )),
                child: const Text("Calc Area"),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const TextFieldPage(),
                    )),
                child: const Text("Text Maker"),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const CarsPage(),
                    )),
                child: const Text("Cars Page Consumer"),
              ),
              const SizedBox(height: 16),
              // ElevatedButton(
              //   onPressed: () => Navigator.push(
              //       context,
              //       MaterialPageRoute(
              //         builder: (context) => const CarsPageBlocBuild(),
              //       )),
              //   child: const Text("Cars Page BlocBuilder"),
              // )
            ]),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_cubit/bloc/area_calc/area_calc_cubit.dart';
import 'package:flutter_bloc_cubit/bloc/area_calc/area_calc_state.dart';

class CalcAreaPage extends StatelessWidget {
  const CalcAreaPage({super.key});

  @override
  Widget build(BuildContext context) {
    num number = 0;
    return Scaffold(
        appBar: AppBar(
          title: const Text("Calculate Area Page"),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(12),
              child: TextFormField(
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(border: OutlineInputBorder()),
                onChanged: (value) {
                  number = double.parse(value);
                },
              ),
            ),
            BlocBuilder<AreaCalcCubit, AreaCalcState>(
              builder: (context, state) {
                if (state is CircleAreaState) {
                  return Text(
                    "This is Circle Area:${state.areaResult}",
                    style: const TextStyle(
                      fontSize: 24,
                      color: Colors.black,
                    ),
                  );
                } else if (state is SquareAreaState) {
                  return Text(
                    "This is Square Area:${state.areaResult}",
                    style: const TextStyle(
                      fontSize: 24,
                      color: Colors.black,
                    ),
                  );
                } else if (state is TriangleAreaState) {
                  return Text(
                    "This is Square Area:${state.areaResult}",
                    style: const TextStyle(
                      fontSize: 24,
                      color: Colors.black,
                    ),
                  );
                }

                return const Text("NO Data");
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                    onPressed: () {
                      BlocProvider.of<AreaCalcCubit>(context)
                          .circleArea(number);
                    },
                    icon: const Icon(Icons.circle)),
                IconButton(
                    onPressed: () {
                      BlocProvider.of<AreaCalcCubit>(context)
                          .squareArea(number);
                    },
                    icon: const Icon(Icons.square)),
                IconButton(
                    onPressed: () {
                      BlocProvider.of<AreaCalcCubit>(context)
                          .triangleArea(number);
                    },
                    icon: const Icon(Icons.train_sharp)),
              ],
            )
          ],
        ));
  }
}

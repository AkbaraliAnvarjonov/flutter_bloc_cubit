import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_cubit/bloc/upper_case/text_maekr_cubit.dart';

class TextFieldPage extends StatelessWidget {
  const TextFieldPage({super.key});

  @override
  Widget build(BuildContext context) {
    String word;
    TextMakerCubit textMakerCubit = TextMakerCubit();
    return BlocProvider(
      create: (context) => textMakerCubit,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Text Maker Page"),
        ),
        body: BlocBuilder<TextMakerCubit, String>(
          builder: (context, state) {
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: TextFormField(
                    keyboardType: TextInputType.text,
                    decoration:
                        const InputDecoration(border: OutlineInputBorder()),
                    onChanged: (value) {
                      word = value;
                      BlocProvider.of<TextMakerCubit>(context)
                          .toUpperCase(word);
                    },
                  ),
                ),
                const SizedBox(height: 12),
                Text(state),
              ],
            );
          },
        ),
      ),
    );
  }
}

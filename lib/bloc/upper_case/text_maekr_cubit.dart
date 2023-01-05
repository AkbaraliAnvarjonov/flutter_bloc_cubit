import 'package:flutter_bloc/flutter_bloc.dart';

class TextMakerCubit extends Cubit<String> {
  TextMakerCubit() : super("");

  toUpperCase(String word) {
    emit(word.toUpperCase());
  }
}

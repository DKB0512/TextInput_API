import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:text_input_api/services/textInputServices.dart';
import '../services/name_lang.dart';
part 'textinputb_event.dart';
part 'textinputb_state.dart';

class TextinputbBloc extends Bloc<TextinputbEvent, TextinputbState> {
  final TextInputService _inputService;

  TextinputbBloc(this._inputService) : super(TextinputbInitial()) {
    on<LoadApiEvent>((event, emit) async {
      emit(TextinputLoading());
      final resultString =
          await _inputService.getTextInputBack(event.data, event.lang);
      print(resultString);
      emit(
        TextinputbLoaded(
          resultString.httpEnWikipediaOrgWiki1,
          resultString.httpEnWikipediaOrgWiki2,
          resultString.httpEnWikipediaOrgWiki3,
          resultString.httpEnWikipediaOrgWiki4,
          resultString.httpEnWikipediaOrgWiki5,
          resultString.httpEnWikipediaOrgWiki6,
          resultString.httpEnWikipediaOrgWiki7,
          resultString.httpEnWikipediaOrgWiki8,
          resultString.httpEnWikipediaOrgWiki9,
          resultString.httpEnWikipediaOrgWiki10,
        ),
      );
    });
  }
}

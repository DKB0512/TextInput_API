part of 'textinputb_bloc.dart';

@immutable
abstract class TextinputbEvent extends Equatable {}

class LoadApiEvent extends TextinputbEvent {
  final String data;
  final String lang;

  LoadApiEvent(this.data, this.lang);
  @override
  List<Object?> get props => [data, lang];
}

part of 'textinputb_bloc.dart';

@immutable
abstract class TextinputbState extends Equatable {}

class TextinputbInitial extends TextinputbState {
  @override
  List<Object?> get props => [];
}

class TextinputLoading extends TextinputbState {
  @override
  List<Object?> get props => [];
}

class TextinputbLoaded extends TextinputbState {
  final String finalResult1;
  final String finalResult2;
  final String finalResult3;
  final String finalResult4;
  final String finalResult5;
  final String finalResult6;
  final String finalResult7;
  final String finalResult8;
  final String finalResult9;
  final String finalResult10;

  TextinputbLoaded(
      this.finalResult1,
      this.finalResult2,
      this.finalResult3,
      this.finalResult4,
      this.finalResult5,
      this.finalResult6,
      this.finalResult7,
      this.finalResult8,
      this.finalResult9,
      this.finalResult10);

  @override
  List<Object?> get props => [finalResult1, finalResult2];
}

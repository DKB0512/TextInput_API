import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:text_input_api/services/textInputServices.dart';

import 'bloc/textinputb_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final formKey = GlobalKey<FormState>();
  String data = "";
  String dropdownValue = 'en';
  TextEditingController _textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TextinputbBloc(
        RepositoryProvider.of<TextInputService>(context),
      ),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: const Text("TextInput Application"),
        ),
        body: Container(
          margin: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 15.0),
          child: Column(
            children: [
              _textInputField(),
              const SizedBox(
                height: 15.0,
              ),
              _dropDownButton(),
              const SizedBox(
                height: 10,
              ),
              BlocBuilder<TextinputbBloc, TextinputbState>(
                  builder: (context, state) {
                if (state is TextinputbInitial) {
                  return Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          data = _textEditingController.text.toString();
                          BlocProvider.of<TextinputbBloc>(context)
                              .add(LoadApiEvent(data, dropdownValue));
                        },
                        child: Container(
                          height: 50,
                          width: 100,
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Center(
                            child: Text(
                              "Press me",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                }
                if (state is TextinputLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (state is TextinputbLoaded) {
                  return Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          data = _textEditingController.text.toString();
                          BlocProvider.of<TextinputbBloc>(context)
                              .add(LoadApiEvent(data, dropdownValue));
                        },
                        child: Container(
                          height: 50,
                          width: 100,
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Center(
                            child: Text(
                              "Press me",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      Text(
                        state.finalResult1,
                        style: const TextStyle(
                          fontSize: 20.0,
                        ),
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        state.finalResult2,
                        style: const TextStyle(
                          fontSize: 20.0,
                        ),
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        state.finalResult3,
                        style: const TextStyle(
                          fontSize: 20.0,
                        ),
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        state.finalResult4,
                        style: const TextStyle(
                          fontSize: 20.0,
                        ),
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        state.finalResult5,
                        style: const TextStyle(
                          fontSize: 20.0,
                        ),
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        state.finalResult6,
                        style: const TextStyle(
                          fontSize: 20.0,
                        ),
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        state.finalResult7,
                        style: const TextStyle(
                          fontSize: 20.0,
                        ),
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        state.finalResult8,
                        style: const TextStyle(
                          fontSize: 20.0,
                        ),
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        state.finalResult9,
                        style: const TextStyle(
                          fontSize: 20.0,
                        ),
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        state.finalResult10,
                        style: const TextStyle(
                          fontSize: 20.0,
                        ),
                      ),
                    ],
                  );
                }
                return Container();
              }),
            ],
          ),
        ),
      ),
    );
  }

  _textInputField() {
    return TextFormField(
      key: formKey,
      controller: _textEditingController,
      style: const TextStyle(
        fontSize: 20,
      ),
      validator: (value) {
        if (value!.isEmpty) {
          return "Please enter your email id";
        } else {
          return null;
        }
      },
      decoration: const InputDecoration(
        hintText: "Enter Something here",
        hintStyle: TextStyle(
          fontSize: 20,
        ),
      ),
    );
  }

  _dropDownButton() {
    return DropdownButton<String>(
      value: dropdownValue,
      onChanged: (String? value) {
        setState(() {
          dropdownValue = value!;
        });
      },
      items: <String>['en', 'fr', 'es']
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}

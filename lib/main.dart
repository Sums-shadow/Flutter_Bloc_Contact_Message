import 'package:contacta/bloc/contact.bloc.dart';
import 'package:contacta/repositories/contact.repo.dart';
import 'package:contacta/ui/contacts/contact.ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/contact.state.dart';
import 'enums/enums.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider(create: (context)=>ContactBloc(ContactState(contacts: [], errorMessage: "",requestState: RequestState.NONE), new ContactRepository())),

    ], child: MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
 
        primarySwatch: Colors.blue,
      ),
      home: ContactUI(),
    ));
  }
}
 
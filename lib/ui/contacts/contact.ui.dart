import 'package:contacta/bloc/contact.action.dart';
import 'package:contacta/bloc/contact.bloc.dart';
import 'package:contacta/bloc/contact.state.dart';
import 'package:contacta/enums/enums.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ContactUI extends StatelessWidget {
  const ContactUI({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("CONTACTA"),
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                  onPressed: () {
                    context.read<ContactBloc>().add(loadAllContactEvent());
                  },
                  child: Text("All contact")),
              ElevatedButton(
                  onPressed: () {
                    context.read<ContactBloc>().add(loadStudentsEvent());
                  },
                  child: Text("Student")),
              ElevatedButton(
                  onPressed: () {
                    context.read<ContactBloc>().add(loadDeveloperEvent());
                  },
                  child: Text("Developers")),
            ],
          ),
          BlocBuilder<ContactBloc, ContactState>(builder: (context, state) {
            if (state.requestState == RequestState.LOADING) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (state.requestState == RequestState.LOADED) {
              return Builder(builder: (context) {
                return Expanded(
                    child: ListView.builder(
                        itemCount: state.contacts?.length,
                        itemBuilder: (c, i) {
                          return ListTile(
                            title: Row(
                              children: [Text("${state.contacts?[i].name}")],
                            ),
                          );
                        }));
              });
            } else if (state.requestState == RequestState.ERROR) {
              return Center(
                child: Column(
                  children: [
                    Text("Erreur: ${state.errorMessage}"),
                    ElevatedButton(
                        onPressed: () {
                          context.read<ContactBloc>().add(state.currentEvent!);
                        },
                        child: Text("Retry"))
                  ],
                ),
              );
            } else {
              return Center(child: Text("HELLO"));
            }
          })
        ],
      ),
    );
  }
}

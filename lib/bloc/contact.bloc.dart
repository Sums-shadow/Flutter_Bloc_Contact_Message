import 'package:bloc/bloc.dart';
import 'package:contacta/model/contact.model.dart';
import 'package:contacta/repositories/contact.repo.dart';

abstract class ContactEvent {}

class loadAllContactEvent extends ContactEvent {}

class loadStudentsEvent extends ContactEvent {}

class loadDeveloperEvent extends ContactEvent {}

enum RequestState { LOADING, LOADED, ERROR, NONE }

class ContactState {
  List<Contact>? contacts;
  RequestState? requestState;
  String? errorMessage;
  ContactEvent? currentEvent;
  ContactState({this.contacts, this.requestState, this.errorMessage, this.currentEvent}) {}
}

class ContactBloc extends Bloc<ContactEvent, ContactState> {
  ContactRepository? contactRepository;
  ContactBloc(ContactState initialState, this.contactRepository)
      : super(initialState);
  @override
  Stream<ContactState> mapEventToState(ContactEvent event) async* {
    if (event is loadAllContactEvent) {
      yield ContactState(
          contacts: state.contacts, requestState: RequestState.LOADING,currentEvent: event);
      try {
        List<Contact>? cont = await contactRepository?.allContact();
        yield ContactState(contacts: cont, requestState: RequestState.LOADED,currentEvent: event);
      } catch (e) {
        yield ContactState(
            contacts: state.contacts, requestState: RequestState.ERROR,currentEvent: event);
      }
    } else if (event is loadStudentsEvent) {
    } else if (event is loadDeveloperEvent) {}
  }
}

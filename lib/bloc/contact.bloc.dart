import 'package:bloc/bloc.dart';
import 'package:contacta/enums/enums.dart';
import 'package:contacta/model/contact.model.dart';
import 'package:contacta/repositories/contact.repo.dart';

import 'contact.action.dart';
import 'contact.state.dart';






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
       yield ContactState(
          contacts: state.contacts, requestState: RequestState.LOADING,currentEvent: event);
      try {
        List<Contact>? cont = await contactRepository?.contactByType("Student");
        yield ContactState(contacts: cont, requestState: RequestState.LOADED,currentEvent: event);
      } catch (e) {
        yield ContactState(
            contacts: state.contacts, requestState: RequestState.ERROR,currentEvent: event);
      }
    } else if (event is loadDeveloperEvent) {
       yield ContactState(
          contacts: state.contacts, requestState: RequestState.LOADING,currentEvent: event);
      try {
        List<Contact>? cont = await contactRepository?.contactByType("Developer");
        yield ContactState(contacts: cont, requestState: RequestState.LOADED,currentEvent: event);
      } catch (e) {
        yield ContactState(
            contacts: state.contacts, requestState: RequestState.ERROR,currentEvent: event);
      }
    }
  }
}

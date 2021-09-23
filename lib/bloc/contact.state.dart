
import 'package:contacta/enums/enums.dart';
import 'package:contacta/model/contact.model.dart';

import 'contact.action.dart';

class ContactState {
  List<Contact>? contacts;
  RequestState? requestState;
  String? errorMessage;
  ContactEvent? currentEvent;
  ContactState({this.contacts, this.requestState, this.errorMessage, this.currentEvent}) {}
}
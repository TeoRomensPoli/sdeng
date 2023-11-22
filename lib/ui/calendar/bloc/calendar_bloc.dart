// ignore_for_file: unused_import

import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:googleapis/calendar/v3.dart';
import 'package:sdeng/globals/variables.dart';
import 'package:sdeng/repositories/calendar_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'calendar_state.dart';

class CalendarBloc extends Cubit<CalendarState> {
  CalendarBloc() : super(CalendarState());

  final CalendarRepository calendarRepository = GetIt.I.get<CalendarRepository>();

  Future<void> loadCalendar() async {
    try {
      if(Variables.calendarId.isEmpty) {
        emit(state.copyWith(status: CalendarStatus.loaded));
        return;
      }
      List<Event> appointmentList = await calendarRepository.getAllEvents();
      emit(state.copyWith(appointments: appointmentList, calendarId: Variables.calendarId, status: CalendarStatus.loaded));
    } catch (e) {
      log(e.toString());
      emit(state.copyWith(status: CalendarStatus.failure));
    }
  }

  Future<void> setCalendarId(String calendarId) async {
    try {
      Variables.calendarId = calendarId;
      await calendarRepository.setCalendarId(calendarId);
      emit(state.copyWith(calendarId: calendarId));
    } catch (e) {
      log(e.toString());
      emit(state.copyWith(status: CalendarStatus.failure));
    }
  }
}
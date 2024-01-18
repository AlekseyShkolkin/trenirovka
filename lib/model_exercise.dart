import 'dart:ffi';
import 'dart:io';

import 'package:flutter/foundation.dart';

class Exercise {
  int _id;
  String _title;
  String _date;
  String _name;
  String _weight;

  Exercise(
    this._title,
    this._date, [
    this._name,
    this._weight,
  ]);

  Exercise.withId(
    this._id,
    this._title,
    this._date, [
    this._name,
    this._weight,
  ]);

  int get id => _id;
  String get title => _title;
  String get name => _name;
  String get todoDate => _date;
  String get weight => _weight;

  set weight(String newWeight) {
    if ((newWeight?.length ?? 0) <= 255) {
      _weight = newWeight;
    }
  }

  set title(String newTitle) {
    if ((newTitle?.length ?? 0) <= 255) {
      _title = newTitle;
    }
  }

  set todoDate(newDate) {
    _date = newDate;
  }

  set name(String newname) {
    if ((newname?.length ?? 0) <= 255) {
      _name = newname;
    }
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> map = <String, dynamic>{};
    map['title'] = _title;
    map['name'] = _name;
    map['weight'] = _weight;

    if (_id != null) {
      map['id'] = _id;
    }
    return map;
  }

  Exercise.fromExercise(dynamic o) {
    _id = o['id'];
    _title = o['title'];
    _date = o['date'];
    _name = o['name'];
    _weight = o['weight'];
  }
}

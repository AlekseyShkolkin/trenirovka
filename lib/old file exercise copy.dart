import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import './dbhelper_day.dart';
import './model_day.dart';
import './list_day.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class DayDetail extends StatefulWidget {
  const DayDetail({Key key, @required this.day});
  final Day day;
  @override
  State<StatefulWidget> createState() => DayDetailState(day);
}

class DayDetailState extends State<DayDetail> {
  DbHelperDay helperD = DbHelperDay();
  List<Day> todos;

  Day day;
  String locationData = '';

  DateTime dateObsl1; // Дата выбранная для dateObsl1
  DateTime dateObsl2; // Дата выбранная для dateObsl2

  FocusNode focusNode1 = FocusNode();
  FocusNode focusNode2 = FocusNode();
  FocusNode focusNode3 = FocusNode();
  FocusNode focusNode4 = FocusNode();
  FocusNode focusNode5 = FocusNode();

  Color _cardColor = Colors.white;

  TextEditingController titleController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController weightController = TextEditingController();

  bool isEdit;
  final GlobalKey<FormState> _1formKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _2formKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _3formKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _4formKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _5formKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _6formKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _7formKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _8formKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _9formKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _10formKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _11formKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _12formKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _13formKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _14formKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _15formKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _16formKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _17formKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _18formKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _19formKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _20formKey = GlobalKey<FormState>();

  DayDetailState(this.day);

  @override
  void initState() {
    super.initState();
    isEdit = day.titleday == '' ? false : true;
    titleController.text = day.titleday ?? '';
    nameController.text = day.name ?? '';
    weightController.text = day.weightTotal ?? '';
  }

  @override
  Widget build(BuildContext context) {
    const TextStyle textStyle = TextStyle(
      fontSize: 16.0,
      color: Colors.black54,
      fontWeight: FontWeight.w600,
    );

    return DefaultTabController(
      length: 20,
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: _cardColor,
        appBar: AppBar(
            backgroundColor: Theme.of(context).primaryColor,
            title: isEdit
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'ИЗМЕНИТЬ ТРЕНИРОВКУ',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      IconButton(
                        icon: Icon(
                          Icons.delete,
                          color: Color.fromRGBO(187, 30, 16, 1.0),
                          size: 32,
                        ),
                        onPressed: () {
                          debugPrint('Click Floated Back.');
                          confirmDelete();
                        },
                      ),
                      IconButton(
                        icon: Icon(
                          Icons.save,
                          color: Theme.of(context).indicatorColor,
                          size: 32,
                        ),
                        onPressed: () {
                          if (_1formKey.currentState != null) {
                            _1formKey.currentState.validate();
                            saveForm12();
                          } else if (_2formKey.currentState != null) {
                            _2formKey.currentState.validate();
                            saveForm22();
                          } else if (_3formKey.currentState != null) {
                            _3formKey.currentState.validate();
                            saveForm32();
                          } else if (_4formKey.currentState != null) {
                            _4formKey.currentState.validate();
                            saveForm42();
                          } else if (_5formKey.currentState != null) {
                            _5formKey.currentState.validate();
                            saveForm52();
                          } else if (_6formKey.currentState != null) {
                            _6formKey.currentState.validate();
                            saveForm62();
                          } else if (_7formKey.currentState != null) {
                            _7formKey.currentState.validate();
                            saveForm72();
                          } else if (_8formKey.currentState != null) {
                            _8formKey.currentState.validate();
                            saveForm82();
                          } else if (_9formKey.currentState != null) {
                            _9formKey.currentState.validate();
                            saveForm92();
                          } else if (_10formKey.currentState != null) {
                            _10formKey.currentState.validate();
                            saveForm102();
                          } else if (_11formKey.currentState != null) {
                            _11formKey.currentState.validate();
                            saveForm112();
                          } else if (_12formKey.currentState != null) {
                            _12formKey.currentState.validate();
                            saveForm122();
                          } else if (_13formKey.currentState != null) {
                            _13formKey.currentState.validate();
                            saveForm132();
                          } else if (_14formKey.currentState != null) {
                            _14formKey.currentState.validate();
                            saveForm142();
                          } else if (_15formKey.currentState != null) {
                            _15formKey.currentState.validate();
                            saveForm152();
                          } else if (_16formKey.currentState != null) {
                            _16formKey.currentState.validate();
                            saveForm162();
                          } else if (_17formKey.currentState != null) {
                            _17formKey.currentState.validate();
                            saveForm172();
                          } else if (_18formKey.currentState != null) {
                            _18formKey.currentState.validate();
                            saveForm182();
                          } else if (_19formKey.currentState != null) {
                            _19formKey.currentState.validate();
                            saveForm192();
                          } else if (_20formKey.currentState != null) {
                            _20formKey.currentState.validate();
                            saveForm202();
                          }
                        },
                      ),
                    ],
                  )
                : Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'ДОБАВИТЬ ТРЕНИРОВКУ',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      IconButton(
                        icon: Icon(
                          Icons.save,
                          color: Theme.of(context).indicatorColor,
                          size: 32,
                        ),
                        onPressed: () {
                          if (_1formKey.currentState != null) {
                            _1formKey.currentState.validate();
                            saveForm1();
                          } else if (_2formKey.currentState != null) {
                            _2formKey.currentState.validate();
                            saveForm2();
                          } else if (_3formKey.currentState != null) {
                            _3formKey.currentState.validate();
                            saveForm3();
                          } else if (_4formKey.currentState != null) {
                            _4formKey.currentState.validate();
                            saveForm4();
                          } else if (_5formKey.currentState != null) {
                            _5formKey.currentState.validate();
                            saveForm5();
                          } else if (_6formKey.currentState != null) {
                            _6formKey.currentState.validate();
                            saveForm6();
                          } else if (_7formKey.currentState != null) {
                            _7formKey.currentState.validate();
                            saveForm7();
                          } else if (_8formKey.currentState != null) {
                            _8formKey.currentState.validate();
                            saveForm8();
                          } else if (_9formKey.currentState != null) {
                            _9formKey.currentState.validate();
                            saveForm9();
                          } else if (_10formKey.currentState != null) {
                            _10formKey.currentState.validate();
                            saveForm10();
                          } else if (_11formKey.currentState != null) {
                            _11formKey.currentState.validate();
                            saveForm11();
                          } else if (_12formKey.currentState != null) {
                            _12formKey.currentState.validate();
                            saveForm121();
                          } else if (_13formKey.currentState != null) {
                            _13formKey.currentState.validate();
                            saveForm13();
                          } else if (_14formKey.currentState != null) {
                            _14formKey.currentState.validate();
                            saveForm14();
                          } else if (_15formKey.currentState != null) {
                            _15formKey.currentState.validate();
                            saveForm152();
                          } else if (_16formKey.currentState != null) {
                            _16formKey.currentState.validate();
                            saveForm16();
                          } else if (_17formKey.currentState != null) {
                            _17formKey.currentState.validate();
                            saveForm17();
                          } else if (_18formKey.currentState != null) {
                            _18formKey.currentState.validate();
                            saveForm18();
                          } else if (_19formKey.currentState != null) {
                            _19formKey.currentState.validate();
                            saveForm19();
                          } else if (_20formKey.currentState != null) {
                            _20formKey.currentState.validate();
                            saveForm20();
                          }
                        },
                      ),
                    ],
                  ),
            bottom: TabBar(
              indicator: UnderlineTabIndicator(
                borderSide: BorderSide(
                  width: 4,
                  color: Theme.of(context).indicatorColor,
                ),
              ),
              labelStyle: TextStyle(
                fontSize: 44,
                color: Theme.of(context).accentColor, // цвет выбранной иконки
              ),
              unselectedLabelStyle: TextStyle(
                // fontSize: 32,
                color:
                    Theme.of(context).indicatorColor, // цвет невыбранных иконок
              ),
              tabs: [
                Tab(
                    icon: Icon(
                  Icons.notes_rounded,
                  size: 6,
                  color: Theme.of(context).indicatorColor,
                )),
                Tab(
                    icon: Icon(
                  Icons.radio_button_unchecked_sharp,
                  size: 6,
                  color: Theme.of(context).indicatorColor,
                )),
                Tab(
                    icon: Icon(
                  Icons.radio_button_on_sharp,
                  size: 6,
                  color: Theme.of(context).indicatorColor,
                )),
                Tab(
                    icon: Icon(
                  Icons.build_circle_sharp,
                  size: 6,
                  color: Theme.of(context).indicatorColor,
                )),
                Tab(
                    icon: Icon(
                  Icons.align_vertical_bottom_rounded,
                  size: 6,
                  color: Theme.of(context).indicatorColor,
                )),
                Tab(
                    icon: Icon(
                  Icons.design_services_sharp,
                  size: 6,
                  color: Theme.of(context).indicatorColor,
                )),
                Tab(
                    icon: Icon(
                  Icons.playlist_add_circle_sharp,
                  size: 6,
                  color: Theme.of(context).indicatorColor,
                )),
                Tab(
                    icon: Icon(
                  Icons.person_add_alt_rounded,
                  size: 6,
                  color: Theme.of(context).indicatorColor,
                )),
                Tab(
                    icon: Icon(
                  Icons.notes_rounded,
                  size: 6,
                  color: Theme.of(context).indicatorColor,
                )),
                Tab(
                    icon: Icon(
                  Icons.radio_button_unchecked_sharp,
                  size: 6,
                  color: Theme.of(context).indicatorColor,
                )),
                Tab(
                    icon: Icon(
                  Icons.radio_button_on_sharp,
                  size: 6,
                  color: Theme.of(context).indicatorColor,
                )),
                Tab(
                    icon: Icon(
                  Icons.build_circle_sharp,
                  size: 6,
                  color: Theme.of(context).indicatorColor,
                )),
                Tab(
                    icon: Icon(
                  Icons.align_vertical_bottom_rounded,
                  size: 6,
                  color: Theme.of(context).indicatorColor,
                )),
                Tab(
                    icon: Icon(
                  Icons.design_services_sharp,
                  size: 6,
                  color: Theme.of(context).indicatorColor,
                )),
                Tab(
                    icon: Icon(
                  Icons.playlist_add_circle_sharp,
                  size: 6,
                  color: Theme.of(context).indicatorColor,
                )),
                Tab(
                    icon: Icon(
                  Icons.person_add_alt_rounded,
                  size: 6,
                  color: Theme.of(context).indicatorColor,
                )),
                Tab(
                    icon: Icon(
                  Icons.align_vertical_bottom_rounded,
                  size: 6,
                  color: Theme.of(context).indicatorColor,
                )),
                Tab(
                    icon: Icon(
                  Icons.design_services_sharp,
                  size: 6,
                  color: Theme.of(context).indicatorColor,
                )),
                Tab(
                    icon: Icon(
                  Icons.playlist_add_circle_sharp,
                  size: 6,
                  color: Theme.of(context).indicatorColor,
                )),
                Tab(
                    icon: Icon(
                  Icons.person_add_alt_rounded,
                  size: 6,
                  color: Theme.of(context).indicatorColor,
                )),
              ],
            )),
        body: TabBarView(
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Form(
                  key: _1formKey,
                  child: ListView(
                    children: <Widget>[
                      SizedBox(height: 20),
                      Container(
                          alignment: Alignment.center,
                          child: Text(
                            'УПРАЖНЕНИЯ',
                            style: TextStyle(
                                fontSize: 24,
                                color: Theme.of(context).primaryColor,
                                fontWeight: FontWeight.w300),
                          )),
                      SizedBox(height: 20),
                      TextFormField(
                        maxLength: 20,
                        onFieldSubmitted: (String value) {
                          // setState(() {
                          day.titleday = value;
                          // titleController.text = day.title ?? '';
                          // });
                        },
                        validator: (String value) {
                          if (value.isEmpty) {
                            return 'Наименование не введено';
                          } else if (value.length > 20) {
                            return 'Максимальная длина 20';
                          } else {
                            return null;
                          }
                        },
                        keyboardType: TextInputType.text,
                        controller: titleController,
                        focusNode: focusNode1,
                        style: textStyle,
                        decoration: InputDecoration(
                          focusColor: Theme.of(context).primaryColor,
                          labelStyle: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w300,
                            color: Theme.of(context).primaryColor,
                          ),
                          hintStyle: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w300,
                            color: Theme.of(context).primaryColor,
                          ),
                          labelText: 'Назовите этот день тренировки',
                          hintText: 'Например: день первый...',
                          prefixIcon: Icon(
                            Icons.account_balance_outlined,
                            color: focusNode1.hasFocus ||
                                    titleController.text.isNotEmpty
                                ? Theme.of(context).primaryColor
                                : Colors.grey,
                            size: 32,
                          ),
                          suffixIcon: GestureDetector(
                            onTap: () {
                              titleController.clear();
                            },
                            child: Icon(
                              Icons.delete_outline,
                              color: Color.fromRGBO(187, 30, 16, 1.0),
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            borderSide:
                                BorderSide(color: Colors.grey, width: 2),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            borderSide: BorderSide(
                                color: Theme.of(context).primaryColor,
                                width: 2),
                          ),
                        ),
                        onChanged: (String value) {
                          setState(() {
                            focusNode1.requestFocus();
                            // day.title = value;
                            // titleController.text = day.title ?? '';
                          });
                        },
                      ),
                      SizedBox(height: 10),
                      Divider(thickness: 4),
                      SizedBox(height: 10),
                      TextFormField(
                        maxLength: 50,
                        onFieldSubmitted: (String value) {
                          // setState(() {
                          day.weightTotal = value;
                          // titleController.text = day.title ?? '';
                          // });
                        },
                        // validator: (String value) {
                        //   if (value.isEmpty) {
                        //     return 'Наименование не введено';
                        //   } else if (value.length > 50) {
                        //     return 'Максимальная длина 50';
                        //   } else {
                        //     return null;
                        //   }
                        // },
                        keyboardType: TextInputType.text,
                        controller: weightController,
                        focusNode: focusNode2,
                        style: textStyle,
                        decoration: InputDecoration(
                          focusColor: Theme.of(context).primaryColor,
                          labelStyle: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w300,
                            color: Theme.of(context).primaryColor,
                          ),
                          hintStyle: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w300,
                            color: Theme.of(context).primaryColor,
                          ),
                          labelText: 'Вес',
                          hintText: 'Вес',
                          prefixIcon: Icon(
                            Icons.account_balance_outlined,
                            color: focusNode2.hasFocus ||
                                    weightController.text.isNotEmpty
                                ? Theme.of(context).primaryColor
                                : Colors.grey,
                            size: 32,
                          ),
                          suffixIcon: GestureDetector(
                            onTap: () {
                              weightController.clear();
                            },
                            child: Icon(
                              Icons.delete_outline,
                              color: Color.fromRGBO(187, 30, 16, 1.0),
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            borderSide:
                                BorderSide(color: Colors.grey, width: 2),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            borderSide: BorderSide(
                                color: Theme.of(context).primaryColor,
                                width: 2),
                          ),
                        ),
                        onChanged: (String value) {
                          setState(() {
                            focusNode2.requestFocus();
                            // day.title = value;
                            // titleController.text = day.title ?? '';
                          });
                        },
                      ),
                      SizedBox(height: 10),
                      Divider(thickness: 4),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary:
                                Theme.of(context).accentColor, // background
                            onPrimary: Colors.white,
                            elevation: 2,
                            padding: const EdgeInsets.all(13.0),
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.circular(10.0)) // foreground
                            ),
                        onPressed: () => saveForm1(),
                        child: Text(
                          isEdit
                              ? 'Редактировать и закрыть'
                              : 'Добавить и закрыть',
                          style: const TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Form(
                  key: _1formKey,
                  child: ListView(
                    children: <Widget>[
                      SizedBox(height: 20),
                      Container(
                          alignment: Alignment.center,
                          child: Text(
                            'УПРАЖНЕНИЯ',
                            style: TextStyle(
                                fontSize: 24,
                                color: Theme.of(context).primaryColor,
                                fontWeight: FontWeight.w300),
                          )),
                      SizedBox(height: 20),
                      TextFormField(
                        maxLength: 20,
                        onFieldSubmitted: (String value) {
                          // setState(() {
                          day.titleday = value;
                          // titleController.text = day.title ?? '';
                          // });
                        },
                        validator: (String value) {
                          if (value.isEmpty) {
                            return 'Наименование не введено';
                          } else if (value.length > 20) {
                            return 'Максимальная длина 20';
                          } else {
                            return null;
                          }
                        },
                        keyboardType: TextInputType.text,
                        controller: titleController,
                        focusNode: focusNode1,
                        style: textStyle,
                        decoration: InputDecoration(
                          focusColor: Theme.of(context).primaryColor,
                          labelStyle: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w300,
                            color: Theme.of(context).primaryColor,
                          ),
                          hintStyle: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w300,
                            color: Theme.of(context).primaryColor,
                          ),
                          labelText: 'Назовите этот день тренировки',
                          hintText: 'Например: день первый...',
                          prefixIcon: Icon(
                            Icons.account_balance_outlined,
                            color: focusNode1.hasFocus ||
                                    titleController.text.isNotEmpty
                                ? Theme.of(context).primaryColor
                                : Colors.grey,
                            size: 32,
                          ),
                          suffixIcon: GestureDetector(
                            onTap: () {
                              titleController.clear();
                            },
                            child: Icon(
                              Icons.delete_outline,
                              color: Color.fromRGBO(187, 30, 16, 1.0),
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            borderSide:
                                BorderSide(color: Colors.grey, width: 2),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            borderSide: BorderSide(
                                color: Theme.of(context).primaryColor,
                                width: 2),
                          ),
                        ),
                        onChanged: (String value) {
                          setState(() {
                            focusNode1.requestFocus();
                            // day.title = value;
                            // titleController.text = day.title ?? '';
                          });
                        },
                      ),
                      SizedBox(height: 10),
                      Divider(thickness: 4),
                      SizedBox(height: 10),
                      TextFormField(
                        maxLength: 50,
                        onFieldSubmitted: (String value) {
                          // setState(() {
                          day.weightTotal = value;
                          // titleController.text = day.title ?? '';
                          // });
                        },
                        // validator: (String value) {
                        //   if (value.isEmpty) {
                        //     return 'Наименование не введено';
                        //   } else if (value.length > 50) {
                        //     return 'Максимальная длина 50';
                        //   } else {
                        //     return null;
                        //   }
                        // },
                        keyboardType: TextInputType.text,
                        controller: weightController,
                        focusNode: focusNode2,
                        style: textStyle,
                        decoration: InputDecoration(
                          focusColor: Theme.of(context).primaryColor,
                          labelStyle: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w300,
                            color: Theme.of(context).primaryColor,
                          ),
                          hintStyle: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w300,
                            color: Theme.of(context).primaryColor,
                          ),
                          labelText: 'Вес',
                          hintText: 'Вес',
                          prefixIcon: Icon(
                            Icons.account_balance_outlined,
                            color: focusNode2.hasFocus ||
                                    weightController.text.isNotEmpty
                                ? Theme.of(context).primaryColor
                                : Colors.grey,
                            size: 32,
                          ),
                          suffixIcon: GestureDetector(
                            onTap: () {
                              weightController.clear();
                            },
                            child: Icon(
                              Icons.delete_outline,
                              color: Color.fromRGBO(187, 30, 16, 1.0),
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            borderSide:
                                BorderSide(color: Colors.grey, width: 2),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            borderSide: BorderSide(
                                color: Theme.of(context).primaryColor,
                                width: 2),
                          ),
                        ),
                        onChanged: (String value) {
                          setState(() {
                            focusNode2.requestFocus();
                            // day.title = value;
                            // titleController.text = day.title ?? '';
                          });
                        },
                      ),
                      SizedBox(height: 10),
                      Divider(thickness: 4),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary:
                                Theme.of(context).accentColor, // background
                            onPrimary: Colors.white,
                            elevation: 2,
                            padding: const EdgeInsets.all(13.0),
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.circular(10.0)) // foreground
                            ),
                        onPressed: () => saveForm1(),
                        child: Text(
                          isEdit
                              ? 'Редактировать и закрыть'
                              : 'Добавить и закрыть',
                          style: const TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Form(
                  key: _1formKey,
                  child: ListView(
                    children: <Widget>[
                      SizedBox(height: 20),
                      Container(
                          alignment: Alignment.center,
                          child: Text(
                            'УПРАЖНЕНИЯ',
                            style: TextStyle(
                                fontSize: 24,
                                color: Theme.of(context).primaryColor,
                                fontWeight: FontWeight.w300),
                          )),
                      SizedBox(height: 20),
                      TextFormField(
                        maxLength: 20,
                        onFieldSubmitted: (String value) {
                          // setState(() {
                          day.titleday = value;
                          // titleController.text = day.title ?? '';
                          // });
                        },
                        validator: (String value) {
                          if (value.isEmpty) {
                            return 'Наименование не введено';
                          } else if (value.length > 20) {
                            return 'Максимальная длина 20';
                          } else {
                            return null;
                          }
                        },
                        keyboardType: TextInputType.text,
                        controller: titleController,
                        focusNode: focusNode1,
                        style: textStyle,
                        decoration: InputDecoration(
                          focusColor: Theme.of(context).primaryColor,
                          labelStyle: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w300,
                            color: Theme.of(context).primaryColor,
                          ),
                          hintStyle: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w300,
                            color: Theme.of(context).primaryColor,
                          ),
                          labelText: 'Назовите этот день тренировки',
                          hintText: 'Например: день первый...',
                          prefixIcon: Icon(
                            Icons.account_balance_outlined,
                            color: focusNode1.hasFocus ||
                                    titleController.text.isNotEmpty
                                ? Theme.of(context).primaryColor
                                : Colors.grey,
                            size: 32,
                          ),
                          suffixIcon: GestureDetector(
                            onTap: () {
                              titleController.clear();
                            },
                            child: Icon(
                              Icons.delete_outline,
                              color: Color.fromRGBO(187, 30, 16, 1.0),
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            borderSide:
                                BorderSide(color: Colors.grey, width: 2),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            borderSide: BorderSide(
                                color: Theme.of(context).primaryColor,
                                width: 2),
                          ),
                        ),
                        onChanged: (String value) {
                          setState(() {
                            focusNode1.requestFocus();
                            // day.title = value;
                            // titleController.text = day.title ?? '';
                          });
                        },
                      ),
                      SizedBox(height: 10),
                      Divider(thickness: 4),
                      SizedBox(height: 10),
                      TextFormField(
                        maxLength: 50,
                        onFieldSubmitted: (String value) {
                          // setState(() {
                          day.weightTotal = value;
                          // titleController.text = day.title ?? '';
                          // });
                        },
                        // validator: (String value) {
                        //   if (value.isEmpty) {
                        //     return 'Наименование не введено';
                        //   } else if (value.length > 50) {
                        //     return 'Максимальная длина 50';
                        //   } else {
                        //     return null;
                        //   }
                        // },
                        keyboardType: TextInputType.text,
                        controller: weightController,
                        focusNode: focusNode2,
                        style: textStyle,
                        decoration: InputDecoration(
                          focusColor: Theme.of(context).primaryColor,
                          labelStyle: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w300,
                            color: Theme.of(context).primaryColor,
                          ),
                          hintStyle: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w300,
                            color: Theme.of(context).primaryColor,
                          ),
                          labelText: 'Вес',
                          hintText: 'Вес',
                          prefixIcon: Icon(
                            Icons.account_balance_outlined,
                            color: focusNode2.hasFocus ||
                                    weightController.text.isNotEmpty
                                ? Theme.of(context).primaryColor
                                : Colors.grey,
                            size: 32,
                          ),
                          suffixIcon: GestureDetector(
                            onTap: () {
                              weightController.clear();
                            },
                            child: Icon(
                              Icons.delete_outline,
                              color: Color.fromRGBO(187, 30, 16, 1.0),
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            borderSide:
                                BorderSide(color: Colors.grey, width: 2),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            borderSide: BorderSide(
                                color: Theme.of(context).primaryColor,
                                width: 2),
                          ),
                        ),
                        onChanged: (String value) {
                          setState(() {
                            focusNode2.requestFocus();
                            // day.title = value;
                            // titleController.text = day.title ?? '';
                          });
                        },
                      ),
                      SizedBox(height: 10),
                      Divider(thickness: 4),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary:
                                Theme.of(context).accentColor, // background
                            onPrimary: Colors.white,
                            elevation: 2,
                            padding: const EdgeInsets.all(13.0),
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.circular(10.0)) // foreground
                            ),
                        onPressed: () => saveForm1(),
                        child: Text(
                          isEdit
                              ? 'Редактировать и закрыть'
                              : 'Добавить и закрыть',
                          style: const TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Form(
                  key: _1formKey,
                  child: ListView(
                    children: <Widget>[
                      SizedBox(height: 20),
                      Container(
                          alignment: Alignment.center,
                          child: Text(
                            'УПРАЖНЕНИЯ',
                            style: TextStyle(
                                fontSize: 24,
                                color: Theme.of(context).primaryColor,
                                fontWeight: FontWeight.w300),
                          )),
                      SizedBox(height: 20),
                      TextFormField(
                        maxLength: 20,
                        onFieldSubmitted: (String value) {
                          // setState(() {
                          day.titleday = value;
                          // titleController.text = day.title ?? '';
                          // });
                        },
                        validator: (String value) {
                          if (value.isEmpty) {
                            return 'Наименование не введено';
                          } else if (value.length > 20) {
                            return 'Максимальная длина 20';
                          } else {
                            return null;
                          }
                        },
                        keyboardType: TextInputType.text,
                        controller: titleController,
                        focusNode: focusNode1,
                        style: textStyle,
                        decoration: InputDecoration(
                          focusColor: Theme.of(context).primaryColor,
                          labelStyle: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w300,
                            color: Theme.of(context).primaryColor,
                          ),
                          hintStyle: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w300,
                            color: Theme.of(context).primaryColor,
                          ),
                          labelText: 'Назовите этот день тренировки',
                          hintText: 'Например: день первый...',
                          prefixIcon: Icon(
                            Icons.account_balance_outlined,
                            color: focusNode1.hasFocus ||
                                    titleController.text.isNotEmpty
                                ? Theme.of(context).primaryColor
                                : Colors.grey,
                            size: 32,
                          ),
                          suffixIcon: GestureDetector(
                            onTap: () {
                              titleController.clear();
                            },
                            child: Icon(
                              Icons.delete_outline,
                              color: Color.fromRGBO(187, 30, 16, 1.0),
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            borderSide:
                                BorderSide(color: Colors.grey, width: 2),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            borderSide: BorderSide(
                                color: Theme.of(context).primaryColor,
                                width: 2),
                          ),
                        ),
                        onChanged: (String value) {
                          setState(() {
                            focusNode1.requestFocus();
                            // day.title = value;
                            // titleController.text = day.title ?? '';
                          });
                        },
                      ),
                      SizedBox(height: 10),
                      Divider(thickness: 4),
                      SizedBox(height: 10),
                      TextFormField(
                        maxLength: 50,
                        onFieldSubmitted: (String value) {
                          // setState(() {
                          day.weightTotal = value;
                          // titleController.text = day.title ?? '';
                          // });
                        },
                        // validator: (String value) {
                        //   if (value.isEmpty) {
                        //     return 'Наименование не введено';
                        //   } else if (value.length > 50) {
                        //     return 'Максимальная длина 50';
                        //   } else {
                        //     return null;
                        //   }
                        // },
                        keyboardType: TextInputType.text,
                        controller: weightController,
                        focusNode: focusNode2,
                        style: textStyle,
                        decoration: InputDecoration(
                          focusColor: Theme.of(context).primaryColor,
                          labelStyle: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w300,
                            color: Theme.of(context).primaryColor,
                          ),
                          hintStyle: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w300,
                            color: Theme.of(context).primaryColor,
                          ),
                          labelText: 'Вес',
                          hintText: 'Вес',
                          prefixIcon: Icon(
                            Icons.account_balance_outlined,
                            color: focusNode2.hasFocus ||
                                    weightController.text.isNotEmpty
                                ? Theme.of(context).primaryColor
                                : Colors.grey,
                            size: 32,
                          ),
                          suffixIcon: GestureDetector(
                            onTap: () {
                              weightController.clear();
                            },
                            child: Icon(
                              Icons.delete_outline,
                              color: Color.fromRGBO(187, 30, 16, 1.0),
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            borderSide:
                                BorderSide(color: Colors.grey, width: 2),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            borderSide: BorderSide(
                                color: Theme.of(context).primaryColor,
                                width: 2),
                          ),
                        ),
                        onChanged: (String value) {
                          setState(() {
                            focusNode2.requestFocus();
                            // day.title = value;
                            // titleController.text = day.title ?? '';
                          });
                        },
                      ),
                      SizedBox(height: 10),
                      Divider(thickness: 4),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary:
                                Theme.of(context).accentColor, // background
                            onPrimary: Colors.white,
                            elevation: 2,
                            padding: const EdgeInsets.all(13.0),
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.circular(10.0)) // foreground
                            ),
                        onPressed: () => saveForm1(),
                        child: Text(
                          isEdit
                              ? 'Редактировать и закрыть'
                              : 'Добавить и закрыть',
                          style: const TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Form(
                  key: _1formKey,
                  child: ListView(
                    children: <Widget>[
                      SizedBox(height: 20),
                      Container(
                          alignment: Alignment.center,
                          child: Text(
                            'УПРАЖНЕНИЯ',
                            style: TextStyle(
                                fontSize: 24,
                                color: Theme.of(context).primaryColor,
                                fontWeight: FontWeight.w300),
                          )),
                      SizedBox(height: 20),
                      TextFormField(
                        maxLength: 20,
                        onFieldSubmitted: (String value) {
                          // setState(() {
                          day.titleday = value;
                          // titleController.text = day.title ?? '';
                          // });
                        },
                        validator: (String value) {
                          if (value.isEmpty) {
                            return 'Наименование не введено';
                          } else if (value.length > 20) {
                            return 'Максимальная длина 20';
                          } else {
                            return null;
                          }
                        },
                        keyboardType: TextInputType.text,
                        controller: titleController,
                        focusNode: focusNode1,
                        style: textStyle,
                        decoration: InputDecoration(
                          focusColor: Theme.of(context).primaryColor,
                          labelStyle: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w300,
                            color: Theme.of(context).primaryColor,
                          ),
                          hintStyle: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w300,
                            color: Theme.of(context).primaryColor,
                          ),
                          labelText: 'Назовите этот день тренировки',
                          hintText: 'Например: день первый...',
                          prefixIcon: Icon(
                            Icons.account_balance_outlined,
                            color: focusNode1.hasFocus ||
                                    titleController.text.isNotEmpty
                                ? Theme.of(context).primaryColor
                                : Colors.grey,
                            size: 32,
                          ),
                          suffixIcon: GestureDetector(
                            onTap: () {
                              titleController.clear();
                            },
                            child: Icon(
                              Icons.delete_outline,
                              color: Color.fromRGBO(187, 30, 16, 1.0),
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            borderSide:
                                BorderSide(color: Colors.grey, width: 2),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            borderSide: BorderSide(
                                color: Theme.of(context).primaryColor,
                                width: 2),
                          ),
                        ),
                        onChanged: (String value) {
                          setState(() {
                            focusNode1.requestFocus();
                            // day.title = value;
                            // titleController.text = day.title ?? '';
                          });
                        },
                      ),
                      SizedBox(height: 10),
                      Divider(thickness: 4),
                      SizedBox(height: 10),
                      TextFormField(
                        maxLength: 50,
                        onFieldSubmitted: (String value) {
                          // setState(() {
                          day.weightTotal = value;
                          // titleController.text = day.title ?? '';
                          // });
                        },
                        // validator: (String value) {
                        //   if (value.isEmpty) {
                        //     return 'Наименование не введено';
                        //   } else if (value.length > 50) {
                        //     return 'Максимальная длина 50';
                        //   } else {
                        //     return null;
                        //   }
                        // },
                        keyboardType: TextInputType.text,
                        controller: weightController,
                        focusNode: focusNode2,
                        style: textStyle,
                        decoration: InputDecoration(
                          focusColor: Theme.of(context).primaryColor,
                          labelStyle: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w300,
                            color: Theme.of(context).primaryColor,
                          ),
                          hintStyle: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w300,
                            color: Theme.of(context).primaryColor,
                          ),
                          labelText: 'Вес',
                          hintText: 'Вес',
                          prefixIcon: Icon(
                            Icons.account_balance_outlined,
                            color: focusNode2.hasFocus ||
                                    weightController.text.isNotEmpty
                                ? Theme.of(context).primaryColor
                                : Colors.grey,
                            size: 32,
                          ),
                          suffixIcon: GestureDetector(
                            onTap: () {
                              weightController.clear();
                            },
                            child: Icon(
                              Icons.delete_outline,
                              color: Color.fromRGBO(187, 30, 16, 1.0),
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            borderSide:
                                BorderSide(color: Colors.grey, width: 2),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            borderSide: BorderSide(
                                color: Theme.of(context).primaryColor,
                                width: 2),
                          ),
                        ),
                        onChanged: (String value) {
                          setState(() {
                            focusNode2.requestFocus();
                            // day.title = value;
                            // titleController.text = day.title ?? '';
                          });
                        },
                      ),
                      SizedBox(height: 10),
                      Divider(thickness: 4),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary:
                                Theme.of(context).accentColor, // background
                            onPrimary: Colors.white,
                            elevation: 2,
                            padding: const EdgeInsets.all(13.0),
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.circular(10.0)) // foreground
                            ),
                        onPressed: () => saveForm1(),
                        child: Text(
                          isEdit
                              ? 'Редактировать и закрыть'
                              : 'Добавить и закрыть',
                          style: const TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Form(
                  key: _1formKey,
                  child: ListView(
                    children: <Widget>[
                      SizedBox(height: 20),
                      Container(
                          alignment: Alignment.center,
                          child: Text(
                            'УПРАЖНЕНИЯ',
                            style: TextStyle(
                                fontSize: 24,
                                color: Theme.of(context).primaryColor,
                                fontWeight: FontWeight.w300),
                          )),
                      SizedBox(height: 20),
                      TextFormField(
                        maxLength: 20,
                        onFieldSubmitted: (String value) {
                          // setState(() {
                          day.titleday = value;
                          // titleController.text = day.title ?? '';
                          // });
                        },
                        validator: (String value) {
                          if (value.isEmpty) {
                            return 'Наименование не введено';
                          } else if (value.length > 20) {
                            return 'Максимальная длина 20';
                          } else {
                            return null;
                          }
                        },
                        keyboardType: TextInputType.text,
                        controller: titleController,
                        focusNode: focusNode1,
                        style: textStyle,
                        decoration: InputDecoration(
                          focusColor: Theme.of(context).primaryColor,
                          labelStyle: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w300,
                            color: Theme.of(context).primaryColor,
                          ),
                          hintStyle: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w300,
                            color: Theme.of(context).primaryColor,
                          ),
                          labelText: 'Назовите этот день тренировки',
                          hintText: 'Например: день первый...',
                          prefixIcon: Icon(
                            Icons.account_balance_outlined,
                            color: focusNode1.hasFocus ||
                                    titleController.text.isNotEmpty
                                ? Theme.of(context).primaryColor
                                : Colors.grey,
                            size: 32,
                          ),
                          suffixIcon: GestureDetector(
                            onTap: () {
                              titleController.clear();
                            },
                            child: Icon(
                              Icons.delete_outline,
                              color: Color.fromRGBO(187, 30, 16, 1.0),
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            borderSide:
                                BorderSide(color: Colors.grey, width: 2),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            borderSide: BorderSide(
                                color: Theme.of(context).primaryColor,
                                width: 2),
                          ),
                        ),
                        onChanged: (String value) {
                          setState(() {
                            focusNode1.requestFocus();
                            // day.title = value;
                            // titleController.text = day.title ?? '';
                          });
                        },
                      ),
                      SizedBox(height: 10),
                      Divider(thickness: 4),
                      SizedBox(height: 10),
                      TextFormField(
                        maxLength: 50,
                        onFieldSubmitted: (String value) {
                          // setState(() {
                          day.weightTotal = value;
                          // titleController.text = day.title ?? '';
                          // });
                        },
                        // validator: (String value) {
                        //   if (value.isEmpty) {
                        //     return 'Наименование не введено';
                        //   } else if (value.length > 50) {
                        //     return 'Максимальная длина 50';
                        //   } else {
                        //     return null;
                        //   }
                        // },
                        keyboardType: TextInputType.text,
                        controller: weightController,
                        focusNode: focusNode2,
                        style: textStyle,
                        decoration: InputDecoration(
                          focusColor: Theme.of(context).primaryColor,
                          labelStyle: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w300,
                            color: Theme.of(context).primaryColor,
                          ),
                          hintStyle: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w300,
                            color: Theme.of(context).primaryColor,
                          ),
                          labelText: 'Вес',
                          hintText: 'Вес',
                          prefixIcon: Icon(
                            Icons.account_balance_outlined,
                            color: focusNode2.hasFocus ||
                                    weightController.text.isNotEmpty
                                ? Theme.of(context).primaryColor
                                : Colors.grey,
                            size: 32,
                          ),
                          suffixIcon: GestureDetector(
                            onTap: () {
                              weightController.clear();
                            },
                            child: Icon(
                              Icons.delete_outline,
                              color: Color.fromRGBO(187, 30, 16, 1.0),
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            borderSide:
                                BorderSide(color: Colors.grey, width: 2),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            borderSide: BorderSide(
                                color: Theme.of(context).primaryColor,
                                width: 2),
                          ),
                        ),
                        onChanged: (String value) {
                          setState(() {
                            focusNode2.requestFocus();
                            // day.title = value;
                            // titleController.text = day.title ?? '';
                          });
                        },
                      ),
                      SizedBox(height: 10),
                      Divider(thickness: 4),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary:
                                Theme.of(context).accentColor, // background
                            onPrimary: Colors.white,
                            elevation: 2,
                            padding: const EdgeInsets.all(13.0),
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.circular(10.0)) // foreground
                            ),
                        onPressed: () => saveForm1(),
                        child: Text(
                          isEdit
                              ? 'Редактировать и закрыть'
                              : 'Добавить и закрыть',
                          style: const TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Form(
                  key: _1formKey,
                  child: ListView(
                    children: <Widget>[
                      SizedBox(height: 20),
                      Container(
                          alignment: Alignment.center,
                          child: Text(
                            'УПРАЖНЕНИЯ',
                            style: TextStyle(
                                fontSize: 24,
                                color: Theme.of(context).primaryColor,
                                fontWeight: FontWeight.w300),
                          )),
                      SizedBox(height: 20),
                      TextFormField(
                        maxLength: 20,
                        onFieldSubmitted: (String value) {
                          // setState(() {
                          day.titleday = value;
                          // titleController.text = day.title ?? '';
                          // });
                        },
                        validator: (String value) {
                          if (value.isEmpty) {
                            return 'Наименование не введено';
                          } else if (value.length > 20) {
                            return 'Максимальная длина 20';
                          } else {
                            return null;
                          }
                        },
                        keyboardType: TextInputType.text,
                        controller: titleController,
                        focusNode: focusNode1,
                        style: textStyle,
                        decoration: InputDecoration(
                          focusColor: Theme.of(context).primaryColor,
                          labelStyle: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w300,
                            color: Theme.of(context).primaryColor,
                          ),
                          hintStyle: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w300,
                            color: Theme.of(context).primaryColor,
                          ),
                          labelText: 'Назовите этот день тренировки',
                          hintText: 'Например: день первый...',
                          prefixIcon: Icon(
                            Icons.account_balance_outlined,
                            color: focusNode1.hasFocus ||
                                    titleController.text.isNotEmpty
                                ? Theme.of(context).primaryColor
                                : Colors.grey,
                            size: 32,
                          ),
                          suffixIcon: GestureDetector(
                            onTap: () {
                              titleController.clear();
                            },
                            child: Icon(
                              Icons.delete_outline,
                              color: Color.fromRGBO(187, 30, 16, 1.0),
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            borderSide:
                                BorderSide(color: Colors.grey, width: 2),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            borderSide: BorderSide(
                                color: Theme.of(context).primaryColor,
                                width: 2),
                          ),
                        ),
                        onChanged: (String value) {
                          setState(() {
                            focusNode1.requestFocus();
                            // day.title = value;
                            // titleController.text = day.title ?? '';
                          });
                        },
                      ),
                      SizedBox(height: 10),
                      Divider(thickness: 4),
                      SizedBox(height: 10),
                      TextFormField(
                        maxLength: 50,
                        onFieldSubmitted: (String value) {
                          // setState(() {
                          day.weightTotal = value;
                          // titleController.text = day.title ?? '';
                          // });
                        },
                        // validator: (String value) {
                        //   if (value.isEmpty) {
                        //     return 'Наименование не введено';
                        //   } else if (value.length > 50) {
                        //     return 'Максимальная длина 50';
                        //   } else {
                        //     return null;
                        //   }
                        // },
                        keyboardType: TextInputType.text,
                        controller: weightController,
                        focusNode: focusNode2,
                        style: textStyle,
                        decoration: InputDecoration(
                          focusColor: Theme.of(context).primaryColor,
                          labelStyle: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w300,
                            color: Theme.of(context).primaryColor,
                          ),
                          hintStyle: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w300,
                            color: Theme.of(context).primaryColor,
                          ),
                          labelText: 'Вес',
                          hintText: 'Вес',
                          prefixIcon: Icon(
                            Icons.account_balance_outlined,
                            color: focusNode2.hasFocus ||
                                    weightController.text.isNotEmpty
                                ? Theme.of(context).primaryColor
                                : Colors.grey,
                            size: 32,
                          ),
                          suffixIcon: GestureDetector(
                            onTap: () {
                              weightController.clear();
                            },
                            child: Icon(
                              Icons.delete_outline,
                              color: Color.fromRGBO(187, 30, 16, 1.0),
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            borderSide:
                                BorderSide(color: Colors.grey, width: 2),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            borderSide: BorderSide(
                                color: Theme.of(context).primaryColor,
                                width: 2),
                          ),
                        ),
                        onChanged: (String value) {
                          setState(() {
                            focusNode2.requestFocus();
                            // day.title = value;
                            // titleController.text = day.title ?? '';
                          });
                        },
                      ),
                      SizedBox(height: 10),
                      Divider(thickness: 4),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary:
                                Theme.of(context).accentColor, // background
                            onPrimary: Colors.white,
                            elevation: 2,
                            padding: const EdgeInsets.all(13.0),
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.circular(10.0)) // foreground
                            ),
                        onPressed: () => saveForm1(),
                        child: Text(
                          isEdit
                              ? 'Редактировать и закрыть'
                              : 'Добавить и закрыть',
                          style: const TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Form(
                  key: _1formKey,
                  child: ListView(
                    children: <Widget>[
                      SizedBox(height: 20),
                      Container(
                          alignment: Alignment.center,
                          child: Text(
                            'УПРАЖНЕНИЯ',
                            style: TextStyle(
                                fontSize: 24,
                                color: Theme.of(context).primaryColor,
                                fontWeight: FontWeight.w300),
                          )),
                      SizedBox(height: 20),
                      TextFormField(
                        maxLength: 20,
                        onFieldSubmitted: (String value) {
                          // setState(() {
                          day.titleday = value;
                          // titleController.text = day.title ?? '';
                          // });
                        },
                        validator: (String value) {
                          if (value.isEmpty) {
                            return 'Наименование не введено';
                          } else if (value.length > 20) {
                            return 'Максимальная длина 20';
                          } else {
                            return null;
                          }
                        },
                        keyboardType: TextInputType.text,
                        controller: titleController,
                        focusNode: focusNode1,
                        style: textStyle,
                        decoration: InputDecoration(
                          focusColor: Theme.of(context).primaryColor,
                          labelStyle: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w300,
                            color: Theme.of(context).primaryColor,
                          ),
                          hintStyle: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w300,
                            color: Theme.of(context).primaryColor,
                          ),
                          labelText: 'Назовите этот день тренировки',
                          hintText: 'Например: день первый...',
                          prefixIcon: Icon(
                            Icons.account_balance_outlined,
                            color: focusNode1.hasFocus ||
                                    titleController.text.isNotEmpty
                                ? Theme.of(context).primaryColor
                                : Colors.grey,
                            size: 32,
                          ),
                          suffixIcon: GestureDetector(
                            onTap: () {
                              titleController.clear();
                            },
                            child: Icon(
                              Icons.delete_outline,
                              color: Color.fromRGBO(187, 30, 16, 1.0),
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            borderSide:
                                BorderSide(color: Colors.grey, width: 2),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            borderSide: BorderSide(
                                color: Theme.of(context).primaryColor,
                                width: 2),
                          ),
                        ),
                        onChanged: (String value) {
                          setState(() {
                            focusNode1.requestFocus();
                            // day.title = value;
                            // titleController.text = day.title ?? '';
                          });
                        },
                      ),
                      SizedBox(height: 10),
                      Divider(thickness: 4),
                      SizedBox(height: 10),
                      TextFormField(
                        maxLength: 50,
                        onFieldSubmitted: (String value) {
                          // setState(() {
                          day.weightTotal = value;
                          // titleController.text = day.title ?? '';
                          // });
                        },
                        // validator: (String value) {
                        //   if (value.isEmpty) {
                        //     return 'Наименование не введено';
                        //   } else if (value.length > 50) {
                        //     return 'Максимальная длина 50';
                        //   } else {
                        //     return null;
                        //   }
                        // },
                        keyboardType: TextInputType.text,
                        controller: weightController,
                        focusNode: focusNode2,
                        style: textStyle,
                        decoration: InputDecoration(
                          focusColor: Theme.of(context).primaryColor,
                          labelStyle: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w300,
                            color: Theme.of(context).primaryColor,
                          ),
                          hintStyle: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w300,
                            color: Theme.of(context).primaryColor,
                          ),
                          labelText: 'Вес',
                          hintText: 'Вес',
                          prefixIcon: Icon(
                            Icons.account_balance_outlined,
                            color: focusNode2.hasFocus ||
                                    weightController.text.isNotEmpty
                                ? Theme.of(context).primaryColor
                                : Colors.grey,
                            size: 32,
                          ),
                          suffixIcon: GestureDetector(
                            onTap: () {
                              weightController.clear();
                            },
                            child: Icon(
                              Icons.delete_outline,
                              color: Color.fromRGBO(187, 30, 16, 1.0),
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            borderSide:
                                BorderSide(color: Colors.grey, width: 2),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            borderSide: BorderSide(
                                color: Theme.of(context).primaryColor,
                                width: 2),
                          ),
                        ),
                        onChanged: (String value) {
                          setState(() {
                            focusNode2.requestFocus();
                            // day.title = value;
                            // titleController.text = day.title ?? '';
                          });
                        },
                      ),
                      SizedBox(height: 10),
                      Divider(thickness: 4),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary:
                                Theme.of(context).accentColor, // background
                            onPrimary: Colors.white,
                            elevation: 2,
                            padding: const EdgeInsets.all(13.0),
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.circular(10.0)) // foreground
                            ),
                        onPressed: () => saveForm1(),
                        child: Text(
                          isEdit
                              ? 'Редактировать и закрыть'
                              : 'Добавить и закрыть',
                          style: const TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Form(
                  key: _1formKey,
                  child: ListView(
                    children: <Widget>[
                      SizedBox(height: 20),
                      Container(
                          alignment: Alignment.center,
                          child: Text(
                            'УПРАЖНЕНИЯ',
                            style: TextStyle(
                                fontSize: 24,
                                color: Theme.of(context).primaryColor,
                                fontWeight: FontWeight.w300),
                          )),
                      SizedBox(height: 20),
                      TextFormField(
                        maxLength: 20,
                        onFieldSubmitted: (String value) {
                          // setState(() {
                          day.titleday = value;
                          // titleController.text = day.title ?? '';
                          // });
                        },
                        validator: (String value) {
                          if (value.isEmpty) {
                            return 'Наименование не введено';
                          } else if (value.length > 20) {
                            return 'Максимальная длина 20';
                          } else {
                            return null;
                          }
                        },
                        keyboardType: TextInputType.text,
                        controller: titleController,
                        focusNode: focusNode1,
                        style: textStyle,
                        decoration: InputDecoration(
                          focusColor: Theme.of(context).primaryColor,
                          labelStyle: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w300,
                            color: Theme.of(context).primaryColor,
                          ),
                          hintStyle: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w300,
                            color: Theme.of(context).primaryColor,
                          ),
                          labelText: 'Назовите этот день тренировки',
                          hintText: 'Например: день первый...',
                          prefixIcon: Icon(
                            Icons.account_balance_outlined,
                            color: focusNode1.hasFocus ||
                                    titleController.text.isNotEmpty
                                ? Theme.of(context).primaryColor
                                : Colors.grey,
                            size: 32,
                          ),
                          suffixIcon: GestureDetector(
                            onTap: () {
                              titleController.clear();
                            },
                            child: Icon(
                              Icons.delete_outline,
                              color: Color.fromRGBO(187, 30, 16, 1.0),
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            borderSide:
                                BorderSide(color: Colors.grey, width: 2),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            borderSide: BorderSide(
                                color: Theme.of(context).primaryColor,
                                width: 2),
                          ),
                        ),
                        onChanged: (String value) {
                          setState(() {
                            focusNode1.requestFocus();
                            // day.title = value;
                            // titleController.text = day.title ?? '';
                          });
                        },
                      ),
                      SizedBox(height: 10),
                      Divider(thickness: 4),
                      SizedBox(height: 10),
                      TextFormField(
                        maxLength: 50,
                        onFieldSubmitted: (String value) {
                          // setState(() {
                          day.weightTotal = value;
                          // titleController.text = day.title ?? '';
                          // });
                        },
                        // validator: (String value) {
                        //   if (value.isEmpty) {
                        //     return 'Наименование не введено';
                        //   } else if (value.length > 50) {
                        //     return 'Максимальная длина 50';
                        //   } else {
                        //     return null;
                        //   }
                        // },
                        keyboardType: TextInputType.text,
                        controller: weightController,
                        focusNode: focusNode2,
                        style: textStyle,
                        decoration: InputDecoration(
                          focusColor: Theme.of(context).primaryColor,
                          labelStyle: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w300,
                            color: Theme.of(context).primaryColor,
                          ),
                          hintStyle: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w300,
                            color: Theme.of(context).primaryColor,
                          ),
                          labelText: 'Вес',
                          hintText: 'Вес',
                          prefixIcon: Icon(
                            Icons.account_balance_outlined,
                            color: focusNode2.hasFocus ||
                                    weightController.text.isNotEmpty
                                ? Theme.of(context).primaryColor
                                : Colors.grey,
                            size: 32,
                          ),
                          suffixIcon: GestureDetector(
                            onTap: () {
                              weightController.clear();
                            },
                            child: Icon(
                              Icons.delete_outline,
                              color: Color.fromRGBO(187, 30, 16, 1.0),
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            borderSide:
                                BorderSide(color: Colors.grey, width: 2),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            borderSide: BorderSide(
                                color: Theme.of(context).primaryColor,
                                width: 2),
                          ),
                        ),
                        onChanged: (String value) {
                          setState(() {
                            focusNode2.requestFocus();
                            // day.title = value;
                            // titleController.text = day.title ?? '';
                          });
                        },
                      ),
                      SizedBox(height: 10),
                      Divider(thickness: 4),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary:
                                Theme.of(context).accentColor, // background
                            onPrimary: Colors.white,
                            elevation: 2,
                            padding: const EdgeInsets.all(13.0),
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.circular(10.0)) // foreground
                            ),
                        onPressed: () => saveForm1(),
                        child: Text(
                          isEdit
                              ? 'Редактировать и закрыть'
                              : 'Добавить и закрыть',
                          style: const TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Form(
                  key: _1formKey,
                  child: ListView(
                    children: <Widget>[
                      SizedBox(height: 20),
                      Container(
                          alignment: Alignment.center,
                          child: Text(
                            'УПРАЖНЕНИЯ',
                            style: TextStyle(
                                fontSize: 24,
                                color: Theme.of(context).primaryColor,
                                fontWeight: FontWeight.w300),
                          )),
                      SizedBox(height: 20),
                      TextFormField(
                        maxLength: 20,
                        onFieldSubmitted: (String value) {
                          // setState(() {
                          day.titleday = value;
                          // titleController.text = day.title ?? '';
                          // });
                        },
                        validator: (String value) {
                          if (value.isEmpty) {
                            return 'Наименование не введено';
                          } else if (value.length > 20) {
                            return 'Максимальная длина 20';
                          } else {
                            return null;
                          }
                        },
                        keyboardType: TextInputType.text,
                        controller: titleController,
                        focusNode: focusNode1,
                        style: textStyle,
                        decoration: InputDecoration(
                          focusColor: Theme.of(context).primaryColor,
                          labelStyle: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w300,
                            color: Theme.of(context).primaryColor,
                          ),
                          hintStyle: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w300,
                            color: Theme.of(context).primaryColor,
                          ),
                          labelText: 'Назовите этот день тренировки',
                          hintText: 'Например: день первый...',
                          prefixIcon: Icon(
                            Icons.account_balance_outlined,
                            color: focusNode1.hasFocus ||
                                    titleController.text.isNotEmpty
                                ? Theme.of(context).primaryColor
                                : Colors.grey,
                            size: 32,
                          ),
                          suffixIcon: GestureDetector(
                            onTap: () {
                              titleController.clear();
                            },
                            child: Icon(
                              Icons.delete_outline,
                              color: Color.fromRGBO(187, 30, 16, 1.0),
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            borderSide:
                                BorderSide(color: Colors.grey, width: 2),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            borderSide: BorderSide(
                                color: Theme.of(context).primaryColor,
                                width: 2),
                          ),
                        ),
                        onChanged: (String value) {
                          setState(() {
                            focusNode1.requestFocus();
                            // day.title = value;
                            // titleController.text = day.title ?? '';
                          });
                        },
                      ),
                      SizedBox(height: 10),
                      Divider(thickness: 4),
                      SizedBox(height: 10),
                      TextFormField(
                        maxLength: 50,
                        onFieldSubmitted: (String value) {
                          // setState(() {
                          day.weightTotal = value;
                          // titleController.text = day.title ?? '';
                          // });
                        },
                        // validator: (String value) {
                        //   if (value.isEmpty) {
                        //     return 'Наименование не введено';
                        //   } else if (value.length > 50) {
                        //     return 'Максимальная длина 50';
                        //   } else {
                        //     return null;
                        //   }
                        // },
                        keyboardType: TextInputType.text,
                        controller: weightController,
                        focusNode: focusNode2,
                        style: textStyle,
                        decoration: InputDecoration(
                          focusColor: Theme.of(context).primaryColor,
                          labelStyle: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w300,
                            color: Theme.of(context).primaryColor,
                          ),
                          hintStyle: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w300,
                            color: Theme.of(context).primaryColor,
                          ),
                          labelText: 'Вес',
                          hintText: 'Вес',
                          prefixIcon: Icon(
                            Icons.account_balance_outlined,
                            color: focusNode2.hasFocus ||
                                    weightController.text.isNotEmpty
                                ? Theme.of(context).primaryColor
                                : Colors.grey,
                            size: 32,
                          ),
                          suffixIcon: GestureDetector(
                            onTap: () {
                              weightController.clear();
                            },
                            child: Icon(
                              Icons.delete_outline,
                              color: Color.fromRGBO(187, 30, 16, 1.0),
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            borderSide:
                                BorderSide(color: Colors.grey, width: 2),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            borderSide: BorderSide(
                                color: Theme.of(context).primaryColor,
                                width: 2),
                          ),
                        ),
                        onChanged: (String value) {
                          setState(() {
                            focusNode2.requestFocus();
                            // day.title = value;
                            // titleController.text = day.title ?? '';
                          });
                        },
                      ),
                      SizedBox(height: 10),
                      Divider(thickness: 4),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary:
                                Theme.of(context).accentColor, // background
                            onPrimary: Colors.white,
                            elevation: 2,
                            padding: const EdgeInsets.all(13.0),
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.circular(10.0)) // foreground
                            ),
                        onPressed: () => saveForm1(),
                        child: Text(
                          isEdit
                              ? 'Редактировать и закрыть'
                              : 'Добавить и закрыть',
                          style: const TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Form(
                  key: _1formKey,
                  child: ListView(
                    children: <Widget>[
                      SizedBox(height: 20),
                      Container(
                          alignment: Alignment.center,
                          child: Text(
                            'УПРАЖНЕНИЯ',
                            style: TextStyle(
                                fontSize: 24,
                                color: Theme.of(context).primaryColor,
                                fontWeight: FontWeight.w300),
                          )),
                      SizedBox(height: 20),
                      TextFormField(
                        maxLength: 20,
                        onFieldSubmitted: (String value) {
                          // setState(() {
                          day.titleday = value;
                          // titleController.text = day.title ?? '';
                          // });
                        },
                        validator: (String value) {
                          if (value.isEmpty) {
                            return 'Наименование не введено';
                          } else if (value.length > 20) {
                            return 'Максимальная длина 20';
                          } else {
                            return null;
                          }
                        },
                        keyboardType: TextInputType.text,
                        controller: titleController,
                        focusNode: focusNode1,
                        style: textStyle,
                        decoration: InputDecoration(
                          focusColor: Theme.of(context).primaryColor,
                          labelStyle: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w300,
                            color: Theme.of(context).primaryColor,
                          ),
                          hintStyle: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w300,
                            color: Theme.of(context).primaryColor,
                          ),
                          labelText: 'Назовите этот день тренировки',
                          hintText: 'Например: день первый...',
                          prefixIcon: Icon(
                            Icons.account_balance_outlined,
                            color: focusNode1.hasFocus ||
                                    titleController.text.isNotEmpty
                                ? Theme.of(context).primaryColor
                                : Colors.grey,
                            size: 32,
                          ),
                          suffixIcon: GestureDetector(
                            onTap: () {
                              titleController.clear();
                            },
                            child: Icon(
                              Icons.delete_outline,
                              color: Color.fromRGBO(187, 30, 16, 1.0),
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            borderSide:
                                BorderSide(color: Colors.grey, width: 2),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            borderSide: BorderSide(
                                color: Theme.of(context).primaryColor,
                                width: 2),
                          ),
                        ),
                        onChanged: (String value) {
                          setState(() {
                            focusNode1.requestFocus();
                            // day.title = value;
                            // titleController.text = day.title ?? '';
                          });
                        },
                      ),
                      SizedBox(height: 10),
                      Divider(thickness: 4),
                      SizedBox(height: 10),
                      TextFormField(
                        maxLength: 50,
                        onFieldSubmitted: (String value) {
                          // setState(() {
                          day.weightTotal = value;
                          // titleController.text = day.title ?? '';
                          // });
                        },
                        // validator: (String value) {
                        //   if (value.isEmpty) {
                        //     return 'Наименование не введено';
                        //   } else if (value.length > 50) {
                        //     return 'Максимальная длина 50';
                        //   } else {
                        //     return null;
                        //   }
                        // },
                        keyboardType: TextInputType.text,
                        controller: weightController,
                        focusNode: focusNode2,
                        style: textStyle,
                        decoration: InputDecoration(
                          focusColor: Theme.of(context).primaryColor,
                          labelStyle: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w300,
                            color: Theme.of(context).primaryColor,
                          ),
                          hintStyle: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w300,
                            color: Theme.of(context).primaryColor,
                          ),
                          labelText: 'Вес',
                          hintText: 'Вес',
                          prefixIcon: Icon(
                            Icons.account_balance_outlined,
                            color: focusNode2.hasFocus ||
                                    weightController.text.isNotEmpty
                                ? Theme.of(context).primaryColor
                                : Colors.grey,
                            size: 32,
                          ),
                          suffixIcon: GestureDetector(
                            onTap: () {
                              weightController.clear();
                            },
                            child: Icon(
                              Icons.delete_outline,
                              color: Color.fromRGBO(187, 30, 16, 1.0),
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            borderSide:
                                BorderSide(color: Colors.grey, width: 2),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            borderSide: BorderSide(
                                color: Theme.of(context).primaryColor,
                                width: 2),
                          ),
                        ),
                        onChanged: (String value) {
                          setState(() {
                            focusNode2.requestFocus();
                            // day.title = value;
                            // titleController.text = day.title ?? '';
                          });
                        },
                      ),
                      SizedBox(height: 10),
                      Divider(thickness: 4),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary:
                                Theme.of(context).accentColor, // background
                            onPrimary: Colors.white,
                            elevation: 2,
                            padding: const EdgeInsets.all(13.0),
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.circular(10.0)) // foreground
                            ),
                        onPressed: () => saveForm1(),
                        child: Text(
                          isEdit
                              ? 'Редактировать и закрыть'
                              : 'Добавить и закрыть',
                          style: const TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Form(
                  key: _1formKey,
                  child: ListView(
                    children: <Widget>[
                      SizedBox(height: 20),
                      Container(
                          alignment: Alignment.center,
                          child: Text(
                            'УПРАЖНЕНИЯ',
                            style: TextStyle(
                                fontSize: 24,
                                color: Theme.of(context).primaryColor,
                                fontWeight: FontWeight.w300),
                          )),
                      SizedBox(height: 20),
                      TextFormField(
                        maxLength: 20,
                        onFieldSubmitted: (String value) {
                          // setState(() {
                          day.titleday = value;
                          // titleController.text = day.title ?? '';
                          // });
                        },
                        validator: (String value) {
                          if (value.isEmpty) {
                            return 'Наименование не введено';
                          } else if (value.length > 20) {
                            return 'Максимальная длина 20';
                          } else {
                            return null;
                          }
                        },
                        keyboardType: TextInputType.text,
                        controller: titleController,
                        focusNode: focusNode1,
                        style: textStyle,
                        decoration: InputDecoration(
                          focusColor: Theme.of(context).primaryColor,
                          labelStyle: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w300,
                            color: Theme.of(context).primaryColor,
                          ),
                          hintStyle: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w300,
                            color: Theme.of(context).primaryColor,
                          ),
                          labelText: 'Назовите этот день тренировки',
                          hintText: 'Например: день первый...',
                          prefixIcon: Icon(
                            Icons.account_balance_outlined,
                            color: focusNode1.hasFocus ||
                                    titleController.text.isNotEmpty
                                ? Theme.of(context).primaryColor
                                : Colors.grey,
                            size: 32,
                          ),
                          suffixIcon: GestureDetector(
                            onTap: () {
                              titleController.clear();
                            },
                            child: Icon(
                              Icons.delete_outline,
                              color: Color.fromRGBO(187, 30, 16, 1.0),
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            borderSide:
                                BorderSide(color: Colors.grey, width: 2),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            borderSide: BorderSide(
                                color: Theme.of(context).primaryColor,
                                width: 2),
                          ),
                        ),
                        onChanged: (String value) {
                          setState(() {
                            focusNode1.requestFocus();
                            // day.title = value;
                            // titleController.text = day.title ?? '';
                          });
                        },
                      ),
                      SizedBox(height: 10),
                      Divider(thickness: 4),
                      SizedBox(height: 10),
                      TextFormField(
                        maxLength: 50,
                        onFieldSubmitted: (String value) {
                          // setState(() {
                          day.weightTotal = value;
                          // titleController.text = day.title ?? '';
                          // });
                        },
                        // validator: (String value) {
                        //   if (value.isEmpty) {
                        //     return 'Наименование не введено';
                        //   } else if (value.length > 50) {
                        //     return 'Максимальная длина 50';
                        //   } else {
                        //     return null;
                        //   }
                        // },
                        keyboardType: TextInputType.text,
                        controller: weightController,
                        focusNode: focusNode2,
                        style: textStyle,
                        decoration: InputDecoration(
                          focusColor: Theme.of(context).primaryColor,
                          labelStyle: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w300,
                            color: Theme.of(context).primaryColor,
                          ),
                          hintStyle: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w300,
                            color: Theme.of(context).primaryColor,
                          ),
                          labelText: 'Вес',
                          hintText: 'Вес',
                          prefixIcon: Icon(
                            Icons.account_balance_outlined,
                            color: focusNode2.hasFocus ||
                                    weightController.text.isNotEmpty
                                ? Theme.of(context).primaryColor
                                : Colors.grey,
                            size: 32,
                          ),
                          suffixIcon: GestureDetector(
                            onTap: () {
                              weightController.clear();
                            },
                            child: Icon(
                              Icons.delete_outline,
                              color: Color.fromRGBO(187, 30, 16, 1.0),
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            borderSide:
                                BorderSide(color: Colors.grey, width: 2),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            borderSide: BorderSide(
                                color: Theme.of(context).primaryColor,
                                width: 2),
                          ),
                        ),
                        onChanged: (String value) {
                          setState(() {
                            focusNode2.requestFocus();
                            // day.title = value;
                            // titleController.text = day.title ?? '';
                          });
                        },
                      ),
                      SizedBox(height: 10),
                      Divider(thickness: 4),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary:
                                Theme.of(context).accentColor, // background
                            onPrimary: Colors.white,
                            elevation: 2,
                            padding: const EdgeInsets.all(13.0),
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.circular(10.0)) // foreground
                            ),
                        onPressed: () => saveForm1(),
                        child: Text(
                          isEdit
                              ? 'Редактировать и закрыть'
                              : 'Добавить и закрыть',
                          style: const TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Form(
                  key: _1formKey,
                  child: ListView(
                    children: <Widget>[
                      SizedBox(height: 20),
                      Container(
                          alignment: Alignment.center,
                          child: Text(
                            'УПРАЖНЕНИЯ',
                            style: TextStyle(
                                fontSize: 24,
                                color: Theme.of(context).primaryColor,
                                fontWeight: FontWeight.w300),
                          )),
                      SizedBox(height: 20),
                      TextFormField(
                        maxLength: 20,
                        onFieldSubmitted: (String value) {
                          // setState(() {
                          day.titleday = value;
                          // titleController.text = day.title ?? '';
                          // });
                        },
                        validator: (String value) {
                          if (value.isEmpty) {
                            return 'Наименование не введено';
                          } else if (value.length > 20) {
                            return 'Максимальная длина 20';
                          } else {
                            return null;
                          }
                        },
                        keyboardType: TextInputType.text,
                        controller: titleController,
                        focusNode: focusNode1,
                        style: textStyle,
                        decoration: InputDecoration(
                          focusColor: Theme.of(context).primaryColor,
                          labelStyle: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w300,
                            color: Theme.of(context).primaryColor,
                          ),
                          hintStyle: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w300,
                            color: Theme.of(context).primaryColor,
                          ),
                          labelText: 'Назовите этот день тренировки',
                          hintText: 'Например: день первый...',
                          prefixIcon: Icon(
                            Icons.account_balance_outlined,
                            color: focusNode1.hasFocus ||
                                    titleController.text.isNotEmpty
                                ? Theme.of(context).primaryColor
                                : Colors.grey,
                            size: 32,
                          ),
                          suffixIcon: GestureDetector(
                            onTap: () {
                              titleController.clear();
                            },
                            child: Icon(
                              Icons.delete_outline,
                              color: Color.fromRGBO(187, 30, 16, 1.0),
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            borderSide:
                                BorderSide(color: Colors.grey, width: 2),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            borderSide: BorderSide(
                                color: Theme.of(context).primaryColor,
                                width: 2),
                          ),
                        ),
                        onChanged: (String value) {
                          setState(() {
                            focusNode1.requestFocus();
                            // day.title = value;
                            // titleController.text = day.title ?? '';
                          });
                        },
                      ),
                      SizedBox(height: 10),
                      Divider(thickness: 4),
                      SizedBox(height: 10),
                      TextFormField(
                        maxLength: 50,
                        onFieldSubmitted: (String value) {
                          // setState(() {
                          day.weightTotal = value;
                          // titleController.text = day.title ?? '';
                          // });
                        },
                        // validator: (String value) {
                        //   if (value.isEmpty) {
                        //     return 'Наименование не введено';
                        //   } else if (value.length > 50) {
                        //     return 'Максимальная длина 50';
                        //   } else {
                        //     return null;
                        //   }
                        // },
                        keyboardType: TextInputType.text,
                        controller: weightController,
                        focusNode: focusNode2,
                        style: textStyle,
                        decoration: InputDecoration(
                          focusColor: Theme.of(context).primaryColor,
                          labelStyle: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w300,
                            color: Theme.of(context).primaryColor,
                          ),
                          hintStyle: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w300,
                            color: Theme.of(context).primaryColor,
                          ),
                          labelText: 'Вес',
                          hintText: 'Вес',
                          prefixIcon: Icon(
                            Icons.account_balance_outlined,
                            color: focusNode2.hasFocus ||
                                    weightController.text.isNotEmpty
                                ? Theme.of(context).primaryColor
                                : Colors.grey,
                            size: 32,
                          ),
                          suffixIcon: GestureDetector(
                            onTap: () {
                              weightController.clear();
                            },
                            child: Icon(
                              Icons.delete_outline,
                              color: Color.fromRGBO(187, 30, 16, 1.0),
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            borderSide:
                                BorderSide(color: Colors.grey, width: 2),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            borderSide: BorderSide(
                                color: Theme.of(context).primaryColor,
                                width: 2),
                          ),
                        ),
                        onChanged: (String value) {
                          setState(() {
                            focusNode2.requestFocus();
                            // day.title = value;
                            // titleController.text = day.title ?? '';
                          });
                        },
                      ),
                      SizedBox(height: 10),
                      Divider(thickness: 4),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary:
                                Theme.of(context).accentColor, // background
                            onPrimary: Colors.white,
                            elevation: 2,
                            padding: const EdgeInsets.all(13.0),
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.circular(10.0)) // foreground
                            ),
                        onPressed: () => saveForm1(),
                        child: Text(
                          isEdit
                              ? 'Редактировать и закрыть'
                              : 'Добавить и закрыть',
                          style: const TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Form(
                  key: _1formKey,
                  child: ListView(
                    children: <Widget>[
                      SizedBox(height: 20),
                      Container(
                          alignment: Alignment.center,
                          child: Text(
                            'УПРАЖНЕНИЯ',
                            style: TextStyle(
                                fontSize: 24,
                                color: Theme.of(context).primaryColor,
                                fontWeight: FontWeight.w300),
                          )),
                      SizedBox(height: 20),
                      TextFormField(
                        maxLength: 20,
                        onFieldSubmitted: (String value) {
                          // setState(() {
                          day.titleday = value;
                          // titleController.text = day.title ?? '';
                          // });
                        },
                        validator: (String value) {
                          if (value.isEmpty) {
                            return 'Наименование не введено';
                          } else if (value.length > 20) {
                            return 'Максимальная длина 20';
                          } else {
                            return null;
                          }
                        },
                        keyboardType: TextInputType.text,
                        controller: titleController,
                        focusNode: focusNode1,
                        style: textStyle,
                        decoration: InputDecoration(
                          focusColor: Theme.of(context).primaryColor,
                          labelStyle: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w300,
                            color: Theme.of(context).primaryColor,
                          ),
                          hintStyle: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w300,
                            color: Theme.of(context).primaryColor,
                          ),
                          labelText: 'Назовите этот день тренировки',
                          hintText: 'Например: день первый...',
                          prefixIcon: Icon(
                            Icons.account_balance_outlined,
                            color: focusNode1.hasFocus ||
                                    titleController.text.isNotEmpty
                                ? Theme.of(context).primaryColor
                                : Colors.grey,
                            size: 32,
                          ),
                          suffixIcon: GestureDetector(
                            onTap: () {
                              titleController.clear();
                            },
                            child: Icon(
                              Icons.delete_outline,
                              color: Color.fromRGBO(187, 30, 16, 1.0),
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            borderSide:
                                BorderSide(color: Colors.grey, width: 2),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            borderSide: BorderSide(
                                color: Theme.of(context).primaryColor,
                                width: 2),
                          ),
                        ),
                        onChanged: (String value) {
                          setState(() {
                            focusNode1.requestFocus();
                            // day.title = value;
                            // titleController.text = day.title ?? '';
                          });
                        },
                      ),
                      SizedBox(height: 10),
                      Divider(thickness: 4),
                      SizedBox(height: 10),
                      TextFormField(
                        maxLength: 50,
                        onFieldSubmitted: (String value) {
                          // setState(() {
                          day.weightTotal = value;
                          // titleController.text = day.title ?? '';
                          // });
                        },
                        // validator: (String value) {
                        //   if (value.isEmpty) {
                        //     return 'Наименование не введено';
                        //   } else if (value.length > 50) {
                        //     return 'Максимальная длина 50';
                        //   } else {
                        //     return null;
                        //   }
                        // },
                        keyboardType: TextInputType.text,
                        controller: weightController,
                        focusNode: focusNode2,
                        style: textStyle,
                        decoration: InputDecoration(
                          focusColor: Theme.of(context).primaryColor,
                          labelStyle: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w300,
                            color: Theme.of(context).primaryColor,
                          ),
                          hintStyle: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w300,
                            color: Theme.of(context).primaryColor,
                          ),
                          labelText: 'Вес',
                          hintText: 'Вес',
                          prefixIcon: Icon(
                            Icons.account_balance_outlined,
                            color: focusNode2.hasFocus ||
                                    weightController.text.isNotEmpty
                                ? Theme.of(context).primaryColor
                                : Colors.grey,
                            size: 32,
                          ),
                          suffixIcon: GestureDetector(
                            onTap: () {
                              weightController.clear();
                            },
                            child: Icon(
                              Icons.delete_outline,
                              color: Color.fromRGBO(187, 30, 16, 1.0),
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            borderSide:
                                BorderSide(color: Colors.grey, width: 2),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            borderSide: BorderSide(
                                color: Theme.of(context).primaryColor,
                                width: 2),
                          ),
                        ),
                        onChanged: (String value) {
                          setState(() {
                            focusNode2.requestFocus();
                            // day.title = value;
                            // titleController.text = day.title ?? '';
                          });
                        },
                      ),
                      SizedBox(height: 10),
                      Divider(thickness: 4),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary:
                                Theme.of(context).accentColor, // background
                            onPrimary: Colors.white,
                            elevation: 2,
                            padding: const EdgeInsets.all(13.0),
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.circular(10.0)) // foreground
                            ),
                        onPressed: () => saveForm1(),
                        child: Text(
                          isEdit
                              ? 'Редактировать и закрыть'
                              : 'Добавить и закрыть',
                          style: const TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Form(
                  key: _1formKey,
                  child: ListView(
                    children: <Widget>[
                      SizedBox(height: 20),
                      Container(
                          alignment: Alignment.center,
                          child: Text(
                            'УПРАЖНЕНИЯ',
                            style: TextStyle(
                                fontSize: 24,
                                color: Theme.of(context).primaryColor,
                                fontWeight: FontWeight.w300),
                          )),
                      SizedBox(height: 20),
                      TextFormField(
                        maxLength: 20,
                        onFieldSubmitted: (String value) {
                          // setState(() {
                          day.titleday = value;
                          // titleController.text = day.title ?? '';
                          // });
                        },
                        validator: (String value) {
                          if (value.isEmpty) {
                            return 'Наименование не введено';
                          } else if (value.length > 20) {
                            return 'Максимальная длина 20';
                          } else {
                            return null;
                          }
                        },
                        keyboardType: TextInputType.text,
                        controller: titleController,
                        focusNode: focusNode1,
                        style: textStyle,
                        decoration: InputDecoration(
                          focusColor: Theme.of(context).primaryColor,
                          labelStyle: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w300,
                            color: Theme.of(context).primaryColor,
                          ),
                          hintStyle: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w300,
                            color: Theme.of(context).primaryColor,
                          ),
                          labelText: 'Назовите этот день тренировки',
                          hintText: 'Например: день первый...',
                          prefixIcon: Icon(
                            Icons.account_balance_outlined,
                            color: focusNode1.hasFocus ||
                                    titleController.text.isNotEmpty
                                ? Theme.of(context).primaryColor
                                : Colors.grey,
                            size: 32,
                          ),
                          suffixIcon: GestureDetector(
                            onTap: () {
                              titleController.clear();
                            },
                            child: Icon(
                              Icons.delete_outline,
                              color: Color.fromRGBO(187, 30, 16, 1.0),
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            borderSide:
                                BorderSide(color: Colors.grey, width: 2),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            borderSide: BorderSide(
                                color: Theme.of(context).primaryColor,
                                width: 2),
                          ),
                        ),
                        onChanged: (String value) {
                          setState(() {
                            focusNode1.requestFocus();
                            // day.title = value;
                            // titleController.text = day.title ?? '';
                          });
                        },
                      ),
                      SizedBox(height: 10),
                      Divider(thickness: 4),
                      SizedBox(height: 10),
                      TextFormField(
                        maxLength: 50,
                        onFieldSubmitted: (String value) {
                          // setState(() {
                          day.weightTotal = value;
                          // titleController.text = day.title ?? '';
                          // });
                        },
                        // validator: (String value) {
                        //   if (value.isEmpty) {
                        //     return 'Наименование не введено';
                        //   } else if (value.length > 50) {
                        //     return 'Максимальная длина 50';
                        //   } else {
                        //     return null;
                        //   }
                        // },
                        keyboardType: TextInputType.text,
                        controller: weightController,
                        focusNode: focusNode2,
                        style: textStyle,
                        decoration: InputDecoration(
                          focusColor: Theme.of(context).primaryColor,
                          labelStyle: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w300,
                            color: Theme.of(context).primaryColor,
                          ),
                          hintStyle: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w300,
                            color: Theme.of(context).primaryColor,
                          ),
                          labelText: 'Вес',
                          hintText: 'Вес',
                          prefixIcon: Icon(
                            Icons.account_balance_outlined,
                            color: focusNode2.hasFocus ||
                                    weightController.text.isNotEmpty
                                ? Theme.of(context).primaryColor
                                : Colors.grey,
                            size: 32,
                          ),
                          suffixIcon: GestureDetector(
                            onTap: () {
                              weightController.clear();
                            },
                            child: Icon(
                              Icons.delete_outline,
                              color: Color.fromRGBO(187, 30, 16, 1.0),
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            borderSide:
                                BorderSide(color: Colors.grey, width: 2),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            borderSide: BorderSide(
                                color: Theme.of(context).primaryColor,
                                width: 2),
                          ),
                        ),
                        onChanged: (String value) {
                          setState(() {
                            focusNode2.requestFocus();
                            // day.title = value;
                            // titleController.text = day.title ?? '';
                          });
                        },
                      ),
                      SizedBox(height: 10),
                      Divider(thickness: 4),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary:
                                Theme.of(context).accentColor, // background
                            onPrimary: Colors.white,
                            elevation: 2,
                            padding: const EdgeInsets.all(13.0),
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.circular(10.0)) // foreground
                            ),
                        onPressed: () => saveForm1(),
                        child: Text(
                          isEdit
                              ? 'Редактировать и закрыть'
                              : 'Добавить и закрыть',
                          style: const TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Form(
                  key: _1formKey,
                  child: ListView(
                    children: <Widget>[
                      SizedBox(height: 20),
                      Container(
                          alignment: Alignment.center,
                          child: Text(
                            'УПРАЖНЕНИЯ',
                            style: TextStyle(
                                fontSize: 24,
                                color: Theme.of(context).primaryColor,
                                fontWeight: FontWeight.w300),
                          )),
                      SizedBox(height: 20),
                      TextFormField(
                        maxLength: 20,
                        onFieldSubmitted: (String value) {
                          // setState(() {
                          day.titleday = value;
                          // titleController.text = day.title ?? '';
                          // });
                        },
                        validator: (String value) {
                          if (value.isEmpty) {
                            return 'Наименование не введено';
                          } else if (value.length > 20) {
                            return 'Максимальная длина 20';
                          } else {
                            return null;
                          }
                        },
                        keyboardType: TextInputType.text,
                        controller: titleController,
                        focusNode: focusNode1,
                        style: textStyle,
                        decoration: InputDecoration(
                          focusColor: Theme.of(context).primaryColor,
                          labelStyle: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w300,
                            color: Theme.of(context).primaryColor,
                          ),
                          hintStyle: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w300,
                            color: Theme.of(context).primaryColor,
                          ),
                          labelText: 'Назовите этот день тренировки',
                          hintText: 'Например: день первый...',
                          prefixIcon: Icon(
                            Icons.account_balance_outlined,
                            color: focusNode1.hasFocus ||
                                    titleController.text.isNotEmpty
                                ? Theme.of(context).primaryColor
                                : Colors.grey,
                            size: 32,
                          ),
                          suffixIcon: GestureDetector(
                            onTap: () {
                              titleController.clear();
                            },
                            child: Icon(
                              Icons.delete_outline,
                              color: Color.fromRGBO(187, 30, 16, 1.0),
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            borderSide:
                                BorderSide(color: Colors.grey, width: 2),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            borderSide: BorderSide(
                                color: Theme.of(context).primaryColor,
                                width: 2),
                          ),
                        ),
                        onChanged: (String value) {
                          setState(() {
                            focusNode1.requestFocus();
                            // day.title = value;
                            // titleController.text = day.title ?? '';
                          });
                        },
                      ),
                      SizedBox(height: 10),
                      Divider(thickness: 4),
                      SizedBox(height: 10),
                      TextFormField(
                        maxLength: 50,
                        onFieldSubmitted: (String value) {
                          // setState(() {
                          day.weightTotal = value;
                          // titleController.text = day.title ?? '';
                          // });
                        },
                        // validator: (String value) {
                        //   if (value.isEmpty) {
                        //     return 'Наименование не введено';
                        //   } else if (value.length > 50) {
                        //     return 'Максимальная длина 50';
                        //   } else {
                        //     return null;
                        //   }
                        // },
                        keyboardType: TextInputType.text,
                        controller: weightController,
                        focusNode: focusNode2,
                        style: textStyle,
                        decoration: InputDecoration(
                          focusColor: Theme.of(context).primaryColor,
                          labelStyle: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w300,
                            color: Theme.of(context).primaryColor,
                          ),
                          hintStyle: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w300,
                            color: Theme.of(context).primaryColor,
                          ),
                          labelText: 'Вес',
                          hintText: 'Вес',
                          prefixIcon: Icon(
                            Icons.account_balance_outlined,
                            color: focusNode2.hasFocus ||
                                    weightController.text.isNotEmpty
                                ? Theme.of(context).primaryColor
                                : Colors.grey,
                            size: 32,
                          ),
                          suffixIcon: GestureDetector(
                            onTap: () {
                              weightController.clear();
                            },
                            child: Icon(
                              Icons.delete_outline,
                              color: Color.fromRGBO(187, 30, 16, 1.0),
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            borderSide:
                                BorderSide(color: Colors.grey, width: 2),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            borderSide: BorderSide(
                                color: Theme.of(context).primaryColor,
                                width: 2),
                          ),
                        ),
                        onChanged: (String value) {
                          setState(() {
                            focusNode2.requestFocus();
                            // day.title = value;
                            // titleController.text = day.title ?? '';
                          });
                        },
                      ),
                      SizedBox(height: 10),
                      Divider(thickness: 4),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary:
                                Theme.of(context).accentColor, // background
                            onPrimary: Colors.white,
                            elevation: 2,
                            padding: const EdgeInsets.all(13.0),
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.circular(10.0)) // foreground
                            ),
                        onPressed: () => saveForm1(),
                        child: Text(
                          isEdit
                              ? 'Редактировать и закрыть'
                              : 'Добавить и закрыть',
                          style: const TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Form(
                  key: _1formKey,
                  child: ListView(
                    children: <Widget>[
                      SizedBox(height: 20),
                      Container(
                          alignment: Alignment.center,
                          child: Text(
                            'УПРАЖНЕНИЯ',
                            style: TextStyle(
                                fontSize: 24,
                                color: Theme.of(context).primaryColor,
                                fontWeight: FontWeight.w300),
                          )),
                      SizedBox(height: 20),
                      TextFormField(
                        maxLength: 20,
                        onFieldSubmitted: (String value) {
                          // setState(() {
                          day.titleday = value;
                          // titleController.text = day.title ?? '';
                          // });
                        },
                        validator: (String value) {
                          if (value.isEmpty) {
                            return 'Наименование не введено';
                          } else if (value.length > 20) {
                            return 'Максимальная длина 20';
                          } else {
                            return null;
                          }
                        },
                        keyboardType: TextInputType.text,
                        controller: titleController,
                        focusNode: focusNode1,
                        style: textStyle,
                        decoration: InputDecoration(
                          focusColor: Theme.of(context).primaryColor,
                          labelStyle: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w300,
                            color: Theme.of(context).primaryColor,
                          ),
                          hintStyle: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w300,
                            color: Theme.of(context).primaryColor,
                          ),
                          labelText: 'Назовите этот день тренировки',
                          hintText: 'Например: день первый...',
                          prefixIcon: Icon(
                            Icons.account_balance_outlined,
                            color: focusNode1.hasFocus ||
                                    titleController.text.isNotEmpty
                                ? Theme.of(context).primaryColor
                                : Colors.grey,
                            size: 32,
                          ),
                          suffixIcon: GestureDetector(
                            onTap: () {
                              titleController.clear();
                            },
                            child: Icon(
                              Icons.delete_outline,
                              color: Color.fromRGBO(187, 30, 16, 1.0),
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            borderSide:
                                BorderSide(color: Colors.grey, width: 2),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            borderSide: BorderSide(
                                color: Theme.of(context).primaryColor,
                                width: 2),
                          ),
                        ),
                        onChanged: (String value) {
                          setState(() {
                            focusNode1.requestFocus();
                            // day.title = value;
                            // titleController.text = day.title ?? '';
                          });
                        },
                      ),
                      SizedBox(height: 10),
                      Divider(thickness: 4),
                      SizedBox(height: 10),
                      TextFormField(
                        maxLength: 50,
                        onFieldSubmitted: (String value) {
                          // setState(() {
                          day.weightTotal = value;
                          // titleController.text = day.title ?? '';
                          // });
                        },
                        // validator: (String value) {
                        //   if (value.isEmpty) {
                        //     return 'Наименование не введено';
                        //   } else if (value.length > 50) {
                        //     return 'Максимальная длина 50';
                        //   } else {
                        //     return null;
                        //   }
                        // },
                        keyboardType: TextInputType.text,
                        controller: weightController,
                        focusNode: focusNode2,
                        style: textStyle,
                        decoration: InputDecoration(
                          focusColor: Theme.of(context).primaryColor,
                          labelStyle: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w300,
                            color: Theme.of(context).primaryColor,
                          ),
                          hintStyle: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w300,
                            color: Theme.of(context).primaryColor,
                          ),
                          labelText: 'Вес',
                          hintText: 'Вес',
                          prefixIcon: Icon(
                            Icons.account_balance_outlined,
                            color: focusNode2.hasFocus ||
                                    weightController.text.isNotEmpty
                                ? Theme.of(context).primaryColor
                                : Colors.grey,
                            size: 32,
                          ),
                          suffixIcon: GestureDetector(
                            onTap: () {
                              weightController.clear();
                            },
                            child: Icon(
                              Icons.delete_outline,
                              color: Color.fromRGBO(187, 30, 16, 1.0),
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            borderSide:
                                BorderSide(color: Colors.grey, width: 2),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            borderSide: BorderSide(
                                color: Theme.of(context).primaryColor,
                                width: 2),
                          ),
                        ),
                        onChanged: (String value) {
                          setState(() {
                            focusNode2.requestFocus();
                            // day.title = value;
                            // titleController.text = day.title ?? '';
                          });
                        },
                      ),
                      SizedBox(height: 10),
                      Divider(thickness: 4),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary:
                                Theme.of(context).accentColor, // background
                            onPrimary: Colors.white,
                            elevation: 2,
                            padding: const EdgeInsets.all(13.0),
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.circular(10.0)) // foreground
                            ),
                        onPressed: () => saveForm1(),
                        child: Text(
                          isEdit
                              ? 'Редактировать и закрыть'
                              : 'Добавить и закрыть',
                          style: const TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Form(
                  key: _1formKey,
                  child: ListView(
                    children: <Widget>[
                      SizedBox(height: 20),
                      Container(
                          alignment: Alignment.center,
                          child: Text(
                            'УПРАЖНЕНИЯ',
                            style: TextStyle(
                                fontSize: 24,
                                color: Theme.of(context).primaryColor,
                                fontWeight: FontWeight.w300),
                          )),
                      SizedBox(height: 20),
                      TextFormField(
                        maxLength: 20,
                        onFieldSubmitted: (String value) {
                          // setState(() {
                          day.titleday = value;
                          // titleController.text = day.title ?? '';
                          // });
                        },
                        validator: (String value) {
                          if (value.isEmpty) {
                            return 'Наименование не введено';
                          } else if (value.length > 20) {
                            return 'Максимальная длина 20';
                          } else {
                            return null;
                          }
                        },
                        keyboardType: TextInputType.text,
                        controller: titleController,
                        focusNode: focusNode1,
                        style: textStyle,
                        decoration: InputDecoration(
                          focusColor: Theme.of(context).primaryColor,
                          labelStyle: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w300,
                            color: Theme.of(context).primaryColor,
                          ),
                          hintStyle: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w300,
                            color: Theme.of(context).primaryColor,
                          ),
                          labelText: 'Назовите этот день тренировки',
                          hintText: 'Например: день первый...',
                          prefixIcon: Icon(
                            Icons.account_balance_outlined,
                            color: focusNode1.hasFocus ||
                                    titleController.text.isNotEmpty
                                ? Theme.of(context).primaryColor
                                : Colors.grey,
                            size: 32,
                          ),
                          suffixIcon: GestureDetector(
                            onTap: () {
                              titleController.clear();
                            },
                            child: Icon(
                              Icons.delete_outline,
                              color: Color.fromRGBO(187, 30, 16, 1.0),
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            borderSide:
                                BorderSide(color: Colors.grey, width: 2),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            borderSide: BorderSide(
                                color: Theme.of(context).primaryColor,
                                width: 2),
                          ),
                        ),
                        onChanged: (String value) {
                          setState(() {
                            focusNode1.requestFocus();
                            // day.title = value;
                            // titleController.text = day.title ?? '';
                          });
                        },
                      ),
                      SizedBox(height: 10),
                      Divider(thickness: 4),
                      SizedBox(height: 10),
                      TextFormField(
                        maxLength: 50,
                        onFieldSubmitted: (String value) {
                          // setState(() {
                          day.weightTotal = value;
                          // titleController.text = day.title ?? '';
                          // });
                        },
                        // validator: (String value) {
                        //   if (value.isEmpty) {
                        //     return 'Наименование не введено';
                        //   } else if (value.length > 50) {
                        //     return 'Максимальная длина 50';
                        //   } else {
                        //     return null;
                        //   }
                        // },
                        keyboardType: TextInputType.text,
                        controller: weightController,
                        focusNode: focusNode2,
                        style: textStyle,
                        decoration: InputDecoration(
                          focusColor: Theme.of(context).primaryColor,
                          labelStyle: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w300,
                            color: Theme.of(context).primaryColor,
                          ),
                          hintStyle: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w300,
                            color: Theme.of(context).primaryColor,
                          ),
                          labelText: 'Вес',
                          hintText: 'Вес',
                          prefixIcon: Icon(
                            Icons.account_balance_outlined,
                            color: focusNode2.hasFocus ||
                                    weightController.text.isNotEmpty
                                ? Theme.of(context).primaryColor
                                : Colors.grey,
                            size: 32,
                          ),
                          suffixIcon: GestureDetector(
                            onTap: () {
                              weightController.clear();
                            },
                            child: Icon(
                              Icons.delete_outline,
                              color: Color.fromRGBO(187, 30, 16, 1.0),
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            borderSide:
                                BorderSide(color: Colors.grey, width: 2),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            borderSide: BorderSide(
                                color: Theme.of(context).primaryColor,
                                width: 2),
                          ),
                        ),
                        onChanged: (String value) {
                          setState(() {
                            focusNode2.requestFocus();
                            // day.title = value;
                            // titleController.text = day.title ?? '';
                          });
                        },
                      ),
                      SizedBox(height: 10),
                      Divider(thickness: 4),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary:
                                Theme.of(context).accentColor, // background
                            onPrimary: Colors.white,
                            elevation: 2,
                            padding: const EdgeInsets.all(13.0),
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.circular(10.0)) // foreground
                            ),
                        onPressed: () => saveForm1(),
                        child: Text(
                          isEdit
                              ? 'Редактировать и закрыть'
                              : 'Добавить и закрыть',
                          style: const TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Form(
                  key: _1formKey,
                  child: ListView(
                    children: <Widget>[
                      SizedBox(height: 20),
                      Container(
                          alignment: Alignment.center,
                          child: Text(
                            'УПРАЖНЕНИЯ',
                            style: TextStyle(
                                fontSize: 24,
                                color: Theme.of(context).primaryColor,
                                fontWeight: FontWeight.w300),
                          )),
                      SizedBox(height: 20),
                      TextFormField(
                        maxLength: 20,
                        onFieldSubmitted: (String value) {
                          // setState(() {
                          day.titleday = value;
                          // titleController.text = day.title ?? '';
                          // });
                        },
                        validator: (String value) {
                          if (value.isEmpty) {
                            return 'Наименование не введено';
                          } else if (value.length > 20) {
                            return 'Максимальная длина 20';
                          } else {
                            return null;
                          }
                        },
                        keyboardType: TextInputType.text,
                        controller: titleController,
                        focusNode: focusNode1,
                        style: textStyle,
                        decoration: InputDecoration(
                          focusColor: Theme.of(context).primaryColor,
                          labelStyle: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w300,
                            color: Theme.of(context).primaryColor,
                          ),
                          hintStyle: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w300,
                            color: Theme.of(context).primaryColor,
                          ),
                          labelText: 'Назовите этот день тренировки',
                          hintText: 'Например: день первый...',
                          prefixIcon: Icon(
                            Icons.account_balance_outlined,
                            color: focusNode1.hasFocus ||
                                    titleController.text.isNotEmpty
                                ? Theme.of(context).primaryColor
                                : Colors.grey,
                            size: 32,
                          ),
                          suffixIcon: GestureDetector(
                            onTap: () {
                              titleController.clear();
                            },
                            child: Icon(
                              Icons.delete_outline,
                              color: Color.fromRGBO(187, 30, 16, 1.0),
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            borderSide:
                                BorderSide(color: Colors.grey, width: 2),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            borderSide: BorderSide(
                                color: Theme.of(context).primaryColor,
                                width: 2),
                          ),
                        ),
                        onChanged: (String value) {
                          setState(() {
                            focusNode1.requestFocus();
                            // day.title = value;
                            // titleController.text = day.title ?? '';
                          });
                        },
                      ),
                      SizedBox(height: 10),
                      Divider(thickness: 4),
                      SizedBox(height: 10),
                      TextFormField(
                        maxLength: 50,
                        onFieldSubmitted: (String value) {
                          // setState(() {
                          day.weightTotal = value;
                          // titleController.text = day.title ?? '';
                          // });
                        },
                        // validator: (String value) {
                        //   if (value.isEmpty) {
                        //     return 'Наименование не введено';
                        //   } else if (value.length > 50) {
                        //     return 'Максимальная длина 50';
                        //   } else {
                        //     return null;
                        //   }
                        // },
                        keyboardType: TextInputType.text,
                        controller: weightController,
                        focusNode: focusNode2,
                        style: textStyle,
                        decoration: InputDecoration(
                          focusColor: Theme.of(context).primaryColor,
                          labelStyle: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w300,
                            color: Theme.of(context).primaryColor,
                          ),
                          hintStyle: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w300,
                            color: Theme.of(context).primaryColor,
                          ),
                          labelText: 'Вес',
                          hintText: 'Вес',
                          prefixIcon: Icon(
                            Icons.account_balance_outlined,
                            color: focusNode2.hasFocus ||
                                    weightController.text.isNotEmpty
                                ? Theme.of(context).primaryColor
                                : Colors.grey,
                            size: 32,
                          ),
                          suffixIcon: GestureDetector(
                            onTap: () {
                              weightController.clear();
                            },
                            child: Icon(
                              Icons.delete_outline,
                              color: Color.fromRGBO(187, 30, 16, 1.0),
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            borderSide:
                                BorderSide(color: Colors.grey, width: 2),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            borderSide: BorderSide(
                                color: Theme.of(context).primaryColor,
                                width: 2),
                          ),
                        ),
                        onChanged: (String value) {
                          setState(() {
                            focusNode2.requestFocus();
                            // day.title = value;
                            // titleController.text = day.title ?? '';
                          });
                        },
                      ),
                      SizedBox(height: 10),
                      Divider(thickness: 4),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary:
                                Theme.of(context).accentColor, // background
                            onPrimary: Colors.white,
                            elevation: 2,
                            padding: const EdgeInsets.all(13.0),
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.circular(10.0)) // foreground
                            ),
                        onPressed: () => saveForm1(),
                        child: Text(
                          isEdit
                              ? 'Редактировать и закрыть'
                              : 'Добавить и закрыть',
                          style: const TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Form(
                  key: _1formKey,
                  child: ListView(
                    children: <Widget>[
                      SizedBox(height: 20),
                      Container(
                          alignment: Alignment.center,
                          child: Text(
                            'УПРАЖНЕНИЯ',
                            style: TextStyle(
                                fontSize: 24,
                                color: Theme.of(context).primaryColor,
                                fontWeight: FontWeight.w300),
                          )),
                      SizedBox(height: 20),
                      TextFormField(
                        maxLength: 20,
                        onFieldSubmitted: (String value) {
                          // setState(() {
                          day.titleday = value;
                          // titleController.text = day.title ?? '';
                          // });
                        },
                        validator: (String value) {
                          if (value.isEmpty) {
                            return 'Наименование не введено';
                          } else if (value.length > 20) {
                            return 'Максимальная длина 20';
                          } else {
                            return null;
                          }
                        },
                        keyboardType: TextInputType.text,
                        controller: titleController,
                        focusNode: focusNode1,
                        style: textStyle,
                        decoration: InputDecoration(
                          focusColor: Theme.of(context).primaryColor,
                          labelStyle: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w300,
                            color: Theme.of(context).primaryColor,
                          ),
                          hintStyle: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w300,
                            color: Theme.of(context).primaryColor,
                          ),
                          labelText: 'Назовите этот день тренировки',
                          hintText: 'Например: день первый...',
                          prefixIcon: Icon(
                            Icons.account_balance_outlined,
                            color: focusNode1.hasFocus ||
                                    titleController.text.isNotEmpty
                                ? Theme.of(context).primaryColor
                                : Colors.grey,
                            size: 32,
                          ),
                          suffixIcon: GestureDetector(
                            onTap: () {
                              titleController.clear();
                            },
                            child: Icon(
                              Icons.delete_outline,
                              color: Color.fromRGBO(187, 30, 16, 1.0),
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            borderSide:
                                BorderSide(color: Colors.grey, width: 2),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            borderSide: BorderSide(
                                color: Theme.of(context).primaryColor,
                                width: 2),
                          ),
                        ),
                        onChanged: (String value) {
                          setState(() {
                            focusNode1.requestFocus();
                            // day.title = value;
                            // titleController.text = day.title ?? '';
                          });
                        },
                      ),
                      SizedBox(height: 10),
                      Divider(thickness: 4),
                      SizedBox(height: 10),
                      TextFormField(
                        maxLength: 50,
                        onFieldSubmitted: (String value) {
                          // setState(() {
                          day.weightTotal = value;
                          // titleController.text = day.title ?? '';
                          // });
                        },
                        // validator: (String value) {
                        //   if (value.isEmpty) {
                        //     return 'Наименование не введено';
                        //   } else if (value.length > 50) {
                        //     return 'Максимальная длина 50';
                        //   } else {
                        //     return null;
                        //   }
                        // },
                        keyboardType: TextInputType.text,
                        controller: weightController,
                        focusNode: focusNode2,
                        style: textStyle,
                        decoration: InputDecoration(
                          focusColor: Theme.of(context).primaryColor,
                          labelStyle: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w300,
                            color: Theme.of(context).primaryColor,
                          ),
                          hintStyle: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w300,
                            color: Theme.of(context).primaryColor,
                          ),
                          labelText: 'Вес',
                          hintText: 'Вес',
                          prefixIcon: Icon(
                            Icons.account_balance_outlined,
                            color: focusNode2.hasFocus ||
                                    weightController.text.isNotEmpty
                                ? Theme.of(context).primaryColor
                                : Colors.grey,
                            size: 32,
                          ),
                          suffixIcon: GestureDetector(
                            onTap: () {
                              weightController.clear();
                            },
                            child: Icon(
                              Icons.delete_outline,
                              color: Color.fromRGBO(187, 30, 16, 1.0),
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            borderSide:
                                BorderSide(color: Colors.grey, width: 2),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            borderSide: BorderSide(
                                color: Theme.of(context).primaryColor,
                                width: 2),
                          ),
                        ),
                        onChanged: (String value) {
                          setState(() {
                            focusNode2.requestFocus();
                            // day.title = value;
                            // titleController.text = day.title ?? '';
                          });
                        },
                      ),
                      SizedBox(height: 10),
                      Divider(thickness: 4),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary:
                                Theme.of(context).accentColor, // background
                            onPrimary: Colors.white,
                            elevation: 2,
                            padding: const EdgeInsets.all(13.0),
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.circular(10.0)) // foreground
                            ),
                        onPressed: () => saveForm1(),
                        child: Text(
                          isEdit
                              ? 'Редактировать и закрыть'
                              : 'Добавить и закрыть',
                          style: const TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void confirmDelete() {
    showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: const Text('Вы действительно хотите удалить запись?',
            style: TextStyle(fontSize: 15.0)),
        actions: <Widget>[
          TextButton(
              child: const Text('Закрыть'),
              onPressed: () => Navigator.of(context).pop()),
          TextButton(
              child: const Text(
                'Удалить',
                style: TextStyle(
                    color: Color.fromRGBO(187, 30, 16, 1.0),
                    fontWeight: FontWeight.bold),
              ),
              onPressed: () {
                helperD.deleteDay(day.id);
                Navigator.of(context).pop();
                Navigator.pop(context, true);
              })
        ],
      ),
    );
  }

  void saveForm1() {
    final form = _1formKey.currentState;
    if (form.validate()) {
      form.save();
      day.todoDate = DateFormat.yMMMMd().format(DateTime.now());
      if (day.id != null) {
        helperD.updateDay(day);
      } else {
        helperD.insertDay(day);
      }
      Navigator.pop(context, true);
    }
  }

  void saveForm12() {
    final form = _1formKey.currentState;
    if (form.validate()) {
      form.save();
      day.todoDate = DateFormat.yMMMMd().format(DateTime.now());
      if (day.id != null) {
        helperD.updateDay(day);
      } else {
        helperD.insertDay(day);
      }
      // Navigator.pop(context, true);
    }
  }

  void saveForm2() {
    final form = _2formKey.currentState;
    if (form.validate()) {
      form.save();
      day.todoDate = DateFormat.yMMMMd().format(DateTime.now());
      if (day.id != null) {
        helperD.updateDay(day);
      } else {
        helperD.insertDay(day);
      }
      Navigator.pop(context, true);
    }
  }

  void saveForm22() {
    final form = _2formKey.currentState;
    if (form.validate()) {
      form.save();
      day.todoDate = DateFormat.yMMMMd().format(DateTime.now());
      if (day.id != null) {
        helperD.updateDay(day);
      } else {
        helperD.insertDay(day);
      }
      // Navigator.pop(context, true);
    }
  }

  void saveForm3() {
    final form = _3formKey.currentState;
    if (form.validate()) {
      form.save();
      day.todoDate = DateFormat.yMMMMd().format(DateTime.now());
      if (day.id != null) {
        helperD.updateDay(day);
      } else {
        helperD.insertDay(day);
      }
      Navigator.pop(context, true);
    }
  }

  void saveForm32() {
    final form = _3formKey.currentState;
    if (form.validate()) {
      form.save();
      day.todoDate = DateFormat.yMMMMd().format(DateTime.now());
      if (day.id != null) {
        helperD.updateDay(day);
      } else {
        helperD.insertDay(day);
      }
      // Navigator.pop(context, true);
    }
  }

  void saveForm4() {
    final form = _4formKey.currentState;
    if (form.validate()) {
      form.save();
      day.todoDate = DateFormat.yMMMMd().format(DateTime.now());
      if (day.id != null) {
        helperD.updateDay(day);
      } else {
        helperD.insertDay(day);
      }
      Navigator.pop(context, true);
    }
  }

  void saveForm42() {
    final form = _4formKey.currentState;
    if (form.validate()) {
      form.save();
      day.todoDate = DateFormat.yMMMMd().format(DateTime.now());
      if (day.id != null) {
        helperD.updateDay(day);
      } else {
        helperD.insertDay(day);
      }
      // Navigator.pop(context, true);
    }
  }

  void saveForm5() {
    final form = _5formKey.currentState;
    if (form.validate()) {
      form.save();
      day.todoDate = DateFormat.yMMMMd().format(DateTime.now());
      if (day.id != null) {
        helperD.updateDay(day);
      } else {
        helperD.insertDay(day);
      }
      Navigator.pop(context, true);
    }
  }

  void saveForm52() {
    final form = _5formKey.currentState;
    if (form.validate()) {
      form.save();
      day.todoDate = DateFormat.yMMMMd().format(DateTime.now());
      if (day.id != null) {
        helperD.updateDay(day);
      } else {
        helperD.insertDay(day);
      }
      // Navigator.pop(context, true);
    }
  }

  void saveForm6() {
    final form = _6formKey.currentState;
    if (form.validate()) {
      form.save();
      day.todoDate = DateFormat.yMMMMd().format(DateTime.now());
      if (day.id != null) {
        helperD.updateDay(day);
      } else {
        helperD.insertDay(day);
      }
      Navigator.pop(context, true);
    }
  }

  void saveForm62() {
    final form = _6formKey.currentState;
    if (form.validate()) {
      form.save();
      day.todoDate = DateFormat.yMMMMd().format(DateTime.now());
      if (day.id != null) {
        helperD.updateDay(day);
      } else {
        helperD.insertDay(day);
      }
      // Navigator.pop(context, true);
    }
  }

  void saveForm7() {
    final form = _7formKey.currentState;
    if (form.validate()) {
      form.save();
      day.todoDate = DateFormat.yMMMMd().format(DateTime.now());
      if (day.id != null) {
        helperD.updateDay(day);
      } else {
        helperD.insertDay(day);
      }
      Navigator.pop(context, true);
    }
  }

  void saveForm72() {
    final form = _7formKey.currentState;
    if (form.validate()) {
      form.save();
      day.todoDate = DateFormat.yMMMMd().format(DateTime.now());
      if (day.id != null) {
        helperD.updateDay(day);
      } else {
        helperD.insertDay(day);
      }
      // Navigator.pop(context, true);
    }
  }

  void saveForm8() {
    final form = _8formKey.currentState;
    if (form.validate()) {
      form.save();
      day.todoDate = DateFormat.yMMMMd().format(DateTime.now());
      if (day.id != null) {
        helperD.updateDay(day);
      } else {
        helperD.insertDay(day);
      }
      Navigator.pop(context, true);
    }
  }

  void saveForm82() {
    final form = _8formKey.currentState;
    if (form.validate()) {
      form.save();
      day.todoDate = DateFormat.yMMMMd().format(DateTime.now());
      if (day.id != null) {
        helperD.updateDay(day);
      } else {
        helperD.insertDay(day);
      }
      // Navigator.pop(context, true);
    }
  }

  void saveForm9() {
    final form = _9formKey.currentState;
    if (form.validate()) {
      form.save();
      day.todoDate = DateFormat.yMMMMd().format(DateTime.now());
      if (day.id != null) {
        helperD.updateDay(day);
      } else {
        helperD.insertDay(day);
      }
      Navigator.pop(context, true);
    }
  }

  void saveForm92() {
    final form = _9formKey.currentState;
    if (form.validate()) {
      form.save();
      day.todoDate = DateFormat.yMMMMd().format(DateTime.now());
      if (day.id != null) {
        helperD.updateDay(day);
      } else {
        helperD.insertDay(day);
      }
      // Navigator.pop(context, true);
    }
  }

  void saveForm10() {
    final form = _10formKey.currentState;
    if (form.validate()) {
      form.save();
      day.todoDate = DateFormat.yMMMMd().format(DateTime.now());
      if (day.id != null) {
        helperD.updateDay(day);
      } else {
        helperD.insertDay(day);
      }
      Navigator.pop(context, true);
    }
  }

  void saveForm102() {
    final form = _10formKey.currentState;
    if (form.validate()) {
      form.save();
      day.todoDate = DateFormat.yMMMMd().format(DateTime.now());
      if (day.id != null) {
        helperD.updateDay(day);
      } else {
        helperD.insertDay(day);
      }
      // Navigator.pop(context, true);
    }
  }

  void saveForm11() {
    final form = _11formKey.currentState;
    if (form.validate()) {
      form.save();
      day.todoDate = DateFormat.yMMMMd().format(DateTime.now());
      if (day.id != null) {
        helperD.updateDay(day);
      } else {
        helperD.insertDay(day);
      }
      Navigator.pop(context, true);
    }
  }

  void saveForm112() {
    final form = _11formKey.currentState;
    if (form.validate()) {
      form.save();
      day.todoDate = DateFormat.yMMMMd().format(DateTime.now());
      if (day.id != null) {
        helperD.updateDay(day);
      } else {
        helperD.insertDay(day);
      }
      // Navigator.pop(context, true);
    }
  }

  void saveForm121() {
    final form = _12formKey.currentState;
    if (form.validate()) {
      form.save();
      day.todoDate = DateFormat.yMMMMd().format(DateTime.now());
      if (day.id != null) {
        helperD.updateDay(day);
      } else {
        helperD.insertDay(day);
      }
      Navigator.pop(context, true);
    }
  }

  void saveForm122() {
    final form = _12formKey.currentState;
    if (form.validate()) {
      form.save();
      day.todoDate = DateFormat.yMMMMd().format(DateTime.now());
      if (day.id != null) {
        helperD.updateDay(day);
      } else {
        helperD.insertDay(day);
      }
      // Navigator.pop(context, true);
    }
  }

  void saveForm13() {
    final form = _13formKey.currentState;
    if (form.validate()) {
      form.save();
      day.todoDate = DateFormat.yMMMMd().format(DateTime.now());
      if (day.id != null) {
        helperD.updateDay(day);
      } else {
        helperD.insertDay(day);
      }
      Navigator.pop(context, true);
    }
  }

  void saveForm132() {
    final form = _13formKey.currentState;
    if (form.validate()) {
      form.save();
      day.todoDate = DateFormat.yMMMMd().format(DateTime.now());
      if (day.id != null) {
        helperD.updateDay(day);
      } else {
        helperD.insertDay(day);
      }
      // Navigator.pop(context, true);
    }
  }

  void saveForm14() {
    final form = _14formKey.currentState;
    if (form.validate()) {
      form.save();
      day.todoDate = DateFormat.yMMMMd().format(DateTime.now());
      if (day.id != null) {
        helperD.updateDay(day);
      } else {
        helperD.insertDay(day);
      }
      Navigator.pop(context, true);
    }
  }

  void saveForm142() {
    final form = _14formKey.currentState;
    if (form.validate()) {
      form.save();
      day.todoDate = DateFormat.yMMMMd().format(DateTime.now());
      if (day.id != null) {
        helperD.updateDay(day);
      } else {
        helperD.insertDay(day);
      }
      // Navigator.pop(context, true);
    }
  }

  void saveForm15() {
    final form = _15formKey.currentState;
    if (form.validate()) {
      form.save();
      day.todoDate = DateFormat.yMMMMd().format(DateTime.now());
      if (day.id != null) {
        helperD.updateDay(day);
      } else {
        helperD.insertDay(day);
      }
      Navigator.pop(context, true);
    }
  }

  void saveForm152() {
    final form = _15formKey.currentState;
    if (form.validate()) {
      form.save();
      day.todoDate = DateFormat.yMMMMd().format(DateTime.now());
      if (day.id != null) {
        helperD.updateDay(day);
      } else {
        helperD.insertDay(day);
      }
      // Navigator.pop(context, true);
    }
  }

  void saveForm16() {
    final form = _16formKey.currentState;
    if (form.validate()) {
      form.save();
      day.todoDate = DateFormat.yMMMMd().format(DateTime.now());
      if (day.id != null) {
        helperD.updateDay(day);
      } else {
        helperD.insertDay(day);
      }
      Navigator.pop(context, true);
    }
  }

  void saveForm162() {
    final form = _16formKey.currentState;
    if (form.validate()) {
      form.save();
      day.todoDate = DateFormat.yMMMMd().format(DateTime.now());
      if (day.id != null) {
        helperD.updateDay(day);
      } else {
        helperD.insertDay(day);
      }
      // Navigator.pop(context, true);
    }
  }

  void saveForm17() {
    final form = _17formKey.currentState;
    if (form.validate()) {
      form.save();
      day.todoDate = DateFormat.yMMMMd().format(DateTime.now());
      if (day.id != null) {
        helperD.updateDay(day);
      } else {
        helperD.insertDay(day);
      }
      Navigator.pop(context, true);
    }
  }

  void saveForm172() {
    final form = _17formKey.currentState;
    if (form.validate()) {
      form.save();
      day.todoDate = DateFormat.yMMMMd().format(DateTime.now());
      if (day.id != null) {
        helperD.updateDay(day);
      } else {
        helperD.insertDay(day);
      }
      // Navigator.pop(context, true);
    }
  }

  void saveForm18() {
    final form = _18formKey.currentState;
    if (form.validate()) {
      form.save();
      day.todoDate = DateFormat.yMMMMd().format(DateTime.now());
      if (day.id != null) {
        helperD.updateDay(day);
      } else {
        helperD.insertDay(day);
      }
      Navigator.pop(context, true);
    }
  }

  void saveForm182() {
    final form = _18formKey.currentState;
    if (form.validate()) {
      form.save();
      day.todoDate = DateFormat.yMMMMd().format(DateTime.now());
      if (day.id != null) {
        helperD.updateDay(day);
      } else {
        helperD.insertDay(day);
      }
      // Navigator.pop(context, true);
    }
  }

  void saveForm19() {
    final form = _19formKey.currentState;
    if (form.validate()) {
      form.save();
      day.todoDate = DateFormat.yMMMMd().format(DateTime.now());
      if (day.id != null) {
        helperD.updateDay(day);
      } else {
        helperD.insertDay(day);
      }
      Navigator.pop(context, true);
    }
  }

  void saveForm192() {
    final form = _19formKey.currentState;
    if (form.validate()) {
      form.save();
      day.todoDate = DateFormat.yMMMMd().format(DateTime.now());
      if (day.id != null) {
        helperD.updateDay(day);
      } else {
        helperD.insertDay(day);
      }
      // Navigator.pop(context, true);
    }
  }

  void saveForm20() {
    final form = _20formKey.currentState;
    if (form.validate()) {
      form.save();
      day.todoDate = DateFormat.yMMMMd().format(DateTime.now());
      if (day.id != null) {
        helperD.updateDay(day);
      } else {
        helperD.insertDay(day);
      }
      Navigator.pop(context, true);
    }
  }

  void saveForm202() {
    final form = _20formKey.currentState;
    if (form.validate()) {
      form.save();
      day.todoDate = DateFormat.yMMMMd().format(DateTime.now());
      if (day.id != null) {
        helperD.updateDay(day);
      } else {
        helperD.insertDay(day);
      }
      // Navigator.pop(context, true);
    }
  }
}

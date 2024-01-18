import 'dart:io';
import 'dart:math';
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import './search.dart';
import './watch.dart';
import './dbhelper_day.dart';
import './model_day.dart';
import './list_day.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:english_words/english_words.dart' as english_words;

class DayDetail extends StatefulWidget {
  const DayDetail({Key key, @required this.day});
  final Day day;
  @override
  State<StatefulWidget> createState() => DayDetailState(day);
}

class DayDetailState extends State<DayDetail> {
  DbHelperDay helperD = DbHelperDay();
  List<Day> todos;

  Stopwatch _stopwatch = Stopwatch();
  Timer _timer;
  bool _isRunning = false;

  Day day;
  String locationData = '';
  double _currentWeight = 0;

  DateTime dateTren; // Дата выбранная для date

  FocusNode focusNode1 = FocusNode();
  FocusNode focusNode2 = FocusNode();
  FocusNode focusNode3 = FocusNode();
  FocusNode focusNode4 = FocusNode();
  FocusNode focusNode5 = FocusNode();
  FocusNode focusNode6 = FocusNode();
  FocusNode focusNode7 = FocusNode();
  FocusNode focusNode8 = FocusNode();
  FocusNode focusNode9 = FocusNode();
  FocusNode focusNode10 = FocusNode();
  FocusNode focusNode11 = FocusNode();
  FocusNode focusNode12 = FocusNode();
  FocusNode focusNode13 = FocusNode();
  FocusNode focusNode14 = FocusNode();
  FocusNode focusNode15 = FocusNode();
  FocusNode focusNode16 = FocusNode();
  FocusNode focusNode17 = FocusNode();
  FocusNode focusNode18 = FocusNode();
  FocusNode focusNode19 = FocusNode();
  FocusNode focusNode20 = FocusNode();
  FocusNode focusNode21 = FocusNode();
  FocusNode focusNode22 = FocusNode();
  FocusNode focusNode23 = FocusNode();
  FocusNode focusNode24 = FocusNode();
  FocusNode focusNode25 = FocusNode();
  FocusNode focusNode26 = FocusNode();
  FocusNode focusNode27 = FocusNode();
  FocusNode focusNode28 = FocusNode();
  FocusNode focusNode29 = FocusNode();
  FocusNode focusNode30 = FocusNode();
  FocusNode focusNode31 = FocusNode();
  FocusNode focusNode32 = FocusNode();
  FocusNode focusNode33 = FocusNode();
  FocusNode focusNode34 = FocusNode();
  FocusNode focusNode35 = FocusNode();
  FocusNode focusNode36 = FocusNode();
  FocusNode focusNode37 = FocusNode();
  FocusNode focusNode38 = FocusNode();
  FocusNode focusNode39 = FocusNode();
  FocusNode focusNode40 = FocusNode();
  FocusNode focusNode41 = FocusNode();
  FocusNode focusNode42 = FocusNode();
  FocusNode focusNode43 = FocusNode();
  FocusNode focusNode44 = FocusNode();
  FocusNode focusNode45 = FocusNode();
  FocusNode focusNode46 = FocusNode();
  FocusNode focusNode47 = FocusNode();
  FocusNode focusNode48 = FocusNode();
  FocusNode focusNode49 = FocusNode();
  FocusNode focusNode50 = FocusNode();

  Color _cardColor = Colors.white;

  TextEditingController titleController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController dateTrenController = TextEditingController();

  TextEditingController nameExerciseController1 = TextEditingController();
  TextEditingController nameExerciseController2 = TextEditingController();
  TextEditingController nameExerciseController3 = TextEditingController();
  TextEditingController nameExerciseController4 = TextEditingController();
  TextEditingController nameExerciseController5 = TextEditingController();
  TextEditingController nameExerciseController6 = TextEditingController();
  TextEditingController nameExerciseController7 = TextEditingController();
  TextEditingController nameExerciseController8 = TextEditingController();
  TextEditingController nameExerciseController9 = TextEditingController();
  TextEditingController nameExerciseController10 = TextEditingController();
  TextEditingController nameExerciseController11 = TextEditingController();
  TextEditingController nameExerciseController12 = TextEditingController();
  TextEditingController nameExerciseController13 = TextEditingController();
  TextEditingController nameExerciseController14 = TextEditingController();
  TextEditingController nameExerciseController15 = TextEditingController();
  TextEditingController nameExerciseController16 = TextEditingController();
  TextEditingController nameExerciseController17 = TextEditingController();
  TextEditingController nameExerciseController18 = TextEditingController();
  TextEditingController nameExerciseController19 = TextEditingController();
  TextEditingController nameExerciseController20 = TextEditingController();

  TextEditingController weightTotalController = TextEditingController();
  TextEditingController weightController1 = TextEditingController();
  TextEditingController weightController2 = TextEditingController();
  TextEditingController weightController3 = TextEditingController();
  TextEditingController weightController4 = TextEditingController();
  TextEditingController weightController5 = TextEditingController();
  TextEditingController weightController6 = TextEditingController();
  TextEditingController weightController7 = TextEditingController();
  TextEditingController weightController8 = TextEditingController();
  TextEditingController weightController9 = TextEditingController();
  TextEditingController weightController10 = TextEditingController();
  TextEditingController weightController11 = TextEditingController();
  TextEditingController weightController12 = TextEditingController();
  TextEditingController weightController13 = TextEditingController();
  TextEditingController weightController14 = TextEditingController();
  TextEditingController weightController15 = TextEditingController();
  TextEditingController weightController16 = TextEditingController();
  TextEditingController weightController17 = TextEditingController();
  TextEditingController weightController18 = TextEditingController();
  TextEditingController weightController19 = TextEditingController();
  TextEditingController weightController20 = TextEditingController();

  TextEditingController numbApprController1 = TextEditingController();
  TextEditingController numbApprController2 = TextEditingController();
  TextEditingController numbApprController3 = TextEditingController();
  TextEditingController numbApprController4 = TextEditingController();
  TextEditingController numbApprController5 = TextEditingController();
  TextEditingController numbApprController6 = TextEditingController();
  TextEditingController numbApprController7 = TextEditingController();
  TextEditingController numbApprController8 = TextEditingController();
  TextEditingController numbApprController9 = TextEditingController();
  TextEditingController numbApprController10 = TextEditingController();
  TextEditingController numbApprController11 = TextEditingController();
  TextEditingController numbApprController12 = TextEditingController();
  TextEditingController numbApprController13 = TextEditingController();
  TextEditingController numbApprController14 = TextEditingController();
  TextEditingController numbApprController15 = TextEditingController();
  TextEditingController numbApprController16 = TextEditingController();
  TextEditingController numbApprController17 = TextEditingController();
  TextEditingController numbApprController18 = TextEditingController();
  TextEditingController numbApprController19 = TextEditingController();
  TextEditingController numbApprController20 = TextEditingController();

  TextEditingController numbRepitController1 = TextEditingController();
  TextEditingController numbRepitController2 = TextEditingController();
  TextEditingController numbRepitController3 = TextEditingController();
  TextEditingController numbRepitController4 = TextEditingController();
  TextEditingController numbRepitController5 = TextEditingController();
  TextEditingController numbRepitController6 = TextEditingController();
  TextEditingController numbRepitController7 = TextEditingController();
  TextEditingController numbRepitController8 = TextEditingController();
  TextEditingController numbRepitController9 = TextEditingController();
  TextEditingController numbRepitController10 = TextEditingController();
  TextEditingController numbRepitController11 = TextEditingController();
  TextEditingController numbRepitController12 = TextEditingController();
  TextEditingController numbRepitController13 = TextEditingController();
  TextEditingController numbRepitController14 = TextEditingController();
  TextEditingController numbRepitController15 = TextEditingController();
  TextEditingController numbRepitController16 = TextEditingController();
  TextEditingController numbRepitController17 = TextEditingController();
  TextEditingController numbRepitController18 = TextEditingController();
  TextEditingController numbRepitController19 = TextEditingController();
  TextEditingController numbRepitController20 = TextEditingController();

  final List<String> _set = [
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
    '9',
    '10',
  ];

  final List<String> _repeat = [
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
    '9',
    '10',
    '11',
    '12',
    '13',
    '14',
    '15',
    '16',
    '17',
    '18',
    '19',
    '20',
  ];

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

  DayDetailState(this.day);

  @override
  void initState() {
    super.initState();
    isEdit = day.titleday == '' ? false : true;
    titleController.text = day.titleday ?? '';
    nameController.text = day.name ?? '';
    weightTotalController.text = day.weightTotal ?? '';
    dateTrenController.text = day.dateTren ?? '';

    weightController1.text = day.weight1 ?? '';
    weightController2.text = day.weight2 ?? '';
    weightController3.text = day.weight3 ?? '';
    weightController4.text = day.weight4 ?? '';
    weightController5.text = day.weight5 ?? '';
    weightController6.text = day.weight6 ?? '';
    weightController7.text = day.weight7 ?? '';
    weightController8.text = day.weight8 ?? '';
    weightController9.text = day.weight9 ?? '';
    weightController10.text = day.weight10 ?? '';
    weightController11.text = day.weight11 ?? '';
    weightController12.text = day.weight12 ?? '';
    weightController13.text = day.weight13 ?? '';
    weightController14.text = day.weight14 ?? '';
    weightController15.text = day.weight15 ?? '';
    weightController16.text = day.weight16 ?? '';
    weightController17.text = day.weight17 ?? '';
    weightController18.text = day.weight18 ?? '';
    weightController19.text = day.weight19 ?? '';
    weightController20.text = day.weight20 ?? '';

    nameExerciseController1.text = day.nameExercise1 ?? '';
    nameExerciseController2.text = day.nameExercise2 ?? '';
    nameExerciseController3.text = day.nameExercise3 ?? '';
    nameExerciseController4.text = day.nameExercise4 ?? '';
    nameExerciseController5.text = day.nameExercise5 ?? '';
    nameExerciseController6.text = day.nameExercise6 ?? '';
    nameExerciseController7.text = day.nameExercise7 ?? '';
    nameExerciseController8.text = day.nameExercise8 ?? '';
    nameExerciseController9.text = day.nameExercise9 ?? '';
    nameExerciseController10.text = day.nameExercise10 ?? '';
    nameExerciseController11.text = day.nameExercise11 ?? '';
    nameExerciseController12.text = day.nameExercise12 ?? '';
    nameExerciseController13.text = day.nameExercise13 ?? '';
    nameExerciseController14.text = day.nameExercise14 ?? '';
    nameExerciseController15.text = day.nameExercise15 ?? '';
    nameExerciseController16.text = day.nameExercise16 ?? '';
    nameExerciseController17.text = day.nameExercise17 ?? '';
    nameExerciseController18.text = day.nameExercise18 ?? '';
    nameExerciseController19.text = day.nameExercise19 ?? '';
    nameExerciseController20.text = day.nameExercise20 ?? '';

    numbApprController1.text = day.numbAppr1 ?? '';
    numbApprController2.text = day.numbAppr2 ?? '';
    numbApprController3.text = day.numbAppr3 ?? '';
    numbApprController4.text = day.numbAppr4 ?? '';
    numbApprController5.text = day.numbAppr5 ?? '';
    numbApprController6.text = day.numbAppr6 ?? '';
    numbApprController7.text = day.numbAppr7 ?? '';
    numbApprController8.text = day.numbAppr8 ?? '';
    numbApprController9.text = day.numbAppr9 ?? '';
    numbApprController10.text = day.numbAppr10 ?? '';
    numbApprController11.text = day.numbAppr11 ?? '';
    numbApprController12.text = day.numbAppr12 ?? '';
    numbApprController13.text = day.numbAppr13 ?? '';
    numbApprController14.text = day.numbAppr14 ?? '';
    numbApprController15.text = day.numbAppr15 ?? '';
    numbApprController16.text = day.numbAppr16 ?? '';
    numbApprController17.text = day.numbAppr17 ?? '';
    numbApprController18.text = day.numbAppr18 ?? '';
    numbApprController19.text = day.numbAppr19 ?? '';
    numbApprController20.text = day.numbAppr20 ?? '';

    numbRepitController1.text = day.numbRepit1 ?? '';
    numbRepitController2.text = day.numbRepit2 ?? '';
    numbRepitController3.text = day.numbRepit3 ?? '';
    numbRepitController4.text = day.numbRepit4 ?? '';
    numbRepitController5.text = day.numbRepit5 ?? '';
    numbRepitController6.text = day.numbRepit6 ?? '';
    numbRepitController7.text = day.numbRepit7 ?? '';
    numbRepitController8.text = day.numbRepit8 ?? '';
    numbRepitController9.text = day.numbRepit9 ?? '';
    numbRepitController10.text = day.numbRepit10 ?? '';
    numbRepitController11.text = day.numbRepit11 ?? '';
    numbRepitController12.text = day.numbRepit12 ?? '';
    numbRepitController13.text = day.numbRepit13 ?? '';
    numbRepitController14.text = day.numbRepit14 ?? '';
    numbRepitController15.text = day.numbRepit15 ?? '';
    numbRepitController16.text = day.numbRepit16 ?? '';
    numbRepitController17.text = day.numbRepit17 ?? '';
    numbRepitController18.text = day.numbRepit18 ?? '';
    numbRepitController19.text = day.numbRepit19 ?? '';
    numbRepitController20.text = day.numbRepit20 ?? '';
  }

  @override
  void dispose() {
    if (_timer != null) {
      _timer.cancel();
    }
    super.dispose();
  }

  void _startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (Timer timer) {
      if (_stopwatch.isRunning) {
        setState(() {});
      }
    });
  }

  void _toggleTimer() {
    if (_stopwatch.isRunning) {
      _stopwatch.stop();
      setState(() {
        _isRunning = false;
      });
    } else {
      _stopwatch.start();
      _startTimer();
      setState(() {
        _isRunning = true;
      });
    }
  }

  void _resetTimer() {
    if (_stopwatch.isRunning) {
      _stopwatch.stop();
    }
    _stopwatch.reset();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    String formattedTime = TimerTextFormatter.format(_stopwatch.elapsed);
    const TextStyle textStyle = TextStyle(
      fontFamily: 'ASimplerDnm',
      color: Colors.black87,
      fontSize: 16.0,
      fontWeight: FontWeight.w600,
    );

    return DefaultTabController(
      length: 12,
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
                        fontFamily: 'ASimplerDnm',
                        color: Colors.black87,
                        fontSize: 20,
                        // fontWeight: FontWeight.w400,
                      ),
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.clear_rounded,
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
                        Icons.save_as_rounded,
                        color: Colors.green.shade700,
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
                          saveForm120();
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
                        fontFamily: 'ASimplerDnm',
                        color: Colors.black87,
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.save,
                        color: Colors.green.shade700,
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
                          saveForm12();
                        }
                      },
                    ),
                  ],
                ),
          // bottom: TabBar(
          // ),
        ),
        body: Column(
          children: [
            SizedBox(height: 10),
            TabPageSelector(),
            Expanded(
              child: TabBarView(children: [
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Form(
                      key: _1formKey,
                      child: ListView(
                        children: <Widget>[
                          SizedBox(height: 4),
                          Container(
                            alignment: Alignment.center,
                            child: Text(
                              day.titleday != null && day.titleday.isNotEmpty
                                  ? titleController.text
                                  : 'Тренировочный день',
                              style: TextStyle(
                                fontFamily: 'ASimplerDnm',
                                fontSize: 30,
                                color: Colors.black87,
                              ),
                            ),
                          ),
                          SizedBox(height: 20),
                          TextFormField(
                            maxLength: 30,
                            onFieldSubmitted: (String value) {
                              day.titleday = value;
                            },
                            validator: (String value) {
                              if (value.isEmpty) {
                                return 'Наименование не введено';
                              } else if (value.length > 30) {
                                return 'Максимальная длина 30';
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
                                fontSize: 16,
                                fontWeight: FontWeight.w300,
                                color: Colors.black45,
                              ),
                              hintStyle: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w300,
                                color: Colors.black45,
                              ),
                              labelText: day.titleday != null &&
                                      day.titleday.isNotEmpty
                                  ? 'Сегодня день'
                                  : 'Назовите этот день тренировки',
                              hintText: 'Например: день первый...',
                              prefixIcon: Icon(
                                Icons.calendar_today,
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
                              enabledBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.grey, width: 2),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Theme.of(context).primaryColor,
                                    width: 4),
                              ),
                            ),
                            onChanged: (String value) {
                              setState(() {
                                focusNode1.requestFocus();
                              });
                            },
                          ),
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(2.0),
                                child: Container(
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                    'Дата тренировки:',
                                    style: TextStyle(
                                      fontFamily: 'ASimplerDnm',
                                      fontSize: 16,
                                      color: Colors.black45,
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              IconButton(
                                focusNode: focusNode2,
                                onPressed: () async {
                                  DateTime selectedDate = await showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime(2015),
                                    lastDate: dateTren ?? DateTime(2100),
                                    locale: const Locale("ru",
                                        "RU"), // Установите локаль на русский язык
                                  );

                                  if (selectedDate != null) {
                                    setState(() {
                                      dateTren = selectedDate;
                                      dateTrenController.text =
                                          DateFormat('dd.MM.yyyy')
                                              .format(selectedDate);
                                      day.dateTren = dateTrenController.text;
                                    });
                                  }
                                },
                                icon: Icon(
                                  Icons.calendar_month_outlined,
                                  color: focusNode2.hasFocus ||
                                          dateTrenController.text.isNotEmpty
                                      ? Theme.of(context).primaryColor
                                      : Colors.grey,
                                  size: 32,
                                ),
                              ),
                              SizedBox(width: 10),
                              Container(
                                alignment: Alignment.center,
                                child: Text(
                                  dateTrenController.text,
                                  style: TextStyle(
                                    fontFamily: 'ASimplerDnm',
                                    fontSize: 22,
                                    color: Colors.black87,
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Divider(thickness: 4),
                          SizedBox(height: 10),
                          Container(
                              alignment: Alignment.center,
                              child: Text(
                                'УПРАЖНЕНИЕ #1',
                                style: TextStyle(
                                    fontSize: 30,
                                    fontFamily: 'ASimplerDnm',
                                    color: Colors.black87,
                                    fontWeight: FontWeight.w300),
                              )),
                          SizedBox(height: 10),
                          TextFormField(
                            maxLength: 30,
                            onFieldSubmitted: (String value) {
                              day.nameExercise1 = value;
                            },
                            validator: (String value) {
                              if (value.isEmpty) {
                                return 'Название не введено';
                              } else if (value.length > 30) {
                                return 'Максимальная длина 30';
                              } else {
                                return null;
                              }
                            },
                            keyboardType: TextInputType.text,
                            controller: nameExerciseController1,
                            focusNode: focusNode3,
                            style: textStyle,
                            decoration: InputDecoration(
                              focusColor: Theme.of(context).primaryColor,
                              labelStyle: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w300,
                                color: Colors.black45,
                              ),
                              hintStyle: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w300,
                                color: Colors.black45,
                              ),
                              labelText: day.nameExercise1 != null &&
                                      day.nameExercise1.isNotEmpty
                                  ? 'Название упражнения'
                                  : 'Какое упражнение будем делать?',
                              hintText: 'Например: Жим штанги лёжа...',
                              prefixIcon: Icon(
                                Icons.fitness_center_rounded,
                                color: focusNode3.hasFocus ||
                                        nameExerciseController1.text.isNotEmpty
                                    ? Theme.of(context).primaryColor
                                    : Colors.grey,
                                size: 32,
                              ),
                              suffixIcon: GestureDetector(
                                child: IconButton(
                                  tooltip: 'Поиск',
                                  icon: Icon(
                                    Icons.search,
                                    size: 32,
                                    color: Colors.green.shade700,
                                  ),
                                  onPressed: () {
                                    showSearchPage(
                                        context,
                                        nameExerciseController1,
                                        'nameExercise1');
                                  },
                                ),
                              ),
                              enabledBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.grey, width: 2),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Theme.of(context).primaryColor,
                                    width: 4),
                              ),
                            ),
                            onChanged: (String value) {
                              setState(() {
                                focusNode3.requestFocus();
                                day.nameExercise1 = value;
                              });
                            },
                          ),
                          Column(
                            children: [
                              TextFormField(
                                maxLength: 5,
                                validator: (String value) {
                                  if (value.isEmpty) {
                                    return 'Введите вес';
                                  } else {
                                    try {
                                      double weight = double.parse(value);
                                      if (weight > 500) {
                                        return 'Максимальный вес 500кг';
                                      }
                                    } catch (e) {
                                      return 'Некорректный формат веса';
                                    }
                                  }
                                  return null;
                                },
                                keyboardType: TextInputType.number,
                                onFieldSubmitted: (String value) {
                                  if (value.isNotEmpty) {
                                    day.weight1 = value;
                                    // focusNode5.requestFocus();
                                  }
                                },
                                focusNode: focusNode4,
                                controller: weightController1,
                                textAlign: TextAlign.center,
                                onChanged: (String value) {
                                  int parsedValue = int.tryParse(value);
                                  if (parsedValue != null &&
                                      parsedValue >= 0 &&
                                      parsedValue <= 500) {
                                    setState(() {
                                      _currentWeight = parsedValue.toDouble();
                                    });
                                  }
                                },
                                style: TextStyle(
                                  fontFamily: 'ASimplerDnm',
                                  fontSize: 54,
                                  color: Colors.black87,
                                  fontWeight: FontWeight.w300,
                                ),
                                decoration: InputDecoration(
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.grey, width: 2),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Theme.of(context).primaryColor,
                                        width: 4),
                                  ),
                                  hintText: 'выберите вес',
                                  helperText: 'КГ',
                                ),
                              ),
                              SliderTheme(
                                data: SliderThemeData(
                                    thumbColor: Colors.black87,
                                    thumbShape: RoundSliderThumbShape(
                                        enabledThumbRadius: 16)),
                                child: Slider(
                                  activeColor: Theme.of(context).primaryColor,
                                  inactiveColor: Colors.grey,
                                  value: _currentWeight,
                                  min: 0,
                                  max: 500,
                                  divisions: 1000,
                                  onChanged: (double value) {
                                    setState(() {
                                      _currentWeight = value;
                                      weightController1.text =
                                          _currentWeight.toStringAsFixed(1);
                                      day.weight1 = weightController1.text;
                                    });
                                  },
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: DropdownButtonFormField(
                                  isExpanded: true,
                                  focusNode: focusNode5,
                                  decoration: InputDecoration(
                                    focusColor: Theme.of(context).primaryColor,
                                    labelText: 'Подходы',
                                    labelStyle: TextStyle(
                                        fontSize: 22,
                                        fontFamily: 'ASimplerDnm',
                                        color: Colors.black45,
                                        fontWeight: FontWeight.w300),
                                    hintStyle: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w300,
                                      color: Theme.of(context).primaryColor,
                                    ),
                                    prefixIcon: Icon(
                                      Icons.undo_rounded,
                                      color: focusNode5.hasFocus ||
                                              numbApprController1
                                                  .text.isNotEmpty
                                          ? Theme.of(context).primaryColor
                                          : Colors.grey,
                                      size: 32,
                                    ),
                                    border: OutlineInputBorder(),
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.grey, width: 2),
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Theme.of(context).primaryColor,
                                          width: 4),
                                    ),
                                  ),
                                  items: _set.map((String value) {
                                    return DropdownMenuItem(
                                      value: value,
                                      child: Text(value),
                                    );
                                  }).toList(),
                                  style: textStyle,
                                  value: day.numbAppr1,
                                  onChanged: (String value) {
                                    focusNode5.requestFocus();
                                    setState(() {});
                                    day.numbAppr1 = value;
                                  },
                                ),
                              ),
                              Expanded(
                                child: DropdownButtonFormField(
                                  isExpanded: true,
                                  focusNode: focusNode6,
                                  decoration: InputDecoration(
                                    focusColor: Theme.of(context).primaryColor,
                                    labelText: 'Повторы',
                                    labelStyle: TextStyle(
                                        fontSize: 22,
                                        fontFamily: 'ASimplerDnm',
                                        color: Colors.black45,
                                        fontWeight: FontWeight.w300),
                                    hintStyle: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w300,
                                      color: Theme.of(context).primaryColor,
                                    ),
                                    prefixIcon: Icon(
                                      Icons.sync_rounded,
                                      color: focusNode6.hasFocus ||
                                              numbRepitController1
                                                  .text.isNotEmpty
                                          ? Theme.of(context).primaryColor
                                          : Colors.grey,
                                      size: 32,
                                    ),
                                    border: OutlineInputBorder(),
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.grey, width: 2),
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Theme.of(context).primaryColor,
                                          width: 4),
                                    ),
                                  ),
                                  items: _repeat.map((String value) {
                                    return DropdownMenuItem(
                                      value: value,
                                      child: Text(value),
                                    );
                                  }).toList(),
                                  style: textStyle,
                                  value: day.numbRepit1,
                                  onChanged: (String value) {
                                    focusNode6.requestFocus();
                                    setState(() {});
                                    day.numbRepit1 = value;
                                  },
                                ),
                              ),
                            ],
                          ),
                          Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Container(
                                  padding: EdgeInsets.all(20.0),
                                  child: Text(
                                    formattedTime,
                                    style: TextStyle(
                                      fontFamily: 'ASimplerDnm',
                                      fontSize: 50,
                                      color: Colors.black87,
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                ),
                                IconButton(
                                  icon: Icon(
                                    _isRunning
                                        ? Icons.pause_circle_sharp
                                        : Icons.play_circle_sharp,
                                    size: 80,
                                    color: Theme.of(context).primaryColor,
                                  ),
                                  onPressed: () {
                                    _toggleTimer();
                                  },
                                ),
                                SizedBox(width: 20.0),
                                IconButton(
                                  icon: Icon(
                                    Icons.replay_circle_filled_outlined,
                                    size: 80,
                                    color: Theme.of(context).primaryColor,
                                  ),
                                  onPressed: () {
                                    _resetTimer();
                                  },
                                ),
                              ],
                            ),
                          ),
                          Divider(thickness: 4),
                        ],
                      ),
                    ),
                  ),
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Form(
                      key: _2formKey,
                      child: ListView(
                        children: <Widget>[
                          SizedBox(height: 10),
                          Container(
                              alignment: Alignment.center,
                              child: Text(
                                'УПРАЖНЕНИЕ #2',
                                style: TextStyle(
                                    fontSize: 30,
                                    fontFamily: 'ASimplerDnm',
                                    color: Colors.black87,
                                    fontWeight: FontWeight.w300),
                              )),
                          SizedBox(height: 10),
                          TextFormField(
                            maxLength: 30,
                            onFieldSubmitted: (String value) {
                              day.nameExercise2 = value;
                            },
                            validator: (String value) {
                              if (value.isEmpty) {
                                return 'Название не введено';
                              } else if (value.length > 30) {
                                return 'Максимальная длина 30';
                              } else {
                                return null;
                              }
                            },
                            keyboardType: TextInputType.text,
                            controller: nameExerciseController2,
                            focusNode: focusNode7,
                            style: textStyle,
                            decoration: InputDecoration(
                              focusColor: Theme.of(context).primaryColor,
                              labelStyle: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w300,
                                color: Colors.black45,
                              ),
                              hintStyle: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w300,
                                color: Colors.black45,
                              ),
                              labelText: day.nameExercise2 != null &&
                                      day.nameExercise2.isNotEmpty
                                  ? 'Название упражнения'
                                  : 'Какое упражнение будем делать?',
                              hintText: 'Например: Жим штанги лёжа...',
                              prefixIcon: Icon(
                                Icons.fitness_center_rounded,
                                color: focusNode7.hasFocus ||
                                        nameExerciseController2.text.isNotEmpty
                                    ? Theme.of(context).primaryColor
                                    : Colors.grey,
                                size: 32,
                              ),
                              suffixIcon: GestureDetector(
                                child: IconButton(
                                  tooltip: 'Поиск',
                                  icon: Icon(
                                    Icons.search,
                                    size: 32,
                                    color: Colors.green.shade700,
                                  ),
                                  onPressed: () {
                                    showSearchPage(
                                        context,
                                        nameExerciseController2,
                                        'nameExercise2');
                                  },
                                ),
                              ),
                              enabledBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.grey, width: 2),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Theme.of(context).primaryColor,
                                    width: 4),
                              ),
                            ),
                            onChanged: (String value) {
                              setState(() {
                                focusNode7.requestFocus();
                              });
                            },
                          ),
                          Column(
                            children: [
                              TextFormField(
                                maxLength: 5,
                                validator: (String value) {
                                  if (value.isEmpty) {
                                    return 'Введите вес';
                                  } else {
                                    try {
                                      double weight = double.parse(value);
                                      if (weight > 500) {
                                        return 'Максимальный вес 500кг';
                                      }
                                    } catch (e) {
                                      return 'Некорректный формат веса';
                                    }
                                  }
                                  return null;
                                },
                                keyboardType: TextInputType.number,
                                onFieldSubmitted: (String value) {
                                  if (value.isNotEmpty) {
                                    day.weight2 = value;
                                    // focusNode5.requestFocus();
                                  }
                                },
                                focusNode: focusNode8,
                                controller: weightController2,
                                textAlign: TextAlign.center,
                                onChanged: (String value) {
                                  int parsedValue = int.tryParse(value);
                                  if (parsedValue != null &&
                                      parsedValue >= 0 &&
                                      parsedValue <= 500) {
                                    setState(() {
                                      _currentWeight = parsedValue.toDouble();
                                    });
                                  }
                                },
                                style: TextStyle(
                                  fontFamily: 'ASimplerDnm',
                                  fontSize: 54,
                                  color: Colors.black87,
                                  fontWeight: FontWeight.w300,
                                ),
                                decoration: InputDecoration(
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.grey, width: 2),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Theme.of(context).primaryColor,
                                        width: 4),
                                  ),
                                  hintText: 'выберите вес',
                                  helperText: 'КГ',
                                ),
                              ),
                              SliderTheme(
                                data: SliderThemeData(
                                    thumbColor: Colors.black87,
                                    thumbShape: RoundSliderThumbShape(
                                        enabledThumbRadius: 16)),
                                child: Slider(
                                  activeColor: Theme.of(context).primaryColor,
                                  inactiveColor: Colors.grey,
                                  value: _currentWeight,
                                  min: 0,
                                  max: 500,
                                  divisions: 1000,
                                  onChanged: (double value) {
                                    setState(() {
                                      _currentWeight = value;
                                      weightController2.text =
                                          _currentWeight.toStringAsFixed(1);
                                      day.weight2 = weightController2.text;
                                    });
                                  },
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: DropdownButtonFormField(
                                  isExpanded: true,
                                  focusNode: focusNode9,
                                  decoration: InputDecoration(
                                    focusColor: Theme.of(context).primaryColor,
                                    labelText: 'Подходы',
                                    labelStyle: TextStyle(
                                        fontSize: 22,
                                        fontFamily: 'ASimplerDnm',
                                        color: Colors.black45,
                                        fontWeight: FontWeight.w300),
                                    hintStyle: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w300,
                                      color: Theme.of(context).primaryColor,
                                    ),
                                    prefixIcon: Icon(
                                      Icons.undo_rounded,
                                      color: focusNode9.hasFocus ||
                                              numbApprController2
                                                  .text.isNotEmpty
                                          ? Theme.of(context).primaryColor
                                          : Colors.grey,
                                      size: 32,
                                    ),
                                    border: OutlineInputBorder(),
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.grey, width: 2),
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Theme.of(context).primaryColor,
                                          width: 4),
                                    ),
                                  ),
                                  items: _set.map((String value) {
                                    return DropdownMenuItem(
                                      value: value,
                                      child: Text(value),
                                    );
                                  }).toList(),
                                  style: textStyle,
                                  value: day.numbAppr2,
                                  onChanged: (String value) {
                                    focusNode9.requestFocus();
                                    setState(() {});
                                    day.numbAppr2 = value;
                                  },
                                ),
                              ),
                              Expanded(
                                child: DropdownButtonFormField(
                                  isExpanded: true,
                                  focusNode: focusNode10,
                                  decoration: InputDecoration(
                                    focusColor: Theme.of(context).primaryColor,
                                    labelText: 'Повторы',
                                    labelStyle: TextStyle(
                                        fontSize: 22,
                                        fontFamily: 'ASimplerDnm',
                                        color: Colors.black45,
                                        fontWeight: FontWeight.w300),
                                    hintStyle: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w300,
                                      color: Theme.of(context).primaryColor,
                                    ),
                                    prefixIcon: Icon(
                                      Icons.sync_rounded,
                                      color: focusNode10.hasFocus ||
                                              numbRepitController2
                                                  .text.isNotEmpty
                                          ? Theme.of(context).primaryColor
                                          : Colors.grey,
                                      size: 32,
                                    ),
                                    border: OutlineInputBorder(),
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.grey, width: 2),
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Theme.of(context).primaryColor,
                                          width: 4),
                                    ),
                                  ),
                                  items: _repeat.map((String value) {
                                    return DropdownMenuItem(
                                      value: value,
                                      child: Text(value),
                                    );
                                  }).toList(),
                                  style: textStyle,
                                  value: day.numbRepit2,
                                  onChanged: (String value) {
                                    focusNode10.requestFocus();
                                    setState(() {});
                                    day.numbRepit2 = value;
                                  },
                                ),
                              ),
                            ],
                          ),
                          Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Container(
                                  padding: EdgeInsets.all(20.0),
                                  child: Text(
                                    formattedTime,
                                    style: TextStyle(
                                      fontFamily: 'ASimplerDnm',
                                      fontSize: 50,
                                      color: Colors.black87,
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                ),
                                IconButton(
                                  icon: Icon(
                                    _isRunning
                                        ? Icons.pause_circle_sharp
                                        : Icons.play_circle_sharp,
                                    size: 50,
                                    color: Theme.of(context).primaryColor,
                                  ),
                                  onPressed: () {
                                    _toggleTimer();
                                  },
                                ),
                                SizedBox(width: 20.0),
                                IconButton(
                                  icon: Icon(
                                    Icons.replay_circle_filled_outlined,
                                    size: 50,
                                    color: Theme.of(context).primaryColor,
                                  ),
                                  onPressed: () {
                                    _resetTimer();
                                  },
                                ),
                              ],
                            ),
                          ),
                          Divider(thickness: 4),
                        ],
                      ),
                    ),
                  ),
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Form(
                      key: _3formKey,
                      child: ListView(
                        children: <Widget>[
                          SizedBox(height: 10),
                          Container(
                              alignment: Alignment.center,
                              child: Text(
                                'УПРАЖНЕНИЕ #3',
                                style: TextStyle(
                                    fontSize: 30,
                                    fontFamily: 'ASimplerDnm',
                                    color: Colors.black87,
                                    fontWeight: FontWeight.w300),
                              )),
                          SizedBox(height: 10),
                          TextFormField(
                            maxLength: 30,
                            onFieldSubmitted: (String value) {
                              day.nameExercise3 = value;
                            },
                            validator: (String value) {
                              if (value.isEmpty) {
                                return 'Название не введено';
                              } else if (value.length > 30) {
                                return 'Максимальная длина 30';
                              } else {
                                return null;
                              }
                            },
                            keyboardType: TextInputType.text,
                            controller: nameExerciseController3,
                            focusNode: focusNode11,
                            style: textStyle,
                            decoration: InputDecoration(
                              focusColor: Theme.of(context).primaryColor,
                              labelStyle: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w300,
                                color: Colors.black45,
                              ),
                              hintStyle: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w300,
                                color: Colors.black45,
                              ),
                              labelText: day.nameExercise3 != null &&
                                      day.nameExercise3.isNotEmpty
                                  ? 'Название упражнения'
                                  : 'Какое упражнение будем делать?',
                              hintText: 'Например: Жим штанги лёжа...',
                              prefixIcon: Icon(
                                Icons.fitness_center_rounded,
                                color: focusNode11.hasFocus ||
                                        nameExerciseController3.text.isNotEmpty
                                    ? Theme.of(context).primaryColor
                                    : Colors.grey,
                                size: 32,
                              ),
                              suffixIcon: GestureDetector(
                                child: IconButton(
                                  tooltip: 'Поиск',
                                  icon: Icon(
                                    Icons.search,
                                    size: 32,
                                    color: Colors.green.shade700,
                                  ),
                                  onPressed: () {
                                    showSearchPage(
                                        context,
                                        nameExerciseController3,
                                        'nameExercise3');
                                  },
                                ),
                              ),
                              enabledBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.grey, width: 2),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Theme.of(context).primaryColor,
                                    width: 4),
                              ),
                            ),
                            onChanged: (String value) {
                              setState(() {
                                focusNode11.requestFocus();
                              });
                            },
                          ),
                          Column(
                            children: [
                              TextFormField(
                                maxLength: 5,
                                validator: (String value) {
                                  if (value.isEmpty) {
                                    return 'Введите вес';
                                  } else {
                                    try {
                                      double weight = double.parse(value);
                                      if (weight > 500) {
                                        return 'Максимальный вес 500кг';
                                      }
                                    } catch (e) {
                                      return 'Некорректный формат веса';
                                    }
                                  }
                                  return null;
                                },
                                keyboardType: TextInputType.number,
                                onFieldSubmitted: (String value) {
                                  if (value.isNotEmpty) {
                                    day.weight3 = value;
                                    // focusNode5.requestFocus();
                                  }
                                },
                                focusNode: focusNode12,
                                controller: weightController3,
                                textAlign: TextAlign.center,
                                onChanged: (String value) {
                                  int parsedValue = int.tryParse(value);
                                  if (parsedValue != null &&
                                      parsedValue >= 0 &&
                                      parsedValue <= 500) {
                                    setState(() {
                                      _currentWeight = parsedValue.toDouble();
                                    });
                                  }
                                },
                                style: TextStyle(
                                  fontFamily: 'ASimplerDnm',
                                  fontSize: 54,
                                  color: Colors.black87,
                                  fontWeight: FontWeight.w300,
                                ),
                                decoration: InputDecoration(
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.grey, width: 2),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Theme.of(context).primaryColor,
                                        width: 4),
                                  ),
                                  hintText: 'выберите вес',
                                  helperText: 'КГ',
                                ),
                              ),
                              SliderTheme(
                                data: SliderThemeData(
                                    thumbColor: Colors.black87,
                                    thumbShape: RoundSliderThumbShape(
                                        enabledThumbRadius: 16)),
                                child: Slider(
                                  activeColor: Theme.of(context).primaryColor,
                                  inactiveColor: Colors.grey,
                                  value: _currentWeight,
                                  min: 0,
                                  max: 500,
                                  divisions: 1000,
                                  onChanged: (double value) {
                                    setState(() {
                                      _currentWeight = value;
                                      weightController3.text =
                                          _currentWeight.toStringAsFixed(1);
                                      day.weight3 = weightController3.text;
                                    });
                                  },
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: DropdownButtonFormField(
                                  isExpanded: true,
                                  focusNode: focusNode13,
                                  decoration: InputDecoration(
                                    focusColor: Theme.of(context).primaryColor,
                                    labelText: 'Подходы',
                                    labelStyle: TextStyle(
                                        fontSize: 22,
                                        fontFamily: 'ASimplerDnm',
                                        color: Colors.black45,
                                        fontWeight: FontWeight.w300),
                                    hintStyle: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w300,
                                      color: Theme.of(context).primaryColor,
                                    ),
                                    prefixIcon: Icon(
                                      Icons.undo_rounded,
                                      color: focusNode13.hasFocus ||
                                              numbApprController3
                                                  .text.isNotEmpty
                                          ? Theme.of(context).primaryColor
                                          : Colors.grey,
                                      size: 32,
                                    ),
                                    border: OutlineInputBorder(),
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.grey, width: 2),
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Theme.of(context).primaryColor,
                                          width: 4),
                                    ),
                                  ),
                                  items: _set.map((String value) {
                                    return DropdownMenuItem(
                                      value: value,
                                      child: Text(value),
                                    );
                                  }).toList(),
                                  style: textStyle,
                                  value: day.numbAppr3,
                                  onChanged: (String value) {
                                    focusNode13.requestFocus();
                                    setState(() {});
                                    day.numbAppr3 = value;
                                  },
                                ),
                              ),
                              Expanded(
                                child: DropdownButtonFormField(
                                  isExpanded: true,
                                  focusNode: focusNode14,
                                  decoration: InputDecoration(
                                    focusColor: Theme.of(context).primaryColor,
                                    labelText: 'Повторы',
                                    labelStyle: TextStyle(
                                        fontSize: 22,
                                        fontFamily: 'ASimplerDnm',
                                        color: Colors.black45,
                                        fontWeight: FontWeight.w300),
                                    hintStyle: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w300,
                                      color: Theme.of(context).primaryColor,
                                    ),
                                    prefixIcon: Icon(
                                      Icons.sync_rounded,
                                      color: focusNode14.hasFocus ||
                                              numbRepitController3
                                                  .text.isNotEmpty
                                          ? Theme.of(context).primaryColor
                                          : Colors.grey,
                                      size: 32,
                                    ),
                                    border: OutlineInputBorder(),
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.grey, width: 2),
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Theme.of(context).primaryColor,
                                          width: 4),
                                    ),
                                  ),
                                  items: _repeat.map((String value) {
                                    return DropdownMenuItem(
                                      value: value,
                                      child: Text(value),
                                    );
                                  }).toList(),
                                  style: textStyle,
                                  value: day.numbRepit3,
                                  onChanged: (String value) {
                                    focusNode14.requestFocus();
                                    setState(() {});
                                    day.numbRepit3 = value;
                                  },
                                ),
                              ),
                            ],
                          ),
                          Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Container(
                                  padding: EdgeInsets.all(20.0),
                                  child: Text(
                                    formattedTime,
                                    style: TextStyle(
                                      fontFamily: 'ASimplerDnm',
                                      fontSize: 50,
                                      color: Colors.black87,
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                ),
                                IconButton(
                                  icon: Icon(
                                    _isRunning
                                        ? Icons.pause_circle_sharp
                                        : Icons.play_circle_sharp,
                                    size: 50,
                                    color: Theme.of(context).primaryColor,
                                  ),
                                  onPressed: () {
                                    _toggleTimer();
                                  },
                                ),
                                SizedBox(width: 20.0),
                                IconButton(
                                  icon: Icon(
                                    Icons.replay_circle_filled_outlined,
                                    size: 50,
                                    color: Theme.of(context).primaryColor,
                                  ),
                                  onPressed: () {
                                    _resetTimer();
                                  },
                                ),
                              ],
                            ),
                          ),
                          Divider(thickness: 4),
                        ],
                      ),
                    ),
                  ),
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Form(
                      key: _4formKey,
                      child: ListView(
                        children: <Widget>[
                          SizedBox(height: 10),
                          Container(
                              alignment: Alignment.center,
                              child: Text(
                                'УПРАЖНЕНИЕ #4',
                                style: TextStyle(
                                    fontSize: 30,
                                    fontFamily: 'ASimplerDnm',
                                    color: Colors.black87,
                                    fontWeight: FontWeight.w300),
                              )),
                          SizedBox(height: 10),
                          TextFormField(
                            maxLength: 30,
                            onFieldSubmitted: (String value) {
                              day.nameExercise4 = value;
                            },
                            validator: (String value) {
                              if (value.isEmpty) {
                                return 'Название не введено';
                              } else if (value.length > 30) {
                                return 'Максимальная длина 30';
                              } else {
                                return null;
                              }
                            },
                            keyboardType: TextInputType.text,
                            controller: nameExerciseController4,
                            focusNode: focusNode15,
                            style: textStyle,
                            decoration: InputDecoration(
                              focusColor: Theme.of(context).primaryColor,
                              labelStyle: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w300,
                                color: Colors.black45,
                              ),
                              hintStyle: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w300,
                                color: Colors.black45,
                              ),
                              labelText: day.nameExercise4 != null &&
                                      day.nameExercise4.isNotEmpty
                                  ? 'Название упражнения'
                                  : 'Какое упражнение будем делать?',
                              hintText: 'Например: Жим штанги лёжа...',
                              prefixIcon: Icon(
                                Icons.fitness_center_rounded,
                                color: focusNode15.hasFocus ||
                                        nameExerciseController4.text.isNotEmpty
                                    ? Theme.of(context).primaryColor
                                    : Colors.grey,
                                size: 32,
                              ),
                              suffixIcon: GestureDetector(
                                child: IconButton(
                                  tooltip: 'Поиск',
                                  icon: Icon(
                                    Icons.search,
                                    size: 32,
                                    color: Colors.green.shade700,
                                  ),
                                  onPressed: () {
                                    showSearchPage(
                                        context,
                                        nameExerciseController4,
                                        'nameExercise4');
                                  },
                                ),
                              ),
                              enabledBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.grey, width: 2),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Theme.of(context).primaryColor,
                                    width: 4),
                              ),
                            ),
                            onChanged: (String value) {
                              setState(() {
                                focusNode15.requestFocus();
                              });
                            },
                          ),
                          Column(
                            children: [
                              TextFormField(
                                maxLength: 5,
                                validator: (String value) {
                                  if (value.isEmpty) {
                                    return 'Введите вес';
                                  } else {
                                    try {
                                      double weight = double.parse(value);
                                      if (weight > 500) {
                                        return 'Максимальный вес 500кг';
                                      }
                                    } catch (e) {
                                      return 'Некорректный формат веса';
                                    }
                                  }
                                  return null;
                                },
                                keyboardType: TextInputType.number,
                                onFieldSubmitted: (String value) {
                                  if (value.isNotEmpty) {
                                    day.weight4 = value;
                                    // focusNode5.requestFocus();
                                  }
                                },
                                focusNode: focusNode16,
                                controller: weightController4,
                                textAlign: TextAlign.center,
                                onChanged: (String value) {
                                  int parsedValue = int.tryParse(value);
                                  if (parsedValue != null &&
                                      parsedValue >= 0 &&
                                      parsedValue <= 500) {
                                    setState(() {
                                      _currentWeight = parsedValue.toDouble();
                                    });
                                  }
                                },
                                style: TextStyle(
                                  fontFamily: 'ASimplerDnm',
                                  fontSize: 54,
                                  color: Colors.black87,
                                  fontWeight: FontWeight.w300,
                                ),
                                decoration: InputDecoration(
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.grey, width: 2),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Theme.of(context).primaryColor,
                                        width: 4),
                                  ),
                                  hintText: 'выберите вес',
                                  helperText: 'КГ',
                                ),
                              ),
                              SliderTheme(
                                data: SliderThemeData(
                                    thumbColor: Colors.black87,
                                    thumbShape: RoundSliderThumbShape(
                                        enabledThumbRadius: 16)),
                                child: Slider(
                                  activeColor: Theme.of(context).primaryColor,
                                  inactiveColor: Colors.grey,
                                  value: _currentWeight,
                                  min: 0,
                                  max: 500,
                                  divisions: 1000,
                                  onChanged: (double value) {
                                    setState(() {
                                      _currentWeight = value;
                                      weightController4.text =
                                          _currentWeight.toStringAsFixed(1);
                                      day.weight4 = weightController4.text;
                                    });
                                  },
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: DropdownButtonFormField(
                                  isExpanded: true,
                                  focusNode: focusNode17,
                                  decoration: InputDecoration(
                                    focusColor: Theme.of(context).primaryColor,
                                    labelText: 'Подходы',
                                    labelStyle: TextStyle(
                                        fontSize: 22,
                                        fontFamily: 'ASimplerDnm',
                                        color: Colors.black45,
                                        fontWeight: FontWeight.w300),
                                    hintStyle: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w300,
                                      color: Theme.of(context).primaryColor,
                                    ),
                                    prefixIcon: Icon(
                                      Icons.undo_rounded,
                                      color: focusNode17.hasFocus ||
                                              numbApprController4
                                                  .text.isNotEmpty
                                          ? Theme.of(context).primaryColor
                                          : Colors.grey,
                                      size: 32,
                                    ),
                                    border: OutlineInputBorder(),
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.grey, width: 2),
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Theme.of(context).primaryColor,
                                          width: 4),
                                    ),
                                  ),
                                  items: _set.map((String value) {
                                    return DropdownMenuItem(
                                      value: value,
                                      child: Text(value),
                                    );
                                  }).toList(),
                                  style: textStyle,
                                  value: day.numbAppr4,
                                  onChanged: (String value) {
                                    focusNode17.requestFocus();
                                    setState(() {});
                                    day.numbAppr4 = value;
                                  },
                                ),
                              ),
                              Expanded(
                                child: DropdownButtonFormField(
                                  isExpanded: true,
                                  focusNode: focusNode18,
                                  decoration: InputDecoration(
                                    focusColor: Theme.of(context).primaryColor,
                                    labelText: 'Повторы',
                                    labelStyle: TextStyle(
                                        fontSize: 22,
                                        fontFamily: 'ASimplerDnm',
                                        color: Colors.black45,
                                        fontWeight: FontWeight.w300),
                                    hintStyle: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w300,
                                      color: Theme.of(context).primaryColor,
                                    ),
                                    prefixIcon: Icon(
                                      Icons.sync_rounded,
                                      color: focusNode18.hasFocus ||
                                              numbRepitController4
                                                  .text.isNotEmpty
                                          ? Theme.of(context).primaryColor
                                          : Colors.grey,
                                      size: 32,
                                    ),
                                    border: OutlineInputBorder(),
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.grey, width: 2),
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Theme.of(context).primaryColor,
                                          width: 4),
                                    ),
                                  ),
                                  items: _repeat.map((String value) {
                                    return DropdownMenuItem(
                                      value: value,
                                      child: Text(value),
                                    );
                                  }).toList(),
                                  style: textStyle,
                                  value: day.numbRepit4,
                                  onChanged: (String value) {
                                    focusNode18.requestFocus();
                                    setState(() {});
                                    day.numbRepit4 = value;
                                  },
                                ),
                              ),
                            ],
                          ),
                          Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Container(
                                  padding: EdgeInsets.all(20.0),
                                  child: Text(
                                    formattedTime,
                                    style: TextStyle(
                                      fontFamily: 'ASimplerDnm',
                                      fontSize: 50,
                                      color: Colors.black87,
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                ),
                                IconButton(
                                  icon: Icon(
                                    _isRunning
                                        ? Icons.pause_circle_sharp
                                        : Icons.play_circle_sharp,
                                    size: 50,
                                    color: Theme.of(context).primaryColor,
                                  ),
                                  onPressed: () {
                                    _toggleTimer();
                                  },
                                ),
                                SizedBox(width: 20.0),
                                IconButton(
                                  icon: Icon(
                                    Icons.replay_circle_filled_outlined,
                                    size: 50,
                                    color: Theme.of(context).primaryColor,
                                  ),
                                  onPressed: () {
                                    _resetTimer();
                                  },
                                ),
                              ],
                            ),
                          ),
                          Divider(thickness: 4),
                        ],
                      ),
                    ),
                  ),
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Form(
                      key: _5formKey,
                      child: ListView(
                        children: <Widget>[
                          SizedBox(height: 10),
                          Container(
                              alignment: Alignment.center,
                              child: Text(
                                'УПРАЖНЕНИЕ #5',
                                style: TextStyle(
                                    fontSize: 30,
                                    fontFamily: 'ASimplerDnm',
                                    color: Colors.black87,
                                    fontWeight: FontWeight.w300),
                              )),
                          SizedBox(height: 10),
                          TextFormField(
                            maxLength: 30,
                            onFieldSubmitted: (String value) {
                              day.nameExercise5 = value;
                            },
                            validator: (String value) {
                              if (value.isEmpty) {
                                return 'Название не введено';
                              } else if (value.length > 30) {
                                return 'Максимальная длина 30';
                              } else {
                                return null;
                              }
                            },
                            keyboardType: TextInputType.text,
                            controller: nameExerciseController5,
                            focusNode: focusNode19,
                            style: textStyle,
                            decoration: InputDecoration(
                              focusColor: Theme.of(context).primaryColor,
                              labelStyle: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w300,
                                color: Colors.black45,
                              ),
                              hintStyle: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w300,
                                color: Colors.black45,
                              ),
                              labelText: day.nameExercise5 != null &&
                                      day.nameExercise5.isNotEmpty
                                  ? 'Название упражнения'
                                  : 'Какое упражнение будем делать?',
                              hintText: 'Например: Жим штанги лёжа...',
                              prefixIcon: Icon(
                                Icons.fitness_center_rounded,
                                color: focusNode19.hasFocus ||
                                        nameExerciseController5.text.isNotEmpty
                                    ? Theme.of(context).primaryColor
                                    : Colors.grey,
                                size: 32,
                              ),
                              suffixIcon: GestureDetector(
                                child: IconButton(
                                  tooltip: 'Поиск',
                                  icon: Icon(
                                    Icons.search,
                                    size: 32,
                                    color: Colors.green.shade700,
                                  ),
                                  onPressed: () {
                                    showSearchPage(
                                        context,
                                        nameExerciseController5,
                                        'nameExercise5');
                                  },
                                ),
                              ),
                              enabledBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.grey, width: 2),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Theme.of(context).primaryColor,
                                    width: 4),
                              ),
                            ),
                            onChanged: (String value) {
                              setState(() {
                                focusNode19.requestFocus();
                              });
                            },
                          ),
                          Column(
                            children: [
                              TextFormField(
                                maxLength: 5,
                                validator: (String value) {
                                  if (value.isEmpty) {
                                    return 'Введите вес';
                                  } else {
                                    try {
                                      double weight = double.parse(value);
                                      if (weight > 500) {
                                        return 'Максимальный вес 500кг';
                                      }
                                    } catch (e) {
                                      return 'Некорректный формат веса';
                                    }
                                  }
                                  return null;
                                },
                                keyboardType: TextInputType.number,
                                onFieldSubmitted: (String value) {
                                  if (value.isNotEmpty) {
                                    day.weight5 = value;
                                    // focusNode5.requestFocus();
                                  }
                                },
                                focusNode: focusNode20,
                                controller: weightController5,
                                textAlign: TextAlign.center,
                                onChanged: (String value) {
                                  int parsedValue = int.tryParse(value);
                                  if (parsedValue != null &&
                                      parsedValue >= 0 &&
                                      parsedValue <= 500) {
                                    setState(() {
                                      _currentWeight = parsedValue.toDouble();
                                    });
                                  }
                                },
                                style: TextStyle(
                                  fontFamily: 'ASimplerDnm',
                                  fontSize: 54,
                                  color: Colors.black87,
                                  fontWeight: FontWeight.w300,
                                ),
                                decoration: InputDecoration(
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.grey, width: 2),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Theme.of(context).primaryColor,
                                        width: 4),
                                  ),
                                  hintText: 'выберите вес',
                                  helperText: 'КГ',
                                ),
                              ),
                              SliderTheme(
                                data: SliderThemeData(
                                    thumbColor: Colors.black87,
                                    thumbShape: RoundSliderThumbShape(
                                        enabledThumbRadius: 16)),
                                child: Slider(
                                  activeColor: Theme.of(context).primaryColor,
                                  inactiveColor: Colors.grey,
                                  value: _currentWeight,
                                  min: 0,
                                  max: 500,
                                  divisions: 1000,
                                  onChanged: (double value) {
                                    setState(() {
                                      _currentWeight = value;
                                      weightController5.text =
                                          _currentWeight.toStringAsFixed(1);
                                      day.weight5 = weightController5.text;
                                    });
                                  },
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: DropdownButtonFormField(
                                  isExpanded: true,
                                  focusNode: focusNode21,
                                  decoration: InputDecoration(
                                    focusColor: Theme.of(context).primaryColor,
                                    labelText: 'Подходы',
                                    labelStyle: TextStyle(
                                        fontSize: 22,
                                        fontFamily: 'ASimplerDnm',
                                        color: Colors.black45,
                                        fontWeight: FontWeight.w300),
                                    hintStyle: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w300,
                                      color: Theme.of(context).primaryColor,
                                    ),
                                    prefixIcon: Icon(
                                      Icons.undo_rounded,
                                      color: focusNode21.hasFocus ||
                                              numbApprController5
                                                  .text.isNotEmpty
                                          ? Theme.of(context).primaryColor
                                          : Colors.grey,
                                      size: 32,
                                    ),
                                    border: OutlineInputBorder(),
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.grey, width: 2),
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Theme.of(context).primaryColor,
                                          width: 4),
                                    ),
                                  ),
                                  items: _set.map((String value) {
                                    return DropdownMenuItem(
                                      value: value,
                                      child: Text(value),
                                    );
                                  }).toList(),
                                  style: textStyle,
                                  value: day.numbAppr5,
                                  onChanged: (String value) {
                                    focusNode21.requestFocus();
                                    setState(() {});
                                    day.numbAppr5 = value;
                                  },
                                ),
                              ),
                              Expanded(
                                child: DropdownButtonFormField(
                                  isExpanded: true,
                                  focusNode: focusNode22,
                                  decoration: InputDecoration(
                                    focusColor: Theme.of(context).primaryColor,
                                    labelText: 'Повторы',
                                    labelStyle: TextStyle(
                                        fontSize: 22,
                                        fontFamily: 'ASimplerDnm',
                                        color: Colors.black45,
                                        fontWeight: FontWeight.w300),
                                    hintStyle: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w300,
                                      color: Theme.of(context).primaryColor,
                                    ),
                                    prefixIcon: Icon(
                                      Icons.sync_rounded,
                                      color: focusNode22.hasFocus ||
                                              numbRepitController5
                                                  .text.isNotEmpty
                                          ? Theme.of(context).primaryColor
                                          : Colors.grey,
                                      size: 32,
                                    ),
                                    border: OutlineInputBorder(),
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.grey, width: 2),
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Theme.of(context).primaryColor,
                                          width: 4),
                                    ),
                                  ),
                                  items: _repeat.map((String value) {
                                    return DropdownMenuItem(
                                      value: value,
                                      child: Text(value),
                                    );
                                  }).toList(),
                                  style: textStyle,
                                  value: day.numbRepit5,
                                  onChanged: (String value) {
                                    focusNode22.requestFocus();
                                    setState(() {});
                                    day.numbRepit5 = value;
                                  },
                                ),
                              ),
                            ],
                          ),
                          Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Container(
                                  padding: EdgeInsets.all(20.0),
                                  child: Text(
                                    formattedTime,
                                    style: TextStyle(
                                      fontFamily: 'ASimplerDnm',
                                      fontSize: 50,
                                      color: Colors.black87,
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                ),
                                IconButton(
                                  icon: Icon(
                                    _isRunning
                                        ? Icons.pause_circle_sharp
                                        : Icons.play_circle_sharp,
                                    size: 50,
                                    color: Theme.of(context).primaryColor,
                                  ),
                                  onPressed: () {
                                    _toggleTimer();
                                  },
                                ),
                                SizedBox(width: 20.0),
                                IconButton(
                                  icon: Icon(
                                    Icons.replay_circle_filled_outlined,
                                    size: 50,
                                    color: Theme.of(context).primaryColor,
                                  ),
                                  onPressed: () {
                                    _resetTimer();
                                  },
                                ),
                              ],
                            ),
                          ),
                          Divider(thickness: 4),
                        ],
                      ),
                    ),
                  ),
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Form(
                      key: _6formKey,
                      child: ListView(
                        children: <Widget>[
                          SizedBox(height: 10),
                          Container(
                              alignment: Alignment.center,
                              child: Text(
                                'УПРАЖНЕНИЕ #6',
                                style: TextStyle(
                                    fontSize: 30,
                                    fontFamily: 'ASimplerDnm',
                                    color: Colors.black87,
                                    fontWeight: FontWeight.w300),
                              )),
                          SizedBox(height: 10),
                          TextFormField(
                            maxLength: 30,
                            onFieldSubmitted: (String value) {
                              day.nameExercise6 = value;
                            },
                            validator: (String value) {
                              if (value.isEmpty) {
                                return 'Название не введено';
                              } else if (value.length > 30) {
                                return 'Максимальная длина 30';
                              } else {
                                return null;
                              }
                            },
                            keyboardType: TextInputType.text,
                            controller: nameExerciseController6,
                            focusNode: focusNode23,
                            style: textStyle,
                            decoration: InputDecoration(
                              focusColor: Theme.of(context).primaryColor,
                              labelStyle: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w300,
                                color: Colors.black45,
                              ),
                              hintStyle: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w300,
                                color: Colors.black45,
                              ),
                              labelText: day.nameExercise6 != null &&
                                      day.nameExercise6.isNotEmpty
                                  ? 'Название упражнения'
                                  : 'Какое упражнение будем делать?',
                              hintText: 'Например: Жим штанги лёжа...',
                              prefixIcon: Icon(
                                Icons.fitness_center_rounded,
                                color: focusNode23.hasFocus ||
                                        nameExerciseController6.text.isNotEmpty
                                    ? Theme.of(context).primaryColor
                                    : Colors.grey,
                                size: 32,
                              ),
                              suffixIcon: GestureDetector(
                                child: IconButton(
                                  tooltip: 'Поиск',
                                  icon: Icon(
                                    Icons.search,
                                    size: 32,
                                    color: Colors.green.shade700,
                                  ),
                                  onPressed: () {
                                    showSearchPage(
                                        context,
                                        nameExerciseController6,
                                        'nameExercise6');
                                  },
                                ),
                              ),
                              enabledBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.grey, width: 2),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Theme.of(context).primaryColor,
                                    width: 4),
                              ),
                            ),
                            onChanged: (String value) {
                              setState(() {
                                focusNode23.requestFocus();
                              });
                            },
                          ),
                          Column(
                            children: [
                              TextFormField(
                                maxLength: 5,
                                validator: (String value) {
                                  if (value.isEmpty) {
                                    return 'Введите вес';
                                  } else {
                                    try {
                                      double weight = double.parse(value);
                                      if (weight > 500) {
                                        return 'Максимальный вес 500кг';
                                      }
                                    } catch (e) {
                                      return 'Некорректный формат веса';
                                    }
                                  }
                                  return null;
                                },
                                keyboardType: TextInputType.number,
                                onFieldSubmitted: (String value) {
                                  if (value.isNotEmpty) {
                                    day.weight6 = value;
                                    // focusNode5.requestFocus();
                                  }
                                },
                                focusNode: focusNode24,
                                controller: weightController6,
                                textAlign: TextAlign.center,
                                onChanged: (String value) {
                                  int parsedValue = int.tryParse(value);
                                  if (parsedValue != null &&
                                      parsedValue >= 0 &&
                                      parsedValue <= 500) {
                                    setState(() {
                                      _currentWeight = parsedValue.toDouble();
                                    });
                                  }
                                },
                                style: TextStyle(
                                  fontFamily: 'ASimplerDnm',
                                  fontSize: 54,
                                  color: Colors.black87,
                                  fontWeight: FontWeight.w300,
                                ),
                                decoration: InputDecoration(
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.grey, width: 2),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Theme.of(context).primaryColor,
                                        width: 4),
                                  ),
                                  hintText: 'выберите вес',
                                  helperText: 'КГ',
                                ),
                              ),
                              SliderTheme(
                                data: SliderThemeData(
                                    thumbColor: Colors.black87,
                                    thumbShape: RoundSliderThumbShape(
                                        enabledThumbRadius: 16)),
                                child: Slider(
                                  activeColor: Theme.of(context).primaryColor,
                                  inactiveColor: Colors.grey,
                                  value: _currentWeight,
                                  min: 0,
                                  max: 500,
                                  divisions: 1000,
                                  onChanged: (double value) {
                                    setState(() {
                                      _currentWeight = value;
                                      weightController6.text =
                                          _currentWeight.toStringAsFixed(1);
                                      day.weight6 = weightController6.text;
                                    });
                                  },
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: DropdownButtonFormField(
                                  isExpanded: true,
                                  focusNode: focusNode25,
                                  decoration: InputDecoration(
                                    focusColor: Theme.of(context).primaryColor,
                                    labelText: 'Подходы',
                                    labelStyle: TextStyle(
                                        fontSize: 22,
                                        fontFamily: 'ASimplerDnm',
                                        color: Colors.black45,
                                        fontWeight: FontWeight.w300),
                                    hintStyle: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w300,
                                      color: Theme.of(context).primaryColor,
                                    ),
                                    prefixIcon: Icon(
                                      Icons.undo_rounded,
                                      color: focusNode25.hasFocus ||
                                              numbApprController6
                                                  .text.isNotEmpty
                                          ? Theme.of(context).primaryColor
                                          : Colors.grey,
                                      size: 32,
                                    ),
                                    border: OutlineInputBorder(),
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.grey, width: 2),
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Theme.of(context).primaryColor,
                                          width: 4),
                                    ),
                                  ),
                                  items: _set.map((String value) {
                                    return DropdownMenuItem(
                                      value: value,
                                      child: Text(value),
                                    );
                                  }).toList(),
                                  style: textStyle,
                                  value: day.numbAppr6,
                                  onChanged: (String value) {
                                    focusNode25.requestFocus();
                                    setState(() {});
                                    day.numbAppr6 = value;
                                  },
                                ),
                              ),
                              Expanded(
                                child: DropdownButtonFormField(
                                  isExpanded: true,
                                  focusNode: focusNode26,
                                  decoration: InputDecoration(
                                    focusColor: Theme.of(context).primaryColor,
                                    labelText: 'Повторы',
                                    labelStyle: TextStyle(
                                        fontSize: 22,
                                        fontFamily: 'ASimplerDnm',
                                        color: Colors.black45,
                                        fontWeight: FontWeight.w300),
                                    hintStyle: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w300,
                                      color: Theme.of(context).primaryColor,
                                    ),
                                    prefixIcon: Icon(
                                      Icons.sync_rounded,
                                      color: focusNode26.hasFocus ||
                                              numbRepitController6
                                                  .text.isNotEmpty
                                          ? Theme.of(context).primaryColor
                                          : Colors.grey,
                                      size: 32,
                                    ),
                                    border: OutlineInputBorder(),
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.grey, width: 2),
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Theme.of(context).primaryColor,
                                          width: 4),
                                    ),
                                  ),
                                  items: _repeat.map((String value) {
                                    return DropdownMenuItem(
                                      value: value,
                                      child: Text(value),
                                    );
                                  }).toList(),
                                  style: textStyle,
                                  value: day.numbRepit6,
                                  onChanged: (String value) {
                                    focusNode26.requestFocus();
                                    setState(() {});
                                    day.numbRepit6 = value;
                                  },
                                ),
                              ),
                            ],
                          ),
                          Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Container(
                                  padding: EdgeInsets.all(20.0),
                                  child: Text(
                                    formattedTime,
                                    style: TextStyle(
                                      fontFamily: 'ASimplerDnm',
                                      fontSize: 50,
                                      color: Colors.black87,
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                ),
                                IconButton(
                                  icon: Icon(
                                    _isRunning
                                        ? Icons.pause_circle_sharp
                                        : Icons.play_circle_sharp,
                                    size: 50,
                                    color: Theme.of(context).primaryColor,
                                  ),
                                  onPressed: () {
                                    _toggleTimer();
                                  },
                                ),
                                SizedBox(width: 20.0),
                                IconButton(
                                  icon: Icon(
                                    Icons.replay_circle_filled_outlined,
                                    size: 50,
                                    color: Theme.of(context).primaryColor,
                                  ),
                                  onPressed: () {
                                    _resetTimer();
                                  },
                                ),
                              ],
                            ),
                          ),
                          Divider(thickness: 4),
                        ],
                      ),
                    ),
                  ),
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Form(
                      key: _7formKey,
                      child: ListView(
                        children: <Widget>[
                          SizedBox(height: 10),
                          Container(
                              alignment: Alignment.center,
                              child: Text(
                                'УПРАЖНЕНИЕ #7',
                                style: TextStyle(
                                    fontSize: 30,
                                    fontFamily: 'ASimplerDnm',
                                    color: Colors.black87,
                                    fontWeight: FontWeight.w300),
                              )),
                          SizedBox(height: 10),
                          TextFormField(
                            maxLength: 30,
                            onFieldSubmitted: (String value) {
                              day.nameExercise7 = value;
                            },
                            validator: (String value) {
                              if (value.isEmpty) {
                                return 'Название не введено';
                              } else if (value.length > 30) {
                                return 'Максимальная длина 30';
                              } else {
                                return null;
                              }
                            },
                            keyboardType: TextInputType.text,
                            controller: nameExerciseController7,
                            focusNode: focusNode27,
                            style: textStyle,
                            decoration: InputDecoration(
                              focusColor: Theme.of(context).primaryColor,
                              labelStyle: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w300,
                                color: Colors.black45,
                              ),
                              hintStyle: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w300,
                                color: Colors.black45,
                              ),
                              labelText: day.nameExercise7 != null &&
                                      day.nameExercise7.isNotEmpty
                                  ? 'Название упражнения'
                                  : 'Какое упражнение будем делать?',
                              hintText: 'Например: Жим штанги лёжа...',
                              prefixIcon: Icon(
                                Icons.fitness_center_rounded,
                                color: focusNode27.hasFocus ||
                                        nameExerciseController7.text.isNotEmpty
                                    ? Theme.of(context).primaryColor
                                    : Colors.grey,
                                size: 32,
                              ),
                              suffixIcon: GestureDetector(
                                child: IconButton(
                                  tooltip: 'Поиск',
                                  icon: Icon(
                                    Icons.search,
                                    size: 32,
                                    color: Colors.green.shade700,
                                  ),
                                  onPressed: () {
                                    showSearchPage(
                                        context,
                                        nameExerciseController7,
                                        'nameExercise7');
                                  },
                                ),
                              ),
                              enabledBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.grey, width: 2),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Theme.of(context).primaryColor,
                                    width: 4),
                              ),
                            ),
                            onChanged: (String value) {
                              setState(() {
                                focusNode27.requestFocus();
                              });
                            },
                          ),
                          Column(
                            children: [
                              TextFormField(
                                maxLength: 5,
                                validator: (String value) {
                                  if (value.isEmpty) {
                                    return 'Введите вес';
                                  } else {
                                    try {
                                      double weight = double.parse(value);
                                      if (weight > 500) {
                                        return 'Максимальный вес 500кг';
                                      }
                                    } catch (e) {
                                      return 'Некорректный формат веса';
                                    }
                                  }
                                  return null;
                                },
                                keyboardType: TextInputType.number,
                                onFieldSubmitted: (String value) {
                                  if (value.isNotEmpty) {
                                    day.weight7 = value;
                                    // focusNode5.requestFocus();
                                  }
                                },
                                focusNode: focusNode28,
                                controller: weightController7,
                                textAlign: TextAlign.center,
                                onChanged: (String value) {
                                  int parsedValue = int.tryParse(value);
                                  if (parsedValue != null &&
                                      parsedValue >= 0 &&
                                      parsedValue <= 500) {
                                    setState(() {
                                      _currentWeight = parsedValue.toDouble();
                                    });
                                  }
                                },
                                style: TextStyle(
                                  fontFamily: 'ASimplerDnm',
                                  fontSize: 54,
                                  color: Colors.black87,
                                  fontWeight: FontWeight.w300,
                                ),
                                decoration: InputDecoration(
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.grey, width: 2),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Theme.of(context).primaryColor,
                                        width: 4),
                                  ),
                                  hintText: 'выберите вес',
                                  helperText: 'КГ',
                                ),
                              ),
                              SliderTheme(
                                data: SliderThemeData(
                                    thumbColor: Colors.black87,
                                    thumbShape: RoundSliderThumbShape(
                                        enabledThumbRadius: 16)),
                                child: Slider(
                                  activeColor: Theme.of(context).primaryColor,
                                  inactiveColor: Colors.grey,
                                  value: _currentWeight,
                                  min: 0,
                                  max: 500,
                                  divisions: 1000,
                                  onChanged: (double value) {
                                    setState(() {
                                      _currentWeight = value;
                                      weightController7.text =
                                          _currentWeight.toStringAsFixed(1);
                                      day.weight7 = weightController7.text;
                                    });
                                  },
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: DropdownButtonFormField(
                                  isExpanded: true,
                                  focusNode: focusNode29,
                                  decoration: InputDecoration(
                                    focusColor: Theme.of(context).primaryColor,
                                    labelText: 'Подходы',
                                    labelStyle: TextStyle(
                                        fontSize: 22,
                                        fontFamily: 'ASimplerDnm',
                                        color: Colors.black45,
                                        fontWeight: FontWeight.w300),
                                    hintStyle: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w300,
                                      color: Theme.of(context).primaryColor,
                                    ),
                                    prefixIcon: Icon(
                                      Icons.undo_rounded,
                                      color: focusNode29.hasFocus ||
                                              numbApprController7
                                                  .text.isNotEmpty
                                          ? Theme.of(context).primaryColor
                                          : Colors.grey,
                                      size: 32,
                                    ),
                                    border: OutlineInputBorder(),
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.grey, width: 2),
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Theme.of(context).primaryColor,
                                          width: 4),
                                    ),
                                  ),
                                  items: _set.map((String value) {
                                    return DropdownMenuItem(
                                      value: value,
                                      child: Text(value),
                                    );
                                  }).toList(),
                                  style: textStyle,
                                  value: day.numbAppr7,
                                  onChanged: (String value) {
                                    focusNode29.requestFocus();
                                    setState(() {});
                                    day.numbAppr7 = value;
                                  },
                                ),
                              ),
                              Expanded(
                                child: DropdownButtonFormField(
                                  isExpanded: true,
                                  focusNode: focusNode30,
                                  decoration: InputDecoration(
                                    focusColor: Theme.of(context).primaryColor,
                                    labelText: 'Повторы',
                                    labelStyle: TextStyle(
                                        fontSize: 22,
                                        fontFamily: 'ASimplerDnm',
                                        color: Colors.black45,
                                        fontWeight: FontWeight.w300),
                                    hintStyle: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w300,
                                      color: Theme.of(context).primaryColor,
                                    ),
                                    prefixIcon: Icon(
                                      Icons.sync_rounded,
                                      color: focusNode30.hasFocus ||
                                              numbRepitController7
                                                  .text.isNotEmpty
                                          ? Theme.of(context).primaryColor
                                          : Colors.grey,
                                      size: 32,
                                    ),
                                    border: OutlineInputBorder(),
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.grey, width: 2),
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Theme.of(context).primaryColor,
                                          width: 4),
                                    ),
                                  ),
                                  items: _repeat.map((String value) {
                                    return DropdownMenuItem(
                                      value: value,
                                      child: Text(value),
                                    );
                                  }).toList(),
                                  style: textStyle,
                                  value: day.numbRepit7,
                                  onChanged: (String value) {
                                    focusNode30.requestFocus();
                                    setState(() {});
                                    day.numbRepit7 = value;
                                  },
                                ),
                              ),
                            ],
                          ),
                          Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Container(
                                  padding: EdgeInsets.all(20.0),
                                  child: Text(
                                    formattedTime,
                                    style: TextStyle(
                                      fontFamily: 'ASimplerDnm',
                                      fontSize: 50,
                                      color: Colors.black87,
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                ),
                                IconButton(
                                  icon: Icon(
                                    _isRunning
                                        ? Icons.pause_circle_sharp
                                        : Icons.play_circle_sharp,
                                    size: 50,
                                    color: Theme.of(context).primaryColor,
                                  ),
                                  onPressed: () {
                                    _toggleTimer();
                                  },
                                ),
                                SizedBox(width: 20.0),
                                IconButton(
                                  icon: Icon(
                                    Icons.replay_circle_filled_outlined,
                                    size: 50,
                                    color: Theme.of(context).primaryColor,
                                  ),
                                  onPressed: () {
                                    _resetTimer();
                                  },
                                ),
                              ],
                            ),
                          ),
                          Divider(thickness: 4),
                        ],
                      ),
                    ),
                  ),
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Form(
                      key: _8formKey,
                      child: ListView(
                        children: <Widget>[
                          SizedBox(height: 10),
                          Container(
                              alignment: Alignment.center,
                              child: Text(
                                'УПРАЖНЕНИЕ #8',
                                style: TextStyle(
                                    fontSize: 30,
                                    fontFamily: 'ASimplerDnm',
                                    color: Colors.black87,
                                    fontWeight: FontWeight.w300),
                              )),
                          SizedBox(height: 10),
                          TextFormField(
                            maxLength: 30,
                            onFieldSubmitted: (String value) {
                              day.nameExercise8 = value;
                            },
                            validator: (String value) {
                              if (value.isEmpty) {
                                return 'Название не введено';
                              } else if (value.length > 30) {
                                return 'Максимальная длина 30';
                              } else {
                                return null;
                              }
                            },
                            keyboardType: TextInputType.text,
                            controller: nameExerciseController8,
                            focusNode: focusNode31,
                            style: textStyle,
                            decoration: InputDecoration(
                              focusColor: Theme.of(context).primaryColor,
                              labelStyle: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w300,
                                color: Colors.black45,
                              ),
                              hintStyle: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w300,
                                color: Colors.black45,
                              ),
                              labelText: day.nameExercise8 != null &&
                                      day.nameExercise8.isNotEmpty
                                  ? 'Название упражнения'
                                  : 'Какое упражнение будем делать?',
                              hintText: 'Например: Жим штанги лёжа...',
                              prefixIcon: Icon(
                                Icons.fitness_center_rounded,
                                color: focusNode31.hasFocus ||
                                        nameExerciseController8.text.isNotEmpty
                                    ? Theme.of(context).primaryColor
                                    : Colors.grey,
                                size: 32,
                              ),
                              suffixIcon: GestureDetector(
                                child: IconButton(
                                  tooltip: 'Поиск',
                                  icon: Icon(
                                    Icons.search,
                                    size: 32,
                                    color: Colors.green.shade700,
                                  ),
                                  onPressed: () {
                                    showSearchPage(
                                        context,
                                        nameExerciseController8,
                                        'nameExercise8');
                                  },
                                ),
                              ),
                              enabledBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.grey, width: 2),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Theme.of(context).primaryColor,
                                    width: 4),
                              ),
                            ),
                            onChanged: (String value) {
                              setState(() {
                                focusNode31.requestFocus();
                              });
                            },
                          ),
                          Column(
                            children: [
                              TextFormField(
                                maxLength: 5,
                                validator: (String value) {
                                  if (value.isEmpty) {
                                    return 'Введите вес';
                                  } else {
                                    try {
                                      double weight = double.parse(value);
                                      if (weight > 500) {
                                        return 'Максимальный вес 500кг';
                                      }
                                    } catch (e) {
                                      return 'Некорректный формат веса';
                                    }
                                  }
                                  return null;
                                },
                                keyboardType: TextInputType.number,
                                onFieldSubmitted: (String value) {
                                  if (value.isNotEmpty) {
                                    day.weight8 = value;
                                    // focusNode5.requestFocus();
                                  }
                                },
                                focusNode: focusNode32,
                                controller: weightController8,
                                textAlign: TextAlign.center,
                                onChanged: (String value) {
                                  int parsedValue = int.tryParse(value);
                                  if (parsedValue != null &&
                                      parsedValue >= 0 &&
                                      parsedValue <= 500) {
                                    setState(() {
                                      _currentWeight = parsedValue.toDouble();
                                    });
                                  }
                                },
                                style: TextStyle(
                                  fontFamily: 'ASimplerDnm',
                                  fontSize: 54,
                                  color: Colors.black87,
                                  fontWeight: FontWeight.w300,
                                ),
                                decoration: InputDecoration(
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.grey, width: 2),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Theme.of(context).primaryColor,
                                        width: 4),
                                  ),
                                  hintText: 'выберите вес',
                                  helperText: 'КГ',
                                ),
                              ),
                              SliderTheme(
                                data: SliderThemeData(
                                    thumbColor: Colors.black87,
                                    thumbShape: RoundSliderThumbShape(
                                        enabledThumbRadius: 16)),
                                child: Slider(
                                  activeColor: Theme.of(context).primaryColor,
                                  inactiveColor: Colors.grey,
                                  value: _currentWeight,
                                  min: 0,
                                  max: 500,
                                  divisions: 1000,
                                  onChanged: (double value) {
                                    setState(() {
                                      _currentWeight = value;
                                      weightController8.text =
                                          _currentWeight.toStringAsFixed(1);
                                      day.weight8 = weightController8.text;
                                    });
                                  },
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: DropdownButtonFormField(
                                  isExpanded: true,
                                  focusNode: focusNode33,
                                  decoration: InputDecoration(
                                    focusColor: Theme.of(context).primaryColor,
                                    labelText: 'Подходы',
                                    labelStyle: TextStyle(
                                        fontSize: 22,
                                        fontFamily: 'ASimplerDnm',
                                        color: Colors.black45,
                                        fontWeight: FontWeight.w300),
                                    hintStyle: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w300,
                                      color: Theme.of(context).primaryColor,
                                    ),
                                    prefixIcon: Icon(
                                      Icons.undo_rounded,
                                      color: focusNode33.hasFocus ||
                                              numbApprController8
                                                  .text.isNotEmpty
                                          ? Theme.of(context).primaryColor
                                          : Colors.grey,
                                      size: 32,
                                    ),
                                    border: OutlineInputBorder(),
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.grey, width: 2),
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Theme.of(context).primaryColor,
                                          width: 4),
                                    ),
                                  ),
                                  items: _set.map((String value) {
                                    return DropdownMenuItem(
                                      value: value,
                                      child: Text(value),
                                    );
                                  }).toList(),
                                  style: textStyle,
                                  value: day.numbAppr8,
                                  onChanged: (String value) {
                                    focusNode33.requestFocus();
                                    setState(() {});
                                    day.numbAppr8 = value;
                                  },
                                ),
                              ),
                              Expanded(
                                child: DropdownButtonFormField(
                                  isExpanded: true,
                                  focusNode: focusNode34,
                                  decoration: InputDecoration(
                                    focusColor: Theme.of(context).primaryColor,
                                    labelText: 'Повторы',
                                    labelStyle: TextStyle(
                                        fontSize: 22,
                                        fontFamily: 'ASimplerDnm',
                                        color: Colors.black45,
                                        fontWeight: FontWeight.w300),
                                    hintStyle: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w300,
                                      color: Theme.of(context).primaryColor,
                                    ),
                                    prefixIcon: Icon(
                                      Icons.sync_rounded,
                                      color: focusNode34.hasFocus ||
                                              numbRepitController8
                                                  .text.isNotEmpty
                                          ? Theme.of(context).primaryColor
                                          : Colors.grey,
                                      size: 32,
                                    ),
                                    border: OutlineInputBorder(),
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.grey, width: 2),
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Theme.of(context).primaryColor,
                                          width: 4),
                                    ),
                                  ),
                                  items: _repeat.map((String value) {
                                    return DropdownMenuItem(
                                      value: value,
                                      child: Text(value),
                                    );
                                  }).toList(),
                                  style: textStyle,
                                  value: day.numbRepit8,
                                  onChanged: (String value) {
                                    focusNode34.requestFocus();
                                    setState(() {});
                                    day.numbRepit8 = value;
                                  },
                                ),
                              ),
                            ],
                          ),
                          Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Container(
                                  padding: EdgeInsets.all(20.0),
                                  child: Text(
                                    formattedTime,
                                    style: TextStyle(
                                      fontFamily: 'ASimplerDnm',
                                      fontSize: 50,
                                      color: Colors.black87,
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                ),
                                IconButton(
                                  icon: Icon(
                                    _isRunning
                                        ? Icons.pause_circle_sharp
                                        : Icons.play_circle_sharp,
                                    size: 50,
                                    color: Theme.of(context).primaryColor,
                                  ),
                                  onPressed: () {
                                    _toggleTimer();
                                  },
                                ),
                                SizedBox(width: 20.0),
                                IconButton(
                                  icon: Icon(
                                    Icons.replay_circle_filled_outlined,
                                    size: 50,
                                    color: Theme.of(context).primaryColor,
                                  ),
                                  onPressed: () {
                                    _resetTimer();
                                  },
                                ),
                              ],
                            ),
                          ),
                          Divider(thickness: 4),
                        ],
                      ),
                    ),
                  ),
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Form(
                      key: _9formKey,
                      child: ListView(
                        children: <Widget>[
                          SizedBox(height: 10),
                          Container(
                              alignment: Alignment.center,
                              child: Text(
                                'УПРАЖНЕНИЕ #9',
                                style: TextStyle(
                                    fontSize: 30,
                                    fontFamily: 'ASimplerDnm',
                                    color: Colors.black87,
                                    fontWeight: FontWeight.w300),
                              )),
                          SizedBox(height: 10),
                          TextFormField(
                            maxLength: 30,
                            onFieldSubmitted: (String value) {
                              day.nameExercise9 = value;
                            },
                            validator: (String value) {
                              if (value.isEmpty) {
                                return 'Название не введено';
                              } else if (value.length > 30) {
                                return 'Максимальная длина 30';
                              } else {
                                return null;
                              }
                            },
                            keyboardType: TextInputType.text,
                            controller: nameExerciseController9,
                            focusNode: focusNode35,
                            style: textStyle,
                            decoration: InputDecoration(
                              focusColor: Theme.of(context).primaryColor,
                              labelStyle: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w300,
                                color: Colors.black45,
                              ),
                              hintStyle: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w300,
                                color: Colors.black45,
                              ),
                              labelText: day.nameExercise9 != null &&
                                      day.nameExercise9.isNotEmpty
                                  ? 'Название упражнения'
                                  : 'Какое упражнение будем делать?',
                              hintText: 'Например: Жим штанги лёжа...',
                              prefixIcon: Icon(
                                Icons.fitness_center_rounded,
                                color: focusNode35.hasFocus ||
                                        nameExerciseController9.text.isNotEmpty
                                    ? Theme.of(context).primaryColor
                                    : Colors.grey,
                                size: 32,
                              ),
                              suffixIcon: GestureDetector(
                                child: IconButton(
                                  tooltip: 'Поиск',
                                  icon: Icon(
                                    Icons.search,
                                    size: 32,
                                    color: Colors.green.shade700,
                                  ),
                                  onPressed: () {
                                    showSearchPage(
                                        context,
                                        nameExerciseController9,
                                        'nameExercise9');
                                  },
                                ),
                              ),
                              enabledBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.grey, width: 2),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Theme.of(context).primaryColor,
                                    width: 4),
                              ),
                            ),
                            onChanged: (String value) {
                              setState(() {
                                focusNode35.requestFocus();
                              });
                            },
                          ),
                          Column(
                            children: [
                              TextFormField(
                                maxLength: 5,
                                validator: (String value) {
                                  if (value.isEmpty) {
                                    return 'Введите вес';
                                  } else {
                                    try {
                                      double weight = double.parse(value);
                                      if (weight > 500) {
                                        return 'Максимальный вес 500кг';
                                      }
                                    } catch (e) {
                                      return 'Некорректный формат веса';
                                    }
                                  }
                                  return null;
                                },
                                keyboardType: TextInputType.number,
                                onFieldSubmitted: (String value) {
                                  if (value.isNotEmpty) {
                                    day.weight9 = value;
                                    // focusNode5.requestFocus();
                                  }
                                },
                                focusNode: focusNode36,
                                controller: weightController9,
                                textAlign: TextAlign.center,
                                onChanged: (String value) {
                                  int parsedValue = int.tryParse(value);
                                  if (parsedValue != null &&
                                      parsedValue >= 0 &&
                                      parsedValue <= 500) {
                                    setState(() {
                                      _currentWeight = parsedValue.toDouble();
                                    });
                                  }
                                },
                                style: TextStyle(
                                  fontFamily: 'ASimplerDnm',
                                  fontSize: 54,
                                  color: Colors.black87,
                                  fontWeight: FontWeight.w300,
                                ),
                                decoration: InputDecoration(
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.grey, width: 2),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Theme.of(context).primaryColor,
                                        width: 4),
                                  ),
                                  hintText: 'выберите вес',
                                  helperText: 'КГ',
                                ),
                              ),
                              SliderTheme(
                                data: SliderThemeData(
                                    thumbColor: Colors.black87,
                                    thumbShape: RoundSliderThumbShape(
                                        enabledThumbRadius: 16)),
                                child: Slider(
                                  activeColor: Theme.of(context).primaryColor,
                                  inactiveColor: Colors.grey,
                                  value: _currentWeight,
                                  min: 0,
                                  max: 500,
                                  divisions: 1000,
                                  onChanged: (double value) {
                                    setState(() {
                                      _currentWeight = value;
                                      weightController9.text =
                                          _currentWeight.toStringAsFixed(1);
                                      day.weight9 = weightController9.text;
                                    });
                                  },
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: DropdownButtonFormField(
                                  isExpanded: true,
                                  focusNode: focusNode37,
                                  decoration: InputDecoration(
                                    focusColor: Theme.of(context).primaryColor,
                                    labelText: 'Подходы',
                                    labelStyle: TextStyle(
                                        fontSize: 22,
                                        fontFamily: 'ASimplerDnm',
                                        color: Colors.black45,
                                        fontWeight: FontWeight.w300),
                                    hintStyle: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w300,
                                      color: Theme.of(context).primaryColor,
                                    ),
                                    prefixIcon: Icon(
                                      Icons.undo_rounded,
                                      color: focusNode37.hasFocus ||
                                              numbApprController9
                                                  .text.isNotEmpty
                                          ? Theme.of(context).primaryColor
                                          : Colors.grey,
                                      size: 32,
                                    ),
                                    border: OutlineInputBorder(),
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.grey, width: 2),
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Theme.of(context).primaryColor,
                                          width: 4),
                                    ),
                                  ),
                                  items: _set.map((String value) {
                                    return DropdownMenuItem(
                                      value: value,
                                      child: Text(value),
                                    );
                                  }).toList(),
                                  style: textStyle,
                                  value: day.numbAppr9,
                                  onChanged: (String value) {
                                    focusNode37.requestFocus();
                                    setState(() {});
                                    day.numbAppr9 = value;
                                  },
                                ),
                              ),
                              Expanded(
                                child: DropdownButtonFormField(
                                  isExpanded: true,
                                  focusNode: focusNode38,
                                  decoration: InputDecoration(
                                    focusColor: Theme.of(context).primaryColor,
                                    labelText: 'Повторы',
                                    labelStyle: TextStyle(
                                        fontSize: 22,
                                        fontFamily: 'ASimplerDnm',
                                        color: Colors.black45,
                                        fontWeight: FontWeight.w300),
                                    hintStyle: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w300,
                                      color: Theme.of(context).primaryColor,
                                    ),
                                    prefixIcon: Icon(
                                      Icons.sync_rounded,
                                      color: focusNode38.hasFocus ||
                                              numbRepitController9
                                                  .text.isNotEmpty
                                          ? Theme.of(context).primaryColor
                                          : Colors.grey,
                                      size: 32,
                                    ),
                                    border: OutlineInputBorder(),
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.grey, width: 2),
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Theme.of(context).primaryColor,
                                          width: 4),
                                    ),
                                  ),
                                  items: _repeat.map((String value) {
                                    return DropdownMenuItem(
                                      value: value,
                                      child: Text(value),
                                    );
                                  }).toList(),
                                  style: textStyle,
                                  value: day.numbRepit9,
                                  onChanged: (String value) {
                                    focusNode38.requestFocus();
                                    setState(() {});
                                    day.numbRepit9 = value;
                                  },
                                ),
                              ),
                            ],
                          ),
                          Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Container(
                                  padding: EdgeInsets.all(20.0),
                                  child: Text(
                                    formattedTime,
                                    style: TextStyle(
                                      fontFamily: 'ASimplerDnm',
                                      fontSize: 50,
                                      color: Colors.black87,
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                ),
                                IconButton(
                                  icon: Icon(
                                    _isRunning
                                        ? Icons.pause_circle_sharp
                                        : Icons.play_circle_sharp,
                                    size: 50,
                                    color: Theme.of(context).primaryColor,
                                  ),
                                  onPressed: () {
                                    _toggleTimer();
                                  },
                                ),
                                SizedBox(width: 20.0),
                                IconButton(
                                  icon: Icon(
                                    Icons.replay_circle_filled_outlined,
                                    size: 50,
                                    color: Theme.of(context).primaryColor,
                                  ),
                                  onPressed: () {
                                    _resetTimer();
                                  },
                                ),
                              ],
                            ),
                          ),
                          Divider(thickness: 4),
                        ],
                      ),
                    ),
                  ),
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Form(
                      key: _10formKey,
                      child: ListView(
                        children: <Widget>[
                          SizedBox(height: 10),
                          Container(
                              alignment: Alignment.center,
                              child: Text(
                                'УПРАЖНЕНИЕ #10',
                                style: TextStyle(
                                    fontSize: 30,
                                    fontFamily: 'ASimplerDnm',
                                    color: Colors.black87,
                                    fontWeight: FontWeight.w300),
                              )),
                          SizedBox(height: 10),
                          TextFormField(
                            maxLength: 30,
                            onFieldSubmitted: (String value) {
                              day.nameExercise10 = value;
                            },
                            validator: (String value) {
                              if (value.isEmpty) {
                                return 'Название не введено';
                              } else if (value.length > 30) {
                                return 'Максимальная длина 30';
                              } else {
                                return null;
                              }
                            },
                            keyboardType: TextInputType.text,
                            controller: nameExerciseController10,
                            focusNode: focusNode39,
                            style: textStyle,
                            decoration: InputDecoration(
                              focusColor: Theme.of(context).primaryColor,
                              labelStyle: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w300,
                                color: Colors.black45,
                              ),
                              hintStyle: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w300,
                                color: Colors.black45,
                              ),
                              labelText: day.nameExercise10 != null &&
                                      day.nameExercise10.isNotEmpty
                                  ? 'Название упражнения'
                                  : 'Какое упражнение будем делать?',
                              hintText: 'Например: Жим штанги лёжа...',
                              prefixIcon: Icon(
                                Icons.fitness_center_rounded,
                                color: focusNode39.hasFocus ||
                                        nameExerciseController10.text.isNotEmpty
                                    ? Theme.of(context).primaryColor
                                    : Colors.grey,
                                size: 32,
                              ),
                              suffixIcon: GestureDetector(
                                child: IconButton(
                                  tooltip: 'Поиск',
                                  icon: Icon(
                                    Icons.search,
                                    size: 32,
                                    color: Colors.green.shade700,
                                  ),
                                  onPressed: () {
                                    showSearchPage(
                                        context,
                                        nameExerciseController10,
                                        'nameExercise10');
                                  },
                                ),
                              ),
                              enabledBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.grey, width: 2),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Theme.of(context).primaryColor,
                                    width: 4),
                              ),
                            ),
                            onChanged: (String value) {
                              setState(() {
                                focusNode39.requestFocus();
                              });
                            },
                          ),
                          Column(
                            children: [
                              TextFormField(
                                maxLength: 5,
                                validator: (String value) {
                                  if (value.isEmpty) {
                                    return 'Введите вес';
                                  } else {
                                    try {
                                      double weight = double.parse(value);
                                      if (weight > 500) {
                                        return 'Максимальный вес 500кг';
                                      }
                                    } catch (e) {
                                      return 'Некорректный формат веса';
                                    }
                                  }
                                  return null;
                                },
                                keyboardType: TextInputType.number,
                                onFieldSubmitted: (String value) {
                                  if (value.isNotEmpty) {
                                    day.weight10 = value;
                                    // focusNode5.requestFocus();
                                  }
                                },
                                focusNode: focusNode40,
                                controller: weightController10,
                                textAlign: TextAlign.center,
                                onChanged: (String value) {
                                  int parsedValue = int.tryParse(value);
                                  if (parsedValue != null &&
                                      parsedValue >= 0 &&
                                      parsedValue <= 500) {
                                    setState(() {
                                      _currentWeight = parsedValue.toDouble();
                                    });
                                  }
                                },
                                style: TextStyle(
                                  fontFamily: 'ASimplerDnm',
                                  fontSize: 54,
                                  color: Colors.black87,
                                  fontWeight: FontWeight.w300,
                                ),
                                decoration: InputDecoration(
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.grey, width: 2),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Theme.of(context).primaryColor,
                                        width: 4),
                                  ),
                                  hintText: 'выберите вес',
                                  helperText: 'КГ',
                                ),
                              ),
                              SliderTheme(
                                data: SliderThemeData(
                                    thumbColor: Colors.black87,
                                    thumbShape: RoundSliderThumbShape(
                                        enabledThumbRadius: 16)),
                                child: Slider(
                                  activeColor: Theme.of(context).primaryColor,
                                  inactiveColor: Colors.grey,
                                  value: _currentWeight,
                                  min: 0,
                                  max: 500,
                                  divisions: 1000,
                                  onChanged: (double value) {
                                    setState(() {
                                      _currentWeight = value;
                                      weightController10.text =
                                          _currentWeight.toStringAsFixed(1);
                                      day.weight10 = weightController10.text;
                                    });
                                  },
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: DropdownButtonFormField(
                                  isExpanded: true,
                                  focusNode: focusNode41,
                                  decoration: InputDecoration(
                                    focusColor: Theme.of(context).primaryColor,
                                    labelText: 'Подходы',
                                    labelStyle: TextStyle(
                                        fontSize: 22,
                                        fontFamily: 'ASimplerDnm',
                                        color: Colors.black45,
                                        fontWeight: FontWeight.w300),
                                    hintStyle: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w300,
                                      color: Theme.of(context).primaryColor,
                                    ),
                                    prefixIcon: Icon(
                                      Icons.undo_rounded,
                                      color: focusNode41.hasFocus ||
                                              numbApprController10
                                                  .text.isNotEmpty
                                          ? Theme.of(context).primaryColor
                                          : Colors.grey,
                                      size: 32,
                                    ),
                                    border: OutlineInputBorder(),
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.grey, width: 2),
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Theme.of(context).primaryColor,
                                          width: 4),
                                    ),
                                  ),
                                  items: _set.map((String value) {
                                    return DropdownMenuItem(
                                      value: value,
                                      child: Text(value),
                                    );
                                  }).toList(),
                                  style: textStyle,
                                  value: day.numbAppr10,
                                  onChanged: (String value) {
                                    focusNode41.requestFocus();
                                    setState(() {});
                                    day.numbAppr10 = value;
                                  },
                                ),
                              ),
                              Expanded(
                                child: DropdownButtonFormField(
                                  isExpanded: true,
                                  focusNode: focusNode42,
                                  decoration: InputDecoration(
                                    focusColor: Theme.of(context).primaryColor,
                                    labelText: 'Повторы',
                                    labelStyle: TextStyle(
                                        fontSize: 22,
                                        fontFamily: 'ASimplerDnm',
                                        color: Colors.black45,
                                        fontWeight: FontWeight.w300),
                                    hintStyle: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w300,
                                      color: Theme.of(context).primaryColor,
                                    ),
                                    prefixIcon: Icon(
                                      Icons.sync_rounded,
                                      color: focusNode42.hasFocus ||
                                              numbRepitController10
                                                  .text.isNotEmpty
                                          ? Theme.of(context).primaryColor
                                          : Colors.grey,
                                      size: 32,
                                    ),
                                    border: OutlineInputBorder(),
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.grey, width: 2),
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Theme.of(context).primaryColor,
                                          width: 4),
                                    ),
                                  ),
                                  items: _repeat.map((String value) {
                                    return DropdownMenuItem(
                                      value: value,
                                      child: Text(value),
                                    );
                                  }).toList(),
                                  style: textStyle,
                                  value: day.numbRepit10,
                                  onChanged: (String value) {
                                    focusNode42.requestFocus();
                                    setState(() {});
                                    day.numbRepit10 = value;
                                  },
                                ),
                              ),
                            ],
                          ),
                          Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Container(
                                  padding: EdgeInsets.all(20.0),
                                  child: Text(
                                    formattedTime,
                                    style: TextStyle(
                                      fontFamily: 'ASimplerDnm',
                                      fontSize: 50,
                                      color: Colors.black87,
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                ),
                                IconButton(
                                  icon: Icon(
                                    _isRunning
                                        ? Icons.pause_circle_sharp
                                        : Icons.play_circle_sharp,
                                    size: 50,
                                    color: Theme.of(context).primaryColor,
                                  ),
                                  onPressed: () {
                                    _toggleTimer();
                                  },
                                ),
                                SizedBox(width: 20.0),
                                IconButton(
                                  icon: Icon(
                                    Icons.replay_circle_filled_outlined,
                                    size: 50,
                                    color: Theme.of(context).primaryColor,
                                  ),
                                  onPressed: () {
                                    _resetTimer();
                                  },
                                ),
                              ],
                            ),
                          ),
                          Divider(thickness: 4),
                        ],
                      ),
                    ),
                  ),
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Form(
                      key: _11formKey,
                      child: ListView(
                        children: <Widget>[
                          SizedBox(height: 10),
                          Container(
                              alignment: Alignment.center,
                              child: Text(
                                'УПРАЖНЕНИЕ #11',
                                style: TextStyle(
                                    fontSize: 30,
                                    fontFamily: 'ASimplerDnm',
                                    color: Colors.black87,
                                    fontWeight: FontWeight.w300),
                              )),
                          SizedBox(height: 10),
                          TextFormField(
                            maxLength: 30,
                            onFieldSubmitted: (String value) {
                              day.nameExercise11 = value;
                            },
                            validator: (String value) {
                              if (value.isEmpty) {
                                return 'Название не введено';
                              } else if (value.length > 30) {
                                return 'Максимальная длина 30';
                              } else {
                                return null;
                              }
                            },
                            keyboardType: TextInputType.text,
                            controller: nameExerciseController11,
                            focusNode: focusNode43,
                            style: textStyle,
                            decoration: InputDecoration(
                              focusColor: Theme.of(context).primaryColor,
                              labelStyle: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w300,
                                color: Colors.black45,
                              ),
                              hintStyle: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w300,
                                color: Colors.black45,
                              ),
                              labelText: day.nameExercise11 != null &&
                                      day.nameExercise11.isNotEmpty
                                  ? 'Название упражнения'
                                  : 'Какое упражнение будем делать?',
                              hintText: 'Например: Жим штанги лёжа...',
                              prefixIcon: Icon(
                                Icons.fitness_center_rounded,
                                color: focusNode43.hasFocus ||
                                        nameExerciseController11.text.isNotEmpty
                                    ? Theme.of(context).primaryColor
                                    : Colors.grey,
                                size: 32,
                              ),
                              suffixIcon: GestureDetector(
                                child: IconButton(
                                  tooltip: 'Поиск',
                                  icon: Icon(
                                    Icons.search,
                                    size: 32,
                                    color: Colors.green.shade700,
                                  ),
                                  onPressed: () {
                                    showSearchPage(
                                        context,
                                        nameExerciseController11,
                                        'nameExercise11');
                                  },
                                ),
                              ),
                              enabledBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.grey, width: 2),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Theme.of(context).primaryColor,
                                    width: 4),
                              ),
                            ),
                            onChanged: (String value) {
                              setState(() {
                                focusNode43.requestFocus();
                              });
                            },
                          ),
                          Column(
                            children: [
                              TextFormField(
                                maxLength: 5,
                                validator: (String value) {
                                  if (value.isEmpty) {
                                    return 'Введите вес';
                                  } else {
                                    try {
                                      double weight = double.parse(value);
                                      if (weight > 500) {
                                        return 'Максимальный вес 500кг';
                                      }
                                    } catch (e) {
                                      return 'Некорректный формат веса';
                                    }
                                  }
                                  return null;
                                },
                                keyboardType: TextInputType.number,
                                onFieldSubmitted: (String value) {
                                  if (value.isNotEmpty) {
                                    day.weight11 = value;
                                    // focusNode5.requestFocus();
                                  }
                                },
                                focusNode: focusNode44,
                                controller: weightController11,
                                textAlign: TextAlign.center,
                                onChanged: (String value) {
                                  int parsedValue = int.tryParse(value);
                                  if (parsedValue != null &&
                                      parsedValue >= 0 &&
                                      parsedValue <= 500) {
                                    setState(() {
                                      _currentWeight = parsedValue.toDouble();
                                    });
                                  }
                                },
                                style: TextStyle(
                                  fontFamily: 'ASimplerDnm',
                                  fontSize: 54,
                                  color: Colors.black87,
                                  fontWeight: FontWeight.w300,
                                ),
                                decoration: InputDecoration(
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.grey, width: 2),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Theme.of(context).primaryColor,
                                        width: 4),
                                  ),
                                  hintText: 'выберите вес',
                                  helperText: 'КГ',
                                ),
                              ),
                              SliderTheme(
                                data: SliderThemeData(
                                    thumbColor: Colors.black87,
                                    thumbShape: RoundSliderThumbShape(
                                        enabledThumbRadius: 16)),
                                child: Slider(
                                  activeColor: Theme.of(context).primaryColor,
                                  inactiveColor: Colors.grey,
                                  value: _currentWeight,
                                  min: 0,
                                  max: 500,
                                  divisions: 1000,
                                  onChanged: (double value) {
                                    setState(() {
                                      _currentWeight = value;
                                      weightController11.text =
                                          _currentWeight.toStringAsFixed(1);
                                      day.weight11 = weightController11.text;
                                    });
                                  },
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: DropdownButtonFormField(
                                  isExpanded: true,
                                  focusNode: focusNode45,
                                  decoration: InputDecoration(
                                    focusColor: Theme.of(context).primaryColor,
                                    labelText: 'Подходы',
                                    labelStyle: TextStyle(
                                        fontSize: 22,
                                        fontFamily: 'ASimplerDnm',
                                        color: Colors.black45,
                                        fontWeight: FontWeight.w300),
                                    hintStyle: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w300,
                                      color: Theme.of(context).primaryColor,
                                    ),
                                    prefixIcon: Icon(
                                      Icons.undo_rounded,
                                      color: focusNode45.hasFocus ||
                                              numbApprController11
                                                  .text.isNotEmpty
                                          ? Theme.of(context).primaryColor
                                          : Colors.grey,
                                      size: 32,
                                    ),
                                    border: OutlineInputBorder(),
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.grey, width: 2),
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Theme.of(context).primaryColor,
                                          width: 4),
                                    ),
                                  ),
                                  items: _set.map((String value) {
                                    return DropdownMenuItem(
                                      value: value,
                                      child: Text(value),
                                    );
                                  }).toList(),
                                  style: textStyle,
                                  value: day.numbAppr11,
                                  onChanged: (String value) {
                                    focusNode45.requestFocus();
                                    setState(() {});
                                    day.numbAppr11 = value;
                                  },
                                ),
                              ),
                              Expanded(
                                child: DropdownButtonFormField(
                                  isExpanded: true,
                                  focusNode: focusNode46,
                                  decoration: InputDecoration(
                                    focusColor: Theme.of(context).primaryColor,
                                    labelText: 'Повторы',
                                    labelStyle: TextStyle(
                                        fontSize: 22,
                                        fontFamily: 'ASimplerDnm',
                                        color: Colors.black45,
                                        fontWeight: FontWeight.w300),
                                    hintStyle: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w300,
                                      color: Theme.of(context).primaryColor,
                                    ),
                                    prefixIcon: Icon(
                                      Icons.sync_rounded,
                                      color: focusNode46.hasFocus ||
                                              numbRepitController11
                                                  .text.isNotEmpty
                                          ? Theme.of(context).primaryColor
                                          : Colors.grey,
                                      size: 32,
                                    ),
                                    border: OutlineInputBorder(),
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.grey, width: 2),
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Theme.of(context).primaryColor,
                                          width: 4),
                                    ),
                                  ),
                                  items: _repeat.map((String value) {
                                    return DropdownMenuItem(
                                      value: value,
                                      child: Text(value),
                                    );
                                  }).toList(),
                                  style: textStyle,
                                  value: day.numbRepit11,
                                  onChanged: (String value) {
                                    focusNode46.requestFocus();
                                    setState(() {});
                                    day.numbRepit11 = value;
                                  },
                                ),
                              ),
                            ],
                          ),
                          Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Container(
                                  padding: EdgeInsets.all(20.0),
                                  child: Text(
                                    formattedTime,
                                    style: TextStyle(
                                      fontFamily: 'ASimplerDnm',
                                      fontSize: 50,
                                      color: Colors.black87,
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                ),
                                IconButton(
                                  icon: Icon(
                                    _isRunning
                                        ? Icons.pause_circle_sharp
                                        : Icons.play_circle_sharp,
                                    size: 50,
                                    color: Theme.of(context).primaryColor,
                                  ),
                                  onPressed: () {
                                    _toggleTimer();
                                  },
                                ),
                                SizedBox(width: 20.0),
                                IconButton(
                                  icon: Icon(
                                    Icons.replay_circle_filled_outlined,
                                    size: 50,
                                    color: Theme.of(context).primaryColor,
                                  ),
                                  onPressed: () {
                                    _resetTimer();
                                  },
                                ),
                              ],
                            ),
                          ),
                          Divider(thickness: 4),
                        ],
                      ),
                    ),
                  ),
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Form(
                      key: _12formKey,
                      child: ListView(
                        children: <Widget>[
                          SizedBox(height: 10),
                          Container(
                              alignment: Alignment.center,
                              child: Text(
                                'УПРАЖНЕНИЕ #12',
                                style: TextStyle(
                                    fontSize: 30,
                                    fontFamily: 'ASimplerDnm',
                                    color: Colors.black87,
                                    fontWeight: FontWeight.w300),
                              )),
                          SizedBox(height: 10),
                          TextFormField(
                            maxLength: 30,
                            onFieldSubmitted: (String value) {
                              day.nameExercise12 = value;
                            },
                            validator: (String value) {
                              if (value.isEmpty) {
                                return 'Название не введено';
                              } else if (value.length > 30) {
                                return 'Максимальная длина 30';
                              } else {
                                return null;
                              }
                            },
                            keyboardType: TextInputType.text,
                            controller: nameExerciseController12,
                            focusNode: focusNode47,
                            style: textStyle,
                            decoration: InputDecoration(
                              focusColor: Theme.of(context).primaryColor,
                              labelStyle: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w300,
                                color: Colors.black45,
                              ),
                              hintStyle: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w300,
                                color: Colors.black45,
                              ),
                              labelText: day.nameExercise12 != null &&
                                      day.nameExercise12.isNotEmpty
                                  ? 'Название упражнения'
                                  : 'Какое упражнение будем делать?',
                              hintText: 'Например: Жим штанги лёжа...',
                              prefixIcon: Icon(
                                Icons.fitness_center_rounded,
                                color: focusNode47.hasFocus ||
                                        nameExerciseController12.text.isNotEmpty
                                    ? Theme.of(context).primaryColor
                                    : Colors.grey,
                                size: 32,
                              ),
                              suffixIcon: GestureDetector(
                                child: IconButton(
                                  tooltip: 'Поиск',
                                  icon: Icon(
                                    Icons.search,
                                    size: 32,
                                    color: Colors.green.shade700,
                                  ),
                                  onPressed: () {
                                    showSearchPage(
                                        context,
                                        nameExerciseController12,
                                        'nameExercise12');
                                  },
                                ),
                              ),
                              enabledBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.grey, width: 2),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Theme.of(context).primaryColor,
                                    width: 4),
                              ),
                            ),
                            onChanged: (String value) {
                              setState(() {
                                focusNode47.requestFocus();
                              });
                            },
                          ),
                          Column(
                            children: [
                              TextFormField(
                                maxLength: 5,
                                validator: (String value) {
                                  if (value.isEmpty) {
                                    return 'Введите вес';
                                  } else {
                                    try {
                                      double weight = double.parse(value);
                                      if (weight > 500) {
                                        return 'Максимальный вес 500кг';
                                      }
                                    } catch (e) {
                                      return 'Некорректный формат веса';
                                    }
                                  }
                                  return null;
                                },
                                keyboardType: TextInputType.number,
                                onFieldSubmitted: (String value) {
                                  if (value.isNotEmpty) {
                                    day.weight12 = value;
                                    // focusNode5.requestFocus();
                                  }
                                },
                                focusNode: focusNode48,
                                controller: weightController12,
                                textAlign: TextAlign.center,
                                onChanged: (String value) {
                                  int parsedValue = int.tryParse(value);
                                  if (parsedValue != null &&
                                      parsedValue >= 0 &&
                                      parsedValue <= 500) {
                                    setState(() {
                                      _currentWeight = parsedValue.toDouble();
                                    });
                                  }
                                },
                                style: TextStyle(
                                  fontFamily: 'ASimplerDnm',
                                  fontSize: 54,
                                  color: Colors.black87,
                                  fontWeight: FontWeight.w300,
                                ),
                                decoration: InputDecoration(
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.grey, width: 2),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Theme.of(context).primaryColor,
                                        width: 4),
                                  ),
                                  hintText: 'выберите вес',
                                  helperText: 'КГ',
                                ),
                              ),
                              SliderTheme(
                                data: SliderThemeData(
                                    thumbColor: Colors.black87,
                                    thumbShape: RoundSliderThumbShape(
                                        enabledThumbRadius: 16)),
                                child: Slider(
                                  activeColor: Theme.of(context).primaryColor,
                                  inactiveColor: Colors.grey,
                                  value: _currentWeight,
                                  min: 0,
                                  max: 500,
                                  divisions: 1000,
                                  onChanged: (double value) {
                                    setState(() {
                                      _currentWeight = value;
                                      weightController12.text =
                                          _currentWeight.toStringAsFixed(1);
                                      day.weight10 = weightController12.text;
                                    });
                                  },
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: DropdownButtonFormField(
                                  isExpanded: true,
                                  focusNode: focusNode49,
                                  decoration: InputDecoration(
                                    focusColor: Theme.of(context).primaryColor,
                                    labelText: 'Подходы',
                                    labelStyle: TextStyle(
                                        fontSize: 22,
                                        fontFamily: 'ASimplerDnm',
                                        color: Colors.black45,
                                        fontWeight: FontWeight.w300),
                                    hintStyle: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w300,
                                      color: Theme.of(context).primaryColor,
                                    ),
                                    prefixIcon: Icon(
                                      Icons.undo_rounded,
                                      color: focusNode49.hasFocus ||
                                              numbApprController12
                                                  .text.isNotEmpty
                                          ? Theme.of(context).primaryColor
                                          : Colors.grey,
                                      size: 32,
                                    ),
                                    border: OutlineInputBorder(),
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.grey, width: 2),
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Theme.of(context).primaryColor,
                                          width: 4),
                                    ),
                                  ),
                                  items: _set.map((String value) {
                                    return DropdownMenuItem(
                                      value: value,
                                      child: Text(value),
                                    );
                                  }).toList(),
                                  style: textStyle,
                                  value: day.numbAppr12,
                                  onChanged: (String value) {
                                    focusNode49.requestFocus();
                                    setState(() {});
                                    day.numbAppr12 = value;
                                  },
                                ),
                              ),
                              Expanded(
                                child: DropdownButtonFormField(
                                  isExpanded: true,
                                  focusNode: focusNode50,
                                  decoration: InputDecoration(
                                    focusColor: Theme.of(context).primaryColor,
                                    labelText: 'Повторы',
                                    labelStyle: TextStyle(
                                        fontSize: 22,
                                        fontFamily: 'ASimplerDnm',
                                        color: Colors.black45,
                                        fontWeight: FontWeight.w300),
                                    hintStyle: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w300,
                                      color: Theme.of(context).primaryColor,
                                    ),
                                    prefixIcon: Icon(
                                      Icons.sync_rounded,
                                      color: focusNode50.hasFocus ||
                                              numbRepitController12
                                                  .text.isNotEmpty
                                          ? Theme.of(context).primaryColor
                                          : Colors.grey,
                                      size: 32,
                                    ),
                                    border: OutlineInputBorder(),
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.grey, width: 2),
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Theme.of(context).primaryColor,
                                          width: 4),
                                    ),
                                  ),
                                  items: _repeat.map((String value) {
                                    return DropdownMenuItem(
                                      value: value,
                                      child: Text(value),
                                    );
                                  }).toList(),
                                  style: textStyle,
                                  value: day.numbRepit12,
                                  onChanged: (String value) {
                                    focusNode50.requestFocus();
                                    setState(() {});
                                    day.numbRepit12 = value;
                                  },
                                ),
                              ),
                            ],
                          ),
                          Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Container(
                                  padding: EdgeInsets.all(20.0),
                                  child: Text(
                                    formattedTime,
                                    style: TextStyle(
                                      fontFamily: 'ASimplerDnm',
                                      fontSize: 50,
                                      color: Colors.black87,
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                ),
                                IconButton(
                                  icon: Icon(
                                    _isRunning
                                        ? Icons.pause_circle_sharp
                                        : Icons.play_circle_sharp,
                                    size: 50,
                                    color: Theme.of(context).primaryColor,
                                  ),
                                  onPressed: () {
                                    _toggleTimer();
                                  },
                                ),
                                SizedBox(width: 20.0),
                                IconButton(
                                  icon: Icon(
                                    Icons.replay_circle_filled_outlined,
                                    size: 50,
                                    color: Theme.of(context).primaryColor,
                                  ),
                                  onPressed: () {
                                    _resetTimer();
                                  },
                                ),
                              ],
                            ),
                          ),
                          Divider(thickness: 4),
                        ],
                      ),
                    ),
                  ),
                ),
              ]),
            ),
          ],
        ),
        // floatingActionButton: FloatingActionButton(
        //   backgroundColor: Theme.of(context).primaryColor,
        //   heroTag: 'Добавить упражнение',
        //   onPressed: () {},
        //   tooltip: 'Добавляет упражнение',
        //   child: Icon(
        //     Icons.fitness_center_rounded,
        //     size: 52.0,
        //     color: Colors.black87,
        //   ),
        //   mini: false,
        // ),
        // floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      ),
    );
  }

  void weightTotal() {
    double weight1 =
        (double.tryParse(weightController1.text.replaceAll(',', '.')) ?? 0.0) *
            (double.tryParse(numbRepitController1.text.replaceAll(',', '.')) ??
                0.0) *
            (double.tryParse(numbApprController1.text.replaceAll(',', '.')) ??
                0.0);
    double weight2 =
        (double.tryParse(weightController2.text.replaceAll(',', '.')) ?? 0.0) *
            (double.tryParse(numbRepitController2.text.replaceAll(',', '.')) ??
                0.0) *
            (double.tryParse(numbApprController2.text.replaceAll(',', '.')) ??
                0.0);
    double weight3 =
        (double.tryParse(weightController3.text.replaceAll(',', '.')) ?? 0.0) *
            (double.tryParse(numbRepitController3.text.replaceAll(',', '.')) ??
                0.0) *
            (double.tryParse(numbApprController3.text.replaceAll(',', '.')) ??
                0.0);
    double weight4 =
        (double.tryParse(weightController4.text.replaceAll(',', '.')) ?? 0.0) *
            (double.tryParse(numbRepitController4.text.replaceAll(',', '.')) ??
                0.0) *
            (double.tryParse(numbApprController4.text.replaceAll(',', '.')) ??
                0.0);
    double weight5 =
        (double.tryParse(weightController5.text.replaceAll(',', '.')) ?? 0.0) *
            (double.tryParse(numbRepitController5.text.replaceAll(',', '.')) ??
                0.0) *
            (double.tryParse(numbApprController5.text.replaceAll(',', '.')) ??
                0.0);
    double weight6 =
        (double.tryParse(weightController6.text.replaceAll(',', '.')) ?? 0.0) *
            (double.tryParse(numbRepitController6.text.replaceAll(',', '.')) ??
                0.0) *
            (double.tryParse(numbApprController6.text.replaceAll(',', '.')) ??
                0.0);
    double weight7 =
        (double.tryParse(weightController7.text.replaceAll(',', '.')) ?? 0.0) *
            (double.tryParse(numbRepitController7.text.replaceAll(',', '.')) ??
                0.0) *
            (double.tryParse(numbApprController7.text.replaceAll(',', '.')) ??
                0.0);
    double weight8 =
        (double.tryParse(weightController8.text.replaceAll(',', '.')) ?? 0.0) *
            (double.tryParse(numbRepitController8.text.replaceAll(',', '.')) ??
                0.0) *
            (double.tryParse(numbApprController8.text.replaceAll(',', '.')) ??
                0.0);
    double weight9 =
        (double.tryParse(weightController9.text.replaceAll(',', '.')) ?? 0.0) *
            (double.tryParse(numbRepitController9.text.replaceAll(',', '.')) ??
                0.0) *
            (double.tryParse(numbApprController9.text.replaceAll(',', '.')) ??
                0.0);
    double weight10 =
        (double.tryParse(weightController10.text.replaceAll(',', '.')) ?? 0.0) *
            (double.tryParse(numbRepitController10.text.replaceAll(',', '.')) ??
                0.0) *
            (double.tryParse(numbApprController10.text.replaceAll(',', '.')) ??
                0.0);
    double weight11 =
        (double.tryParse(weightController11.text.replaceAll(',', '.')) ?? 0.0) *
            (double.tryParse(numbRepitController11.text.replaceAll(',', '.')) ??
                0.0) *
            (double.tryParse(numbApprController11.text.replaceAll(',', '.')) ??
                0.0);
    double weight12 =
        (double.tryParse(weightController12.text.replaceAll(',', '.')) ?? 0.0) *
            (double.tryParse(numbRepitController12.text.replaceAll(',', '.')) ??
                0.0) *
            (double.tryParse(numbApprController12.text.replaceAll(',', '.')) ??
                0.0);

    double weightTotal = weight1 +
        weight2 +
        weight3 +
        weight4 +
        weight5 +
        weight6 +
        weight7 +
        weight8 +
        weight9 +
        weight10 +
        weight11 +
        weight12;

    day.weightTotal = weightTotal.toStringAsFixed(1);
    weightTotalController.text = day.weightTotal;
    print('вес 1: ${weightController1.text}');
    print('подходов 1: ${numbApprController1.text}');
    print('повторов 1: ${numbRepitController1.text}');
    print('Общий вес: $weightTotal');
  }

  void showSearchPage(
      BuildContext context, TextEditingController controller, String dayField) {
    final List<String> kEnglishWords = List.from(Set.from(english_words.all))
      ..sort(
        (w1, w2) => w1.toLowerCase().compareTo(w2.toLowerCase()),
      );

    MySearchDelegate delegate = MySearchDelegate(kEnglishWords);
    showSearch<String>(
      context: context,
      delegate: delegate,
    ).then((selected) {
      if (selected != null) {
        controller.text = selected;
        if (dayField == 'nameExercise1') {
          day.nameExercise1 = controller.text;
        } else if (dayField == 'nameExercise2') {
          day.nameExercise2 = controller.text;
        } else if (dayField == 'nameExercise3') {
          day.nameExercise3 = controller.text;
        } else if (dayField == 'nameExercise4') {
          day.nameExercise4 = controller.text;
        } else if (dayField == 'nameExercise5') {
          day.nameExercise5 = controller.text;
        } else if (dayField == 'nameExercise6') {
          day.nameExercise6 = controller.text;
        } else if (dayField == 'nameExercise7') {
          day.nameExercise7 = controller.text;
        } else if (dayField == 'nameExercise8') {
          day.nameExercise8 = controller.text;
        } else if (dayField == 'nameExercise9') {
          day.nameExercise9 = controller.text;
        } else if (dayField == 'nameExercise10') {
          day.nameExercise10 = controller.text;
        } else if (dayField == 'nameExercise11') {
          day.nameExercise11 = controller.text;
        } else if (dayField == 'nameExercise12') {
          day.nameExercise12 = controller.text;
        }
      }
    });
  }

  // void showSearchPage1(BuildContext context) {
  //   final List<String> kEnglishWords = List.from(Set.from(english_words.all))
  //     ..sort(
  //       (w1, w2) => w1.toLowerCase().compareTo(w2.toLowerCase()),
  //     );

  //   MySearchDelegate delegate = MySearchDelegate(kEnglishWords);
  //   showSearch<String>(
  //     context: context,
  //     delegate: delegate,
  //   ).then((selected1) {
  //     if (selected1 != null) {
  //       nameExerciseController1.text = selected1;
  //       day.nameExercise1 = nameExerciseController1.text;
  //     }
  //   });
  // }

  // void showSearchPage2(BuildContext context) {
  //   final List<String> kEnglishWords = List.from(Set.from(english_words.all))
  //     ..sort(
  //       (w1, w2) => w1.toLowerCase().compareTo(w2.toLowerCase()),
  //     );

  //   MySearchDelegate delegate = MySearchDelegate(kEnglishWords);
  //   showSearch<String>(
  //     context: context,
  //     delegate: delegate,
  //   ).then((selected2) {
  //     if (selected2 != null) {
  //       nameExerciseController2.text = selected2;
  //       day.nameExercise2 = nameExerciseController2.text;
  //     }
  //   });
  // }

  void confirmDelete() {
    showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        backgroundColor: Theme.of(context).primaryColor,
        title: const Text(
          'Вы хотите удалить тренировку?',
          style: TextStyle(
            fontSize: 16.0,
            fontFamily: 'ASimplerDnm',
          ),
        ),
        actions: <Widget>[
          TextButton(
              child: const Text(
                'Закрыть',
                style: TextStyle(
                  fontSize: 16.0,
                  fontFamily: 'ASimplerDnm',
                ),
              ),
              onPressed: () => Navigator.of(context).pop()),
          TextButton(
              child: const Text(
                'Удалить',
                style: TextStyle(
                  color: Color.fromRGBO(187, 30, 16, 1.0),
                  fontSize: 16.0,
                  fontFamily: 'ASimplerDnm',
                ),
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
    weightTotal();
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
    weightTotal();
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
    weightTotal();
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
    weightTotal();
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
    weightTotal();
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
    weightTotal();
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
    weightTotal();
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
    weightTotal();
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
    weightTotal();
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
    weightTotal();
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
    weightTotal();
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
    weightTotal();
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
    weightTotal();
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
    weightTotal();
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
    weightTotal();
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
    weightTotal();
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
    weightTotal();
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
    weightTotal();
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
    weightTotal();
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
    weightTotal();
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
    weightTotal();
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
    weightTotal();
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

  void saveForm120() {
    weightTotal();
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
    weightTotal();
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
}

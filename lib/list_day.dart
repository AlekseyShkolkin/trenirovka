import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import './dbhelper_day.dart';
import './model_day.dart';
import './day_detail.dart';
import 'package:sqflite/sqflite.dart';
import 'package:flutter_circular_text/circular_text.dart';

DbHelperDay helperD = DbHelperDay();

class ListDay extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => ListDayState();
}

class ListDayState extends State {
  DbHelperDay helperD = DbHelperDay();
  List<Day> todos;

  bool _isVisible = true;

  void initState() {
    super.initState();
    Timer.periodic(Duration(milliseconds: 600), (timer) {
      setState(() {
        _isVisible = !_isVisible;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    // File defaultimage = File('assets/images/defaultimage.png');
    if (todos == null) {
      todos = <Day>[];
      getData();
    }

    return Scaffold(
      appBar: todos.isNotEmpty && todos != null
          ? AppBar(
              backgroundColor: Theme.of(context).primaryColor,
              title: Center(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'ТВОЯ ТРЕНИРОВКА',
                          style: TextStyle(
                            fontFamily: 'ASimplerDnm',
                            color: Colors.black87,
                            fontSize: 32,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      IconButton(
                        tooltip: 'Добавляет день',
                        icon: Icon(
                          Icons.library_add_rounded,
                          color: Colors.black87,
                          size: 32,
                        ),
                        onPressed: () {
                          navigateToDetail(Day('', ''));
                        },
                      ),
                    ],
                  ),
                ],
              )),
            )
          : null,
      backgroundColor: Theme.of(context).primaryColor,
      body: Center(
        child: todos.isNotEmpty && todos != null
            ? objectListItems()
            : GestureDetector(
                onTap: () {
                  navigateToDetail(Day('', ''));
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('assets/images/defaultimage.png'),
                    SizedBox(height: 10),
                    AnimatedOpacity(
                      opacity: _isVisible ? 1.0 : 0.0,
                      duration: Duration(milliseconds: 400),
                      child: Text(
                        'Нажмите для продолжения',
                        style: TextStyle(
                          color: Colors.black26,
                          fontSize: 16,
                          fontFamily: 'ASimplerDnm',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
      ),
      floatingActionButton: todos.isNotEmpty
          ? FloatingActionButton(
              backgroundColor: Theme.of(context).primaryColor,
              heroTag: 'Добавить день',
              onPressed: () {
                navigateToDetail(Day('', ''));
              },
              tooltip: 'Добавляет день',
              child: Icon(
                Icons.fitness_center_rounded,
                size: 52.0,
                color: Colors.black87,
              ),
              elevation: 12,
              mini: false,
            )
          : null,
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }

  ListView objectListItems() {
    return ListView.builder(
        padding: const EdgeInsets.only(top: 20.0),
        itemCount: todos.length,
        itemBuilder: (BuildContext context, int position) {
          return Center(
            child: Container(
              padding: const EdgeInsets.only(bottom: 2.0),
              decoration: const BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      color: Color.fromARGB(255, 235, 235, 243),
                      blurRadius: 100.0,
                      spreadRadius: -9.0,
                      offset: Offset(0.0, 7.0)),
                ],
              ),
              child: Dismissible(
                direction: DismissDirection.endToStart,
                background: Container(
                    alignment: Alignment.centerRight,
                    padding: const EdgeInsets.only(right: 24.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100.0),
                      color: Color.fromRGBO(187, 30, 16, 1.0),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const <Widget>[
                        Icon(
                          Icons.clear,
                          color: Colors.white,
                          size: 44,
                        ),
                        Text(
                          'УДАЛИТЬ?',
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.w400),
                        )
                      ],
                    )),
                key: Key(todos[position].id.toString()),
                onDismissed: (DismissDirection direction) {
                  final int id = todos[position].id;
                  final String title = todos[position].titleday.toString();
                  setState(() {
                    todos.removeAt(position);
                    helperD.deleteDay(id);
                    getData();
                  });
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('$title - УДАЛЕНО'),
                    ),
                  );
                },
                child: Card(
                  color: (todos[position].weightTotal == null ||
                          double.tryParse(todos[position].weightTotal.replaceAll(',', '.')) ==
                              null)
                      ? Colors.white
                      : (double.tryParse(todos[position].weightTotal.replaceAll(',', '.')) <=
                                  10000 &&
                              double.tryParse(todos[position]
                                      .weightTotal
                                      .replaceAll(',', '.')) >
                                  0)
                          ? Colors.green
                          : (double.tryParse(todos[position].weightTotal.replaceAll(',', '.')) >
                                      10000 &&
                                  double.tryParse(todos[position]
                                          .weightTotal
                                          .replaceAll(',', '.')) <=
                                      30000)
                              ? Colors.yellow
                              : double.tryParse(todos[position].weightTotal.replaceAll(',', '.')) > 30000
                                  ? Colors.red
                                  : Colors.white,
                  shape: CircleBorder(
                    side: BorderSide(width: 2, color: Colors.black87),
                  ), // Используем CircleBorder для круглой формы
                  elevation: 3.0,
                  child: ClipOval(
                    child: Container(
                      width: 200.0, // Задаем ширину для карточки
                      height: 200.0, // Задаем высоту для карточки
                      child: InkWell(
                        onTap: () {
                          debugPrint(
                              'Tapped on ' + todos[position].id.toString());
                          navigateToDetail(todos[position]);
                        },
                        child: Padding(
                          padding: EdgeInsets.all(10.0),
                          // Добавляем отступы внутри контейнера
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Stack(
                                children: <Widget>[
                                  CircularText(
                                    children: [
                                      TextItem(
                                        text: Text(
                                          todos[position].titleday != null &&
                                                  todos[position]
                                                      .titleday
                                                      .isNotEmpty
                                              ? todos[position].titleday
                                              : 'Тренировочный день',
                                          style: TextStyle(
                                            fontFamily: 'ASimplerDnm',
                                            fontSize: 36,
                                            // fontWeight: FontWeight.w800,
                                            color: Colors.black87,
                                          ),
                                        ),
                                        space: 10,
                                        startAngleAlignment:
                                            StartAngleAlignment.center,
                                        startAngle: -90,
                                        direction:
                                            CircularTextDirection.clockwise,
                                      ),
                                    ],
                                    radius: 220,
                                    position: CircularTextPosition.inside,
                                  ),
                                  Positioned(
                                    top: 20,
                                    left: 0,
                                    right: 0,
                                    child: Container(
                                      width: 142.0,
                                      height: 142.0,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors
                                            .transparent, // Прозрачный цвет фона
                                        border: Border.all(
                                          color: Colors.black87,
                                          width: 2.0,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    top: 63,
                                    left: 0,
                                    right: 0,
                                    child: Container(
                                      width: 50.0,
                                      height: 50.0,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors
                                            .transparent, // Прозрачный цвет фона
                                        border: Border.all(
                                          color: Colors.black87,
                                          width: 2.0,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    top: 40.0,
                                    left: 0,
                                    right: 0,
                                    child: Text(
                                      todos[position].dateTren != null &&
                                              todos[position]
                                                  .dateTren
                                                  .isNotEmpty
                                          ? todos[position].dateTren
                                          : 'недавно',
                                      style: const TextStyle(
                                        fontFamily: 'ASimplerDnm',
                                        fontSize: 22,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black87,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  SizedBox(height: 10.0),
                                  Positioned(
                                    top: 70.0,
                                    left: 0,
                                    right: 0,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.transparent,
                                        border: Border.all(
                                          color: Colors.black87,
                                          width: 2.0,
                                        ),
                                      ),
                                      child: CircleAvatar(
                                        radius: 16.0,
                                        backgroundColor:
                                            Theme.of(context).primaryColor,
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 10.0),
                                  Positioned(
                                    top: 122.0,
                                    left: 0,
                                    right: 0,
                                    child: Text(
                                      todos[position].weightTotal != null &&
                                              todos[position]
                                                  .weightTotal
                                                  .isNotEmpty
                                          ? todos[position]
                                                  .weightTotal
                                                  .toString() +
                                              ' КГ'
                                          : '...',
                                      style: const TextStyle(
                                          fontFamily: 'ASimplerDnm',
                                          fontSize: 20,
                                          color: Colors.black87),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  SizedBox(height: 15.0),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        });
  }

  String descriptionParser(String desc) {
    if (desc.isNotEmpty) {
      return desc.length > 42 ? desc.substring(0, 42) + '...' : desc;
    }
    return '...';
  }

  void getData() {
    final Future<Database> dbFuture = helperD.initializeDb();
    dbFuture.then((Database result) {
      final Future<List> todosFuture = helperD.getDays();
      todosFuture?.then((List result) {
        final List<Day> todoList = <Day>[];
        for (int i = 0; i < (result?.length ?? 0); i++) {
          todoList.add(Day.fromDay(result[i]));
          debugPrint(todoList[i].titleday);
        }
        setState(() {
          todos = todoList;
        });
        debugPrint('Items: ' + todos.length.toString());
        var lenlistip = todos.length.toString();
      });
    });
  }

  Future<void> navigateToDetail(Day day) async {
    final bool result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (BuildContext context) => DayDetail(day: day)),
    );

    if (result == true) {
      getData();
    }
  }
}

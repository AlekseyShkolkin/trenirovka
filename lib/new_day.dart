// import 'dart:async';

// import 'package:flutter/material.dart';
// import './day_detail.dart';
// import './model_day.dart';
// import './model_day_detail.dart';
// import './dbhelper_day_detail.dart';
// import 'package:sqflite/sqflite.dart';

// DbHelperDayDetail helperDayDetail = DbHelperDayDetail();

// class NewDay extends StatefulWidget {
//   NewDay({Key key, @required this.day});
//   final Day day;
//   @override
//   State<StatefulWidget> createState() => NewDayState();
// }

// class NewDayState extends State {
//   DbHelperDayDetail helperDayDetail = DbHelperDayDetail();
//   List<DayDetail1> todos;

//   @override
//   Widget build(BuildContext context) {
//     if (todos == null) {
//       todos = <DayDetail1>[];
//       getData();
//     }

//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Theme.of(context).primaryColor,
//         title: Center(
//             child: Text(
//           'ПРОВЕРКА КАЧЕСТВА ИП',
//           style: TextStyle(
//             fontSize: 22,
//             fontWeight: FontWeight.w400,
//           ),
//         )),
//       ),
//       body: objectListItems(),
//       floatingActionButton: FloatingActionButton(
//         backgroundColor: Theme.of(context).primaryColor,
//         heroTag: 'Добавить объект',
//         onPressed: () {
//           navigateToDetailDay(DayDetail1('', ''));
//         },
//         tooltip: 'Добавляет объект',
//         child: Icon(
//           Icons.add,
//           size: 35.0,
//           color: Colors.white,
//         ),
//       ),
//       floatingActionButtonLocation: FloatingActionButtonLocation.miniEndFloat,
//     );
//   }

//   ListView objectListItems() {
//     return ListView.builder(
//         padding: const EdgeInsets.only(top: 8.0),
//         itemCount: todos.length,
//         itemBuilder: (BuildContext context, int position) {
//           return Container(
//             padding: const EdgeInsets.only(bottom: 2.0),
//             decoration: const BoxDecoration(
//               boxShadow: [
//                 BoxShadow(
//                     color: Color.fromARGB(255, 235, 235, 243),
//                     blurRadius: 10.0,
//                     spreadRadius: -9.0,
//                     offset: Offset(0.0, 7.0)),
//               ],
//             ),
//             child: Dismissible(
//               direction: DismissDirection.endToStart,
//               background: Container(
//                   alignment: Alignment.centerRight,
//                   padding: const EdgeInsets.only(right: 24.0),
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(10.0),
//                     color: Color.fromRGBO(187, 30, 16, 1.0),
//                   ),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: const <Widget>[
//                       Icon(
//                         Icons.delete_sweep,
//                         color: Colors.white,
//                         size: 44,
//                       ),
//                       Text(
//                         'УДАЛИТЬ?',
//                         style: TextStyle(
//                             color: Colors.white, fontWeight: FontWeight.w400),
//                       )
//                     ],
//                   )),
//               key: Key(todos[position].id.toString()),
//               onDismissed: (DismissDirection direction) {
//                 final int id = todos[position].id;
//                 final String title = todos[position].title.toString();
//                 setState(() {
//                   todos.removeAt(position);
//                   helperDayDetail.deleteDayDetail(id);
//                   getData();
//                 });
//                 ScaffoldMessenger.of(context).showSnackBar(
//                   SnackBar(
//                     content: Text('$title - УДАЛЕНО'),
//                   ),
//                 );
//               },
//               child: Card(
//                   shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(10.0)),
//                   elevation: 0.0,
//                   child: ListTile(
//                     leading: Column(
//                       children: <Widget>[
//                         CircleAvatar(
//                           radius: 7.0,
//                           backgroundColor: Colors.white,
//                         ),
//                         const SizedBox(
//                           height: 24.0,
//                         ),
//                       ],
//                     ),
//                     title: Padding(
//                       padding: const EdgeInsets.only(bottom: 8.0),
//                       child: Text(
//                         todos[position].title ?? '' '',
//                         style: const TextStyle(
//                             fontSize: 15.0, fontWeight: FontWeight.w800),
//                       ),
//                     ),
//                     subtitle: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: <Widget>[
//                         Text(
//                           descriptionParser(todos[position].name ?? ''),
//                           style: const TextStyle(
//                               fontSize: 13.0,
//                               fontWeight: FontWeight.w600,
//                               color: Colors.black38),
//                         ),
//                         const SizedBox(
//                           height: 15.0,
//                         ),
//                         todos[position].name != null
//                             ? Text(
//                                 'Дата обследования ' + todos[position].name,
//                                 style: const TextStyle(
//                                     fontSize: 11.0,
//                                     fontWeight: FontWeight.w600,
//                                     color: Colors.black38),
//                               )
//                             : Text(
//                                 'СОЗДАНО / без даты',
//                                 style: const TextStyle(
//                                     fontSize: 11.0,
//                                     fontWeight: FontWeight.w600,
//                                     color: Colors.black38),
//                               ),
//                       ],
//                     ),
//                     contentPadding:
//                         const EdgeInsets.fromLTRB(5.0, 10.0, 5.0, 10),
//                     isThreeLine: true,
//                     onTap: () {
//                       debugPrint('Tapped on ' + todos[position].id.toString());
//                       navigateToDetailDay(todos[position]);
//                     },
//                   )),
//             ),
//           );
//         });
//   }

//   String descriptionParser(String desc) {
//     if (desc.isNotEmpty) {
//       return desc.length > 42 ? desc.substring(0, 42) + '...' : desc;
//     }
//     return '...';
//   }

//   void getData() {
//     final Future<Database> dbFuture = helperDayDetail.initializeDb();
//     dbFuture.then((Database result) {
//       final Future<List> todosFuture = helperDayDetail.getDaysDetail();
//       todosFuture?.then((List result) {
//         final List<DayDetail1> todoList = <DayDetail1>[];
//         for (int i = 0; i < (result?.length ?? 0); i++) {
//           todoList.add(DayDetail1.fromDayDetail(result[i]));
//           debugPrint(todoList[i].title);
//         }
//         setState(() {
//           todos = todoList;
//         });
//         debugPrint('Items: ' + todos.length.toString());
//         var lenlistip = todos.length.toString();
//       });
//     });
//   }

//   Future<void> navigateToDetailDay(DayDetail1 dayDetail) async {
//     final bool result = await Navigator.push(
//       context,
//       MaterialPageRoute(
//           builder: (BuildContext context) => DayDetail(dayDetail: dayDetail)),
//     );

//     if (result == true) {
//       getData();
//     }
//   }
//   // Navigator.pop
// }

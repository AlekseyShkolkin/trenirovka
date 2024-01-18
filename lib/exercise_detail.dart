import 'package:flutter/material.dart';
import 'package:tren/dbhelper_day.dart';
import 'package:tren/model_day.dart';

class ExerciseForm extends StatefulWidget {
  final Day day;

  const ExerciseForm({Key key, this.day}) : super(key: key);
  @override
  _ExerciseFormState createState() => _ExerciseFormState();
}

class _ExerciseFormState extends State<ExerciseForm> {
  DbHelperDay helperD = DbHelperDay();
  List<Day> todos;
  Day day;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _titleController = TextEditingController();

  DateTime dateObsl1; // Дата выбранная для dateObsl1
  DateTime dateObsl2; // Дата выбранная для dateObsl2

  bool isEdit;

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

  TextEditingController titleController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController weightController = TextEditingController();

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
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Form(
        key: _formKey,
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
                  fontWeight: FontWeight.w300,
                ),
              ),
            ),
            SizedBox(height: 20),
            TextFormField(
              maxLength: 20,
              onFieldSubmitted: (String value) {
                // Handle form submission
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
              controller: _titleController,
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.w300),
              decoration: InputDecoration(
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
                prefixIcon: Icon(Icons.account_balance_outlined,
                    color: Theme.of(context).primaryColor),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

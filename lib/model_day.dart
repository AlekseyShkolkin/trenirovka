import 'dart:ffi';
import 'dart:io';

import 'package:flutter/foundation.dart';

class Day {
  int _id;
  String _dateTren;
  String _titleday;
  String _name;
  String _weightTotal;
  String _weight1;
  String _weight2;
  String _weight3;
  String _weight4;
  String _weight5;
  String _weight6;
  String _weight7;
  String _weight8;
  String _weight9;
  String _weight10;
  String _weight11;
  String _weight12;
  String _weight13;
  String _weight14;
  String _weight15;
  String _weight16;
  String _weight17;
  String _weight18;
  String _weight19;
  String _weight20;
  String _todoDate;
  String _nameExercise1;
  String _nameExercise2;
  String _nameExercise3;
  String _nameExercise4;
  String _nameExercise5;
  String _nameExercise6;
  String _nameExercise7;
  String _nameExercise8;
  String _nameExercise9;
  String _nameExercise10;
  String _nameExercise11;
  String _nameExercise12;
  String _nameExercise13;
  String _nameExercise14;
  String _nameExercise15;
  String _nameExercise16;
  String _nameExercise17;
  String _nameExercise18;
  String _nameExercise19;
  String _nameExercise20;
  String _numbAppr1;
  String _numbAppr2;
  String _numbAppr3;
  String _numbAppr4;
  String _numbAppr5;
  String _numbAppr6;
  String _numbAppr7;
  String _numbAppr8;
  String _numbAppr9;
  String _numbAppr10;
  String _numbAppr11;
  String _numbAppr12;
  String _numbAppr13;
  String _numbAppr14;
  String _numbAppr15;
  String _numbAppr16;
  String _numbAppr17;
  String _numbAppr18;
  String _numbAppr19;
  String _numbAppr20;
  String _numbRepit1;
  String _numbRepit2;
  String _numbRepit3;
  String _numbRepit4;
  String _numbRepit5;
  String _numbRepit6;
  String _numbRepit7;
  String _numbRepit8;
  String _numbRepit9;
  String _numbRepit10;
  String _numbRepit11;
  String _numbRepit12;
  String _numbRepit13;
  String _numbRepit14;
  String _numbRepit15;
  String _numbRepit16;
  String _numbRepit17;
  String _numbRepit18;
  String _numbRepit19;
  String _numbRepit20;

  Day(
    this._titleday,
    this._todoDate, [
    this._dateTren,
    this._name,
    this._weightTotal,
    this._nameExercise1,
    this._nameExercise2,
    this._nameExercise3,
    this._nameExercise4,
    this._nameExercise5,
    this._nameExercise6,
    this._nameExercise7,
    this._nameExercise8,
    this._nameExercise9,
    this._nameExercise10,
    this._nameExercise11,
    this._nameExercise12,
    this._nameExercise13,
    this._nameExercise14,
    this._nameExercise15,
    this._nameExercise16,
    this._nameExercise17,
    this._nameExercise18,
    this._nameExercise19,
    this._nameExercise20,
    this._weight1,
    this._weight2,
    this._weight3,
    this._weight4,
    this._weight5,
    this._weight6,
    this._weight7,
    this._weight8,
    this._weight9,
    this._weight10,
    this._weight11,
    this._weight12,
    this._weight13,
    this._weight14,
    this._weight15,
    this._weight16,
    this._weight17,
    this._weight18,
    this._weight19,
    this._weight20,
    this._numbAppr1,
    this._numbAppr2,
    this._numbAppr3,
    this._numbAppr4,
    this._numbAppr5,
    this._numbAppr6,
    this._numbAppr7,
    this._numbAppr8,
    this._numbAppr9,
    this._numbAppr10,
    this._numbAppr11,
    this._numbAppr12,
    this._numbAppr13,
    this._numbAppr14,
    this._numbAppr15,
    this._numbAppr16,
    this._numbAppr17,
    this._numbAppr18,
    this._numbAppr19,
    this._numbAppr20,
    this._numbRepit1,
    this._numbRepit2,
    this._numbRepit3,
    this._numbRepit4,
    this._numbRepit5,
    this._numbRepit6,
    this._numbRepit7,
    this._numbRepit8,
    this._numbRepit9,
    this._numbRepit10,
    this._numbRepit11,
    this._numbRepit12,
    this._numbRepit13,
    this._numbRepit14,
    this._numbRepit15,
    this._numbRepit16,
    this._numbRepit17,
    this._numbRepit18,
    this._numbRepit19,
    this._numbRepit20,
  ]);

  Day.withId(
    this._id,
    this._titleday,
    this._todoDate, [
    this._dateTren,
    this._name,
    this._weightTotal,
    this._nameExercise1,
    this._nameExercise2,
    this._nameExercise3,
    this._nameExercise4,
    this._nameExercise5,
    this._nameExercise6,
    this._nameExercise7,
    this._nameExercise8,
    this._nameExercise9,
    this._nameExercise10,
    this._nameExercise11,
    this._nameExercise12,
    this._nameExercise13,
    this._nameExercise14,
    this._nameExercise15,
    this._nameExercise16,
    this._nameExercise17,
    this._nameExercise18,
    this._nameExercise19,
    this._nameExercise20,
    this._weight1,
    this._weight2,
    this._weight3,
    this._weight4,
    this._weight5,
    this._weight6,
    this._weight7,
    this._weight8,
    this._weight9,
    this._weight10,
    this._weight11,
    this._weight12,
    this._weight13,
    this._weight14,
    this._weight15,
    this._weight16,
    this._weight17,
    this._weight18,
    this._weight19,
    this._weight20,
    this._numbAppr1,
    this._numbAppr2,
    this._numbAppr3,
    this._numbAppr4,
    this._numbAppr5,
    this._numbAppr6,
    this._numbAppr7,
    this._numbAppr8,
    this._numbAppr9,
    this._numbAppr10,
    this._numbAppr11,
    this._numbAppr12,
    this._numbAppr13,
    this._numbAppr14,
    this._numbAppr15,
    this._numbAppr16,
    this._numbAppr17,
    this._numbAppr18,
    this._numbAppr19,
    this._numbAppr20,
    this._numbRepit1,
    this._numbRepit2,
    this._numbRepit3,
    this._numbRepit4,
    this._numbRepit5,
    this._numbRepit6,
    this._numbRepit7,
    this._numbRepit8,
    this._numbRepit9,
    this._numbRepit10,
    this._numbRepit11,
    this._numbRepit12,
    this._numbRepit13,
    this._numbRepit14,
    this._numbRepit15,
    this._numbRepit16,
    this._numbRepit17,
    this._numbRepit18,
    this._numbRepit19,
    this._numbRepit20,
  ]);

  int get id => _id;
  String get titleday => _titleday;
  String get name => _name;
  String get todoDate => _todoDate;
  String get dateTren => _dateTren;
  String get weightTotal => _weightTotal;

  String get nameExercise1 => _nameExercise1;
  String get nameExercise2 => _nameExercise2;
  String get nameExercise3 => _nameExercise3;
  String get nameExercise4 => _nameExercise4;
  String get nameExercise5 => _nameExercise5;
  String get nameExercise6 => _nameExercise6;
  String get nameExercise7 => _nameExercise7;
  String get nameExercise8 => _nameExercise8;
  String get nameExercise9 => _nameExercise9;
  String get nameExercise10 => _nameExercise10;
  String get nameExercise11 => _nameExercise11;
  String get nameExercise12 => _nameExercise12;
  String get nameExercise13 => _nameExercise13;
  String get nameExercise14 => _nameExercise14;
  String get nameExercise15 => _nameExercise15;
  String get nameExercise16 => _nameExercise16;
  String get nameExercise17 => _nameExercise17;
  String get nameExercise18 => _nameExercise18;
  String get nameExercise19 => _nameExercise19;
  String get nameExercise20 => _nameExercise20;

  String get weight1 => _weight1;
  String get weight2 => _weight2;
  String get weight3 => _weight3;
  String get weight4 => _weight4;
  String get weight5 => _weight5;
  String get weight6 => _weight6;
  String get weight7 => _weight7;
  String get weight8 => _weight8;
  String get weight9 => _weight9;
  String get weight10 => _weight10;
  String get weight11 => _weight11;
  String get weight12 => _weight12;
  String get weight13 => _weight13;
  String get weight14 => _weight14;
  String get weight15 => _weight15;
  String get weight16 => _weight16;
  String get weight17 => _weight17;
  String get weight18 => _weight18;
  String get weight19 => _weight19;
  String get weight20 => _weight20;

  String get numbAppr1 => _numbAppr1;
  String get numbAppr2 => _numbAppr2;
  String get numbAppr3 => _numbAppr3;
  String get numbAppr4 => _numbAppr4;
  String get numbAppr5 => _numbAppr5;
  String get numbAppr6 => _numbAppr6;
  String get numbAppr7 => _numbAppr7;
  String get numbAppr8 => _numbAppr8;
  String get numbAppr9 => _numbAppr9;
  String get numbAppr10 => _numbAppr10;
  String get numbAppr11 => _numbAppr11;
  String get numbAppr12 => _numbAppr12;
  String get numbAppr13 => _numbAppr13;
  String get numbAppr14 => _numbAppr14;
  String get numbAppr15 => _numbAppr15;
  String get numbAppr16 => _numbAppr16;
  String get numbAppr17 => _numbAppr17;
  String get numbAppr18 => _numbAppr18;
  String get numbAppr19 => _numbAppr19;
  String get numbAppr20 => _numbAppr20;

  String get numbRepit1 => _numbRepit1;
  String get numbRepit2 => _numbRepit2;
  String get numbRepit3 => _numbRepit3;
  String get numbRepit4 => _numbRepit4;
  String get numbRepit5 => _numbRepit5;
  String get numbRepit6 => _numbRepit6;
  String get numbRepit7 => _numbRepit7;
  String get numbRepit8 => _numbRepit8;
  String get numbRepit9 => _numbRepit9;
  String get numbRepit10 => _numbRepit10;
  String get numbRepit11 => _numbRepit11;
  String get numbRepit12 => _numbRepit12;
  String get numbRepit13 => _numbRepit13;
  String get numbRepit14 => _numbRepit14;
  String get numbRepit15 => _numbRepit15;
  String get numbRepit16 => _numbRepit16;
  String get numbRepit17 => _numbRepit17;
  String get numbRepit18 => _numbRepit18;
  String get numbRepit19 => _numbRepit19;
  String get numbRepit20 => _numbRepit20;

  set dateTren(String newdateTren) {
    if ((newdateTren?.length ?? 0) <= 255) {
      _dateTren = newdateTren;
    }
  }

  set weightTotal(String newweightTotal) {
    if ((newweightTotal?.length ?? 0) <= 255) {
      _weightTotal = newweightTotal;
    }
  }

  set weight1(String newweight1) {
    if ((newweight1?.length ?? 0) <= 255) {
      _weight1 = newweight1;
    }
  }

  set weight2(String newweight2) {
    if ((newweight2?.length ?? 0) <= 255) {
      _weight2 = newweight2;
    }
  }

  set weight3(String newweight3) {
    if ((newweight3?.length ?? 0) <= 255) {
      _weight3 = newweight3;
    }
  }

  set weight4(String newweight4) {
    if ((newweight4?.length ?? 0) <= 255) {
      _weight4 = newweight4;
    }
  }

  set weight5(String newweight5) {
    if ((newweight5?.length ?? 0) <= 255) {
      _weight5 = newweight5;
    }
  }

  set weight6(String newweight6) {
    if ((newweight6?.length ?? 0) <= 255) {
      _weight6 = newweight6;
    }
  }

  set weight7(String newweight7) {
    if ((newweight7?.length ?? 0) <= 255) {
      _weight7 = newweight7;
    }
  }

  set weight8(String newweight8) {
    if ((newweight8?.length ?? 0) <= 255) {
      _weight8 = newweight8;
    }
  }

  set weight9(String newweight9) {
    if ((newweight9?.length ?? 0) <= 255) {
      _weight9 = newweight9;
    }
  }

  set weight10(String newweight10) {
    if ((newweight10?.length ?? 0) <= 255) {
      _weight10 = newweight10;
    }
  }

  set weight11(String newweight11) {
    if ((newweight11?.length ?? 0) <= 255) {
      _weight11 = newweight11;
    }
  }

  set weight12(String newweight12) {
    if ((newweight12?.length ?? 0) <= 255) {
      _weight12 = newweight12;
    }
  }

  set weight13(String newweight13) {
    if ((newweight13?.length ?? 0) <= 255) {
      _weight13 = newweight13;
    }
  }

  set weight14(String newweight14) {
    if ((newweight14?.length ?? 0) <= 255) {
      _weight14 = newweight14;
    }
  }

  set weight15(String newweight15) {
    if ((newweight15?.length ?? 0) <= 255) {
      _weight15 = newweight15;
    }
  }

  set weight16(String newweight16) {
    if ((newweight16?.length ?? 0) <= 255) {
      _weight16 = newweight16;
    }
  }

  set weight17(String newweight17) {
    if ((newweight17?.length ?? 0) <= 255) {
      _weight17 = newweight17;
    }
  }

  set weight18(String newweight18) {
    if ((newweight18?.length ?? 0) <= 255) {
      _weight18 = newweight18;
    }
  }

  set weight19(String newweight19) {
    if ((newweight19?.length ?? 0) <= 255) {
      _weight19 = newweight19;
    }
  }

  set weight20(String newweight20) {
    if ((newweight20?.length ?? 0) <= 255) {
      _weight20 = newweight20;
    }
  }

  set nameExercise1(String newnameExercise1) {
    if ((newnameExercise1?.length ?? 0) <= 255) {
      _nameExercise1 = newnameExercise1;
    }
  }

  set nameExercise2(String newnameExercise2) {
    if ((newnameExercise2?.length ?? 0) <= 255) {
      _nameExercise2 = newnameExercise2;
    }
  }

  set nameExercise3(String newnameExercise3) {
    if ((newnameExercise3?.length ?? 0) <= 255) {
      _nameExercise3 = newnameExercise3;
    }
  }

  set nameExercise4(String newnameExercise4) {
    if ((newnameExercise4?.length ?? 0) <= 255) {
      _nameExercise4 = newnameExercise4;
    }
  }

  set nameExercise5(String newnameExercise5) {
    if ((newnameExercise5?.length ?? 0) <= 255) {
      _nameExercise5 = newnameExercise5;
    }
  }

  set nameExercise6(String newnameExercise6) {
    if ((newnameExercise6?.length ?? 0) <= 255) {
      _nameExercise6 = newnameExercise6;
    }
  }

  set nameExercise7(String newnameExercise7) {
    if ((newnameExercise7?.length ?? 0) <= 255) {
      _nameExercise7 = newnameExercise7;
    }
  }

  set nameExercise8(String newnameExercise8) {
    if ((newnameExercise8?.length ?? 0) <= 255) {
      _nameExercise8 = newnameExercise8;
    }
  }

  set nameExercise9(String newnameExercise9) {
    if ((newnameExercise9?.length ?? 0) <= 255) {
      _nameExercise9 = newnameExercise9;
    }
  }

  set nameExercise10(String newnameExercise10) {
    if ((newnameExercise10?.length ?? 0) <= 255) {
      _nameExercise10 = newnameExercise10;
    }
  }

  set nameExercise11(String newnameExercise11) {
    if ((newnameExercise11?.length ?? 0) <= 255) {
      _nameExercise11 = newnameExercise11;
    }
  }

  set nameExercise12(String newnameExercise12) {
    if ((newnameExercise12?.length ?? 0) <= 255) {
      _nameExercise12 = newnameExercise12;
    }
  }

  set nameExercise13(String newnameExercise13) {
    if ((newnameExercise13?.length ?? 0) <= 255) {
      _nameExercise13 = newnameExercise13;
    }
  }

  set nameExercise14(String newnameExercise14) {
    if ((newnameExercise14?.length ?? 0) <= 255) {
      _nameExercise14 = newnameExercise14;
    }
  }

  set nameExercise15(String newnameExercise15) {
    if ((newnameExercise15?.length ?? 0) <= 255) {
      _nameExercise15 = newnameExercise15;
    }
  }

  set nameExercise16(String newnameExercise16) {
    if ((newnameExercise16?.length ?? 0) <= 255) {
      _nameExercise16 = newnameExercise16;
    }
  }

  set nameExercise17(String newnameExercise17) {
    if ((newnameExercise17?.length ?? 0) <= 255) {
      _nameExercise17 = newnameExercise17;
    }
  }

  set nameExercise18(String newnameExercise18) {
    if ((newnameExercise18?.length ?? 0) <= 255) {
      _nameExercise18 = newnameExercise18;
    }
  }

  set nameExercise19(String newnameExercise19) {
    if ((newnameExercise19?.length ?? 0) <= 255) {
      _nameExercise19 = newnameExercise19;
    }
  }

  set nameExercise20(String newnameExercise20) {
    if ((newnameExercise20?.length ?? 0) <= 255) {
      _nameExercise20 = newnameExercise20;
    }
  }

  set numbAppr1(String newnumbAppr1) {
    if ((newnumbAppr1?.length ?? 0) <= 255) {
      _numbAppr1 = newnumbAppr1;
    }
  }

  set numbAppr2(String newnumbAppr2) {
    if ((newnumbAppr2?.length ?? 0) <= 255) {
      _numbAppr2 = newnumbAppr2;
    }
  }

  set numbAppr3(String newnumbAppr3) {
    if ((newnumbAppr3?.length ?? 0) <= 255) {
      _numbAppr3 = newnumbAppr3;
    }
  }

  set numbAppr4(String newnumbAppr4) {
    if ((newnumbAppr4?.length ?? 0) <= 255) {
      _numbAppr4 = newnumbAppr4;
    }
  }

  set numbAppr5(String newnumbAppr5) {
    if ((newnumbAppr5?.length ?? 0) <= 255) {
      _numbAppr5 = newnumbAppr5;
    }
  }

  set numbAppr6(String newnumbAppr6) {
    if ((newnumbAppr6?.length ?? 0) <= 255) {
      _numbAppr6 = newnumbAppr6;
    }
  }

  set numbAppr7(String newnumbAppr7) {
    if ((newnumbAppr7?.length ?? 0) <= 255) {
      _numbAppr7 = newnumbAppr7;
    }
  }

  set numbAppr8(String newnumbAppr8) {
    if ((newnumbAppr8?.length ?? 0) <= 255) {
      _numbAppr8 = newnumbAppr8;
    }
  }

  set numbAppr9(String newnumbAppr9) {
    if ((newnumbAppr9?.length ?? 0) <= 255) {
      _numbAppr9 = newnumbAppr9;
    }
  }

  set numbAppr10(String newnumbAppr10) {
    if ((newnumbAppr10?.length ?? 0) <= 255) {
      _numbAppr10 = newnumbAppr10;
    }
  }

  set numbAppr11(String newnumbAppr11) {
    if ((newnumbAppr11?.length ?? 0) <= 255) {
      _numbAppr11 = newnumbAppr11;
    }
  }

  set numbAppr12(String newnumbAppr12) {
    if ((newnumbAppr12?.length ?? 0) <= 255) {
      _numbAppr12 = newnumbAppr12;
    }
  }

  set numbAppr13(String newnumbAppr13) {
    if ((newnumbAppr13?.length ?? 0) <= 255) {
      _numbAppr13 = newnumbAppr13;
    }
  }

  set numbAppr14(String newnumbAppr14) {
    if ((newnumbAppr14?.length ?? 0) <= 255) {
      _numbAppr14 = newnumbAppr14;
    }
  }

  set numbAppr15(String newnumbAppr15) {
    if ((newnumbAppr15?.length ?? 0) <= 255) {
      _numbAppr15 = newnumbAppr15;
    }
  }

  set numbAppr16(String newnumbAppr16) {
    if ((newnumbAppr16?.length ?? 0) <= 255) {
      _numbAppr16 = newnumbAppr16;
    }
  }

  set numbAppr17(String newnumbAppr17) {
    if ((newnumbAppr17?.length ?? 0) <= 255) {
      _numbAppr17 = newnumbAppr17;
    }
  }

  set numbAppr18(String newnumbAppr18) {
    if ((newnumbAppr18?.length ?? 0) <= 255) {
      _numbAppr18 = newnumbAppr18;
    }
  }

  set numbAppr19(String newnumbAppr19) {
    if ((newnumbAppr19?.length ?? 0) <= 255) {
      _numbAppr19 = newnumbAppr19;
    }
  }

  set numbAppr20(String newnumbAppr20) {
    if ((newnumbAppr20?.length ?? 0) <= 255) {
      _numbAppr20 = newnumbAppr20;
    }
  }

  set numbRepit1(String newnumbRepit1) {
    if ((newnumbRepit1?.length ?? 0) <= 255) {
      _numbRepit1 = newnumbRepit1;
    }
  }

  set numbRepit2(String newnumbRepit2) {
    if ((newnumbRepit2?.length ?? 0) <= 255) {
      _numbRepit2 = newnumbRepit2;
    }
  }

  set numbRepit3(String newnumbRepit3) {
    if ((newnumbRepit3?.length ?? 0) <= 255) {
      _numbRepit3 = newnumbRepit3;
    }
  }

  set numbRepit4(String newnumbRepit4) {
    if ((newnumbRepit4?.length ?? 0) <= 255) {
      _numbRepit4 = newnumbRepit4;
    }
  }

  set numbRepit5(String newnumbRepit5) {
    if ((newnumbRepit5?.length ?? 0) <= 255) {
      _numbRepit5 = newnumbRepit5;
    }
  }

  set numbRepit6(String newnumbRepit6) {
    if ((newnumbRepit6?.length ?? 0) <= 255) {
      _numbRepit6 = newnumbRepit6;
    }
  }

  set numbRepit7(String newnumbRepit7) {
    if ((newnumbRepit7?.length ?? 0) <= 255) {
      _numbRepit7 = newnumbRepit7;
    }
  }

  set numbRepit8(String newnumbRepit8) {
    if ((newnumbRepit8?.length ?? 0) <= 255) {
      _numbRepit8 = newnumbRepit8;
    }
  }

  set numbRepit9(String newnumbRepit9) {
    if ((newnumbRepit9?.length ?? 0) <= 255) {
      _numbRepit9 = newnumbRepit9;
    }
  }

  set numbRepit10(String newnumbRepit10) {
    if ((newnumbRepit10?.length ?? 0) <= 255) {
      _numbRepit10 = newnumbRepit10;
    }
  }

  set numbRepit11(String newnumbRepit11) {
    if ((newnumbRepit11?.length ?? 0) <= 255) {
      _numbRepit11 = newnumbRepit11;
    }
  }

  set numbRepit12(String newnumbRepit12) {
    if ((newnumbRepit12?.length ?? 0) <= 255) {
      _numbRepit12 = newnumbRepit12;
    }
  }

  set numbRepit13(String newnumbRepit13) {
    if ((newnumbRepit13?.length ?? 0) <= 255) {
      _numbRepit13 = newnumbRepit13;
    }
  }

  set numbRepit14(String newnumbRepit14) {
    if ((newnumbRepit14?.length ?? 0) <= 255) {
      _numbRepit14 = newnumbRepit14;
    }
  }

  set numbRepit15(String newnumbRepit15) {
    if ((newnumbRepit15?.length ?? 0) <= 255) {
      _numbRepit15 = newnumbRepit15;
    }
  }

  set numbRepit16(String newnumbRepit16) {
    if ((newnumbRepit16?.length ?? 0) <= 255) {
      _numbRepit16 = newnumbRepit16;
    }
  }

  set numbRepit17(String newnumbRepit17) {
    if ((newnumbRepit17?.length ?? 0) <= 255) {
      _numbRepit17 = newnumbRepit17;
    }
  }

  set numbRepit18(String newnumbRepit18) {
    if ((newnumbRepit18?.length ?? 0) <= 255) {
      _numbRepit18 = newnumbRepit18;
    }
  }

  set numbRepit19(String newnumbRepit19) {
    if ((newnumbRepit19?.length ?? 0) <= 255) {
      _numbRepit19 = newnumbRepit19;
    }
  }

  set numbRepit20(String newnumbRepit20) {
    if ((newnumbRepit20?.length ?? 0) <= 255) {
      _numbRepit20 = newnumbRepit20;
    }
  }

  set titleday(String newTitle) {
    if ((newTitle?.length ?? 0) <= 255) {
      _titleday = newTitle;
    }
  }

  set todoDate(newtodoDate) {
    _todoDate = newtodoDate;
  }

  set name(String newname) {
    if ((newname?.length ?? 0) <= 255) {
      _name = newname;
    }
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> map = <String, dynamic>{};
    map['titleday'] = _titleday;
    map['name'] = _name;
    map['weightTotal'] = _weightTotal;
    map['date'] = _todoDate;
    map['dateTren'] = _dateTren;

    map['nameExercise1'] = _nameExercise1;
    map['nameExercise2'] = _nameExercise2;
    map['nameExercise3'] = _nameExercise3;
    map['nameExercise4'] = _nameExercise4;
    map['nameExercise5'] = _nameExercise5;
    map['nameExercise6'] = _nameExercise6;
    map['nameExercise7'] = _nameExercise7;
    map['nameExercise8'] = _nameExercise8;
    map['nameExercise9'] = _nameExercise9;
    map['nameExercise10'] = _nameExercise10;
    map['nameExercise11'] = _nameExercise11;
    map['nameExercise12'] = _nameExercise12;
    map['nameExercise13'] = _nameExercise13;
    map['nameExercise14'] = _nameExercise14;
    map['nameExercise15'] = _nameExercise15;
    map['nameExercise16'] = _nameExercise16;
    map['nameExercise17'] = _nameExercise17;
    map['nameExercise18'] = _nameExercise18;
    map['nameExercise19'] = _nameExercise19;
    map['nameExercise20'] = _nameExercise20;

    map['weight1'] = _weight1;
    map['weight2'] = _weight2;
    map['weight3'] = _weight3;
    map['weight4'] = _weight4;
    map['weight5'] = _weight5;
    map['weight6'] = _weight6;
    map['weight7'] = _weight7;
    map['weight8'] = _weight8;
    map['weight9'] = _weight9;
    map['weight10'] = _weight10;
    map['weight11'] = _weight11;
    map['weight12'] = _weight12;
    map['weight13'] = _weight13;
    map['weight14'] = _weight14;
    map['weight15'] = _weight15;
    map['weight16'] = _weight16;
    map['weight17'] = _weight17;
    map['weight18'] = _weight18;
    map['weight19'] = _weight19;
    map['weight20'] = _weight20;

    map['numbAppr1'] = _numbAppr1;
    map['numbAppr2'] = _numbAppr2;
    map['numbAppr3'] = _numbAppr3;
    map['numbAppr4'] = _numbAppr4;
    map['numbAppr5'] = _numbAppr5;
    map['numbAppr6'] = _numbAppr6;
    map['numbAppr7'] = _numbAppr7;
    map['numbAppr8'] = _numbAppr8;
    map['numbAppr9'] = _numbAppr9;
    map['numbAppr10'] = _numbAppr10;
    map['numbAppr11'] = _numbAppr11;
    map['numbAppr12'] = _numbAppr12;
    map['numbAppr13'] = _numbAppr13;
    map['numbAppr14'] = _numbAppr14;
    map['numbAppr15'] = _numbAppr15;
    map['numbAppr16'] = _numbAppr16;
    map['numbAppr17'] = _numbAppr17;
    map['numbAppr18'] = _numbAppr18;
    map['numbAppr19'] = _numbAppr19;
    map['numbAppr20'] = _numbAppr20;

    map['numbRepit1'] = _numbRepit1;
    map['numbRepit2'] = _numbRepit2;
    map['numbRepit3'] = _numbRepit3;
    map['numbRepit4'] = _numbRepit4;
    map['numbRepit5'] = _numbRepit5;
    map['numbRepit6'] = _numbRepit6;
    map['numbRepit7'] = _numbRepit7;
    map['numbRepit8'] = _numbRepit8;
    map['numbRepit9'] = _numbRepit9;
    map['numbRepit10'] = _numbRepit10;
    map['numbRepit11'] = _numbRepit11;
    map['numbRepit12'] = _numbRepit12;
    map['numbRepit13'] = _numbRepit13;
    map['numbRepit14'] = _numbRepit14;
    map['numbRepit15'] = _numbRepit15;
    map['numbRepit16'] = _numbRepit16;
    map['numbRepit17'] = _numbRepit17;
    map['numbRepit18'] = _numbRepit18;
    map['numbRepit19'] = _numbRepit19;
    map['numbRepit20'] = _numbRepit20;

    if (_id != null) {
      map['id'] = _id;
    }
    return map;
  }

  Day.fromDay(dynamic o) {
    _id = o['id'];
    _titleday = o['titleday'];
    _todoDate = o['date'];
    _name = o['name'];
    _weightTotal = o['weightTotal'];
    _dateTren = o['dateTren'];

    _nameExercise1 = o['nameExercise1'];
    _nameExercise2 = o['nameExercise2'];
    _nameExercise3 = o['nameExercise3'];
    _nameExercise4 = o['nameExercise4'];
    _nameExercise5 = o['nameExercise5'];
    _nameExercise6 = o['nameExercise6'];
    _nameExercise7 = o['nameExercise7'];
    _nameExercise8 = o['nameExercise8'];
    _nameExercise9 = o['nameExercise9'];
    _nameExercise10 = o['nameExercise10'];
    _nameExercise11 = o['nameExercise11'];
    _nameExercise12 = o['nameExercise12'];
    _nameExercise13 = o['nameExercise13'];
    _nameExercise14 = o['nameExercise14'];
    _nameExercise15 = o['nameExercise15'];
    _nameExercise16 = o['nameExercise16'];
    _nameExercise17 = o['nameExercise17'];
    _nameExercise18 = o['nameExercise18'];
    _nameExercise19 = o['nameExercise19'];
    _nameExercise20 = o['nameExercise20'];

    _weight1 = o['weight1'];
    _weight2 = o['weight2'];
    _weight3 = o['weight3'];
    _weight4 = o['weight4'];
    _weight5 = o['weight5'];
    _weight6 = o['weight6'];
    _weight7 = o['weight7'];
    _weight8 = o['weight8'];
    _weight9 = o['weight9'];
    _weight10 = o['weight10'];
    _weight11 = o['weight11'];
    _weight12 = o['weight12'];
    _weight13 = o['weight13'];
    _weight14 = o['weight14'];
    _weight15 = o['weight15'];
    _weight16 = o['weight16'];
    _weight17 = o['weight17'];
    _weight18 = o['weight18'];
    _weight19 = o['weight19'];
    _weight20 = o['weight20'];

    _numbAppr1 = o['numbAppr1'];
    _numbAppr2 = o['numbAppr2'];
    _numbAppr3 = o['numbAppr3'];
    _numbAppr4 = o['numbAppr4'];
    _numbAppr5 = o['numbAppr5'];
    _numbAppr6 = o['numbAppr6'];
    _numbAppr7 = o['numbAppr7'];
    _numbAppr8 = o['numbAppr8'];
    _numbAppr9 = o['numbAppr9'];
    _numbAppr10 = o['numbAppr10'];
    _numbAppr11 = o['numbAppr11'];
    _numbAppr12 = o['numbAppr12'];
    _numbAppr13 = o['numbAppr13'];
    _numbAppr14 = o['numbAppr14'];
    _numbAppr15 = o['numbAppr15'];
    _numbAppr16 = o['numbAppr16'];
    _numbAppr17 = o['numbAppr17'];
    _numbAppr18 = o['numbAppr18'];
    _numbAppr19 = o['numbAppr19'];
    _numbAppr20 = o['numbAppr20'];

    _numbRepit1 = o['numbRepit1'];
    _numbRepit2 = o['numbRepit2'];
    _numbRepit3 = o['numbRepit3'];
    _numbRepit4 = o['numbRepit4'];
    _numbRepit5 = o['numbRepit5'];
    _numbRepit6 = o['numbRepit6'];
    _numbRepit7 = o['numbRepit7'];
    _numbRepit8 = o['numbRepit8'];
    _numbRepit9 = o['numbRepit9'];
    _numbRepit10 = o['numbRepit10'];
    _numbRepit11 = o['numbRepit11'];
    _numbRepit12 = o['numbRepit12'];
    _numbRepit13 = o['numbRepit13'];
    _numbRepit14 = o['numbRepit14'];
    _numbRepit15 = o['numbRepit15'];
    _numbRepit16 = o['numbRepit16'];
    _numbRepit17 = o['numbRepit17'];
    _numbRepit18 = o['numbRepit18'];
    _numbRepit19 = o['numbRepit19'];
    _numbRepit20 = o['numbRepit20'];
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mobile_test_adji/components/component_alerts.dart';
import 'package:mobile_test_adji/components/component_colors.dart';
import 'package:mobile_test_adji/components/component_fonts.dart';
import 'package:numberpicker/numberpicker.dart';

import 'db/db_list_mutu_ancak.dart';
import 'model/mutu_ancak_model.dart';

class DetailPemanen extends StatefulWidget {
  const DetailPemanen({Key? key}) : super(key: key);

  @override
  _DetailPemanenState createState() => _DetailPemanenState();
}

class _DetailPemanenState extends State<DetailPemanen> {
  List<MutuAncak> mutuAncak = [];
  bool isLoading = false;

  String _value = "Tunggal";
  String selectedBlock = "Block : ";
  String addBaris = "";
  int _currentValue = 12;
  int initValue = 31;

  List<Map<String, dynamic>> listValue = [];
  List<Map<String, dynamic>> listBarisBlock = [];
  List<String> listAddingBarisBlock = [];
  List<String> listSortedBarisBlock = [];
  List<Map<String, dynamic>> listMutuAncak = [];

  List<Map<String, dynamic>> listPanenBlock = [
    {
      "panen": [
        {
          "title": "A21",
        },
        {
          "title": "A22",
        },
        {
          "title": "A23",
        },
        {
          "title": "A24",
        },
        {
          "title": "A25",
        },
        {
          "title": "A26",
        },
      ]
    }
  ];

  @override
  void initState() {
    refreshNotes();
  }

  @override
  Widget build(BuildContext context) {
    return _scaffold();
  }

  Widget _scaffold() => Scaffold(
        backgroundColor: Colors.white,
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: Color(0xFF348721),
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () {
              ComponentAlerts.showFlushbarFailed(
                  context, "Fitur sedang tahap pengembangan!");
            },
          ),
          title: Align(
            alignment: Alignment.centerLeft,
            child: Text("Detail Pemanen"),
          ),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(24.0, 20.0, 24.0, 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 32.0),
                child: mutuAncak.isEmpty
                    ? Row(
                        children: [
                          SizedBox(
                              height: 65,
                              width: 65,
                              child: Image.asset('assets/images/picture.png')),
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Sulaiman Johan",
                                  style: ComponentFonts.fontBold18B,
                                ),
                                Text(
                                  "293019293",
                                  style: ComponentFonts.fontNormal14Grey2,
                                ),
                              ],
                            ),
                          )
                        ],
                      )
                    : Center(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(bottom: 8.0),
                                child: SizedBox(
                                    height: 80,
                                    width: 80,
                                    child: Image.asset(
                                        'assets/images/picture.png')),
                              ),
                              Text(
                                "Sulaiman Johan",
                                style: ComponentFonts.fontBold18B,
                              ),
                              Text(
                                "293019293",
                                style: ComponentFonts.fontNormal14Grey2,
                              ),
                            ],
                          ),
                        ),
                      ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 28.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Panen Tanggal",
                            style: ComponentFonts.fontBold12B,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(right: 8.0),
                                  child: SizedBox(
                                    height: 16,
                                    width: 16,
                                    child: Image.asset(
                                      'assets/icons/icon_calender.png',
                                    ),
                                  ),
                                ),
                                Text(
                                  "10 Agustus 2021",
                                  style: ComponentFonts.fontMedium12B,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Hasil Panen",
                            style: ComponentFonts.fontBold12B,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Text(
                              "2.31 Ha 5.800 Kg 784 Jjg",
                              style: ComponentFonts.fontMedium12B,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 44.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Text(
                        "Block Panen Kemarin",
                        style: ComponentFonts.fontBold12B,
                      ),
                    ),
                    Container(
                      height: 32.0,
                      child: ScrollConfiguration(
                        behavior: MyBehavior(),
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: List.generate(
                              listPanenBlock[0]["panen"].length, (index) {
                            print(index);
                            return Padding(
                              padding: const EdgeInsets.only(right: 4.0),
                              child: Container(
                                width: 48,
                                padding: const EdgeInsets.all(7.0),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(
                                    color: ComponentColors.bodyColorGreen,
                                    style: BorderStyle.solid,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(100.0),
                                  ),
                                ),
                                child: Text(
                                  listPanenBlock[0]["panen"][index]["title"]
                                      .toString(),
                                  style: ComponentFonts.fontMedium12Green,
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            );
                          }),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                height: 1,
                width: MediaQuery.of(context).size.width,
                color: Colors.grey.withOpacity(0.5),
              ),
              Expanded(
                  child: isLoading
                      ? Center(child: CircularProgressIndicator())
                      : mutuAncak.isEmpty
                          ? listMutuAncak.isEmpty
                              ? Image.asset('assets/images/not_found_image.png')
                              : buildFromList()
                          : buildFromSqflite())
            ],
          ),
        ),
        floatingActionButton: Padding(
          padding: const EdgeInsets.only(bottom: 44, right: 21),
          child: SizedBox(
            width: 65,
            height: 65,
            child: FloatingActionButton(
              backgroundColor: Color(0xFF348721),
              onPressed: () {
                selectBlock1();
                // print(sortNumString('9, 12, 14, 11, 2, 10'));
              },
              tooltip: 'Increment',
              child: Icon(Icons.add),
            ),
          ),
        ),
      );

  void selectBlock1() async {
    listValue.clear();
    listBarisBlock.clear();
    listAddingBarisBlock.clear();
    listSortedBarisBlock.clear();
    addBaris = "";

    // print(_value);
    // print(selectedBlock);
    // print(_currentValue);
    // print(initValue);
    // print(listValue);
    // print(listBarisBlock);
    // print(listAddingBarisBlock);
    // print(listSortedBarisBlock);
    // print(listMutuAncak);
    for (var i = 1; i <= initValue; i++) {
      listValue.add({"index": i.toString(), "selected": false});
    }

    Widget content =
        StatefulBuilder(builder: (BuildContext context, StateSetter setState) {
      return Padding(
        padding: const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 32.0),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 4.0),
                        child: Text(
                          'Pilih Block',
                          style: ComponentFonts.fontBold18B,
                        ),
                      ),
                    ),
                    InkWell(
                        borderRadius: BorderRadius.circular(5.0),
                        splashColor: Colors.white.withOpacity(0.2),
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Icon(Icons.close,
                            size: 30, color: Colors.grey.withOpacity(0.7)))
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 32.0),
                child: Text(
                  'Langkah 1 dari 2',
                  style: ComponentFonts.fontMedium12Green,
                ),
              ),
              Column(
                children: List.generate(
                  listPanenBlock[0]["panen"].length,
                  (index) => Center(
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.grey.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(4.0),
                        ),
                        height: 56,
                        width: MediaQuery.of(context).size.width,
                        child: Material(
                          color: Colors.transparent,
                          child: InkWell(
                            borderRadius: BorderRadius.circular(4.0),
                            splashColor: Colors.white.withOpacity(0.2),
                            onTap: () async {
                              setState(() {
                                print('ini index $index ');
                                Navigator.pop(context);
                                selectBlock2();

                                print(listPanenBlock[0]["panen"][index]["title"]
                                    .toString());
                                selectedBlock =
                                    "Block : ${listPanenBlock[0]["panen"][index]["title"].toString()}";
                              });
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 16.0, right: 21.0),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                        "Block : " +
                                            listPanenBlock[0]["panen"][index]
                                                    ["title"]
                                                .toString(),
                                        style: ComponentFonts.fontBold14B,
                                      ),
                                    ),
                                    Container(
                                      child: Icon(
                                        Icons.keyboard_arrow_right_outlined,
                                        color: Colors.grey.withOpacity(0.8),
                                        size: 35,
                                      ),
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
                ),
              ),
            ]),
      );
    });

    return showModalBottomSheet(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15), topRight: Radius.circular(15)),
        ),
        context: context,
        isScrollControlled: true,
        backgroundColor: Colors.white,
        builder: (context) => DraggableScrollableSheet(
            initialChildSize: 0.7,
            expand: false,
            builder: (context, scrollController) {
              return SingleChildScrollView(
                controller: scrollController,
                physics: ScrollPhysics(),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Center(
                        child: Container(
                          margin:
                              const EdgeInsets.only(top: 24.0, bottom: 12.0),
                          decoration: BoxDecoration(
                            color: ComponentColors.bodyColorGrey,
                            borderRadius: BorderRadius.all(
                              Radius.circular(100.0),
                            ),
                          ),
                          width: 84,
                          height: 8,
                        ),
                      ),
                      content,
                    ]),
              );
            }));
  }

  void selectBlock2() async {
    Widget content =
        StatefulBuilder(builder: (BuildContext context, StateSetter setState) {
      return Padding(
        padding: const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 32.0),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 4.0),
                        child: Text('Pilih Block',
                            style: ComponentFonts.fontBold18B),
                      ),
                    ),
                    InkWell(
                        borderRadius: BorderRadius.circular(5.0),
                        splashColor: Colors.white.withOpacity(0.2),
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Icon(Icons.close,
                            size: 30, color: Colors.grey.withOpacity(0.7)))
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 32.0),
                child: Text(
                  'Langkah 2 dari 2',
                  style: ComponentFonts.fontMedium12Green,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Text(
                  "Model Pemeriksaan",
                  style: ComponentFonts.fontBold12B,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                      color: Colors.green,
                      style: BorderStyle.solid,
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(5.0),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Expanded(
                        child: GestureDetector(
                          onTap: () => setState(() => _value = "Tunggal"),
                          child: Container(
                            alignment: Alignment.center,
                            height: 48,
                            width: 164,
                            color: _value == "Tunggal"
                                ? ComponentColors.textColorGreen
                                : ComponentColors.textColorWhite,
                            child: Text(
                              "Tunggal",
                              style: TextStyle(
                                  color: _value == "Tunggal"
                                      ? ComponentColors.textColorWhite
                                      : ComponentColors.textColorGreen,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: () => setState(() => _value = "Kanan Kiri"),
                          child: Container(
                            alignment: Alignment.center,
                            height: 48,
                            width: 164,
                            color: _value == "Kanan Kiri"
                                ? ComponentColors.textColorGreen
                                : ComponentColors.textColorWhite,
                            child: Text(
                              "Kanan Kiri",
                              style: TextStyle(
                                color: _value == "Kanan Kiri"
                                    ? ComponentColors.textColorWhite
                                    : ComponentColors.textColorGreen,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Text("Nomor Baris", style: ComponentFonts.fontBold12B),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Stack(
                  alignment: AlignmentDirectional.center,
                  children: [
                    Container(
                      height: 100,
                      color: Color(0xFFE5F9D3),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12.0),
                      child: Container(
                        height: 58.0,
                        child: ScrollConfiguration(
                          behavior: MyBehavior(),
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: List.generate(listValue.length, (index) {
                              return Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 5.0),
                                child: Container(
                                  width: 58,
                                  padding: const EdgeInsets.all(7.0),
                                  decoration: BoxDecoration(
                                    color: Colors.transparent,
                                    border: Border.all(
                                      color:
                                          listValue[index]["selected"] == true
                                              ? Colors.green
                                              : Colors.transparent,
                                      style: BorderStyle.solid,
                                      width: 2.0,
                                    ),
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(4.0),
                                    ),
                                  ),
                                  child: GestureDetector(
                                    onTap: () async {
                                      setState(() {
                                        if (listValue[index]["selected"] ==
                                            true) {
                                          setState(() {
                                            print('masuk true');
                                            listValue[index]["selected"] =
                                                false;
                                            // listBarisBlock.removeWhere((item) { print('lol'); print(item); return item['barisBlock'] == "Baris ${index+1}";});
                                            listBarisBlock.removeWhere((item) {
                                              print('lol');
                                              print(item);
                                              return item['barisBlock'] ==
                                                  "${index + 1}";
                                            });

                                            print(listBarisBlock);
                                          });
                                        } else if (listValue[index]
                                                ["selected"] ==
                                            false) {
                                          setState(() {
                                            print('masuk false');
                                            listValue[index]["selected"] = true;
                                            // listBarisBlock.add({"barisBlock": "Baris "+listValue[index]["index"]});
                                            listBarisBlock.add({
                                              "barisBlock": listValue[index]
                                                  ["index"]
                                            });

                                            print(listBarisBlock);
                                          });
                                        }
                                      });

                                      setState(() {});
                                    },
                                    child: Center(
                                      child: Text(
                                        listValue[index]["index"],
                                        style:
                                            listValue[index]["selected"] == true
                                                ? TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 32)
                                                : TextStyle(
                                                    color: Color(0xFFFF4D35),
                                                    fontSize: 24),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            }),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              // numberpicker()

              // NumberPicker(
              //   decoration: BoxDecoration(
              //     border: Border.all(
              //       color: Colors.green,
              //       style: BorderStyle.solid,
              //       width: 2.0,
              //     ),
              //   ),
              //   itemWidth : 75,
              //   selectedTextStyle: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 32,),
              //   textStyle: _currentValue>10? TextStyle(color:Colors.blue):_currentValue<3? TextStyle(color:Colors.red):TextStyle(color:Colors.grey),
              //   axis: Axis.horizontal,
              //   haptics: true,
              //   infiniteLoop  : true,
              //   minValue: 1,
              //   maxValue: 31,
              //   value: _currentValue,
              //   itemCount : 6,
              //   onChanged: (value) {print('_currentValue $_currentValue'); setState(() { _currentValue = value;});}
              // ),
              Padding(
                padding: EdgeInsets.only(bottom: 62),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Image.asset(
                        "assets/icons/icon_info_circle_black.png",
                        width: 13,
                        height: 13,
                      ),
                    ),
                    Text('Geser ke kanan atau ke kiri untuk memilih',
                        style: ComponentFonts.fontNormal12B)
                  ],
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(4.0),
                          ),
                          height: 56,
                          width: MediaQuery.of(context).size.width,
                          child: Material(
                            color: Colors.transparent,
                            child: InkWell(
                              borderRadius: BorderRadius.circular(4.0),
                              splashColor: Colors.white.withOpacity(0.2),
                              onTap: () async {
                                setState(() {
                                  Navigator.pop(context);
                                  selectBlock1();
                                });
                              },
                              child: Center(
                                  child: Text("Kembali",
                                      style: ComponentFonts.fontBold14Green)),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 12),
                  Expanded(
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Color(0xFF348721),
                            borderRadius: BorderRadius.circular(4.0),
                          ),
                          height: 56,
                          width: MediaQuery.of(context).size.width,
                          child: Material(
                            color: Colors.transparent,
                            child: InkWell(
                              borderRadius: BorderRadius.circular(4.0),
                              splashColor: Colors.white.withOpacity(0.2),
                              onTap: () async {
                                if (listBarisBlock.isEmpty) {
                                  ComponentAlerts.showFlushbarFailed(context,
                                      "Pilihan Baris Tidak Boleh Kosong");
                                } else {
                                  setState(() {
                                    print('masuk buat');
                                    listBarisBlock.sort((a, b) =>
                                        a['barisBlock']
                                            .compareTo(b['barisBlock']));
                                    // for (var i = 1; i <= listBarisBlock.length; i++) {
                                    //   listAddingBarisBlock.add(listBarisBlock[i]['barisBlock']);
                                    // }

                                    // listBarisBlock..sort((a, b) => a['barisBlock'].toString().compareTo(b['barisBlock'].toString()));
                                    print('berhasil diurut');
                                    print(listBarisBlock);
                                    for (var i = 0;
                                        i <= listBarisBlock.length - 1;
                                        i++) {
                                      print('masuk ? ${i}');
                                      // print(listBarisBlock[i]['barisBlock']);
                                      listAddingBarisBlock
                                          .add(listBarisBlock[i]['barisBlock']);
                                      // print(listAddingBarisBlock);
                                    }

                                    print('ini list baris');
                                    print(listAddingBarisBlock);
                                    // listAddingBarisBlock.sort();
                                    // print(listAddingBarisBlock);
                                    // listAddingBarisBlock.map(int.parse).toList()..sort();
                                    final sorted = listAddingBarisBlock
                                        .map(int.parse)
                                        .toList()
                                          ..sort();
                                    print('ini sorted');
                                    print(sorted);
                                    for (var i = 0;
                                        i <= sorted.length - 1;
                                        i++) {
                                      print('masuk ? ${i}');
                                      listSortedBarisBlock
                                          .add("Baris " + sorted[i].toString());
                                    }
                                    print('ini list sorted with text Baris');
                                    print(listSortedBarisBlock);
                                    addBaris = listSortedBarisBlock.isNotEmpty
                                        ? listSortedBarisBlock
                                            .map((val) => val.trim())
                                            .join(', ')
                                        : '';


                                    print('ini String baris');
                                    print(addBaris);

                                    // add Mutu ancak via Variable List
                                    // listMutuAncak.add({
                                    //   "nameBlock": "$selectedBlock",
                                    //   "typeBlock": "$_value",
                                    //   "isiBaris": "$addBaris",
                                    // });

                                    // add Mutu ancak via Sqflite List
                                    addMutuAncakSqflite();
                                    print("ini List Mutu Ancak");
                                    print(listMutuAncak);

                                    Navigator.pop(context);
                                    refreshNotes();
                                  });
                                }
                              },
                              child: Center(
                                  child: Text("Buat",
                                      style: ComponentFonts.fontBold14White)),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ]),
      );
    });

    return showModalBottomSheet(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15), topRight: Radius.circular(15)),
        ),
        context: context,
        isScrollControlled: true,
        backgroundColor: Colors.white,
        builder: (context) => DraggableScrollableSheet(
            initialChildSize: 0.7,
            expand: false,
            builder: (context, scrollController) {
              return SingleChildScrollView(
                controller: scrollController,
                physics: ScrollPhysics(),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Center(
                        child: Container(
                          margin:
                              const EdgeInsets.only(top: 24.0, bottom: 12.0),
                          decoration: BoxDecoration(
                            color: ComponentColors.bodyColorGrey,
                            borderRadius: BorderRadius.all(
                              Radius.circular(100.0),
                            ),
                          ),
                          width: 84,
                          height: 8,
                        ),
                      ),
                      content,
                    ]),
              );
            }));
  }

  Widget buildFromList() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      child: ListView.builder(
          shrinkWrap: false,
          scrollDirection: Axis.vertical,
          itemCount: listMutuAncak.length != 0 ? listMutuAncak.length : 0,
          itemBuilder: (BuildContext context, index) {
            return Column(
              children: [
                Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                        color: Colors.grey.withOpacity(0.3),
                        style: BorderStyle.solid,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                    child: Stack(
                      children: [
                        Material(
                            color: Colors.transparent,
                            child: InkWell(
                              onTap: () {},
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 9, vertical: 10),
                                child: Column(
                                  children: [
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 8.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                right: 6.0),
                                            child: Text(
                                              listMutuAncak[index]["nameBlock"],
                                              style: ComponentFonts.fontBold16B,
                                            ),
                                          ),
                                          Expanded(
                                            child: Text(
                                                listMutuAncak[index]
                                                    ["typeBlock"],
                                                style: TextStyle(
                                                    fontSize: 12,
                                                    color: listMutuAncak[index]
                                                                ["typeBlock"]
                                                            .toString()
                                                            .contains("Tunggal")
                                                        ? ComponentColors
                                                            .textColorBlue
                                                        : ComponentColors
                                                            .textColorCyan)),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        Expanded(
                                            child: Text(
                                          listMutuAncak[index]["isiBaris"],
                                          style:
                                              ComponentFonts.fontNormal14Grey1,
                                        ))
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            )),
                        Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: 9, vertical: 10),
                          child: InkWell(
                            onTap: () {
                              ComponentAlerts.showFlushbarFailed(
                                  context, "Fitur sedang tahap pengembangan!");
                            },
                            child: Align(
                                alignment: Alignment.centerRight,
                                child: Icon(
                                  FontAwesomeIcons.ellipsisV,
                                  size: 12,
                                )),
                          ),
                        )
                      ],
                    )),
                Divider(height: 15.0, color: Colors.black26.withOpacity(0.0)),
              ],
            );
          }),
    );
  }

  Widget buildFromSqflite() {
    print('masuk build sfqlite');
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      child: ListView.builder(
          shrinkWrap: false,
          scrollDirection: Axis.vertical,
          itemCount: mutuAncak.length != 0 ? mutuAncak.length : 0,
          itemBuilder: (BuildContext context, index) {
            return Column(
              children: [
                Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                        color: Colors.grey.withOpacity(0.3),
                        style: BorderStyle.solid,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                    child: Stack(
                      children: [
                        Material(
                            color: Colors.transparent,
                            child: InkWell(
                              onTap: () {},
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 9, vertical: 10),
                                child: Column(
                                  children: [
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 8.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                right: 6.0),
                                            child: Text(
                                              mutuAncak[index].nameBlock,
                                              style: ComponentFonts.fontBold16B,
                                            ),
                                          ),
                                          Expanded(
                                            child: Text(
                                                mutuAncak[index].typeBlock,
                                                style: TextStyle(
                                                    fontSize: 12,
                                                    color: mutuAncak[index]
                                                            .typeBlock
                                                            .toString()
                                                            .contains("Tunggal")
                                                        ? ComponentColors
                                                            .textColorBlue
                                                        : ComponentColors
                                                            .textColorCyan)),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        Expanded(
                                            child: Text(
                                          mutuAncak[index].isiBaris,
                                          style:
                                              ComponentFonts.fontNormal14Grey1,
                                        ))
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            )),
                        Align(
                          alignment: Alignment.topRight,
                          child: Container(
                            padding: const EdgeInsets.all(0.0),
                            height: 38.0,
                            width: 40.0,
                            child: PopupMenuButton(
                              icon: Icon(
                                FontAwesomeIcons.ellipsisV,
                                size: 12,
                              ),
                              itemBuilder: (context) => [
                                PopupMenuItem(
                                  child: Text("Edit"),
                                  value: 1,
                                ),
                                PopupMenuItem(
                                  child: Text("Delete"),
                                  value: 2,
                                )
                              ],
                              initialValue: 1,
                              onCanceled: () {
                                print("You have canceled the menu.");
                              },
                              onSelected: (value) async {
                                print("value:$value");
                                if (value == 1) {
                                  ComponentAlerts.showFlushbarFailed(context,
                                      "Fitur sedang tahap pengembangan!");
                                } else if (value == 2) {
                                  await deleteMutuAncakSqflite(
                                      mutuAncak[index].id);
                                  setState(() {
                                    refreshNotes();
                                    print("mutuAncak");
                                    print(mutuAncak);
                                  });
                                }
                              },
                            ),
                          ),
                        )
                      ],
                    )),
                Divider(height: index == mutuAncak.length-1? 80: 15.0, color: Colors.black26.withOpacity(0.0)),
              ],
            );
          }),
    );
  }

  Future refreshNotes() async {
    setState(() => isLoading = true);

    print("mutuAncak");
    print(mutuAncak);
    this.mutuAncak = await MutuAncakDataBase.instance.readAllList();
    print(mutuAncak);

    print('database instance sukses');
    setState(() => isLoading = false);
  }

  Future addMutuAncakSqflite() async {
    final mutuAncak = MutuAncak(
        nameBlock: selectedBlock, typeBlock: _value, isiBaris: addBaris);

    print(selectedBlock);
    print(_value);
    print(addBaris);

    await MutuAncakDataBase.instance.create(mutuAncak);
  }

  Future deleteMutuAncakSqflite(int? i) async {
    print('delete');

    await MutuAncakDataBase.instance.delete(i);
    ComponentAlerts.showFlushbarSuccess(context, "Data Berhasil terhapus.");

  }
}

class MyBehavior extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}

import 'package:flutter/material.dart';
import 'package:mobile_traning/constants/color.dart';
import 'package:mobile_traning/screen/home.dart';
import 'package:mobile_traning/utils/logger.dart';

import '../screen/detail.dart';

enum ColumnType { text, number }

class TableColumn {
  final String name;
  final String label;
  ColumnType? type = ColumnType.text;

  TableColumn({required this.name, required this.label, this.type});
}

class MutationTable extends StatelessWidget {
  List<TableColumn> columns;
  List<Map<String, dynamic>> data;

  MutationTable({required this.data, required this.columns});

  @override
  Widget build(BuildContext context) {
    AppColors colors = AppColors();
    return Container(
      margin: EdgeInsets.only(bottom: 16),
      child: Column(
        children: [
          // header
          Container(
            margin: EdgeInsets.only(top: 16),
            child: Row(
              children: [
                ...columns.map((cell) {
                  return Expanded(
                    flex: 2,
                    child: Container(
                      alignment: cell.type != ColumnType.number
                          ? Alignment.centerLeft
                          : Alignment.centerRight,
                      child: Text(cell.label,
                          style: TextStyle(color: colors.textSecondaryColor)),
                    ),
                  );
                }).toList(),
                Expanded(
                    child: Container(
                      child: Text('',
                          style: TextStyle(color: colors.textSecondaryColor)),
                    ),
                    flex: 1)
              ],
            ),
          ),
          //body
          SizedBox(
            height: 370,
            child: ListView.builder(
                itemCount: data.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    decoration: BoxDecoration(
                      border: Border(
                          bottom:
                              BorderSide(color: colors.borderColor, width: 1)),
                    ),
                    child: Row(
                      children: [
                        ...data[index].entries.map((field) {
                          if (columns
                              .any((element) => element.name == field.key))
                            return Expanded(
                              flex: 2,
                              child: Container(
                                alignment: int.tryParse(field.value) == null
                                    ? Alignment.centerLeft
                                    : Alignment.centerRight,
                                child: Text(field.value,
                                    style: TextStyle(
                                        color: field.value.contains('-')
                                            ? colors.textSecondaryColor
                                            : colors.textPrimaryColor)),
                              ),
                            );
                          else
                            return Container();
                        }).toList(),
                        Expanded(
                            child: Container(
                                alignment: Alignment.centerLeft,
                                child: IconButton(
                                  iconSize: 15,
                                  icon: Icon(Icons
                                      .arrow_forward_ios), // Icon dấu mũi tên điều hướng sang phải
                                  onPressed: () {
                                    // Xử lý sự kiện khi nhấn vào icon
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            Detail(code: data[index]['code']),
                                      ),
                                    );
                                  },
                                  color: colors.textSecondaryColor,
                                )),
                            flex: 1)
                      ],
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:mobile_traning/constants/color.dart';

enum ColumnType { text, number }

class TableColumn {
  final String name;
  ColumnType? type = ColumnType.text;

  TableColumn({required this.name, this.type});
}

class MutationTable extends StatelessWidget {
  final List<List<String>> data; // Dữ liệu đổ vào bảng
  final List<TableColumn> columns;

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
                      child: Text(cell.name,
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
                        ...data[index].map((cell) {
                          return Expanded(
                            flex: 2,
                            child: Container(
                              alignment: int.tryParse(cell) == null
                                  ? Alignment.centerLeft
                                  : Alignment.centerRight,
                              child: Text(cell,
                                  style: TextStyle(
                                      color: cell.contains('-')
                                          ? colors.textSecondaryColor
                                          : colors.textPrimaryColor)),
                            ),
                          );
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

import 'package:flutter/material.dart';
import 'package:mobile_traning/components/filter.dart';
import 'package:mobile_traning/utils/logger.dart';

import '../components/list.dart';
import '../components/option.dart';
import '../components/pagination.dart';
import '../components/searchBar.dart';

const tableData = [
  ["ABC", "09:30-00:00", '5000'],
  ["XYZ", "11:45-00:00", '3000'],
  ["DEF", "14:15-00:00", '7000'],
  ["GHI", "10:00-00:00", '2000'],
  ["JKL", "13:30-00:00", '4000'],
  ["MNO", "16:45-00:00", '6000'],
  ["PQR", "09:00-00:00", '1500'],
  ["STU", "12:30-00:00", '8000'],
  ["VWX", "14:45-00:00", '2500'],
  ["YZA", "11:15-00:00", '3500'],
  ["BCD", "15:30-00:00", '4500'],
  ["EFG", "10:45-00:00", '6000'],
  ["HIJ", "13:15-00:00", '4000'],
  ["KLM", "09:30-00:00", '5500'],
  ["NOP", "11:00-00:00", '2800'],
  ["QRS", "14:30-00:00", '4200'],
  ["TUV", "10:15-00:00", '3800'],
  ["WXY", "12:00-00:00", '5100'],
  ["ZAB", "15:45-00:00", '3200'],
  ["CDE", "09:30-00:00", '4700'],
  ["ABC", "09:30-00:00", '5000'],
  ["XYZ", "11:45-00:00", '3000'],
  ["DEF", "14:15-00:00", '7000'],
  ["GHI", "10:00-00:00", '2000'],
  ["JKL", "13:30-00:00", '4000'],
  ["MNO", "16:45-00:00", '6000'],
  ["PQR", "09:00-00:00", '1500'],
  ["STU", "12:30-00:00", '8000'],
  ["VWX", "14:45-00:00", '2500'],
  ["YZA", "11:15-00:00", '3500'],
  ["BCD", "15:30-00:00", '4500'],
  ["EFG", "10:45-00:00", '6000'],
  ["HIJ", "13:15-00:00", '4000'],
  ["KLM", "09:30-00:00", '5500'],
  ["NOP", "11:00-00:00", '2800'],
  ["QRS", "14:30-00:00", '4200'],
  ["TUV", "10:15-00:00", '3800'],
  ["WXY", "12:00-00:00", '5100'],
  ["ZAB", "15:45-00:00", '3200'],
  ["CDE", "09:30-00:00", '4700']
];

class Mutation extends StatefulWidget {
  const Mutation({super.key});

  @override
  State<Mutation> createState() => _MutationState();
}

class _MutationState extends State<Mutation> {
  String searchKey='';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 24),
                  child: Text(
                    'Đột biến khối lượng giao dịch',
                    //fonsize 14px, line height 20px
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          fontSize: 14,
                          height: 20 / 14,
                        ),
                  ),
                )
              ],
            ),
            AppSearchBar(
              onSearch: (value) => {
                setState(() {
                  searchKey = value;
                })
              },
            ),
            const Row(
              children: [
                Option(
                  label: '5 Phiên',
                  isSelected: true,
                ),
                Option(
                  label: '20 Phiên',
                  isSelected: false,
                ),
                Option(
                  label: '20 Phiên trước ATC',
                  isSelected: false,
                ),
              ],
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Filter(
                  label: 'Tất cả',
                  isSelected: true,
                ),
                Filter(
                  label: 'HOSE',
                  isSelected: false,
                ),
                Filter(
                  label: 'HNX',
                  isSelected: false,
                ),
                Filter(
                  label: 'UPCOM',
                  isSelected: false,
                ),
              ],
            ),
            MutationTable(
                data: tableData
                    .where((List<String> element) => searchKey.isNotEmpty ? element[0].toLowerCase().contains(searchKey.toLowerCase()): true)
                    .toList(),
                columns: [
                  new TableColumn(name: 'Mã'),
                  new TableColumn(name: 'Thời gian'),
                  new TableColumn(
                      name: 'Khối lượng GD', type: ColumnType.number),
                ]),
            PaginationBar(
              currentPage: 1,
              totalPages: 10,
              onPageSelected: (p0) => {},
            )
          ],
        ),
      ),
    );
  }
}

var person = {
  'name': 'Nguyen Van A',
};

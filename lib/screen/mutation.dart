import 'package:flutter/material.dart';
import 'package:mobile_traning/components/filter.dart';

import '../components/list.dart';
import '../components/option.dart';
import '../components/pagination.dart';
import '../components/searchBar.dart';

const data = [
  {
    'code': 'ABC',
    'session': '09:30-00:00',
    'volume': '1000',
    'floor': 'HOSE',
  },
  {
    'code': 'XYZ',
    'session': '11:45-00:00',
    'volume': '2000',
    'floor': 'HNX',
  },
  {
    'code': 'DEF',
    'session': '14:15-00:00',
    'volume': '3000',
    'floor': 'UPCOM',
  },
  {
    'code': 'ABC',
    'session': '09:30-00:00',
    'volume': '1000',
    'floor': 'HOSE',
  },
  {
    'code': 'XYZ',
    'session': '11:45-00:00',
    'volume': '2000',
    'floor': 'HNX',
  },
  {
    'code': 'DEF',
    'session': '14:15-00:00',
    'volume': '3000',
    'floor': 'UPCOM',
  },
  {
    'code': 'ABC',
    'session': '09:30-00:00',
    'volume': '1000',
    'floor': 'HOSE',
  },
  {
    'code': 'XYZ',
    'session': '11:45-00:00',
    'volume': '2000',
    'floor': 'HNX',
  },
  {
    'code': 'DEF',
    'session': '14:15-00:00',
    'volume': '3000',
    'floor': 'UPCOM',
  },
  {
    'code': 'ABC',
    'session': '09:30-00:00',
    'volume': '1000',
    'floor': 'HOSE',
  },
  {
    'code': 'XYZ',
    'session': '11:45-00:00',
    'volume': '2000',
    'floor': 'HNX',
  },
  {
    'code': 'DEF',
    'session': '14:15-00:00',
    'volume': '3000',
    'floor': 'UPCOM',
  },
  {
    'code': 'ABC',
    'session': '09:30-00:00',
    'volume': '1000',
    'floor': 'HOSE',
  },
  {
    'code': 'XYZ',
    'session': '11:45-00:00',
    'volume': '2000',
    'floor': 'HNX',
  },
  {
    'code': 'DEF',
    'session': '14:15-00:00',
    'volume': '3000',
    'floor': 'UPCOM',
  },
  {
    'code': 'ABC',
    'session': '09:30-00:00',
    'volume': '1000',
    'floor': 'HOSE',
  },
  {
    'code': 'XYZ',
    'session': '11:45-00:00',
    'volume': '2000',
    'floor': 'HNX',
  },
  {
    'code': 'DEF',
    'session': '14:15-00:00',
    'volume': '3000',
    'floor': 'UPCOM',
  },
  {
    'code': 'DGF',
    'session': '14:15-00:00',
    'volume': '3000',
    'floor': 'UPCOM',
  },
  {
    'code': 'LEF',
    'session': '14:15-00:00',
    'volume': '3000',
    'floor': 'UPCOM',
  },
  {
    'code': 'DGL',
    'session': '14:15-00:00',
    'volume': '3000',
    'floor': 'UPCOM',
  },
];

class Mutation extends StatefulWidget {
  const Mutation({super.key});

  @override
  State<Mutation> createState() => _MutationState();
}

class _MutationState extends State<Mutation> {
  String searchKey = '';
  int sessionDisplay = 5;
  bool beforeATCCheck = false;
  String floor = 'ALL';
  int currentPage = 1;
  List<Map<String, dynamic>> get filterdMutationList {
    final mutationList = floor == 'ALL'
        ? data
        //if not all
        : data.where((element) => element['floor'] == floor).toList();
    if (searchKey.isNotEmpty) {
      return mutationList
          .where((element) =>
              element['code'].toString().toLowerCase().contains(searchKey))
          .toList();
    } else {
      return mutationList.toList();
    }
  }

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
            //session display
            Row(
              children: [
                Option(
                  label: '5 Phiên',
                  isSelected: sessionDisplay == 5,
                  onTap: () => {
                    setState(() => {
                          sessionDisplay = 5,
                          beforeATCCheck = false,
                          currentPage = 1,
                        })
                  },
                ),
                Option(
                  label: '20 Phiên',
                  isSelected: sessionDisplay == 20 && beforeATCCheck == false,
                  onTap: () => {
                    setState(() => {
                          sessionDisplay = 20,
                          beforeATCCheck = false,
                          currentPage = 1,
                        })
                  },
                ),
                Option(
                  label: '20 Phiên trước ATC',
                  isSelected: sessionDisplay == 20 && beforeATCCheck == true,
                  onTap: () => {
                    setState(() => {
                          sessionDisplay = 20,
                          beforeATCCheck = true,
                          currentPage = 1,
                        })
                  },
                ),
              ],
            ),
            //filter
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Filter(
                    label: 'Tất cả',
                    isSelected: floor == 'ALL',
                    onTap: () => setState(
                          () => {
                            floor = 'ALL',
                            currentPage = 1,
                          },
                        )),
                Filter(
                  label: 'HOSE',
                  isSelected: floor == 'HOSE',
                  onTap: () => setState(
                    () => {floor = 'HOSE', currentPage = 1},
                  ),
                ),
                Filter(
                  label: 'HNX',
                  isSelected: floor == 'HNX',
                  onTap: () => setState(
                    () => {
                      floor = 'HNX',
                      currentPage = 1,
                    },
                  ),
                ),
                Filter(
                  label: 'UPCOM',
                  isSelected: floor == 'UPCOM',
                  onTap: () => setState(() => {
                        floor = 'UPCOM',
                        currentPage = 1,
                      }),
                ),
              ],
            ),
            MutationTable(
                data: filterdMutationList.length >= sessionDisplay
                    ? filterdMutationList
                        .skip(
                          (currentPage - 1) * sessionDisplay,
                        )
                        .take(sessionDisplay)
                        .toList()
                    : filterdMutationList,
                columns: [
                  new TableColumn(name: 'code', label: 'Mã'),
                  new TableColumn(name: 'session', label: 'Thời gian'),
                  new TableColumn(
                      name: 'volume',
                      label: 'Khối lượng GD',
                      type: ColumnType.number),
                ]),
            PaginationBar(
              currentPage: currentPage,
              totalPages: (filterdMutationList.length / sessionDisplay).ceil(),
              onPageSelected: (page) => {setState(() => currentPage = page)},
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

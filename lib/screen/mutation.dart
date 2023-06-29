import 'package:flutter/material.dart';
import 'package:flutter_web_pagination/flutter_web_pagination.dart';
import 'package:mobile_traning/components/filter.dart';
import 'package:number_pagination/number_pagination.dart';

import '../components/list.dart';
import '../components/option.dart';
import '../components/pagination.dart';
import '../components/searchBar.dart';

class Mutation extends StatefulWidget {
  const Mutation({super.key});

  @override
  State<Mutation> createState() => _MutationState();
}

class _MutationState extends State<Mutation> {
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
            const AppSearchBar(),
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
            MutationTable(data: [
              ['Cell 1', 'Cell-2', '000'],
              ['Cell 4', 'Cell-5', '000'],
              ['Cell 1', 'Cell-2', '000'],
              ['Cell 4', 'Cell-5', '000'],
              ['Cell 1', 'Cell-2', '000'],
              ['Cell 4', 'Cell-5', '000'],
              ['Cell 1', 'Cell-2', '000'],
              ['Cell 4', 'Cell-5', '000'],
              ['Cell 1', 'Cell-2', '000'],
              ['Cell 4', 'Cell-5', '000'],
              ['Cell 1', 'Cell-2', '000'],
              ['Cell 4', 'Cell-5', '000'],
              ['Cell 1', 'Cell-2', '000'],
              ['Cell 4', 'Cell-5', '000'],
              ['Cell 1', 'Cell-2', '000'],
              ['Cell 4', 'Cell-5', '000'],
              ['Cell 1', 'Cell-2', '000'],
              ['Cell 4', 'Cell-5', '000'],
              ['Cell 1', 'Cell-2', '000'],
              ['Cell 4', 'Cell-5', '000'],
              ['Cell 1', 'Cell-2', '000'],
              ['Cell 4', 'Cell-5', '000'],
              ['Cell 1', 'Cell-2', '000'],
              ['Cell 4', 'Cell-5', '000'],
              ['Cell 1', 'Cell-2', '000'],
              ['Cell 4', 'Cell-5', '000'],
              ['Cell 1', 'Cell-2', '000'],
              ['Cell 4', 'Cell-5', '000'],
              ['Cell 1', 'Cell-2', '000'],
              ['Cell 4', 'Cell-5', '000'],
              ['Cell 1', 'Cell-2', '000'],
              ['Cell 4', 'Cell-5', '000'],
            ], columns: [
              new TableColumn(name: 'Mã'),
              new TableColumn(name: 'Thời gian'),
              new TableColumn(name: 'Khối lượng GD',type: ColumnType.number),
            ]),
            PaginationBar(currentPage: 1,totalPages: 10,onPageSelected: (p0) => {},)
          ],
        ),
      ),
    );
  }
}

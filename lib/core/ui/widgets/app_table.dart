import 'package:flutter/material.dart';

import '../../extensions/extension.dart';
import '../themes/theme.dart';

class AppTable extends StatelessWidget {
  const AppTable({
    required this.columns,
    required this.rows,
    required this.tableWidth,
    Key? key,
  }) : super(key: key);

  final List<String> columns;
  final List<List<String>> rows;
  final double tableWidth;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: tableWidth,
      child: Table(
        defaultVerticalAlignment: TableCellVerticalAlignment.middle,
        border: const TableBorder(),
        columnWidths: const {
          0: FlexColumnWidth(),
          1: FlexColumnWidth(),
          2: FlexColumnWidth(),
        },
        children: [
          TableRow(
            children: List.generate(
              columns.length,
              (index) {
                return Container(
                  padding: EdgeInsets.only(
                    left: index == 0 ? context.appPaddingVal : 0,
                    right:
                        index == columns.length - 1 ? context.appPaddingVal : 0,
                    bottom: 10,
                  ),
                  height: 50,
                  alignment: Alignment.centerLeft,
                  child: Text(
                    columns[index],
                    style: context.textTheme.bodySmall?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                );
              },
            ),
          ),
          ...List.generate(
            rows.length,
            (index) {
              final row = rows[index];
              return TableRow(
                decoration: BoxDecoration(
                  color: index.isOdd ? Colors.transparent : AppColors.cultured,
                ),
                children: List.generate(
                  row.length,
                  (index) {
                    return Container(
                      padding: EdgeInsets.only(
                        left: index == 0 ? context.appPaddingVal : 0,
                        right:
                            index == row.length - 1 ? context.appPaddingVal : 0,
                      ),
                      height: 50,
                      alignment: Alignment.centerLeft,
                      child: Text(
                        row[index],
                        style: context.textTheme.bodyMedium?.copyWith(
                          fontWeight:
                              index == 0 ? FontWeight.w500 : FontWeight.normal,
                        ),
                      ),
                    );
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

import '../../../../../core/extensions/extension.dart';
import '../../../../../core/ui/themes/theme.dart';

class ChangesChart extends StatefulWidget {
  const ChangesChart({
    super.key,
  });

  @override
  State<ChangesChart> createState() => _ChangesChartState();
}

class _ChangesChartState extends State<ChangesChart>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Stack(
          children: [
            Positioned(
              right: 0,
              left: 0,
              bottom: 26,
              child: SizedBox(
                height: 300 - 26,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    ...['Very High', 'High', 'Optimal', 'Low', 'Very Low']
                        .map(
                          (label) => Expanded(
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                vertical: 5,
                              ),
                              alignment: Alignment.centerRight,
                              decoration: BoxDecoration(
                                color: label == 'Optimal'
                                    ? AppColors.darkGreen.withOpacity(0.1)
                                    : Colors.transparent,
                                border: Border(
                                  top: BorderSide(
                                    color: label == 'Optimal' || label == 'Low'
                                        ? AppColors.darkGreen.withOpacity(0.3)
                                        : context.colorScheme.onSurface
                                            .withOpacity(0.08),
                                  ),
                                ),
                              ),
                              child: Text(
                                label,
                                style: context.textTheme.bodyMedium?.copyWith(
                                  fontWeight: FontWeight.w500,
                                  color: context.colorScheme.onSurface
                                      .withOpacity(0.6),
                                ),
                                textAlign: TextAlign.end,
                              ),
                            ),
                          ),
                        )
                        .toList(),
                    const Divider(thickness: 1),
                  ],
                ),
              ),
            ),
            Container(
              height: 300,
              padding: EdgeInsets.only(right: context.appPaddingVal),
              width: constraints.maxWidth,
              child: Row(
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          ...List.generate(
                            productivityData.length,
                            (i) => ChartBarItem(
                              value: productivityData[i],
                              onTap: () {},
                            ),
                          ),
                          const SizedBox(width: 15),
                        ],
                      ),
                    ),
                  ),
                  const Opacity(
                    opacity: 0,
                    child: Text('Very High'),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }

  List<Map<String, dynamic>> productivityData = [
    {
      'value': 6.10,
      'xLabel': '10/9',
      'color': AppColors.darkGreen,
    },
    {
      'value': 8.95,
      'xLabel': '16/9',
      'color': AppColors.red,
    },
    {
      'value': 7.95,
      'xLabel': '29/9',
      'color': AppColors.orange,
    },
    {
      'value': 7.80,
      'xLabel': '4/10',
      'color': AppColors.orange,
    },
    {
      'value': 5.85,
      'xLabel': '5/10',
      'color': AppColors.darkGreen,
    },
    {
      'value': 1.85,
      'xLabel': '6/10',
      'color': AppColors.red,
    },
  ];
}

class ChartBarItem extends StatelessWidget {
  const ChartBarItem({
    required this.onTap,
    required this.value,
    super.key,
  });

  final Function() onTap;
  final Map<String, dynamic> value;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 8,
              vertical: 4,
            ),
            margin: const EdgeInsets.symmetric(horizontal: 3),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(80),
              border: Border.all(
                color: AppColors.black.withOpacity(0.08),
              ),
            ),
            child: Center(
              child: Text(
                '${value['value'].toStringAsFixed(2)}',
                style: context.textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              GestureDetector(
                onTap: onTap,
                child: AnimatedContainer(
                  height: (constraints.maxHeight - 78) * (value['value'] / 10),
                  duration: const Duration(milliseconds: 300),
                  width: 20,
                  decoration: BoxDecoration(
                    color: value['color'],
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(8),
                      topRight: Radius.circular(8),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 12),
              AnimatedSwitcher(
                duration: const Duration(milliseconds: 300),
                child: Text(
                  value['xLabel'],
                  style: context.textTheme.bodySmall?.copyWith(
                    fontWeight: FontWeight.w500,
                    color: context.colorScheme.onSurface.withOpacity(0.6),
                  ),
                ),
              ),
            ],
          ),
        ],
      );
    });
  }
}

import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

import '../../../../../core/extensions/extension.dart';
import '../../../../../core/ui/themes/theme.dart';
import '../../../../../core/ui/widgets/app_button.dart';
import '../../../../../core/ui/widgets/app_table.dart';
import '../widgets/changes_chart.dart';
import '../widgets/home_app_bar.dart';
import '../widgets/risk_indicator.dart';
import '../widgets/semi_circular_gauge.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const HomeAppBar(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AppButton(
            padding: EdgeInsets.symmetric(
              horizontal: context.appPaddingVal * 2,
              vertical: context.appPaddingVal,
            ),
            onPressed: () {},
            child: Row(
              children: [
                const Icon(
                  Icons.add,
                  color: AppColors.white,
                ),
                const SizedBox(width: 8),
                Text(
                  'Add new result',
                  style: context.textTheme.bodyLarge?.copyWith(
                    color: AppColors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(vertical: context.appPaddingVal),
        children: [
          _buildLatestResult(context),
          const SizedBox(height: 15),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: context.appPaddingVal,
            ),
            child: IntrinsicHeight(
              child: Row(
                children: [
                  Expanded(
                    child: Card(
                      color: AppColors.darkGreen.withOpacity(0.12),
                      child: Padding(
                        padding: EdgeInsets.all(context.appPaddingVal),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Manage your health to get to optimal ranges',
                              style: context.textTheme.bodyMedium?.copyWith(
                                fontWeight: FontWeight.w600,
                                color: AppColors.darkGreen,
                              ),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              '5 suggested activities',
                              style: context.textTheme.bodySmall?.copyWith(
                                color: AppColors.darkGreen,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const SizedBox(height: 10),
                            Align(
                              alignment: Alignment.centerRight,
                              child: CircleAvatar(
                                radius: 15,
                                backgroundColor:
                                    AppColors.darkGreen.withOpacity(0.25),
                                child: const Icon(
                                  IconlyLight.arrow_right,
                                  color: AppColors.darkGreen,
                                  size: 20,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: context.appPaddingVal),
                  Expanded(
                    child: Card(
                      color: AppColors.primary.withOpacity(0.12),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: context.appPaddingVal,
                        ),
                        child: Column(
                          children: [
                            SizedBox(height: 15 + context.appPaddingVal),
                            SemiCircularGauge(
                              percentage: 50,
                              width: context.width * 0.3,
                              color: AppColors.primary,
                            ),
                            const SizedBox(height: 25),
                            Text(
                              'Health score\nrelevance',
                              textAlign: TextAlign.center,
                              style: context.textTheme.bodyMedium?.copyWith(
                                fontWeight: FontWeight.w600,
                                color: AppColors.primary,
                              ),
                            ),
                            SizedBox(height: 10 + context.appPaddingVal),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 30),
          _buildAboutTest(context),
          const Divider(height: 50),
          _buildDiagnosticFunction(context),
          const SizedBox(height: 25),
          const Divider(),
          const SizedBox(height: 15),
          _buildRanges(context),
          const Divider(height: 50),
          _buildChangesOverTime(context),
          const SizedBox(height: 30),
          _buildAllRecordButton(context),
          SizedBox(height: 70 + context.bottom),
        ],
      ),
    );
  }

  Widget _buildAllRecordButton(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      margin: EdgeInsets.symmetric(
        horizontal: context.appPaddingVal,
      ),
      decoration: BoxDecoration(
        border: Border.all(
          color: context.colorScheme.onSurface.withOpacity(0.1),
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'See all records',
                style: context.textTheme.bodyLarge?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                '5 records',
                style: context.textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.w500,
                  color: context.colorScheme.onSurface.withOpacity(0.6),
                ),
              ),
            ],
          ),
          const Spacer(),
          Icon(
            IconlyLight.document,
            color: context.colorScheme.onSurface,
          ),
        ],
      ),
    );
  }

  Widget _buildChangesOverTime(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: context.appPaddingVal),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Changes over time',
            style: context.textTheme.bodyLarge?.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 15),
          const ChangesChart()
        ],
      ),
    );
  }

  Column _buildRanges(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: context.appPaddingVal,
          ),
          child: Row(
            children: [
              Text(
                'Ranges',
                style: context.textTheme.bodyLarge?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
              const Spacer(),
              TextButton(
                onPressed: () {},
                child: Text(
                  'Learn more',
                  style: context.textTheme.bodyMedium?.copyWith(
                    color: AppColors.primary,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 5),
        AppTable(
            tableWidth: context.width,
            columns: const [
              'Ranges',
              'Functional\nranges (mg/dL)',
              'Standard ranges\n(mg/dL)',
            ],
            rows: List.generate(
              5,
              (index) => ['Very low', '121-150', '100-130'],
            )),
      ],
    );
  }

  Widget _buildDiagnosticFunction(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: context.appPaddingVal),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Diagnostic functions',
            style: context.textTheme.bodyLarge?.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 15),
          Wrap(
            spacing: 10,
            runSpacing: 5,
            children: [
              'Diabetes',
              'Metabolic health',
              'Hearth health',
              'Hormonal health',
              'Longevity'
            ]
                .map(
                  (e) => Chip(
                    label: Text(
                      e,
                      style: context.textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    color: WidgetStateProperty.all(
                      Colors.transparent,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100),
                      side: BorderSide(
                        color: AppColors.black.withOpacity(0.05),
                      ),
                    ),
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }

  Widget _buildAboutTest(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: context.appPaddingVal),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                'About Insulin',
                style: context.textTheme.bodyLarge?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
              const Spacer(),
              TextButton(
                onPressed: () {},
                child: Text(
                  'Learn more',
                  style: context.textTheme.bodyMedium?.copyWith(
                    color: AppColors.primary,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 5),
          Text(
            "Insulin is a hormone created by your pancreas that controls the amount of glucose in your bloodstream at any given moment. It also helps store glucose in your liver, fat, and muscles. Finally, it regulates your body's metabolism of carbohydrates, fats, and proteins.",
            style: context.textTheme.bodyMedium,
          ),
        ],
      ),
    );
  }

  Widget _buildLatestResult(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: context.appPaddingVal),
      color: AppColors.lightPurple,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: context.appPaddingVal,
          vertical: context.appPaddingVal * 1.5,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Latest result',
              style: context.textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              'Day 25 cycle - 6/10/2021 02:00 AM',
              style: context.textTheme.bodyMedium,
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Text.rich(
                  TextSpan(
                    style: context.textTheme.bodyMedium,
                    children: [
                      TextSpan(
                        text: '45 ',
                        style: context.textTheme.displaySmall?.copyWith(
                          fontWeight: FontWeight.w500,
                          height: 1,
                        ),
                      ),
                      TextSpan(
                        text: 'mg/dL',
                        style: context.textTheme.bodyMedium?.copyWith(
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 15),
                CircleAvatar(
                  radius: 15,
                  backgroundColor: AppColors.red.withOpacity(0.25),
                  child: const Icon(
                    IconlyLight.arrow_down,
                    color: AppColors.red,
                    size: 20,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Text(
              'At risk',
              style: context.textTheme.bodyLarge?.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 5),
            const RiskIndicator(value: 6),
            const SizedBox(height: 10),
            Text.rich(
              TextSpan(
                style: context.textTheme.bodyMedium,
                children: [
                  TextSpan(
                    text: 'Provided by ',
                    style: context.textTheme.bodyMedium,
                  ),
                  TextSpan(
                    text: 'Lorem Ipsum Laboratory',
                    style: context.textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

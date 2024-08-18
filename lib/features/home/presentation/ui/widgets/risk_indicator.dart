import 'package:flutter/material.dart';

import '../../../../../core/ui/themes/theme.dart';

class RiskIndicator extends StatelessWidget {
  const RiskIndicator({
    required this.value,
    super.key,
  });

  final double value;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Column(
          children: [
            Stack(
              children: [
                Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  bottom: 0,
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: 10,
                          decoration: const BoxDecoration(
                            color: AppColors.red,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(5),
                              bottomLeft: Radius.circular(5),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          height: 10,
                          color: AppColors.orange,
                        ),
                      ),
                      Expanded(
                        child: Container(
                          height: 10,
                          color: AppColors.darkGreen,
                        ),
                      ),
                      Expanded(
                        child: Container(
                          height: 10,
                          color: AppColors.orange,
                        ),
                      ),
                      Expanded(
                        child: Container(
                          height: 10,
                          decoration: const BoxDecoration(
                            color: AppColors.red,
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(5),
                              bottomRight: Radius.circular(5),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    SizedBox(
                      width: (constraints.maxWidth - 16) * (value / 10),
                    ),
                    Container(
                      height: 30,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 3,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(3),
                        color: AppColors.white,
                        border: Border.all(
                          color: AppColors.red,
                          width: 5,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 5),
            const Row(
              children: [
                Spacer(),
                Expanded(child: Text('1.85')),
                Expanded(child: Text('3.85')),
                Expanded(child: Text('6.78')),
                Expanded(child: Text('8.78')),
              ],
            ),
          ],
        );
      },
    );
  }
}

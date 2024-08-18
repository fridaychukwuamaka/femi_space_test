import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

import '../../../../../core/extensions/extension.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: context.top),
        Row(
          children: [
            IconButton(
              icon: const Icon(IconlyLight.arrow_left),
              onPressed: () {},
            ),
            const Spacer(),
            IconButton(
              icon: const Icon(Icons.more_horiz),
              onPressed: () {},
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Blood test',
                style: context.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 15),
              Text(
                'Insulin',
                style: context.textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                height: 40,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    ChoiceChip(
                      label: const Text('Summary'),
                      selected: true,
                      showCheckmark: false,
                      onSelected: (v) {},
                    ),
                    const SizedBox(width: 20),
                    ChoiceChip(
                      label: Text(
                        'Function',
                        style: context.textTheme.bodyMedium?.copyWith(
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      selected: false,
                      showCheckmark: false,
                      onSelected: (v) {},
                    ),
                    const SizedBox(width: 20),
                    ChoiceChip(
                      label: Text(
                        'Deficiency',
                        style: context.textTheme.bodyMedium?.copyWith(
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      selected: false,
                      showCheckmark: false,
                      onSelected: (v) {},
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 15),
        const Divider(),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(191);
}

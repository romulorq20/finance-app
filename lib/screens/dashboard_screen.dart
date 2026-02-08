import 'package:flutter/material.dart';
import 'package:ruan_design_system/ruan_design_system.dart';

import '../data/mock_data.dart';
import '../models/transaction.dart';
import 'transaction_detail_screen.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  static String _formatCurrency(double value) {
    return 'R\$${value.toStringAsFixed(2).replaceAll('.', ',')}';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(PrimaryTokens.spacingMd),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const RuanText(
                      'Olá',
                      style: RuanTextStyle.bodyMedium,
                    ),
                    const SizedBox(height: PrimaryTokens.spacingXs),
                    const RuanText(
                      'Seu resumo',
                      style: RuanTextStyle.displayMedium,
                    ),
                    const SizedBox(height: PrimaryTokens.spacingLg),
                    RuanCard(
                      elevation: RuanCardElevation.medium,
                      padding: const EdgeInsets.all(PrimaryTokens.spacingMd),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const RuanText(
                            'Saldo na conta',
                            style: RuanTextStyle.label,
                          ),
                          const SizedBox(height: PrimaryTokens.spacingXs),
                          RuanText(
                            _formatCurrency(mockBalance),
                            style: RuanTextStyle.displayLarge,
                            color: PrimaryTokens.primary600,
                          ),
                          const SizedBox(height: PrimaryTokens.spacingMd),
                          const RuanText(
                            'Rendimentos no mês',
                            style: RuanTextStyle.bodySmall,
                          ),
                          const SizedBox(height: PrimaryTokens.spacingXs),
                          RuanText(
                            _formatCurrency(mockEarnings),
                            style: RuanTextStyle.title,
                            color: SecondaryTokens.success,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: PrimaryTokens.spacingLg),
                    const RuanText(
                      'Ações rápidas',
                      style: RuanTextStyle.headline,
                    ),
                    const SizedBox(height: PrimaryTokens.spacingSm),
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 44,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  physics: const ClampingScrollPhysics(),
                  padding: const EdgeInsets.symmetric(
                    horizontal: PrimaryTokens.spacingMd,
                  ),
                  itemCount: quickActions.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.only(
                        right: index < quickActions.length - 1
                            ? PrimaryTokens.spacingSm
                            : 0,
                      ),
                      child: RuanButton(
                        label: quickActions[index],
                        size: RuanButtonSize.small,
                        variant: RuanButtonVariant.outline,
                        onPressed: () {},
                      ),
                    );
                  },
                ),
              ),
            ),
            const SliverToBoxAdapter(
              child: SizedBox(height: PrimaryTokens.spacingLg),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: PrimaryTokens.spacingMd,
                ),
                child: const RuanText(
                  'Últimas transações',
                  style: RuanTextStyle.headline,
                ),
              ),
            ),
            const SliverToBoxAdapter(
              child: SizedBox(height: PrimaryTokens.spacingSm),
            ),
            SliverPadding(
              padding: const EdgeInsets.only(
                left: PrimaryTokens.spacingMd,
                right: PrimaryTokens.spacingMd,
                bottom: PrimaryTokens.spacingLg,
              ),
              sliver: SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    final transaction = mockTransactions[index];
                    return Padding(
                      padding: const EdgeInsets.only(
                        bottom: PrimaryTokens.spacingSm,
                      ),
                      child: RuanCard(
                        elevation: RuanCardElevation.low,
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute<void>(
                              builder: (_) =>
                                  TransactionDetailScreen(
                                    transaction: transaction,
                                  ),
                            ),
                          );
                        },
                        child: Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  RuanText(
                                    transaction.title,
                                    style: RuanTextStyle.title,
                                  ),
                                  const SizedBox(height: PrimaryTokens.spacingXs),
                                  RuanText(
                                    transaction.formattedDate,
                                    style: RuanTextStyle.bodySmall,
                                  ),
                                ],
                              ),
                            ),
                            RuanText(
                              transaction.formattedAmount,
                              style: RuanTextStyle.title,
                              color: transaction.type == TransactionType.credit
                                  ? SecondaryTokens.success
                                  : PrimaryTokens.neutral800,
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  childCount: mockTransactions.length,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

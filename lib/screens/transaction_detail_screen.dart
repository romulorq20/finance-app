import 'package:flutter/material.dart';
import 'package:ruan_design_system/ruan_design_system.dart';

import '../models/transaction.dart';

class TransactionDetailScreen extends StatelessWidget {
  const TransactionDetailScreen({
    super.key,
    required this.transaction,
  });

  final Transaction transaction;

  static String _formatCurrency(double value) {
    return 'R\$${value.toStringAsFixed(2).replaceAll('.', ',')}';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const RuanText(
          'Detalhes da transação',
          style: RuanTextStyle.title,
        ),
        backgroundColor: PrimaryTokens.neutral0,
        foregroundColor: PrimaryTokens.neutral800,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(PrimaryTokens.spacingMd),
            child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              RuanCard(
                elevation: RuanCardElevation.medium,
                padding: const EdgeInsets.all(PrimaryTokens.spacingLg),
                child: Column(
                  children: [
                    RuanText(
                      transaction.formattedAmount,
                      style: RuanTextStyle.displayLarge,
                      color: transaction.type == TransactionType.credit
                          ? SecondaryTokens.success
                          : PrimaryTokens.neutral800,
                    ),
                    const SizedBox(height: PrimaryTokens.spacingMd),
                    RuanText(
                      transaction.title,
                      style: RuanTextStyle.headline,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: PrimaryTokens.spacingXs),
                    RuanText(
                      transaction.formattedDate,
                      style: RuanTextStyle.bodyMedium,
                      color: PrimaryTokens.neutral500,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: PrimaryTokens.spacingLg),
              RuanCard(
                elevation: RuanCardElevation.low,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _DetailRow(
                      label: 'Valor',
                      value: _formatCurrency(transaction.amount),
                    ),
                    Divider(height: 1, color: PrimaryTokens.neutral200),
                    _DetailRow(
                      label: 'Tipo',
                      value: transaction.type == TransactionType.credit
                          ? 'Crédito'
                          : 'Débito',
                    ),
                    Divider(height: 1, color: PrimaryTokens.neutral200),
                    _DetailRow(
                      label: 'Data',
                      value: transaction.formattedDate,
                    ),
                    Divider(height: 1, color: PrimaryTokens.neutral200),
                    _DetailRow(
                      label: 'Descrição',
                      value: transaction.title,
                    ),
                  ],
                ),
              ),
            ],
            ),
          ),
        ),
      ),
    );
  }
}

class _DetailRow extends StatelessWidget {
  const _DetailRow({required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: PrimaryTokens.spacingSm,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          RuanText(label, style: RuanTextStyle.bodySmall),
          RuanText(value, style: RuanTextStyle.bodyMedium),
        ],
      ),
    );
  }
}

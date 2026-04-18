// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transactions_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$transactionsNotifierHash() =>
    r'db811b2e76570e13b74b1697db8be168a8611193';

/// See also [TransactionsNotifier].
@ProviderFor(TransactionsNotifier)
final transactionsNotifierProvider =
    AutoDisposeAsyncNotifierProvider<
      TransactionsNotifier,
      List<TransactionEntity>
    >.internal(
      TransactionsNotifier.new,
      name: r'transactionsNotifierProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$transactionsNotifierHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$TransactionsNotifier =
    AutoDisposeAsyncNotifier<List<TransactionEntity>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package

import 'package:akkredit/extensions/extensions.dart';
import 'package:flutter/services.dart';
import 'package:stellar_flutter_sdk/stellar_flutter_sdk.dart';

class CreateNFT {
  Future<void> createTickets({
    required StellarSDK sdk,
    required Network network,
  }) async {
    final sourceKeyPair = KeyPair.fromSecretSeed(
      "SC52E6FYNV2H2GIXUMS5NNVX5TG3TPUTLYQGOO7EXDIWUD2UVXEILKKG",
    );

    final issuingKeyPair = KeyPair.fromSecretSeed(
      "SAMPSNOZHWOJZQR6O4BQHWPHNIDCPRQIPKXHK7GTXOOWZSQT7YMRYOCD",
    );

    final sourceAccount = await sdk.accounts.account(
      sourceKeyPair.accountId,
    );
    print("Source account balance:");
    sourceAccount.printBalances();
    print('');

    var issuingAccount = await sdk.accounts.account(
      issuingKeyPair.accountId,
    );
    print('Source:${sourceKeyPair.accountId}');
    print("Issuing account balance:");
    issuingAccount.printBalances();
    print('');

    // Add asset and set the issuer account
    final asset = Asset.createNonNativeAsset(
      "TCKT",
      issuingAccount.accountId,
    );

    // Creat a trustline from the receiving account (source) to the issuing account
    final trustlineBuilder = ChangeTrustOperationBuilder(
      asset,
      "100",
    );

    // Execute a payment from the issuing account to the receiving account (source)
    final fundingBuilder = PaymentOperationBuilder(
      sourceAccount.accountId,
      asset,
      "0.0000001",
    ).setSourceAccount(issuingKeyPair.accountId);
    final setoption = SetOptionsOperationBuilder().setMasterKeyWeight(0);
    final transactionBuilder = TransactionBuilder(sourceAccount)
      ..addOperation(trustlineBuilder.build())
      ..addOperation(fundingBuilder.build()).addOperation(setoption.build());

    final transaction = transactionBuilder.build()
      ..sign(sourceKeyPair, network)
      ..sign(issuingKeyPair, network);

    final result = await sdk.submitTransaction(
      transaction,
    );

    result.printResult();
  }
}

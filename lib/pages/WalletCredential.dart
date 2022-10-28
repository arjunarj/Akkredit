import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:stellar_flutter_sdk/stellar_flutter_sdk.dart';

class CryptoWallet extends StatefulWidget {
  const CryptoWallet({super.key});

  @override
  State<CryptoWallet> createState() => _CryptoWalletState();
}

class _CryptoWalletState extends State<CryptoWallet> {
  final StellarSDK blknet = StellarSDK.TESTNET;
  String address = '';
  String? accBalance = '';
  String mnemonicString = '';
  late KeyPair keyPair;
  void createAccount() async {
    String mnemonicString1 = await Wallet.generate24WordsMnemonic();
    setState(() {
      mnemonicString = mnemonicString1;
    });
    Wallet wallet = await Wallet.from(mnemonicString);
    keyPair = await wallet.getKeyPair(index: 0);
    print("${keyPair.accountId} : ${keyPair.secretSeed}");
    setState(() {
      address = keyPair.accountId;
    });
    // mnemonic = await Wallet.generate24WordsMnemonic();
  }

  void getCredits() async {
    bool funded = await FriendBot.fundTestAccount(keyPair.accountId);
    print("funded: ${funded}");
    AccountResponse account = await blknet.accounts.account(address);
    var balances = account.balances;
    setState(() {
      accBalance = balances![0]!.balance;
    });
  }

  @override
  Widget build(BuildContext context) {
    return 
        Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          Text("Current Address :${address}"),
          SizedBox(
            height: 2,
          ),
          Text("Current mnemonic :${mnemonicString}"),
          TextButton(
            child: Text("Click to create account"),
            onPressed: createAccount,
          ),
          Divider(
            thickness: 1,
            color: Colors.green,
          ),
          SizedBox(
            height: 10,
          ),
          Text("Balance:${accBalance} XLM"),
          SizedBox(
            height: 2,
          ),
          TextButton(onPressed: getCredits, child: Text("Get Credits"))
        ],
      ),
    );
  }
}

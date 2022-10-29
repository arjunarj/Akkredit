import 'package:flutter/material.dart';
import 'package:stellar_flutter_sdk/stellar_flutter_sdk.dart';
import 'package:akkredit/functions/create_nft.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child:
          TextButton(
            child: Text("Tap to create NFT"),
            onPressed: () => CreateNFT().createTickets(
                sdk: StellarSDK.TESTNET, network: Network.TESTNET),
      ));
  }
}

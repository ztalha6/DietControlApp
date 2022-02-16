import 'dart:async';

import 'package:flutter/material.dart';
import 'package:in_app_purchase/in_app_purchase.dart';

class SubscribeView extends StatefulWidget {
  const SubscribeView({Key? key}) : super(key: key);

  @override
  State<SubscribeView> createState() => _SubscribeViewState();
}

class _SubscribeViewState extends State<SubscribeView> {
  TextStyle testStyle = const TextStyle(fontWeight: FontWeight.w600);
  // StreamSubscription<List<PurchaseDetails>> _subscription;
  @override
  void initState() {
    // final Stream purchaseUpdated = InAppPurchase.instance.purchaseStream;
    // _subscription = purchaseUpdated.listen((purchaseDetailsList) {
    //   _listenToPurchaseUpdated(purchaseDetailsList);
    // }, onDone: () {
    //   _subscription.cancel();
    // }, onError: (error) {
    //   // handle error here.
    // });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 30, 20, 30),
                child: Row(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.height * 0.340,
                      child: Text(
                        'Unlock unlimited access',
                        style: Theme.of(context).textTheme.headline6,
                        maxLines: 2,
                      ),
                    ),
                    InkWell(
                      onTap: () => Navigator.pop(context),
                      child: Container(
                        padding: const EdgeInsets.all(14),
                        decoration: const BoxDecoration(
                          // ignore: use_full_hex_values_for_flutter_colors
                          color: Color.fromARGB(51, 173, 175, 178),
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                        ),
                        child: const Icon(
                          Icons.close,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Image.asset(
                'assets/images/subscribe.png',
                fit: BoxFit.fill,
              ),
              Transform.translate(
                offset: const Offset(0, -15),
                child: Column(
                  children: [
                    Text(
                      'No Ads',
                      style: testStyle,
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'More storage',
                      style: testStyle,
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'More features',
                      style: testStyle,
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'Greater experiance',
                      style: testStyle,
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'For just',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Color(0xFFFE724C),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          '0.99\$',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 48,
                          ),
                        ),
                        Transform.translate(
                          offset: const Offset(5, 10),
                          child: Text(
                            '/month',
                            style: testStyle,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          'you can pause or cancel your subscription at any time',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: ElevatedButton(
                        onPressed: () => getSub(),
                        style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0),
                              side: BorderSide(
                                color: Theme.of(context).primaryColor,
                              ),
                            ),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Text(
                                "Subscribe",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Color.fromARGB(
                                    255,
                                    255,
                                    255,
                                    255,
                                  ),
                                  fontWeight: FontWeight.w400,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

getSub() async {
  final bool available = await InAppPurchase.instance.isAvailable();
  if (!available) {
    // The store cannot be reached or accessed. Update the UI accordingly.
  }
}

// void _listenToPurchaseUpdated(List<PurchaseDetails> purchaseDetailsList) {
//   purchaseDetailsList.forEach((PurchaseDetails purchaseDetails) async {
//     if (purchaseDetails.status == PurchaseStatus.pending) {
//       _showPendingUI();
//     } else {
//       if (purchaseDetails.status == PurchaseStatus.error) {
//         _handleError(purchaseDetails.error!);
//       } else if (purchaseDetails.status == PurchaseStatus.purchased ||
//           purchaseDetails.status == PurchaseStatus.restored) {
//         bool valid = await _verifyPurchase(purchaseDetails);
//         if (valid) {
//           _deliverProduct(purchaseDetails);
//         } else {
//           _handleInvalidPurchase(purchaseDetails);
//         }
//       }
//       if (purchaseDetails.pendingCompletePurchase) {
//         await InAppPurchase.instance.completePurchase(purchaseDetails);
//       }
//     }
//   });
// }

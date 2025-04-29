import 'package:flutter/material.dart';
import '../../models/responses/transaction_model.dart';

class TransactionListPage extends StatelessWidget {
  final List<TransactionModel> transactions;

  const TransactionListPage({super.key, required this.transactions});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            const Text('Transactions', style: TextStyle(color: Colors.white)),
        // backgroundColor: const Color(0xFF405189),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: transactions.isEmpty
          ? const Center(child: Text("No transactions available"))
          : ListView.builder(
              // padding: const EdgeInsets.all(10),
              itemCount: transactions.length,
              itemBuilder: (context, index) {
                final txn = transactions[index];
                return Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.zero, // This removes the roundness
                  ),
                  elevation: 0,
                  child: Stack(
                    children: [
                      // The border positioned at the bottom (excluding leading space)
                      Positioned(
                        left: 0, // Matches typical leading icon width + padding
                        right: 0,
                        bottom: 0,
                        child: Container(
                          height: 1,
                          color: Colors.grey,
                        ),
                      ),
                      // The ListTile content
                      ListTile(
                        leading: Icon(
                          Icons.money_outlined,
                          color: Colors.grey,
                        ),
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("${txn.price} - ${txn.currency}"),
                            Text(
                              '#${txn.ref.toString()}',
                              style: const TextStyle(color: Colors.grey),
                            ),
                          ],
                        ),
                        subtitle: Padding(
                          padding: const EdgeInsets.only(top: 4),
                          child: Text(
                            txn.docDate.toString(),
                            style: const TextStyle(color: Colors.grey),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
    );
  }
}

import 'package:payments_app/model/transaction.dart';

class TransactionsProvider {
   static final List<Transaction> transactions = [
     Transaction(name: "Toys R Us", timestamp: "Jan 29, 2019", amount: "- \$499"),
     Transaction(name: "Landmark", timestamp: "Jan 9, 2019", amount: "- \$356"),
     Transaction(name: "D - Mart", timestamp: "Feb 29, 2018", amount: "- \$75"),
     Transaction(name: "Toys R Us", timestamp: "March 29, 2018", amount: "- \$89"),

   ];
}
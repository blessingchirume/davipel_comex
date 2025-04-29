class ApiConstants {
  // headers
  static const acceptType = 'application/json';
  static const contentType = 'application/json';

  // base uri
  // static const baseUrl = 'https://test-bot.eazzypay.co.zw/api/';

  static const baseUrl = 'https://41.60.205.126:444/api/';

  // endpoints
  static const login = '${baseUrl}auth/login';

  static const history = '${baseUrl}order';
  static const products = '${baseUrl}product';
  static const postOrder = '${baseUrl}order';
  static const orderDetails = '${baseUrl}order/details';
  static const customers = '${baseUrl}customer';
  static const changePassword = '${baseUrl}auth/password';
  static const uploadPo = '${baseUrl}order/update';
  static const approve = '${baseUrl}order/approve';
  static const grv = '${baseUrl}grv';
  static const inventory = '${baseUrl}inventory/request';
  static const stockTransfer = '${baseUrl}stock/transfer';
  static const tax = '${baseUrl}taxcodes';

  static const transactionHistory = '${baseUrl}transaction-history';

  static const agentBalance = '${baseUrl}agent-balance';

  static const lastTransaction = '${baseUrl}last-transaction';

  static const dayTransactions = '${baseUrl}daily-transaction-history';

  static const makePayment = '${baseUrl}payment';

  static const makeTeloneDirectPayment = '${baseUrl}telone-direct-purchase';

  static const teloneProducts = '${baseUrl}telone-products';

  static const teloneProductStocks = '${baseUrl}telone-product-stocks';

  static const netoneProductStocks = '${baseUrl}netone-stocks';

  static const agentFloat = '${baseUrl}float/top-up';

  static const econetBundles = '${baseUrl}bundles/econet';
}

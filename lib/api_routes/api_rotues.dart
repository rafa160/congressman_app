class ApiRoutes {

  static const url = 'https://dadosabertos.camara.leg.br';
  static const apiVersion = '/api/v2/';
  static const congressmanId = 'deputados?id=';
  static const orderByName = '&ordem=ASC&ordenarPor=nome';

  static const baseUrl = 'https://dadosabertos.camara.leg.br/api/v2/deputados?ordem=ASC&ordenarPor=siglaUF';

  //EXPENSES ROUTES
  static const orderExpensesRoute = '/despesas?ordem=ASC&ordenarPor=ano';
  static const congressman = 'deputados/';

}
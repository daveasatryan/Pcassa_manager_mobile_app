//Requests names from BackEnd

class Requests {
  static String info = '/info';
  static String login = '/signinlogin';
  static String products = '/menuman';
  static String users = '/user';
  static String getDiscounts = '/discountadd';
  static String postDiscounts = '/discount';
  static String currencys = '/valyutaadd';
  static String changeGroupe = '/changegroup';
  static String createGroup = '/category';
  static String unit = '/edizm';
  static String categoryProduct = '/kattov';
  static String accessType = '/tipdostup';
  static String accessNote = '/sprdostup';
  static String changeLanguage = '/changedlanguage';
  static String postAccessNote = '/itemstipdostup';
  static String spent = '/zatrat';
  static String warehouse = '/sklad';
  static String stationType = '/vidkassa';
  static String getContragents = '/kontragent';
  static String contragentsGroupDeleteAndPost = '/gruppakor';
  static String contragentsGroupChange = '/changegruppkor';
  static String searchProductByName = '/searchman?q=';
  static String searchProductByBarcode = '/scanman';
  static String openNakl = '/opennakl';
  static String naklorder = '/naklorder';
  static String openDocument = '/opennaklorder';
  static String deleteDocument = '/nakldelete';
  static String deleteProduct = '/tovardelete';
  static String cahsOrderCreate = '/openkassaorg';
  static String openakt = '/openakt';
  static String aktopen = '/aktopen';
  static String aktdelete = '/aktdelete';
  static String openaktorder = '/openaktorder';
  static String getRkoPkoList = '/kassaorgorder';
  static String deleteRkoPkoList = '/kassaorgdelete';
  static String openRkoPko = '/openkassaorgorder';
  static String ostatok = '/ostatok?limit=20&page=';
  static String aktRealization = '/aktrealizatsia?limit=20&page=';
  static String getViruchka = '/viruchkaman';
  static String saledProductMan = '/saleproductsman';
  static String getContragentReport = '/balansekont';
   
  static String getOborotVedom = '/oborotvedomost?limit=20&page=';
  static String addLicense = '/addlicense';
   static String checklicense = '/checklicense';
}

class RepositoryService {
  const RepositoryService();

  static String? _basicURL;

  static String get basicURL => _basicURL!;

  static void developementService() {
    _basicURL ??= "https://news-goserver.herokuapp.com";
  }

  static void productionService() {
    _basicURL ??= "https://news-goserver.herokuapp.com";
  }
}

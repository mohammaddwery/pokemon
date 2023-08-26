class ApiUtils {
  static String buildApiEndpoint({required String subdirectory, String? path, String? action, String? queryParams}) {
    final List<String> urlSegments = [ subdirectory ];
    if(path != null) urlSegments.add('/$path');
    if(action != null) urlSegments.add('/$action');
    if(queryParams != null) urlSegments.add(queryParams);

    return urlSegments.join();
  }

  static String buildApiQuery(Map<String, dynamic> map) {
    getQueryPart(key, value) {
      return value != null && value != "" ? "$key=$value" : "";
    }

    String searchQuery = '';
    map.forEach((key, value) {
      String queryPart = getQueryPart(key, value);
      if (searchQuery.isNotEmpty) {
        searchQuery = queryPart.isNotEmpty ? '$searchQuery&$queryPart' : searchQuery;
      } else {
          searchQuery = queryPart.isNotEmpty ? '$searchQuery?$queryPart' : searchQuery;
        }
    });
    return searchQuery;
  }
}
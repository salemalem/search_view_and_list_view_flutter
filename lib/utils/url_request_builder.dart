String returnBuildedUrl(String query) {
  var url = Uri.http("mp3-tut.net", "/search", { "query" : query });
  // https://mp3-tut.net/search?query=lil%20yachty
  return url.toString();
}
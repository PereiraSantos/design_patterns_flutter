class NetflixApi {
  const NetflixApi();

  bool connect() => true;

  bool discount() => false;

  void play(String title) {
    print("$title has started start playing on netflix");
  }
}

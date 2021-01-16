class CategoryType {
  static const String artist = "assets/images/category/artist.jpg";
  static const String database = "assets/images/category/database.jpg";
  static const String game = "assets/images/category/game.jpg";
  static const String mobile = "assets/images/category/mobile.png";
  static const String other = "assets/images/category/other.jpg";
  static const String projectmanager = "assets/images/category/projectmanager.jpg";
  static const String testing = "assets/images/category/testing.jpg";
  static const String web = "assets/images/category/web.png";
  static const String windows = "assets/images/category/windows.jpg";

  static const String id_artist = "b8a345df-3b8e-4a4f-b592-6c6c2f230fdc";
  static const String id_database = "edbc17da-ef55-4e83-a028-ba9657600f0b";
  static const String id_game = "a4015252-542a-4482-b087-4cfa85f2b953";
  static const String id_mobile = "847dce36-f43b-4714-982d-e65812b40b5e";
  static const String id_projectmanager = "8d919542-d44d-444c-8623-4d9c4063ed82";
  static const String id_testing = "93959023-5ff2-4bb8-beb2-c42dbe3dc2dd";
  static const String id_web = "4eb0c150-8212-44ef-a90b-fcd40130ac01";
  static const String id_windows = "eaa881b9-def6-429b-94e2-27b466862bc0";

  static getValue(String id) {
    switch(id) {
      case id_artist:
        return artist;

      case id_database:
        return database;

      case id_game:
        return game;

      case id_mobile:
        return mobile;

      case id_projectmanager:
        return projectmanager;

      case id_testing:
        return testing;

      case id_web:
        return web;

      case id_windows:
        return windows;

      default:
        return other;
    }
  }
}
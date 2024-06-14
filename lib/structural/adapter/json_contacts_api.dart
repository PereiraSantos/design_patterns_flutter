class JsonContactsApi {
  static const _constactJson = '''
  {
    "contacts": [
      {
        "fullName": "Jhon Doe(JSON)",
        "email": "johndoe@json",
        "favourite": true
      },
      {
        "fullName": "Jhon Doe(JSON)",
        "email": "Maria@json",
        "favourite": false
      },
      {
        "fullName": "Michal Doe(JSON)",
        "email": "Jose@json",
        "favourite": true
      }
    ]
  }
  ''';

  const JsonContactsApi();

  String getContactJson() => _constactJson;
}

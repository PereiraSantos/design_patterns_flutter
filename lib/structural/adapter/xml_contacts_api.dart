class XmlContactsApi {
  static const _contactsXml = '''
  <?xml version="1.0"?>
  <contacts>
    <contact>
      <fullname> Jhon Dow(XML) </fullname>
      <email>johndoe@json</email>
      <favourite>false</favourite>
    </contact>
    <contact>
      <fullname> Maria(XML) </fullname>
      <email>Maria@json</email>
      <favourite>false</favourite>
    </contact>
    <contact>
      <fullname> Jhon Dow(XML) </fullname>
      <email>Jose@json</email>
      <favourite>true</favourite>
    </contact>
  </contacts>
  ''';

  const XmlContactsApi();

  String getContactXml() => _contactsXml;
}

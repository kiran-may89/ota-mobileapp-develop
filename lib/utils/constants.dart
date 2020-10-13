class Constants {
  static String PRODUCTION_BASEURL = "https://api.otadevtest.com/";

  static String DEV_BASEURL = "https://api.otadevtest.com/";
  static String CALLBACK_URL = "com.tripshop.ota://login-callback";

  static String AUTH0_DOMAIN = 'https://sso-stage.trvlshop.com/';
  static String AUTH0_CLIENT_ID = 'mobile_client';

  static String AUTH0_REDIRECT_URI = 'com.tripshop.ota://login-callback';
  static String AUTH0_ISSUER = 'https://sso.otadevtest.com/';
  static List<String> AUTH_SCOPE = [
    'openid',
    'offline_access',
    'auth_api',
    'search_api',
    'payment_api profile_api',
    'notification_api',
    'common_api',
    'booking_api'
  ];

  static final String OTA_API_KEY = "X-OTA-APIKEY";
  static final String OTA_PLAT_FORM = "X-OTA-PLATFORM";
  // ignore: non_constant_identifier_names
  static final String X_OTA_TIMESTAMP = "X-OTA-TIMESTAMP";
  static String TOKEN =
      "eyJhbGciOiJSUzI1NiIsImtpZCI6IlAzYlRfc3pJZzNiVHlHX0NRSUxFVkEiLCJ0eXAiOiJhdCtqd3QifQ.eyJuYmYiOjE2MDAwMTM0MjQsImV4cCI6MTYwMDAxNzAyNCwiaXNzIjoiaHR0cHM6Ly9zc28tdGVzdC5vdGFkZXZ0ZXN0LmNvbSIsImF1ZCI6WyJhdXRoX2FwaSIsImJvb2tpbmdfYXBpIiwiY29tbW9uX2FwaSIsIm5vdGlmaWNhdGlvbl9hcGkiLCJwYXltZW50X2FwaSIsInByb2ZpbGVfYXBpIiwic2VhcmNoX2FwaSJdLCJjbGllbnRfaWQiOiJtaWNyb3NlcnZpY2VfY2xpbmV0aWQiLCJzdWIiOiJiMTI2NTgyNS1hNDdmLTQ2ZDUtODAwOS0zZTNjY2M3NGI4ZGIiLCJhdXRoX3RpbWUiOjE2MDAwMTM0MjQsImlkcCI6ImxvY2FsIiwibmFtZSI6Ikd1ZXN0IiwiRmlyc3ROYW1lIjoiR3Vlc3QiLCJMYXN0TmFtZSI6IlVzZXIiLCJQaG9uZU51bWJlciI6IjkxIDg2ODY1MDgwMjAiLCJFbWFpbCI6InRyaXBzaG9wZ3Vlc3R1c2VyQGdtYWlsLmNvbSIsIlRlbmFudElkIjoiMDAwMDAwMDAtMDAwMC0wMDAwLTAwMDAtMDAwMDAwMDAwMDAxIiwiVXNlclR5cGUiOiJiYyIsInJvbGUiOiJUcmlwU2hvcCBQb3J0YWwgVXNlciIsInNjb3BlIjpbIm9wZW5pZCIsImF1dGhfYXBpIiwiYm9va2luZ19hcGkiLCJjb21tb25fYXBpIiwibm90aWZpY2F0aW9uX2FwaSIsInBheW1lbnRfYXBpIiwicHJvZmlsZV9hcGkiLCJzZWFyY2hfYXBpIl0sImFtciI6WyJwd2QiXX0.AGy8pPo-F0dqt9IIg-IkIsvKHf6ekBWcxdQOsYDE8lP5A7kzkJWcuIMeH-iSsWXgWRDleqkgi4sopVzg-SqwQbjcrbFd126CPkxDKoVHrtacFIOO_crj53twt-OsJn0ik-Bh4ygVVR6-mJIMoqQKMJYgsTpStE-w_dwGYFsRKVTrXOcJSTO0NruewztbkmFfZprILNo-nkUwLGD6JH0eeJtRZmsVz692nUbBHBWjktCyMXwCJjN5nGaIm6PGg0iNArEChGYWvv6JhAtDiQ0efOQJM9rVSpuH6wdWgvbTrKhR_kDRg3q0WIQ8zgAKE1vxcJVI6WMdAN340gJUbYK7PA";
}

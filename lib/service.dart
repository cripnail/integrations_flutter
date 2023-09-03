import 'dummy/dummy_service.dart'
    if (dart.library.html) 'web/web_service.dart'
    if (dart.library.io) 'mobile/my_home_page.dart';

    abstract class PlatformService{
        // your implementation here
    }
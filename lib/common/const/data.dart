import 'dart:io';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

const ACCESS_TOKEN_KEY = 'ACCESS_TOKEN';
const REFRESH_TOKEN_KEY = 'REFRESH_TOKEN';

final storage = const FlutterSecureStorage();
    //요청 보낼 local host 설정하는 것. 안드로이드 에뮬레이터에서만 필요한 과정.
    final emulatorIp = '10.0.2.2:3000';
    final simulatorIp = '127.0.0.1:3000';
    final ip = Platform.isIOS ? simulatorIp : emulatorIp;
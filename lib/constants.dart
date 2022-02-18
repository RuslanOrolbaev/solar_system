const int fps = 24;
const int microsecondsInSecond = 1000000;
const int frameRenewalTimeInMicroseconds = microsecondsInSecond ~/ fps;
const String buildMessage = 'running build';
const String disposeMessage = 'running dispose';
const String initMessage = 'running initState';

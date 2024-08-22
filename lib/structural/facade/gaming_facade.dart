import 'package:pattern/structural/facade/camera_api.dart';
import 'package:pattern/structural/facade/play_station_api.dart';
import 'package:pattern/structural/facade/smart_home_state.dart';

class GamingFacede {
  const GamingFacede({
    this.playStationApi = const PlayStationApi(),
    this.cameraApi = const CameraApi(),
  });

  final PlayStationApi playStationApi;
  final CameraApi cameraApi;

  void startGamming(SmartHomeState smartHomeState) {
    smartHomeState.gamingConsoleOn = playStationApi.turnOn();
  }

  void stopGamming(SmartHomeState smartHomeState) {
    smartHomeState.gamingConsoleOn = playStationApi.turnOff();
  }

  void startStreaming(SmartHomeState smartHomeState) {
    smartHomeState.streamingCameraOn = cameraApi.turnCameraOn();
    startGamming(smartHomeState);
  }

  void stopStreaming(SmartHomeState smartHomeState) {
    smartHomeState.streamingCameraOn = cameraApi.turnCameraOn();
    startGamming(smartHomeState);
  }
}

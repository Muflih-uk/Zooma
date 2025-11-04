import '../../../core/network/api_service.dart';

class LeaderboardService {
  final ApiService apiService;

  LeaderboardService(this.apiService);

  Future<List<Map<String, dynamic>>> getRoomLeaderboard(String roomCode) async {
    try{
      final response = await apiService.get("game/leaderboard/?room_code=$roomCode");
      if (response.statusCode == 200 || response.statusCode == 201) {
        return response.data;
      }
      return [{"":""}];
    }catch (e) {
      return [{"":""}];
    }
  }

  Future<Map<String, dynamic>> getPlayerStats(String playerId) async {
    final response = await apiService.get('/api/players/$playerId/stats');
    return response.data;
  }

  Future<Map<String, dynamic>> getRoomAnalytics(String roomCode) async {
    final response = await apiService.get('/api/mentor/$roomCode/analytics');
    return response.data;
  }
}
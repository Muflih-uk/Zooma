import '../../../core/network/api_service.dart';

class RoomService {
  final ApiService apiService;

  RoomService(this.apiService);

  Future<String> createRoom({
    required int numberOfQuestion,
    required int maxPlayers,
    required String id,
  }) async {
    try {
      final response = await apiService.post(
        'room/create/',
        data: {
          "mentor_id": id,
          "max_players": maxPlayers,
          "num_questions": numberOfQuestion
        }
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        return response.data["code"];
      }
      return "Could not Generate Code";
    } catch (e) {
      return "Server Issue";
    }
  }


  Future<bool> joinRoom(String roomCode, String playerId) async {
    try {
      final response = await apiService.post(
        'room/join/', 
        data: {
          "room_code": roomCode,
          "player_id": playerId
      });
      if(response.statusCode == 200 || response.statusCode == 201){
        return true; 
      }
      return false;
    } catch(e){
      return false; 
    }
  }

  // Future<Room> getRoomDetails(String roomCode) async {
  //   final response = await apiService.get('/api/rooms/$roomCode');
  //   return Room.fromJson(response.data);
  // }

  // Future<void> updateRoomStatus(String roomCode, String status) async {
  //   await apiService.put('/api/rooms/$roomCode/status', data: {
  //     'status': status,
  //   });
  // }

}
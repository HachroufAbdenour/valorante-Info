// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:valorantegame/data/web_services/web_services.dart';

class Repolayer {

  WebService apiProvider;
  Repolayer( this.apiProvider);

  Future<dynamic> getAgent() async {
    return apiProvider.getAgents();
   }
}

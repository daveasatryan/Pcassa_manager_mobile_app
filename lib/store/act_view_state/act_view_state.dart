import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:pcassa_retail/models/act_view_model/act_view_model.dart';
import 'package:pcassa_retail/requests_settings/repositories/services_repository/services_repository.dart';

part 'act_view_state.g.dart';

//State for Autorisation
class ActViewState = ActViewStateBase with _$ActViewState;

//var naklInfo = GetIt.I<NaklInfoState>();
abstract class ActViewStateBase with Store {
  @observable
  List<ActViewModel> actViewInfo = ObservableList<ActViewModel>();
  @action
  getActList(
      {String? n_dok="",
      String? data_s="",
      String? data_e="",
      String? kontname="",
      String? zatratname=""
      }) async {
    final result = await ServicesResponsitorie.getActView(
        n_dok: n_dok,
        data_s: data_s,
        data_e: data_e,
        kontname: kontname,
        zatratname: zatratname
        );
    actViewInfo = result;
  }
  @action
  delActFromList({
    required int id,
    String n_dok = "",
    String data_s= "",
     String data_e= "",
     String kontname= "",
    String zatratname= ""
  }) async {
    final result = await ServicesResponsitorie.delActView(
        id: id,
        n_dok: n_dok,
        data_s: data_s,
        data_e: data_e,
        kontname: kontname,
        zatratname: zatratname
        );
    actViewInfo = result;
  }
  @action
  searchActForView({
    required int id,
  }) async {
    final result = await ServicesResponsitorie.searchActView(
        id: id
        );
    return result;
  }
}

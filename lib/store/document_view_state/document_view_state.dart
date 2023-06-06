import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:pcassa_retail/models/nakladnoy_view_model/nakladnoy_view_model.dart';
import 'package:pcassa_retail/requests_settings/repositories/services_repository/services_repository.dart';
import 'package:pcassa_retail/store/nakl_info_state/nakl_info_state.dart';

part 'document_view_state.g.dart';

//State for Autorisation
class DocumentViewState = DocumentViewStateBase with _$DocumentViewState;
var naklInfo = GetIt.I<NaklInfoState>();
abstract class DocumentViewStateBase with Store {
  @observable
  ObservableList<NaklViewModel> naklViewInfo = ObservableList<NaklViewModel>();
  @action
  getDocument(
      {String? n_dok,
      String? data_s,
      String? data_e,
      String? tip_name,
      String? kontname,
      String? skl1name,
      String? skl2name,
      int? aktiv}) async {
    final result = await ServicesResponsitorie.getDocuments(
        n_dok: n_dok,
        data_s: data_s,
        data_e: data_e,
        tip_name: tip_name,
        kontname: kontname,
        skl1name: skl1name,
        skl2name: skl2name,
        aktiv: aktiv);
    for (int i = 0; i < result.length; i++) {
      naklViewInfo.add(result[i]);
    }
  }

  @action 
  openDocument({required int id})async {
    final result = await ServicesResponsitorie.openDocument(id: id);
    naklInfo.naklInfoItems = result.naklinfo;
    naklInfo. naklInfoTovars = result.tovar.asObservable();
  }

    @action
  deleteDocument(
    
      {int? id,
        String? n_dok,
      String? data_s,
      String? data_e,
      String? tip_name,
      String? kontname,
      String? skl1name,
      String? skl2name,
      int? aktiv}) async {
    final result = await ServicesResponsitorie.deleteDocuments(
      id: id,
        n_dok: n_dok,
        data_s: data_s,
        data_e: data_e,
        tip_name: tip_name,
        kontname: kontname,
        skl1name: skl1name,
        skl2name: skl2name,
        aktiv: aktiv);
        naklViewInfo.clear();
    for (int i = 0; i < result.length; i++) {
      naklViewInfo.add(result[i]);
    }
  }
}

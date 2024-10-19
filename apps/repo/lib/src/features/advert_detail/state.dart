import 'package:common_features/advert/domain/entity/advert_detail_entity/advert_detail_entity.dart';
import 'package:common_features/advert/domain/entity/advert_entity.dart';
import 'package:repo/src/core/base/base_state.dart';

class AdvertDetailState extends BaseState {
  final AdvertDetailEntity? advert;

  AdvertDetailState({
    super.pageState,
    super.message,
    super.errorType,
    this.advert,
  });

  @override
  AdvertDetailState copyWith({
    PageState? pageState,
    String? message,
    ErrorType? errorType,
    AdvertDetailEntity? advert,
  }) {
    return AdvertDetailState(
      pageState: pageState ?? this.pageState,
      message: message ?? this.message,
      errorType: errorType ?? this.errorType,
      advert: advert ?? this.advert,
    );
  }

  @override
  List<Object?> get props => [
        pageState,
        message,
        errorType,
        advert,
      ];

  @override
  String toString() {
    return '${super.toString()} AdvertDetailState{advert: $advert}';
  }
}

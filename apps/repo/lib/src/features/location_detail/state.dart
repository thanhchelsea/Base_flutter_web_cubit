import 'package:common_features/advert/domain/entity/advert_detail_entity/advert_detail_entity.dart';
import 'package:common_features/advert/domain/entity/advert_entity.dart';
import 'package:common_features/location/domain/entity/location_detail_entity/location_detail_entity.dart';
import 'package:repo/src/core/base/base_state.dart';

class LocationDetailState extends BaseState {
  final LocationDetailEntity? location;
  List<AdvertEntity> adverts;
  LocationDetailState({
    super.pageState,
    super.message,
    super.errorType,
    this.location,
    this.adverts = const [],
  });

  @override
  LocationDetailState copyWith({
    PageState? pageState,
    String? message,
    ErrorType? errorType,
    LocationDetailEntity? location,
    List<AdvertEntity>? adverts,
  }) {
    return LocationDetailState(
      pageState: pageState ?? this.pageState,
      message: message ?? this.message,
      errorType: errorType ?? this.errorType,
      location: location ?? this.location,
      adverts: adverts ?? this.adverts,
    );
  }

  @override
  List<Object?> get props => [
        pageState,
        message,
        errorType,
        location,
        adverts,
      ];

  @override
  String toString() {
    return '${super.toString()} AdvertDetailState{advert: $location}';
  }
}

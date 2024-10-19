import 'package:common_features/location/domain/entity/location_entity.dart';
import 'package:repo/src/core/base/base_state.dart';

class LocationState extends BaseState {
  final List<LocationEntity> locations;

  LocationState({
    super.pageState,
    super.message,
    super.errorType,
    this.locations = const [],
  });

  @override
  LocationState copyWith({
    PageState? pageState,
    String? message,
    ErrorType? errorType,
    List<LocationEntity>? locations,
  }) {
    return LocationState(
      pageState: pageState ?? this.pageState,
      message: message ?? this.message,
      errorType: errorType ?? this.errorType,
      locations: locations ?? this.locations,
    );
  }

  @override
  List<Object?> get props => [
        pageState,
        message,
        errorType,
        locations,
      ];

  @override
  String toString() {
    return '${super.toString()} AdvertState{locations: $locations}';
  }
}

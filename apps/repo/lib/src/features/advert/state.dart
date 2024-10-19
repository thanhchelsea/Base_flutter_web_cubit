import 'package:common_features/advert/domain/entity/advert_entity.dart';
import 'package:repo/src/core/base/base_state.dart';

class AdvertState extends BaseState {
  final List<AdvertEntity> adverts;

  AdvertState({
    super.pageState,
    super.message,
    super.errorType,
    this.adverts = const [],
  });

  @override
  AdvertState copyWith({
    PageState? pageState,
    String? message,
    ErrorType? errorType,
    List<AdvertEntity>? adverts,
  }) {
    return AdvertState(
      pageState: pageState ?? this.pageState,
      message: message ?? this.message,
      errorType: errorType ?? this.errorType,
      adverts: adverts ?? this.adverts,
    );
  }

  @override
  List<Object?> get props => [
        pageState,
        message,
        errorType,
        adverts,
      ];

  @override
  String toString() {
    return '${super.toString()} AdvertState{locations: $adverts}';
  }
}

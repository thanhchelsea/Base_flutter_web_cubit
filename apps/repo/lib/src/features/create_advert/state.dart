import 'package:common_features/advert/domain/entity/advert_entity.dart';
import 'package:common_features/location/domain/entity/category_entity/category_entity.dart';
import 'package:common_features/location/domain/entity/location_entity.dart';
import 'package:repo/src/core/base/base_state.dart';

class CreateAdvertState extends BaseState {
  int processIndex;
  DateTime? startDate;
  DateTime? endDate;
  bool? isPublish;
  List<CategoryEntity> categories;
  List<LocationEntity> locations;
  List<LocationEntity> locationsSelected;
  List<LocationEntity> locationsCateSelected;
  List<LocationEntity> locationsRaitoSelected;

  AdvertEntity? advert;
  int? adsType;
  CreateAdvertState({
    super.pageState,
    super.message,
    super.errorType,
    this.processIndex = 0,
    this.startDate,
    this.endDate,
    this.isPublish = false,
    this.locations = const [],
    this.locationsSelected = const [],
    this.locationsCateSelected = const [],
    this.locationsRaitoSelected = const [],
    this.advert,
    this.adsType,
    this.categories = const [],
  });

  CreateAdvertState copyWith({
    PageState? pageState,
    String? message,
    ErrorType? errorType,
    int? processIndex,
    DateTime? startDate,
    DateTime? endDate,
    bool? isActive,
    List<LocationEntity>? locations,
    List<LocationEntity>? locationsSelected,
    List<LocationEntity>? locationsCateSelected,
    List<LocationEntity>? locationsRaitoSelected,
    AdvertEntity? advert,
    int? adsType,
    List<CategoryEntity>? categories,
  }) {
    return CreateAdvertState(
      pageState: pageState ?? this.pageState,
      message: message ?? this.message,
      errorType: errorType ?? this.errorType,
      processIndex: processIndex ?? this.processIndex,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      isPublish: isActive ?? this.isPublish,
      locations: locations ?? this.locations,
      advert: advert ?? this.advert,
      adsType: adsType ?? this.adsType,
      locationsSelected: locationsSelected ?? this.locationsSelected,
      locationsCateSelected:
          locationsCateSelected ?? this.locationsCateSelected,
      locationsRaitoSelected:
          locationsRaitoSelected ?? this.locationsRaitoSelected,
      categories: categories ?? this.categories,
    );
  }

  @override
  List<Object?> get props => [
        pageState,
        message,
        errorType,
        processIndex,
        startDate,
        endDate,
        isPublish,
        locations,
        locationsSelected,
        locationsCateSelected,
        locationsRaitoSelected,
        advert,
        adsType,
        categories,
      ];

  @override
  String toString() {
    return '${super.toString()} CreateAdvertState{processIndex: $processIndex, startDate: $startDate, endDate: $endDate, isPublish: $isPublish, locations: $locations}';
  }
}

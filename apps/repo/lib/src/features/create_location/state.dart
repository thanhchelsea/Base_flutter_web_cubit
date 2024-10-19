import 'package:common_features/advert/domain/entity/advert_entity.dart';
import 'package:common_features/location/domain/entity/category_entity/category_entity.dart';
import 'package:common_features/location/domain/entity/location_entity.dart';
import 'package:repo/src/core/base/base_state.dart';

class CreateLocationState extends BaseState {
  int processIndex;
  bool? isActive;
  final List<CategoryEntity> categoies;
  final List<CategoryEntity> categoiesSelected;
  List<AdvertEntity> adverts;
  List<AdvertEntity> advertsSelected;

  LocationEntity? location;
  CreateLocationState({
    super.pageState,
    super.message,
    super.errorType,
    this.processIndex = 0,
    this.isActive = true,
    this.categoies = const [],
    this.categoiesSelected = const [],
    this.adverts = const [],
    this.advertsSelected = const [],
    this.location,
  });

  CreateLocationState copyWith({
    PageState? pageState,
    String? message,
    ErrorType? errorType,
    int? processIndex,
    bool? isActive,
    List<CategoryEntity>? categoies,
    List<CategoryEntity>? categoiesSelected,
    List<AdvertEntity>? adverts,
    List<AdvertEntity>? advertsSelected,
    LocationEntity? location,
  }) {
    return CreateLocationState(
      pageState: pageState ?? this.pageState,
      message: message ?? this.message,
      errorType: errorType ?? this.errorType,
      processIndex: processIndex ?? this.processIndex,
      isActive: isActive ?? this.isActive,
      categoies: categoies ?? this.categoies,
      location: location ?? this.location,
      categoiesSelected: categoiesSelected ?? this.categoiesSelected,
      advertsSelected: advertsSelected ?? this.advertsSelected,
      adverts: adverts ?? this.adverts,
    );
  }

  @override
  List<Object?> get props => [
        pageState,
        message,
        errorType,
        processIndex,
        isActive,
        categoies,
        categoiesSelected,
        location,
        adverts,
        advertsSelected,
      ];

  @override
  String toString() {
    return '${super.toString()}';
  }
}

import 'package:common_features/location/domain/entity/category_entity/category_entity.dart';
import 'package:repo/src/core/base/base_state.dart';

class CategoryState extends BaseState {
  final List<CategoryEntity> categories;

  CategoryState({
    super.pageState,
    super.message,
    super.errorType,
    this.categories = const [],
  });

  @override
  CategoryState copyWith({
    PageState? pageState,
    String? message,
    ErrorType? errorType,
    List<CategoryEntity>? locations,
  }) {
    return CategoryState(
      pageState: pageState ?? this.pageState,
      message: message ?? this.message,
      errorType: errorType ?? this.errorType,
      categories: locations ?? this.categories,
    );
  }

  @override
  List<Object?> get props => [
        pageState,
        message,
        errorType,
        categories,
      ];

  @override
  String toString() {
    return '${super.toString()} AdvertState{locations: $categories}';
  }
}

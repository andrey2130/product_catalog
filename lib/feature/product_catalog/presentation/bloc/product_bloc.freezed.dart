// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ProductEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProductEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProductEvent()';
}


}

/// @nodoc
class $ProductEventCopyWith<$Res>  {
$ProductEventCopyWith(ProductEvent _, $Res Function(ProductEvent) __);
}


/// Adds pattern-matching-related methods to [ProductEvent].
extension ProductEventPatterns on ProductEvent {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( LoadAllProducts value)?  loadAllProducts,TResult Function( ToggleFavorite value)?  toggleFavorite,TResult Function( SearchProducts value)?  searchProducts,TResult Function( AddToBasket value)?  addToBasket,required TResult orElse(),}){
final _that = this;
switch (_that) {
case LoadAllProducts() when loadAllProducts != null:
return loadAllProducts(_that);case ToggleFavorite() when toggleFavorite != null:
return toggleFavorite(_that);case SearchProducts() when searchProducts != null:
return searchProducts(_that);case AddToBasket() when addToBasket != null:
return addToBasket(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( LoadAllProducts value)  loadAllProducts,required TResult Function( ToggleFavorite value)  toggleFavorite,required TResult Function( SearchProducts value)  searchProducts,required TResult Function( AddToBasket value)  addToBasket,}){
final _that = this;
switch (_that) {
case LoadAllProducts():
return loadAllProducts(_that);case ToggleFavorite():
return toggleFavorite(_that);case SearchProducts():
return searchProducts(_that);case AddToBasket():
return addToBasket(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( LoadAllProducts value)?  loadAllProducts,TResult? Function( ToggleFavorite value)?  toggleFavorite,TResult? Function( SearchProducts value)?  searchProducts,TResult? Function( AddToBasket value)?  addToBasket,}){
final _that = this;
switch (_that) {
case LoadAllProducts() when loadAllProducts != null:
return loadAllProducts(_that);case ToggleFavorite() when toggleFavorite != null:
return toggleFavorite(_that);case SearchProducts() when searchProducts != null:
return searchProducts(_that);case AddToBasket() when addToBasket != null:
return addToBasket(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  loadAllProducts,TResult Function( String productId)?  toggleFavorite,TResult Function( String query)?  searchProducts,TResult Function( String productId)?  addToBasket,required TResult orElse(),}) {final _that = this;
switch (_that) {
case LoadAllProducts() when loadAllProducts != null:
return loadAllProducts();case ToggleFavorite() when toggleFavorite != null:
return toggleFavorite(_that.productId);case SearchProducts() when searchProducts != null:
return searchProducts(_that.query);case AddToBasket() when addToBasket != null:
return addToBasket(_that.productId);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  loadAllProducts,required TResult Function( String productId)  toggleFavorite,required TResult Function( String query)  searchProducts,required TResult Function( String productId)  addToBasket,}) {final _that = this;
switch (_that) {
case LoadAllProducts():
return loadAllProducts();case ToggleFavorite():
return toggleFavorite(_that.productId);case SearchProducts():
return searchProducts(_that.query);case AddToBasket():
return addToBasket(_that.productId);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  loadAllProducts,TResult? Function( String productId)?  toggleFavorite,TResult? Function( String query)?  searchProducts,TResult? Function( String productId)?  addToBasket,}) {final _that = this;
switch (_that) {
case LoadAllProducts() when loadAllProducts != null:
return loadAllProducts();case ToggleFavorite() when toggleFavorite != null:
return toggleFavorite(_that.productId);case SearchProducts() when searchProducts != null:
return searchProducts(_that.query);case AddToBasket() when addToBasket != null:
return addToBasket(_that.productId);case _:
  return null;

}
}

}

/// @nodoc


class LoadAllProducts implements ProductEvent {
  const LoadAllProducts();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoadAllProducts);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProductEvent.loadAllProducts()';
}


}




/// @nodoc


class ToggleFavorite implements ProductEvent {
  const ToggleFavorite(this.productId);
  

 final  String productId;

/// Create a copy of ProductEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ToggleFavoriteCopyWith<ToggleFavorite> get copyWith => _$ToggleFavoriteCopyWithImpl<ToggleFavorite>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ToggleFavorite&&(identical(other.productId, productId) || other.productId == productId));
}


@override
int get hashCode => Object.hash(runtimeType,productId);

@override
String toString() {
  return 'ProductEvent.toggleFavorite(productId: $productId)';
}


}

/// @nodoc
abstract mixin class $ToggleFavoriteCopyWith<$Res> implements $ProductEventCopyWith<$Res> {
  factory $ToggleFavoriteCopyWith(ToggleFavorite value, $Res Function(ToggleFavorite) _then) = _$ToggleFavoriteCopyWithImpl;
@useResult
$Res call({
 String productId
});




}
/// @nodoc
class _$ToggleFavoriteCopyWithImpl<$Res>
    implements $ToggleFavoriteCopyWith<$Res> {
  _$ToggleFavoriteCopyWithImpl(this._self, this._then);

  final ToggleFavorite _self;
  final $Res Function(ToggleFavorite) _then;

/// Create a copy of ProductEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? productId = null,}) {
  return _then(ToggleFavorite(
null == productId ? _self.productId : productId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class SearchProducts implements ProductEvent {
  const SearchProducts(this.query);
  

 final  String query;

/// Create a copy of ProductEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SearchProductsCopyWith<SearchProducts> get copyWith => _$SearchProductsCopyWithImpl<SearchProducts>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SearchProducts&&(identical(other.query, query) || other.query == query));
}


@override
int get hashCode => Object.hash(runtimeType,query);

@override
String toString() {
  return 'ProductEvent.searchProducts(query: $query)';
}


}

/// @nodoc
abstract mixin class $SearchProductsCopyWith<$Res> implements $ProductEventCopyWith<$Res> {
  factory $SearchProductsCopyWith(SearchProducts value, $Res Function(SearchProducts) _then) = _$SearchProductsCopyWithImpl;
@useResult
$Res call({
 String query
});




}
/// @nodoc
class _$SearchProductsCopyWithImpl<$Res>
    implements $SearchProductsCopyWith<$Res> {
  _$SearchProductsCopyWithImpl(this._self, this._then);

  final SearchProducts _self;
  final $Res Function(SearchProducts) _then;

/// Create a copy of ProductEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? query = null,}) {
  return _then(SearchProducts(
null == query ? _self.query : query // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class AddToBasket implements ProductEvent {
  const AddToBasket(this.productId);
  

 final  String productId;

/// Create a copy of ProductEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AddToBasketCopyWith<AddToBasket> get copyWith => _$AddToBasketCopyWithImpl<AddToBasket>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AddToBasket&&(identical(other.productId, productId) || other.productId == productId));
}


@override
int get hashCode => Object.hash(runtimeType,productId);

@override
String toString() {
  return 'ProductEvent.addToBasket(productId: $productId)';
}


}

/// @nodoc
abstract mixin class $AddToBasketCopyWith<$Res> implements $ProductEventCopyWith<$Res> {
  factory $AddToBasketCopyWith(AddToBasket value, $Res Function(AddToBasket) _then) = _$AddToBasketCopyWithImpl;
@useResult
$Res call({
 String productId
});




}
/// @nodoc
class _$AddToBasketCopyWithImpl<$Res>
    implements $AddToBasketCopyWith<$Res> {
  _$AddToBasketCopyWithImpl(this._self, this._then);

  final AddToBasket _self;
  final $Res Function(AddToBasket) _then;

/// Create a copy of ProductEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? productId = null,}) {
  return _then(AddToBasket(
null == productId ? _self.productId : productId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
mixin _$ProductState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProductState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProductState()';
}


}

/// @nodoc
class $ProductStateCopyWith<$Res>  {
$ProductStateCopyWith(ProductState _, $Res Function(ProductState) __);
}


/// Adds pattern-matching-related methods to [ProductState].
extension ProductStatePatterns on ProductState {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( Initial value)?  initial,TResult Function( Loading value)?  loading,TResult Function( Loaded value)?  loaded,TResult Function( Failure value)?  failure,required TResult orElse(),}){
final _that = this;
switch (_that) {
case Initial() when initial != null:
return initial(_that);case Loading() when loading != null:
return loading(_that);case Loaded() when loaded != null:
return loaded(_that);case Failure() when failure != null:
return failure(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( Initial value)  initial,required TResult Function( Loading value)  loading,required TResult Function( Loaded value)  loaded,required TResult Function( Failure value)  failure,}){
final _that = this;
switch (_that) {
case Initial():
return initial(_that);case Loading():
return loading(_that);case Loaded():
return loaded(_that);case Failure():
return failure(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( Initial value)?  initial,TResult? Function( Loading value)?  loading,TResult? Function( Loaded value)?  loaded,TResult? Function( Failure value)?  failure,}){
final _that = this;
switch (_that) {
case Initial() when initial != null:
return initial(_that);case Loading() when loading != null:
return loading(_that);case Loaded() when loaded != null:
return loaded(_that);case Failure() when failure != null:
return failure(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( List<ProductModel> products,  String searchQuery,  List<ProductModel> allProducts)?  loaded,TResult Function( String message)?  failure,required TResult orElse(),}) {final _that = this;
switch (_that) {
case Initial() when initial != null:
return initial();case Loading() when loading != null:
return loading();case Loaded() when loaded != null:
return loaded(_that.products,_that.searchQuery,_that.allProducts);case Failure() when failure != null:
return failure(_that.message);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( List<ProductModel> products,  String searchQuery,  List<ProductModel> allProducts)  loaded,required TResult Function( String message)  failure,}) {final _that = this;
switch (_that) {
case Initial():
return initial();case Loading():
return loading();case Loaded():
return loaded(_that.products,_that.searchQuery,_that.allProducts);case Failure():
return failure(_that.message);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( List<ProductModel> products,  String searchQuery,  List<ProductModel> allProducts)?  loaded,TResult? Function( String message)?  failure,}) {final _that = this;
switch (_that) {
case Initial() when initial != null:
return initial();case Loading() when loading != null:
return loading();case Loaded() when loaded != null:
return loaded(_that.products,_that.searchQuery,_that.allProducts);case Failure() when failure != null:
return failure(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class Initial implements ProductState {
  const Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProductState.initial()';
}


}




/// @nodoc


class Loading implements ProductState {
  const Loading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Loading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProductState.loading()';
}


}




/// @nodoc


class Loaded implements ProductState {
  const Loaded(final  List<ProductModel> products, {this.searchQuery = '', final  List<ProductModel> allProducts = const []}): _products = products,_allProducts = allProducts;
  

 final  List<ProductModel> _products;
 List<ProductModel> get products {
  if (_products is EqualUnmodifiableListView) return _products;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_products);
}

@JsonKey() final  String searchQuery;
 final  List<ProductModel> _allProducts;
@JsonKey() List<ProductModel> get allProducts {
  if (_allProducts is EqualUnmodifiableListView) return _allProducts;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_allProducts);
}


/// Create a copy of ProductState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LoadedCopyWith<Loaded> get copyWith => _$LoadedCopyWithImpl<Loaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Loaded&&const DeepCollectionEquality().equals(other._products, _products)&&(identical(other.searchQuery, searchQuery) || other.searchQuery == searchQuery)&&const DeepCollectionEquality().equals(other._allProducts, _allProducts));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_products),searchQuery,const DeepCollectionEquality().hash(_allProducts));

@override
String toString() {
  return 'ProductState.loaded(products: $products, searchQuery: $searchQuery, allProducts: $allProducts)';
}


}

/// @nodoc
abstract mixin class $LoadedCopyWith<$Res> implements $ProductStateCopyWith<$Res> {
  factory $LoadedCopyWith(Loaded value, $Res Function(Loaded) _then) = _$LoadedCopyWithImpl;
@useResult
$Res call({
 List<ProductModel> products, String searchQuery, List<ProductModel> allProducts
});




}
/// @nodoc
class _$LoadedCopyWithImpl<$Res>
    implements $LoadedCopyWith<$Res> {
  _$LoadedCopyWithImpl(this._self, this._then);

  final Loaded _self;
  final $Res Function(Loaded) _then;

/// Create a copy of ProductState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? products = null,Object? searchQuery = null,Object? allProducts = null,}) {
  return _then(Loaded(
null == products ? _self._products : products // ignore: cast_nullable_to_non_nullable
as List<ProductModel>,searchQuery: null == searchQuery ? _self.searchQuery : searchQuery // ignore: cast_nullable_to_non_nullable
as String,allProducts: null == allProducts ? _self._allProducts : allProducts // ignore: cast_nullable_to_non_nullable
as List<ProductModel>,
  ));
}


}

/// @nodoc


class Failure implements ProductState {
  const Failure(this.message);
  

 final  String message;

/// Create a copy of ProductState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FailureCopyWith<Failure> get copyWith => _$FailureCopyWithImpl<Failure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Failure&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'ProductState.failure(message: $message)';
}


}

/// @nodoc
abstract mixin class $FailureCopyWith<$Res> implements $ProductStateCopyWith<$Res> {
  factory $FailureCopyWith(Failure value, $Res Function(Failure) _then) = _$FailureCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$FailureCopyWithImpl<$Res>
    implements $FailureCopyWith<$Res> {
  _$FailureCopyWithImpl(this._self, this._then);

  final Failure _self;
  final $Res Function(Failure) _then;

/// Create a copy of ProductState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(Failure(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on

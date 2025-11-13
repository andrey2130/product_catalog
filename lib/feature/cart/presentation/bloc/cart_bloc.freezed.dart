// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cart_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CartEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CartEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CartEvent()';
}


}

/// @nodoc
class $CartEventCopyWith<$Res>  {
$CartEventCopyWith(CartEvent _, $Res Function(CartEvent) __);
}


/// Adds pattern-matching-related methods to [CartEvent].
extension CartEventPatterns on CartEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( LoadCartProducts value)?  loadCartProducts,TResult Function( IncreaseQuantity value)?  increaseQuantity,TResult Function( DecreaseQuantity value)?  decreaseQuantity,TResult Function( RemoveProduct value)?  removeProduct,required TResult orElse(),}){
final _that = this;
switch (_that) {
case LoadCartProducts() when loadCartProducts != null:
return loadCartProducts(_that);case IncreaseQuantity() when increaseQuantity != null:
return increaseQuantity(_that);case DecreaseQuantity() when decreaseQuantity != null:
return decreaseQuantity(_that);case RemoveProduct() when removeProduct != null:
return removeProduct(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( LoadCartProducts value)  loadCartProducts,required TResult Function( IncreaseQuantity value)  increaseQuantity,required TResult Function( DecreaseQuantity value)  decreaseQuantity,required TResult Function( RemoveProduct value)  removeProduct,}){
final _that = this;
switch (_that) {
case LoadCartProducts():
return loadCartProducts(_that);case IncreaseQuantity():
return increaseQuantity(_that);case DecreaseQuantity():
return decreaseQuantity(_that);case RemoveProduct():
return removeProduct(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( LoadCartProducts value)?  loadCartProducts,TResult? Function( IncreaseQuantity value)?  increaseQuantity,TResult? Function( DecreaseQuantity value)?  decreaseQuantity,TResult? Function( RemoveProduct value)?  removeProduct,}){
final _that = this;
switch (_that) {
case LoadCartProducts() when loadCartProducts != null:
return loadCartProducts(_that);case IncreaseQuantity() when increaseQuantity != null:
return increaseQuantity(_that);case DecreaseQuantity() when decreaseQuantity != null:
return decreaseQuantity(_that);case RemoveProduct() when removeProduct != null:
return removeProduct(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  loadCartProducts,TResult Function( String productId)?  increaseQuantity,TResult Function( String productId)?  decreaseQuantity,TResult Function( String productId)?  removeProduct,required TResult orElse(),}) {final _that = this;
switch (_that) {
case LoadCartProducts() when loadCartProducts != null:
return loadCartProducts();case IncreaseQuantity() when increaseQuantity != null:
return increaseQuantity(_that.productId);case DecreaseQuantity() when decreaseQuantity != null:
return decreaseQuantity(_that.productId);case RemoveProduct() when removeProduct != null:
return removeProduct(_that.productId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  loadCartProducts,required TResult Function( String productId)  increaseQuantity,required TResult Function( String productId)  decreaseQuantity,required TResult Function( String productId)  removeProduct,}) {final _that = this;
switch (_that) {
case LoadCartProducts():
return loadCartProducts();case IncreaseQuantity():
return increaseQuantity(_that.productId);case DecreaseQuantity():
return decreaseQuantity(_that.productId);case RemoveProduct():
return removeProduct(_that.productId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  loadCartProducts,TResult? Function( String productId)?  increaseQuantity,TResult? Function( String productId)?  decreaseQuantity,TResult? Function( String productId)?  removeProduct,}) {final _that = this;
switch (_that) {
case LoadCartProducts() when loadCartProducts != null:
return loadCartProducts();case IncreaseQuantity() when increaseQuantity != null:
return increaseQuantity(_that.productId);case DecreaseQuantity() when decreaseQuantity != null:
return decreaseQuantity(_that.productId);case RemoveProduct() when removeProduct != null:
return removeProduct(_that.productId);case _:
  return null;

}
}

}

/// @nodoc


class LoadCartProducts implements CartEvent {
  const LoadCartProducts();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoadCartProducts);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CartEvent.loadCartProducts()';
}


}




/// @nodoc


class IncreaseQuantity implements CartEvent {
  const IncreaseQuantity(this.productId);
  

 final  String productId;

/// Create a copy of CartEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$IncreaseQuantityCopyWith<IncreaseQuantity> get copyWith => _$IncreaseQuantityCopyWithImpl<IncreaseQuantity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is IncreaseQuantity&&(identical(other.productId, productId) || other.productId == productId));
}


@override
int get hashCode => Object.hash(runtimeType,productId);

@override
String toString() {
  return 'CartEvent.increaseQuantity(productId: $productId)';
}


}

/// @nodoc
abstract mixin class $IncreaseQuantityCopyWith<$Res> implements $CartEventCopyWith<$Res> {
  factory $IncreaseQuantityCopyWith(IncreaseQuantity value, $Res Function(IncreaseQuantity) _then) = _$IncreaseQuantityCopyWithImpl;
@useResult
$Res call({
 String productId
});




}
/// @nodoc
class _$IncreaseQuantityCopyWithImpl<$Res>
    implements $IncreaseQuantityCopyWith<$Res> {
  _$IncreaseQuantityCopyWithImpl(this._self, this._then);

  final IncreaseQuantity _self;
  final $Res Function(IncreaseQuantity) _then;

/// Create a copy of CartEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? productId = null,}) {
  return _then(IncreaseQuantity(
null == productId ? _self.productId : productId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class DecreaseQuantity implements CartEvent {
  const DecreaseQuantity(this.productId);
  

 final  String productId;

/// Create a copy of CartEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DecreaseQuantityCopyWith<DecreaseQuantity> get copyWith => _$DecreaseQuantityCopyWithImpl<DecreaseQuantity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DecreaseQuantity&&(identical(other.productId, productId) || other.productId == productId));
}


@override
int get hashCode => Object.hash(runtimeType,productId);

@override
String toString() {
  return 'CartEvent.decreaseQuantity(productId: $productId)';
}


}

/// @nodoc
abstract mixin class $DecreaseQuantityCopyWith<$Res> implements $CartEventCopyWith<$Res> {
  factory $DecreaseQuantityCopyWith(DecreaseQuantity value, $Res Function(DecreaseQuantity) _then) = _$DecreaseQuantityCopyWithImpl;
@useResult
$Res call({
 String productId
});




}
/// @nodoc
class _$DecreaseQuantityCopyWithImpl<$Res>
    implements $DecreaseQuantityCopyWith<$Res> {
  _$DecreaseQuantityCopyWithImpl(this._self, this._then);

  final DecreaseQuantity _self;
  final $Res Function(DecreaseQuantity) _then;

/// Create a copy of CartEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? productId = null,}) {
  return _then(DecreaseQuantity(
null == productId ? _self.productId : productId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class RemoveProduct implements CartEvent {
  const RemoveProduct(this.productId);
  

 final  String productId;

/// Create a copy of CartEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RemoveProductCopyWith<RemoveProduct> get copyWith => _$RemoveProductCopyWithImpl<RemoveProduct>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RemoveProduct&&(identical(other.productId, productId) || other.productId == productId));
}


@override
int get hashCode => Object.hash(runtimeType,productId);

@override
String toString() {
  return 'CartEvent.removeProduct(productId: $productId)';
}


}

/// @nodoc
abstract mixin class $RemoveProductCopyWith<$Res> implements $CartEventCopyWith<$Res> {
  factory $RemoveProductCopyWith(RemoveProduct value, $Res Function(RemoveProduct) _then) = _$RemoveProductCopyWithImpl;
@useResult
$Res call({
 String productId
});




}
/// @nodoc
class _$RemoveProductCopyWithImpl<$Res>
    implements $RemoveProductCopyWith<$Res> {
  _$RemoveProductCopyWithImpl(this._self, this._then);

  final RemoveProduct _self;
  final $Res Function(RemoveProduct) _then;

/// Create a copy of CartEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? productId = null,}) {
  return _then(RemoveProduct(
null == productId ? _self.productId : productId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
mixin _$CartState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CartState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CartState()';
}


}

/// @nodoc
class $CartStateCopyWith<$Res>  {
$CartStateCopyWith(CartState _, $Res Function(CartState) __);
}


/// Adds pattern-matching-related methods to [CartState].
extension CartStatePatterns on CartState {
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( List<ProductModel> products,  double total)?  loaded,TResult Function( String message)?  failure,required TResult orElse(),}) {final _that = this;
switch (_that) {
case Initial() when initial != null:
return initial();case Loading() when loading != null:
return loading();case Loaded() when loaded != null:
return loaded(_that.products,_that.total);case Failure() when failure != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( List<ProductModel> products,  double total)  loaded,required TResult Function( String message)  failure,}) {final _that = this;
switch (_that) {
case Initial():
return initial();case Loading():
return loading();case Loaded():
return loaded(_that.products,_that.total);case Failure():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( List<ProductModel> products,  double total)?  loaded,TResult? Function( String message)?  failure,}) {final _that = this;
switch (_that) {
case Initial() when initial != null:
return initial();case Loading() when loading != null:
return loading();case Loaded() when loaded != null:
return loaded(_that.products,_that.total);case Failure() when failure != null:
return failure(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class Initial implements CartState {
  const Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CartState.initial()';
}


}




/// @nodoc


class Loading implements CartState {
  const Loading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Loading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CartState.loading()';
}


}




/// @nodoc


class Loaded implements CartState {
  const Loaded(final  List<ProductModel> products, this.total): _products = products;
  

 final  List<ProductModel> _products;
 List<ProductModel> get products {
  if (_products is EqualUnmodifiableListView) return _products;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_products);
}

 final  double total;

/// Create a copy of CartState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LoadedCopyWith<Loaded> get copyWith => _$LoadedCopyWithImpl<Loaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Loaded&&const DeepCollectionEquality().equals(other._products, _products)&&(identical(other.total, total) || other.total == total));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_products),total);

@override
String toString() {
  return 'CartState.loaded(products: $products, total: $total)';
}


}

/// @nodoc
abstract mixin class $LoadedCopyWith<$Res> implements $CartStateCopyWith<$Res> {
  factory $LoadedCopyWith(Loaded value, $Res Function(Loaded) _then) = _$LoadedCopyWithImpl;
@useResult
$Res call({
 List<ProductModel> products, double total
});




}
/// @nodoc
class _$LoadedCopyWithImpl<$Res>
    implements $LoadedCopyWith<$Res> {
  _$LoadedCopyWithImpl(this._self, this._then);

  final Loaded _self;
  final $Res Function(Loaded) _then;

/// Create a copy of CartState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? products = null,Object? total = null,}) {
  return _then(Loaded(
null == products ? _self._products : products // ignore: cast_nullable_to_non_nullable
as List<ProductModel>,null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

/// @nodoc


class Failure implements CartState {
  const Failure(this.message);
  

 final  String message;

/// Create a copy of CartState
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
  return 'CartState.failure(message: $message)';
}


}

/// @nodoc
abstract mixin class $FailureCopyWith<$Res> implements $CartStateCopyWith<$Res> {
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

/// Create a copy of CartState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(Failure(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on

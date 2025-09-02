@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Supplement Interface View'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZDES_BOOK_SUPPL_I
  as select from zdes_book_suppl

  association     to parent ZDES_BOOKINGS_I as _Booking on $projection.BookingUUID = _Booking.BookingUuid

  association [1] to ZDES_TRAVELS_I         as _Travel  on $projection.TravelUUID = _Travel.TravelUuid
{
  key booksuppl_uuid        as BooksupplUuid,
      root_uuid             as TravelUUID,
      parent_uuid           as BookingUUID,
      booking_supplement_id as BookingSupplementId,
      supplement_id         as SupplementId,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      price                 as Price,
      currency_code         as CurrencyCode,
      local_last_changed_at as LocalLastChangedAt,
      _Booking, // Make association public
      _Travel
}

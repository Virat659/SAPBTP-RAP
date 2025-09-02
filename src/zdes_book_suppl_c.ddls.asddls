@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Booking Supplement Consumption View'
@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true
define view entity ZDES_BOOK_SUPPL_C
  as projection on ZDES_BOOK_SUPPL_I
{
  key BooksupplUuid,
      TravelUUID,
      BookingUUID,
      BookingSupplementId,
      SupplementId,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      Price,
      CurrencyCode,
      LocalLastChangedAt,
      /* Associations */
      _Booking : redirected to parent ZDES_BOOKINGS_C,
      _Travel  : redirected to ZDES_TRAVELS_C
}

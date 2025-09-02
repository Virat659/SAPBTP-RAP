@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Booking Consumption View'
@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true
@VDM.viewType: #CONSUMPTION
define view entity ZDES_BOOKINGS_C
  as projection on ZDES_BOOKINGS_I
{
  key BookingUuid,
      TravelUuid,   
      BookingId,
      BookingDate,
      CustomerId,
      CarrierId,
      ConnectionId,
      FlightDate,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      FlightPrice,
      CurrencyCode,
      BookingStatus,
      LocalLastChangedAt,
      /* Associations */
      _Booksuppl : redirected to composition child ZDES_BOOK_SUPPL_C,
      _Travel    : redirected to parent ZDES_TRAVELS_C
}

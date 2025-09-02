@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Booking Interface View'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZDES_BOOKINGS_I
  as select from zdes_bookings

  composition [0..*] of ZDES_BOOK_SUPPL_I as _Booksuppl

  association to parent ZDES_TRAVELS_I    as _Travel on $projection.TravelUuid = _Travel.TravelUuid
{
  key booking_uuid          as BookingUuid,
      parent_uuid           as TravelUuid,
      booking_id            as BookingId,
      booking_date          as BookingDate,
      customer_id           as CustomerId,
      carrier_id            as CarrierId,
      connection_id         as ConnectionId,
      flight_date           as FlightDate,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      flight_price          as FlightPrice,
      currency_code         as CurrencyCode,
      booking_status        as BookingStatus,
      @Semantics.user.localInstanceLastChangedBy: true
      local_last_changed_at as LocalLastChangedAt,
      _Travel, 
      _Booksuppl
}

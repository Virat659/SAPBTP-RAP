@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Travel Consumption View'
@Metadata.allowExtensions: true
@VDM.viewType: #CONSUMPTION
define root view entity ZDES_TRAVELS_C
  provider contract transactional_query
  as projection on ZDES_TRAVELS_I
{
  key TravelUuid,
      TravelId,
      AgencyId,
      CustomerId,
      BeginDate,
      EndDate,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      BookingFee,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      TotalPrice,
      CurrencyCode,
      Description,
      OverallStatus,
      LocalCreatedBy,
      LocalCreatedAt,
      LocalLastChangedBy,
      LocalLastChangedAt,
      LastChangedAt,
      /* Associations */
      _Booking : redirected to composition child ZDES_BOOKINGS_C
}

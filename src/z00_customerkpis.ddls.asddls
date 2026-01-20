@AbapCatalog.viewEnhancementCategory: [ #NONE ]

@AccessControl.authorizationCheck: #NOT_REQUIRED

@EndUserText.label: 'Customer KPIs'

@Metadata.ignorePropagatedAnnotations: true

define view entity Z00_CustomerKPIs
  with parameters
    P_City : /dmo/city
  as select from Z00_TravelWithCustomer

{
  key CustomerId,

      CustomerName,
      Street,
      PostalCode,
      City,

      @Semantics.amount.currencyCode: 'CurrencyCode'
      sum(TotalPrice) + sum(BookingFee) as TotalRevenue,

      CurrencyCode,
      avg(Duration as abap.dec(16,0))   as AverageDuration,
      count(distinct AgencyId)          as NumberOfDifferentAgencyIds
}
where
  City = $parameters.P_City

group by
  CurrencyCode,
  CustomerId,
  CustomerName,
  PostalCode,
  City,
  Street

having
  sum(TotalPrice + BookingFee) > 5000

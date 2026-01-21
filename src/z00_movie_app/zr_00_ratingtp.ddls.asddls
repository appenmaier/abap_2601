@AccessControl.authorizationCheck: #NOT_REQUIRED

@EndUserText.label: 'Rating'

@Metadata.ignorePropagatedAnnotations: true

define view entity ZR_00_RatingTP
  as select from ZI_00_Rating

  association to parent ZR_00_MovieTP as _Movie on $projection.MovieUuid = _Movie.MovieUuid

{
  key RatingUuid,

      MovieUuid,
      UserName,
      Rating,
      RatingDate,

      /* Associations */
      _Movie
}

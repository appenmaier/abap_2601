@AbapCatalog.viewEnhancementCategory: [ #NONE ]

@AccessControl.authorizationCheck: #NOT_REQUIRED

@EndUserText.label: 'Movie'

/*+[hideWarning] { "IDS" : [ "CARDINALITY_CHECK" ]  } */
define root view entity ZR_00_MovieTP
  as select from ZI_00_Movie

  association [0..1] to ZI_00_AverageRating as _AverageRating on $projection.MovieUuid = _AverageRating.MovieUuid
  association [0..1] to ZI_00_GenreText     as _GenreText     on $projection.Genre = _GenreText.Genre
  composition [0..*] of ZR_00_RatingTP      as _Ratings

{
  key MovieUuid,

      Title,
      Genre,
      PublishingYear,
      RuntimeInMin,
      ImageUrl,
      CreatedAt,
      CreatedBy,
      LastChangedAt,
      LastChangedBy,

      /* Associations */
      _Ratings,
      _AverageRating,
      _GenreText
}

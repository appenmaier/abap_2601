CLASS zcl_00_demo_07 DEFINITION
  PUBLIC FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
ENDCLASS.


CLASS zcl_00_demo_07 IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
    " Deklaration interner Tabellen
    DATA connections TYPE z00_connections. " TYPE [Tabellentyp]
    DATA connections2 TYPE TABLE OF z00_connection. " TYPE TABLE OF [Strukturtyp]
    DATA connection  TYPE z00_connection.

    " Hinzufügen von Datensätzen
    connections = VALUE #( ( carrier_id = 'LH' connection_id = '0400' )
                           ( carrier_id = 'UA' airport_from_id = 'FRA' )
                           ( connection_id = '0401' airport_to_id = 'FRA' ) ).

    " Anfügen von Datensätzen
    connection = VALUE #( carrier_id      = 'AZ'
                          connection_id   = '0017'
                          airport_from_id = 'BER'
                          airport_to_id   = 'ROM' ).
    connections = VALUE #( BASE connections
                           ( connection ) ).
    APPEND connection TO connections.

    " Lesen von Einzelsätzen
    TRY.
        connection = connections[ 0 ]. " per Index
      CATCH cx_sy_itab_line_not_found.
    ENDTRY.

    IF line_exists( connections[ connection_id = '9999' ] ).
      connection = connections[ connection_id = '9999' ]. " per Schlüsselkomponente
    ENDIF.

    " Lesen mehrerer Datensätze
    " LOOP AT connections INTO DATA(connection2).
    LOOP AT connections INTO connection WHERE carrier_id IS NOT INITIAL.
      out->write( |{ sy-tabix } { connection-carrier_id }| ).
    ENDLOOP.

    " Ändern von Einzelsätzen
    TRY.
        connections[ 1 ]-airport_from_id = 'FRA'. " per Index
      CATCH cx_sy_itab_line_not_found.
    ENDTRY.

    IF line_exists( connections[ connection_id = '0400' ] ).
      connections[ connection_id = '0400' ]-connection_id = '0402'. " per Schlüsselkomponente
    ENDIF.

    " Ändern mehrerer Datensätze (per SY-TABIX)
    LOOP AT connections INTO connection.
      connections[ sy-tabix ]-airport_to_id = 'JFK'.
    ENDLOOP.

    " Ändern mehrerer Datensätze (per Datenreferenz)
    DATA connection2 TYPE REF TO z00_connection.
    LOOP AT connections REFERENCE INTO connection2.
      connection2->airport_from_id = 'BER'.
    ENDLOOP.

    " Ändern mehrerer Datensätze (per Feldsymbol)
    FIELD-SYMBOLS <connection> TYPE z00_connection.
    LOOP AT connections ASSIGNING <connection>.
      <connection>-carrier_id = 'LH'.
    ENDLOOP.

    " Sortieren
    SORT connections BY carrier_id DESCENDING connection_id ASCENDING.

    " Löschen
    DELETE connections WHERE airport_from_id = 'FRA'.

    " Anzahl Datensätze
    out->write( lines( connections ) ).

    " Ausgabe
    out->write( connections ).

  ENDMETHOD.
ENDCLASS.

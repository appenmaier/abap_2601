CLASS zcl_00_abap_05 DEFINITION
  PUBLIC FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
ENDCLASS.


CLASS zcl_00_abap_05 IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
    DATA customer TYPE z00_customer_info.

    TRY.
        customer = zcl_abap_helper=>get_customer( '101010' ).
        out->write( customer-first_name ).
*        out->write( customer-last_name ).
      CATCH zcx_abap_no_data INTO DATA(x).
        out->write( x->get_text( ) ).
    ENDTRY.
  ENDMETHOD.
ENDCLASS.

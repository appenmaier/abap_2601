CLASS zcl_00_abap_07 DEFINITION
  PUBLIC FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
ENDCLASS.


CLASS zcl_00_abap_07 IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
    TRY.
        DATA(travels) = zcl_00_helper=>get_travels( customer_id = '000002' ).

        DELETE travels WHERE begin_date < cl_abap_context_info=>get_system_date( ).

        LOOP AT travels ASSIGNING FIELD-SYMBOL(<travel>).
          <travel>-booking_fee *= '1.1'.
        ENDLOOP.

        SORT travels BY description DESCENDING.

        out->write( travels ).
      CATCH zcx_abap_no_data INTO DATA(x).
        out->write( x->get_text( ) ).
    ENDTRY.
  ENDMETHOD.
ENDCLASS.

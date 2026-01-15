CLASS zcl_00_abap_01 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_00_abap_01 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    DATA first_name TYPE c LENGTH 40.
    DATA last_name TYPE c LENGTH 40.

    first_name = 'Daniel'.
    last_name = 'Appenmaier'.

    out->write( |Hello { first_name } { last_name }, how are you?| ).

  ENDMETHOD.
ENDCLASS.

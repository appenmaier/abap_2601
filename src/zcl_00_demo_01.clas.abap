CLASS zcl_00_demo_01 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_00_demo_01 IMPLEMENTATION.



  METHOD if_oo_adt_classrun~main.

**********************************************************************
* Hello World
**********************************************************************
    DATA text TYPE string. " Deklaration
    text = 'Hello World'. " Wertzuweisung
* Ausgabe
    out->write( text ).

**********************************************************************
* Datentypen und Datenobjekte
**********************************************************************
    DATA age TYPE i. " Ganze Zahlen
    DATA salary_in_euro TYPE p LENGTH 16 DECIMALS 2. " Kommazahlen
    DATA first_name TYPE c LENGTH 40. " Zeichenketten fester Länge
    DATA matriculation_number TYPE n LENGTH 7. " Ziffernfolge
    DATA xmas TYPE d. " Datumsangaben
    DATA noon TYPE t. " Zeitangaben
    DATA flag. " Kennzeichen

    data carrier_id type c length 3. " ABAP Standardtyp
    data carrier_id2 type /dmo/carrier_id. " Datenelement

**********************************************************************
* Wertzuweisungen
**********************************************************************
    " Zuweisungsoperator (=)
    age = 44.
    salary_in_euro = '6000.52'.
    first_name = 'Daniel'.
    matriculation_number = '9182643'.
    xmas = '20261225'.
    noon = '120000'.
    flag = 'X'.

    " Initialisierung
    age = 0.
    flag = ' '.
    flag = ''.
    CLEAR flag.

    " Statische Vorbelegung
    DATA last_name TYPE c LENGTH 40 VALUE 'Appenmaier'.

    " Inlinedeklaration
    DATA(size_in_cm) = 179.
    size_in_cm = '179'.

  ENDMETHOD.

ENDCLASS.

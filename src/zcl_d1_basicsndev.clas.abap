CLASS zcl_d1_basicsndev DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_d1_basicsndev IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
    " ── Data Declaration ───────────────────────
    DATA: lv_name TYPE string VALUE 'ABAP Developer',
          lv_age  TYPE i      VALUE 23,
          lv_salary TYPE p DECIMALS 2 VALUE '450000.70',
          lv_dob TYPE d VALUE '20010310'.

    " ── Modern time conversion  ───────────────────────
    DATA(lv_ts) = utclong_current( ). " Get current time stamp in UTC
    " ── Convert the time stamp into separate date and time variable  ───────────────────────
    CONVERT UTCLONG lv_ts
      TIME ZONE 'UTC'
      INTO DATE DATA(lv_date)
           TIME DATA(lv_time).

    " ── String template output ───────────────────────
    out->write( | Welcome { lv_name }! | ).
    out->write( |Date: { lv_date }  Time: { lv_time }| ).
    out->write( |Age: { lv_age } Salary: { lv_salary DECIMALS = 2 }| ).

    " ── Arithmetic ───────────────────────
    out->write( |17 + 5 = { 17 + 5 }| ).
    out->write( |17 MOD 5 = { 17 MOD 5 }| ).
    out->write( |17 DIV 5 = { 17 DIV 5 }| ).
  ENDMETHOD.
ENDCLASS.

1.copy netlist_form_Telesis.xsl to C:\Program Files\KiCad\bin\scripting\plugins
2.open Kicad Eeschema, Tools->Generate netlist file...->Add Plugin...
   Netlist command:    xsltproc -o "%O" "C:\Program Files\KiCad\bin\scripting\plugins\netlist_form_Telesis.xsl" "%I"
   Name:    Telesis
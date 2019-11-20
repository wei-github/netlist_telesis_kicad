XSLT
1.copy netlist_form_Telesis.xsl to C:\Program Files\KiCad\bin\scripting\plugins
2.open Kicad Eeschema, Tools->Generate netlist file...->Add Plugin...
   Netlist command:    xsltproc -o "%O" "C:\Program Files\KiCad\bin\scripting\plugins\netlist_form_Telesis.xsl" "%I"
   Name:    Telesis

Python
1.copy netlist_form_Telesis.py to C:\Program Files\KiCad\bin\scripting\plugins
2.open Kicad Eeschema, Tools->Generate netlist file...->Add Plugin...
   Netlist command:    python "C:\Program Files\KiCad\bin\scripting\plugins/netlist_form_Telesis.py" "%I" "%O"
   Name:    Telesis_Python
3.log file will be generated for checking single signals.
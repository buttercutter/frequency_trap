GNET=gnetlist -L ../.. -g spice-noqsi
SPICE=ngspice
SCH_NAME=frequency_trap
ADDITIONAL_FILES=Gm2.net CMOS_Inverter.net

%.net : %.sch
	$(GNET) $< -o $@

.PHONY : simulation

simulation : $(SCH_NAME).net $(ADDITIONAL_FILES)
	$(SPICE) $(SCH_NAME).net modelcard.nmos modelcard.pmos

clean : 
	rm -f $(SCH_NAME).net $(ADDITIONAL_FILES) \#* *~

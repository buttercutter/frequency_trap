GNET=gnetlist -L ../.. -g spice-noqsi
SPICE=ngspice
SCH_NAME=frequency_trap
ADDITIONAL_FILES=Gm2.net CMOS_Inverter.net
GM2_FILES=test_Gm2.net Gm2.net
X1_FILES=test_CMOS_Inverter.net CMOS_Inverter.net

%.net : %.sch
	$(GNET) $< -o $@

.PHONY : simulation

simulation : $(SCH_NAME).net $(ADDITIONAL_FILES)
	$(SPICE) $(SCH_NAME).net modelcard.nmos modelcard.pmos

clean : 
	rm -f $(SCH_NAME).net $(ADDITIONAL_FILES) \#* *~

testGm2 : $(GM2_FILES)
	$(SPICE) $(GM2_FILES) modelcard.nmos modelcard.pmos

testX1 : $(X1_FILES)
	$(SPICE) $(X1_FILES) modelcard.nmos modelcard.pmos

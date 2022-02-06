# Semantische Klassifikation der LVBtweets.

## Stoerungen

Diese Stoerungskategorien sind folgende Keywords zugeordnet:

| Variable | Erläuterung | Keywords |
|----------------|--------------------------------------------------------------|------------------------------------------------------------------------------------------------------------|
| idx_mivstoerung | Stoerungen durch MIV | `PKW IM GLEIS`+`PKW. IM GLEIS`+`FALSCHPARKER`+`RÜCKSTAU`+`LKW`+`HOHESN VERKEHRSAUFKOMME`+`HOHEN VERKEHRSAUFKOMMEN`+`UNFALL`+`VERKEHRSUNAFALL` |oe	| idx_unfall | Verkehrsstoerung wegen lang- oder kurzfristigen Baustellen, Witterung/ Wetter | `HAVARIE`+`UMLEITUNG`+`STRECKENBLOCKIERUNG `+`SPERRUNG`+`WITTERUNG`+ `DEFEKTEN SCHRANKENANLAGE`+`HAUSEINSTURZ`+`BAUARBEITEN` |
| idx_blaulicht | Blaulichteinsatz von Polizei, Feuerwehr, Notarzt | `NOTARZTEINSATZ`+`RETTUNGSEINSATZ`+`FEUERWEHREINSATZ`+`POLIZEIEINSATZ` |
| idx_demo | Verkehrsstoerung wegen zivilgesellschaftlichen engagement | `DEMONSTRATION`+`CHRISTOPHER STREET DAY`+`DEMO`+`AUFZUGES` |
| idx_fahrplan | Fahrplanausfälle, SEV, Notbetrieb | `VERKÜRZT`+`SEV`+`SCHIENENERSATZVERKEHR`+`NICHT MÖGLICH`+`FAHRPLANUNREGELMÄßIGKEITEN`+`NOTBETRIEB` |
| idx_lvbintern | LVB interne Gruende | `VERSPÄTUNG`+`AUSFALL`+`LEITUNGSSCHADEN`+`STÖRUNG`+`FAHRZEUGSCHADEN`+`BETRIEBLICHEN GRÜNDEN`+`BETRIEBLICHE GRÜNDE`+`LEITUNGSARBEITEN`+`REINIGUNGSARBEITEN`+`FAHRBAHNVERUNREINIGUNG`+`UPDATE` |
| idx_beendet | Verkehrsstoerung ist beendet | `AB SOFORT`+`FÄHRT WIEDER`+`WIEDER BEFAHRBAR`+`NORMAL`+`WIEDER IM EINSATZ`+`GEHEND NACH FAHRPLAN`+`PLANMÄßIG`+`NORMALER LINIENFÜHRUNG`+`WIEDER NACH FAHRPLAN`+`BEENDET` |
| idx_sonstiges | Sonstige Gruende (Tweets müssen händisch nachbereitet werden) | `SONSTIGES` |
| idx_answertweet | Antworttweet (muss nicht berücksichtigt werden) | ^@ |

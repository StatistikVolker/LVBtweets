# Semantische Klassifikation der LVBtweets.

## Stoerungen

Diese Stoerungskategorien sind folgende Keywords zugeordnet:

| Variable | Erl�uterung | Keywords |
|----------------|--------------------------------------------------------------|------------------------------------------------------------------------------------------------------------|
| idx_mivstoerung | Stoerungen durch MIV | `PKW IM GLEIS`+`PKW. IM GLEIS`+`FALSCHPARKER`+`R�CKSTAU`+`LKW`+`HOHESN VERKEHRSAUFKOMME`+`HOHEN VERKEHRSAUFKOMMEN`+`UNFALL`+`VERKEHRSUNAFALL` |oe	| idx_unfall | Verkehrsstoerung wegen lang- oder kurzfristigen Baustellen, Witterung/ Wetter | `HAVARIE`+`UMLEITUNG`+`STRECKENBLOCKIERUNG `+`SPERRUNG`+`WITTERUNG`+ `DEFEKTEN SCHRANKENANLAGE`+`HAUSEINSTURZ`+`BAUARBEITEN` |
| idx_blaulicht | Blaulichteinsatz von Polizei, Feuerwehr, Notarzt | `NOTARZTEINSATZ`+`RETTUNGSEINSATZ`+`FEUERWEHREINSATZ`+`POLIZEIEINSATZ` |
| idx_demo | Verkehrsstoerung wegen zivilgesellschaftlichen engagement | `DEMONSTRATION`+`CHRISTOPHER STREET DAY`+`DEMO`+`AUFZUGES` |
| idx_fahrplan | Fahrplanausf�lle, SEV, Notbetrieb | `VERK�RZT`+`SEV`+`SCHIENENERSATZVERKEHR`+`NICHT M�GLICH`+`FAHRPLANUNREGELM��IGKEITEN`+`NOTBETRIEB` |
| idx_lvbintern | LVB interne Gruende | `VERSP�TUNG`+`AUSFALL`+`LEITUNGSSCHADEN`+`ST�RUNG`+`FAHRZEUGSCHADEN`+`BETRIEBLICHEN GR�NDEN`+`BETRIEBLICHE GR�NDE`+`LEITUNGSARBEITEN`+`REINIGUNGSARBEITEN`+`FAHRBAHNVERUNREINIGUNG`+`UPDATE` |
| idx_beendet | Verkehrsstoerung ist beendet | `AB SOFORT`+`F�HRT WIEDER`+`WIEDER BEFAHRBAR`+`NORMAL`+`WIEDER IM EINSATZ`+`GEHEND NACH FAHRPLAN`+`PLANM��IG`+`NORMALER LINIENF�HRUNG`+`WIEDER NACH FAHRPLAN`+`BEENDET` |
| idx_sonstiges | Sonstige Gruende (Tweets m�ssen h�ndisch nachbereitet werden) | `SONSTIGES` |
| idx_answertweet | Antworttweet (muss nicht ber�cksichtigt werden) | ^@ |

# LVBtweets
LVB tweets über Störungen im Linienverkehr to a map/ dashboard

Das Projekt lädt die LVBtweet von @LVB_dirket herunter.
Danach werden sie klassifiziert.
Diese Klassifikation erfolgt teilweise automatisch per R Skript.

Eine Händische Nacharbeit der teilautomatisierten semantischen Zerlegung der tweets erfolgt durch Mitarbeitende an dem Projekt.

Ziel ist es eine Tabelle zu erhalten, die die Störungen im LVB Liniensystem nach Kategorien getrennt erfasst.
Diese soll auf einer Karte visualisiert werden.
Veröffentlicht wird das in einem Dashboard.
Das Dashboard hat dabei folgende Mindestanforderungen:
a) Hauptfenster: Anzeige der Störungen auf einer Karte, unterhalb der Karte die Angezeigten Störungen in Tabellenform.
b) Filterung nach Tag/ Kalender Woche/ Monat, evtl auch eigenen einstellbaren Zeitbereichen
c) Anzeige der Störungen erfolgt pro betroffenen Streckenabschnitt, ein Streckenabschnitt ist dabei immer zwischen zwei auf einander folgenden Haltestellen.
d) Die Liniendicke zeigt an, wie oft der Streckenabschnitt im betroffenen Zeitraum gestört war.
e) weitere Filterung ist über die Ursache der Störung möglich - wird noicht gefoltert, erfolgt dies über ine Farbcodierung


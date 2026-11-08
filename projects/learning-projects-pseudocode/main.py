def berechne_aktien(betriebszugehoerigkeit, tarifstatus, beschaeftigungsstatus):
    if beschaeftigungsstatus == "gekündigt" or tarifstatus == "außertariflich":
        return 0
    elif betriebszugehoerigkeit > 10:
        return 50
    elif betriebszugehoerigkeit > 2:
        return 20
    else:
        return 0
betriebszugehoerigkeit = int(input("Geben Sie die Betriebszugehörigkeit in Jahren ein: "))
tarifstatus = input("Geben Sie den Tarifstatus ein (tariflich/außertariflich): ").strip().lower()
beschaeftigungsstatus = input("Geben Sie den Beschäftigungsstatus ein (aktiv/gekündigt): ").strip().lower()
aktien = berechne_aktien(betriebszugehoerigkeit, tarifstatus, beschaeftigungsstatus)
print(f"Der Mitarbeiter kann {aktien} Aktien erwerben.")
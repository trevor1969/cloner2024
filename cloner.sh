# Standardcloner für alle
# Basis 1: rsync
# Basis 2: rclone

BBasis=1
QQuelle="--lokales Quellverzeichnis--"                  # Quell-Verzeichnis
ZZiel="name@192.168.0.222:/home/whatever/"              # Ziel-Verzeichnis
AArchiv="$ZZiel/archiv/$(date +%Y-%m-%d-%H)"  # Archiv-Verzeichnis
LLogbuch="$ZZiel/log.txt"                  # Pfad zum Logbuch
# AAusnahmen="--exclude "                               # Ausnahmen
AAusnahmen=""

mkdir $ZZiel $ZZiel/archiv

echo " " >>$LLogbuch
echo " " >>$LLogbuch
echo " " >>$LLogbuch
echo "$(date) - Starte neuen CLONER-Durchlauf..." >>$LLogbuch
echo "$(date) - Basis: $BBasis" >>$LLogbuch
echo "$(date) - Quelle: $QQuelle" >>$LLogbuch
echo "$(date) - Ziel: $ZZiel" >>$LLogbuch
echo "$(date) - Archiv: $AArchiv" >>$LLogbuch
echo " " >>$LLogbuch

if [ $BBasis = 1 ]
then
  # Sollen spezielle SSH-Parameter angegeben werden, dann mit der Option -e, z. B. -e "-p2222" um einen bestimmten Port anzugeben
  rsync -r -u --delete $AAusnahmen -P "$QQuelle" "$ZZiel" --log-file=$LLogbuch --backup-dir=$AArchiv
  echo " " >>$LLogbuch
  echo "$(date) - CLONER-Durchlauf beendet..." >>$LLogbuch
  echo " " >>$LLogbuch
fi

if [ $BBasis = 2 ]
then
  echo "Noch nicht eingerichtet!"
fi

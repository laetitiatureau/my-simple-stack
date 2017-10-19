#!/usr/bin/env bash
# -*- coding: utf-8-unix; -*-
if [ $# -ge 1 ]; then
	# Remove quotes
	SRCDIR="${1//\"/}"
	echo "Dossier source (donné par la ligne de commande) :" >&2
	echo "SRCDIR=$SRCDIR" >&2
else
    SRCDIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
    echo "Aucun argument donné en ligne de commande. Dossier source auto-détecté :" >&2
    echo "SRCDIR=$SRCDIR" >&2
fi
echo >&2

FILE0="aux_idea.properties"
FILE1="idea.properties"
# CHEMIN_INTELLIJ="Z:/$USERNAME/.IntelliJIdea2016.3"
CHEMIN_INTELLIJ="Z:/$USERNAME/.IntelliJIdea2016"
# => NO BACKSLASH HERE !
echo "Ce script est conçu UNIQUEMENT pour les PC Windows à l'UPS." >&2
echo >&2

echo "Le chemin cible pour IntelliJ que va définir ce script est :" >&2
echo "CHEMIN_INTELLIJ=$CHEMIN_INTELLIJ" >&2
echo >&2

read -p "Appuyez sur Entrée pour continuer... (ou sur Ctrl+C pour quitter)"

DSTDIR1="$USERPROFILE"
#DSTDIR2="$USERPROFILE/.IntelliJIdea13"
DSTDIR3="C:/Users/$USERNAME"
#DSTDIR4="C:/Users/$USERNAME/.IntelliJIdea13"
# => normally DSTDIR2 = DSTDIR4 (mod backslashes), but better safe than sorry

echo >&2
echo "Doing 'sed -e \"s|CHEMIN_INTELLIJ|$CHEMIN_INTELLIJ|\" \"$SRCDIR/$FILE0\" > \"$SRCDIR/$FILE1\"'..." >&2
sed -e "s|CHEMIN_INTELLIJ|$CHEMIN_INTELLIJ|" "$SRCDIR/$FILE0" > "$SRCDIR/$FILE1"
echo >&2

echo "Doing 'mkdir -p "$CHEMIN_INTELLIJ"'..." >&2
mkdir -p "$CHEMIN_INTELLIJ"
RV0=$?
echo >&2

#echo "Doing 'mkdir -p "$DSTDIR2"'..." >&2
#mkdir -p "$DSTDIR2"
#echo >&2

#echo "Doing 'mkdir -p "$DSTDIR4"'..." >&2
#mkdir -p "$DSTDIR4"
#echo >&2

echo "Doing 'cp \"$SRCDIR/$FILE1\" \"$DSTDIR1/$FILE1\"..." >&2
cp "$SRCDIR/$FILE1" "$DSTDIR1/$FILE1"
RV1=$?
echo >&2

#echo "Doing 'cp \"$SRCDIR/$FILE1\" \"$DSTDIR2/$FILE1\"..." >&2
#cp "$SRCDIR/$FILE1" "$DSTDIR2/$FILE1"
#RV2=$?
#echo >&2

echo "Doing 'cp \"$SRCDIR/$FILE1\" \"$DSTDIR3/$FILE1\"..." >&2
cp "$SRCDIR/$FILE1" "$DSTDIR3/$FILE1"
RV3=$?
echo >&2

#echo "Doing 'cp \"$SRCDIR/$FILE1\" \"$DSTDIR4/$FILE1\"..." >&2
#cp "$SRCDIR/$FILE1" "$DSTDIR4/$FILE1"
#RV4=$?
#echo >&2

echo "Doing 'cp \"$SRCDIR/$FILE1\" \"$CHEMIN_INTELLIJ/$FILE1\"..." >&2
cp "$SRCDIR/$FILE1" "$CHEMIN_INTELLIJ/$FILE1"
RVZ=$?
echo >&2

# Otherwise: set the IDEA_PROPERTIES env var & run IntelliJ from a .bat script

if [ "$RV0$RV1$RV3$RVZ" = "0000" ]; then
    echo "IntelliJ est maintenant pré-configuré avec $CHEMIN_INTELLIJ" >&2
    echo "Vous pouvez maintenant lancer IntelliJ !" >&2
else
    echo "La pré-configuration IntelliJ avec le chemin $CHEMIN_INTELLIJ" >&2
    echo "a été effectuée mais des erreurs ont été détectées." >&2
    echo "Veuillez solliciter votre encadrant de TP." >&2
fi

# Tested with IntelliJ IDEA 2016.3 64-bits
echo >&2 	
read -p "Appuyez sur Entrée pour quitter..."

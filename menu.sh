#!/bin/bash
# ajout des script
source ./menu-paquet.sh
source ./menu-utilisateur.sh
while true; do
    clear
    echo "===== MENU ====="
    echo "1) Menu utilisateur"
    echo "2) Menu paquet"
    echo "3) Quitter"
    echo "================"
    read -p "Choisissez une option [1-3] : " choix

    case $choix in
        1)
            menu-utilisateur.sh
            read -p "Appuyez sur Entrée pour continuer..." ;;
        2)
            menu-paquet.sh
            read -p "Appuyez sur Entrée pour continuer..." ;;
        3)
            echo "Au revoir !"
            exit 0 ;;
        *)
            echo "Option invalide."
            read -p "Appuyez sur Entrée pour continuer..." ;;
    esac
done

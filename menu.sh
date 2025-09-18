menu(){
#!/bin/bash

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'

# ajout des script
source ./menu_paquet.sh
source ./menu_utilisateur.sh

while true; do
    clear
    echo "${YELLOW}===== MENU ====="
    echo "${GREEN}1) Menu utilisateur"
    echo "${GREEN}2) Menu paquet"
    echo "${GREEN}3) Quitter"
    echo "${YELLOW}================"
    read -p "${GREEN}Choisissez une option [1-3] : " choix

    case $choix in
        1)
            menu_utilisateur
            read -p "Appuyez sur Entrée pour continuer..." ;;
        2)
            menu_paquet
            read -p "Appuyez sur Entrée pour continuer..." ;;
        3)
            echo "Au revoir !"
            exit 0 ;;
        *)
            echo "Option invalide."
            read -p "Appuyez sur Entrée pour continuer..." ;;
    esac
done
}

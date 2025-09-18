menu(){
#!/bin/bash

# Définir les couleurs avec des variables
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
NC='\033[0m'  # No color, pour réinitialiser

# ajout des script
source ./menu_paquet.sh
source ./menu_utilisateur.sh

while true; do
    clear
    echo -e "${YELLOW}===== MENU ====="
    echo -e "${GREEN}1) Menu utilisateur"
    echo -e "${GREEN}2) Menu paquet"
    echo -e "${GREEN}3) Quitter"
    echo -e "${YELLOW}================${NC}"
    read -p "Choisissez une option [1-3] : " choix

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

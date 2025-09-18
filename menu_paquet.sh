menu_paquet(){
#!/bin/bash

# ajout des script
source ./install_paquet.sh
source ./menu.sh

# Vérifier si l'utilisateur est root ou a sudo
if [[ $EUID -ne 0 ]]; then
    echo "Ce script doit être exécuté avec les droits root (sudo)."
    exit 1
fi

while true; do
    clear
    echo -e "${YELLOW}===== MENU - Gestion des paquets (Debian/Ubuntu) ====="
    echo -e "${GREEN}1) Installer un paquet"
    echo -e "${GREEN}2) Vérifier si un paquet est installé"
    echo -e "${GREEN}3) Supprimer un paquet"
    echo -e "${GREEN}4) Mettre à jour la liste des paquets"
    echo -e "${GREEN}5) Quitter"
    echo -e "$YELLOW}======================================================${NC}"
    read -p "Choisissez une option [1-5] : " choix

    case $choix in
        1)
            install_paquet
            read -p "Appuyez sur Entrée pour continuer..." ;;
        2)
            read -p "Entrez le nom du paquet à vérifier : " paquet
            if dpkg -s "$paquet" &> /dev/null; then
                echo " Le paquet '$paquet' est installé."
            else
                echo " Le paquet '$paquet' n'est pas installé."
            fi
            read -p "Appuyez sur Entrée pour continuer..." ;;
        3)
            read -p "Entrez le nom du paquet à supprimer : " paquet
            if dpkg -s "$paquet" &> /dev/null; then
                apt remove -y "$paquet"
                echo "Paquet '$paquet' supprimé."
            else
                echo "Le paquet '$paquet' n'est pas installé."
            fi
            read -p "Appuyez sur Entrée pour continuer..." ;;
        4)
            echo "Mise à jour de la liste des paquets..."
            apt update
            read -p "Appuyez sur Entrée pour continuer..." ;;
        5)
            echo "Fermeture du gestionnaire. À bientôt !"
            menu ;;
        *)
            echo "Option invalide. Choisissez un numéro entre 1 et 5."
            read -p "Appuyez sur Entrée pour continuer..." ;;
    esac
done
}

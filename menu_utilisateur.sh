menu_utilisateur(){
#!/bin/bash

# ajout des script
source ./ajout_utilisateur.sh
source ./suppression_utilisateur.sh
source ./menu.sh

while true; do
    clear
    echo -e "${YELLOW}===== MENU ====="
    echo -e "${GREEN}1) Créer un utilisateur"
    echo -e "${GREEN}2) Lister les utilisateurs"
    echo -e "${GREEN}3) supprimer utilisateur"
    echo -e "${GREEN}4) Quitter"
    echo "${YELLOW}================${NC}"
    read -p "Choisissez une option [1-4] : " choix

    case $choix in
        1)
            ajout_utilisateur
            read -p "Appuyez sur Entrée pour continuer..." ;;
        2)
            echo "Liste des utilisateurs :"
            cut -d: -f1 /etc/passwd
            read -p "Appuyez sur Entrée pour continuer..." ;;
        3)
            suppression_utilisateur
            read -p "Appuyez sur Entrée pour continuer..." ;;
        4)
            echo "Au revoir !"
            menu;;
        *)
            echo "Option invalide."
            read -p "Appuyez sur Entrée pour continuer..." ;;
    esac
done
}

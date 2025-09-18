menu(){
#!/bin/bash

# ajout des script
source ./menu_paquet.sh
source ./menu_utilisateur.sh

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

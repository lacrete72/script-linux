menu_utilisateur(){
#!/bin/bash

# ajout des script
source ./ajout_utilisateur.sh
source ./suppression_utilisateur.sh

while true; do
    clear
    echo "===== MENU ====="
    echo "1) Créer un utilisateur"
    echo "2) Lister les utilisateurs"
    echo "3) supprimer utilisateur"
    echo "4) Quitter"
    echo "================"
    read -p "Choisissez une option [1-3] : " choix

    case $choix in
        1)
            ajout_utilisateur
            read -p "Appuyez sur Entrée pour continuer..." ;;
        2)
            echo "Liste des utilisateurs :"
            cut -d: -f1 /etc/passwd
            read -p "Appuyez sur Entrée pour continuer..." ;;
        3)
            suppression_utilisateur.sh
            read -p "Appuyez sur Entrée pour continuer..." ;;
        4)
            echo "Au revoir !"
            ./menu.sh;;
        *)
            echo "Option invalide."
            read -p "Appuyez sur Entrée pour continuer..." ;;
    esac
done
}

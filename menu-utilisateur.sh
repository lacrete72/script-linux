#!/bin/bash

while true; do
    clear
    echo "===== MENU ====="
    echo "1) Créer un utilisateur"
    echo "2) Lister les utilisateurs"
    echo "3) Quitter"
    echo "================"
    read -p "Choisissez une option [1-3] : " choix

    case $choix in
        1)
            read -p "Nom du nouvel utilisateur : " nom
            sudo useradd -m "$nom"
            if [[ $? -eq 0 ]]; then
                echo "Utilisateur '$nom' créé avec succès."
            else
                echo "Erreur lors de la création de l'utilisateur."
            fi
            read -p "Appuyez sur Entrée pour continuer..." ;;
        2)
            echo "Liste des utilisateurs :"
            cut -d: -f1 /etc/passwd
            read -p "Appuyez sur Entrée pour continuer..." ;;
        3)
            echo "Au revoir !"
            exit 0 ;;
        *)
            echo "Option invalide."
            read -p "Appuyez sur Entrée pour continuer..." ;;
    esac
done

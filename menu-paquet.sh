#!/bin/bash

# Vérifier si l'utilisateur est root ou a sudo
if [[ $EUID -ne 0 ]]; then
    echo "Ce script doit être exécuté avec les droits root (sudo)."
    exit 1
fi

while true; do
    clear
    echo "===== MENU - Gestion des paquets (Debian/Ubuntu) ====="
    echo "1) Installer un paquet"
    echo "2) Vérifier si un paquet est installé"
    echo "3) Supprimer un paquet"
    echo "4) Mettre à jour la liste des paquets"
    echo "5) Quitter"
    echo "======================================================"
    read -p "Choisissez une option [1-5] : " choix

    case $choix in
        1)
            read -p "Entrez le nom du paquet à installer : " paquet
            if dpkg -s "$paquet" &> /dev/null; then
                echo "Le paquet '$paquet' est déjà installé."
            else
                apt install -y "$paquet"
                if [[ $? -eq 0 ]]; then
                    echo "Paquet '$paquet' installé avec succès."
                else
                    echo "Erreur lors de l'installation du paquet."
                fi
            fi
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
            exit 0 ;;
        *)
            echo "Option invalide. Choisissez un numéro entre 1 et 5."
            read -p "Appuyez sur Entrée pour continuer..." ;;
    esac
done

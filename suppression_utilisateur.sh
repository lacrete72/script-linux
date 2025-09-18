suppression_utilisateur(){
#!/bin/bash

# Vérifier si le script est exécuté avec les droits root
if [[ $EUID -ne 0 ]]; then
    echo " Ce script doit être exécuté avec les droits root (utilise sudo)."
    exit 1
fi

# Demander le nom de l'utilisateur à supprimer
read -p "Entrez le nom de l'utilisateur à supprimer : " utilisateur

# Vérifier si l'utilisateur existe
if id "$utilisateur" &>/dev/null; then
    echo " L'utilisateur '$utilisateur' existe."

    # Demander confirmation
    read -p "Voulez-vous supprimer aussi le répertoire personnel de '$utilisateur' ? [o/N] : " reponse

    if [[ "$reponse" =~ ^[Oo]$ ]]; then
        userdel -r "$utilisateur"
    else
        userdel "$utilisateur"
    fi

    # Vérifier si la suppression a réussi
    if [[ $? -eq 0 ]]; then
        echo " L'utilisateur '$utilisateur' a été supprimé."
    else
        echo " Échec lors de la suppression de l'utilisateur."
    fi
else
    echo " L'utilisateur '$utilisateur' n'existe pas."
    exit 1
fi
}

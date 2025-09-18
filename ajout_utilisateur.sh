ajout_utilisateur{
#!/bin/bash

# Demander le nom de l'utilisateur
read -p "Entrez le nom du nouvel utilisateur : " nom_utilisateur

# Vérifier si le nom est vide
if [[ -z "$nom_utilisateur" ]]; then
    echo "Le nom d'utilisateur ne peut pas être vide."
    exit 1
fi

# Vérifier si l'utilisateur existe déjà
if id "$nom_utilisateur" &>/dev/null; then
    echo "L'utilisateur '$nom_utilisateur' existe déjà."
    exit 1
fi

# Créer le nouvel utilisateur
sudo useradd -m "$nom_utilisateur"

# Vérifier si la commande a réussi
if [[ $? -eq 0 ]]; then
    echo "Utilisateur '$nom_utilisateur' créé avec succès."
    # Optionnel : définir un mot de passe
    read -s -p "Entrez un mot de passe pour '$nom_utilisateur' : " mot_de_passe
    echo
    echo "$nom_utilisateur:$mot_de_passe" | sudo chpasswd
    echo "Mot de passe défini avec succès."
else
    echo "Échec de la création de l'utilisateur."
    exit 1
fi
}

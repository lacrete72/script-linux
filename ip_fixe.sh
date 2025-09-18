#!/bin/bash

# Vérifie si l'utilisateur est root
if [[ $EUID -ne 0 ]]; then
    echo "Ce script doit être exécuté avec les droits root (sudo)."
    exit 1
fi

# Demande l'interface réseau
read -p "Nom de l'interface réseau (ex: eth0, enp0s3) : " interface

# Demande l'adresse IP
read -p "Adresse IP (ex: 192.168.1.100) : " ip

# Demande le masque de sous-réseau
read -p "Masque de sous-réseau (ex: 255.255.255.0) : " netmask

# (Optionnel) Demande la passerelle
read -p "Passerelle (ex: 192.168.1.1) : " gateway

# Sauvegarde de l'ancien fichier
cp /etc/network/interfaces /etc/network/interfaces.bak

# Écriture de la configuration
cat > /etc/network/interfaces <<EOF
# Fichier généré par script
auto lo
iface lo inet loopback

auto $interface
iface $interface inet static
    address $ip
    netmask $netmask
    gateway $gateway
EOF

echo " Configuration enregistrée dans /etc/network/interfaces"
echo " Sauvegarde : /etc/network/interfaces.bak"

# Redémarrer les interfaces réseaux
read -p "Souhaitez-vous redémarrer le service réseau maintenant ? (y/n) : " reponse
if [[ "$reponse" =~ ^[Yy]$ ]]; then
    systemctl restart networking
    echo "🔁 Service réseau redémarré."
else
    echo "ℹ️ Vous devrez redémarrer le réseau manuellement pour appliquer les changements."
fi
